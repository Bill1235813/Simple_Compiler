package lexicalAnalyzer;


import logging.PikaLogger;

import inputHandler.InputHandler;
import inputHandler.LocatedChar;
import inputHandler.LocatedCharStream;
import inputHandler.PushbackCharStream;
import inputHandler.TextLocation;
import tokens.*;

import static lexicalAnalyzer.PunctuatorScanningAids.*;

public class LexicalAnalyzer extends ScannerImp implements Scanner {
	private static final int MAX_IDENTIFIER = 32;
	private static final char MIN_CHARACTER = 32;
	private static final char MAX_CHARACTER = 126;

	public static LexicalAnalyzer make(String filename) {
		InputHandler handler = InputHandler.fromFilename(filename);
		PushbackCharStream charStream = PushbackCharStream.make(handler);
		return new LexicalAnalyzer(charStream);
	}

	public LexicalAnalyzer(PushbackCharStream input) {
		super(input);
	}


	//////////////////////////////////////////////////////////////////////////////
	// Token-finding main dispatch

	@Override
	protected Token findNextToken() {
		LocatedChar ch = nextNonWhitespaceChar();

		if (isNumberStart(ch)) {
			return scanNumber(ch);
		} else if (isCharacterStart(ch)) {
			return scanCharacter(ch);
		} else if (isStringStart(ch)) {
			return scanString(ch);
		} else if (isIdentifierStart(ch)) {
			return scanIdentifier(ch);
		} else if (isPunctuatorStart(ch)) {
			if (PunctuatorScanner.judgeComment(ch, input)) {
				return findNextToken();
			} else {
				return PunctuatorScanner.scan(ch, input);
			}
		} else if (isEndOfInput(ch)) {
			return NullToken.make(ch.getLocation());
		} else {
			lexicalError(ch);
			return findNextToken();
		}
	}


	private LocatedChar nextNonWhitespaceChar() {
		LocatedChar ch = input.next();
		while (ch.isWhitespace()) {
			ch = input.next();
		}
		return ch;
	}


	//////////////////////////////////////////////////////////////////////////////
	// Integer and floating lexical analysis

	private Token scanNumber(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());

		Boolean floatingflag = (firstChar.getCharacter() == '.');
		floatingflag = appendSubsequentDigits(buffer, floatingflag);

		if (floatingflag) {
			return FloatingToken.make(firstChar.getLocation(), buffer.toString());
		} else {
			return IntegerToken.make(firstChar.getLocation(), buffer.toString());
		}
	}

	private Boolean appendSubsequentDigits(StringBuffer buffer, Boolean floatingflag) {
		LocatedChar c = input.next();
		if (!floatingflag) {  // already begin with '.' don't need this step
			while (c.isDigit()) {
				buffer.append(c.getCharacter());
				c = input.next();
			}
		}

		// check floating number
		LocatedChar checkfloat = c;
		if (c.getCharacter() == '.' || floatingflag) {  // maybe floating number or begin with '.'
			checkfloat = input.next();
			if (!checkfloat.isDigit() && !floatingflag) {  // not floating number
				input.pushback(checkfloat);
				input.pushback(c);
			} else {  // is floating number
				floatingflag = true;
				buffer.append(c.getCharacter());
				while (checkfloat.isDigit()) {
					buffer.append(checkfloat.getCharacter());
					checkfloat = input.next();
				}
			}
		} else {  // integer with no '.' after
			input.pushback(c);
		}

		// check exponential
		LocatedChar checkexp = checkfloat;
		if (floatingflag && checkfloat.getCharacter() == 'E') {  // maybe exponential
			checkexp = input.next();
			if (!isIntegerStart(checkexp)) {  // is exponential
				input.pushback(checkexp);
				input.pushback(checkfloat);
			} else {
				buffer.append(checkfloat.getCharacter());
				buffer.append(checkexp.getCharacter());
				checkexp = input.next();
				while (checkexp.isDigit()) {
					buffer.append(checkexp.getCharacter());
					checkexp = input.next();
				}
				input.pushback(checkexp);
			}
		} else if (floatingflag) {  // is float but not exponential
			input.pushback(checkfloat);
		}

		return floatingflag;
	}


	//////////////////////////////////////////////////////////////////////////////
	// Identifier and keyword lexical analysis

	private Token scanIdentifier(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		appendSubsequentAlphabet(buffer);

		String lexeme = buffer.toString();
		if (lexeme.length() > MAX_IDENTIFIER) {
			lexicalError(firstChar);
		}
		if (Keyword.isAKeyword(lexeme)) {
			return LextantToken.make(firstChar.getLocation(), lexeme, Keyword.forLexeme(lexeme));
		} else {
			return IdentifierToken.make(firstChar.getLocation(), lexeme);
		}
	}

	private void appendSubsequentAlphabet(StringBuffer buffer) {
		LocatedChar c = input.next();
		while (isIdentifierContinue(c)) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		input.pushback(c);
	}

	//////////////////////////////////////////////////////////////////////////////
	// Character lexical analysis

	private Token scanCharacter(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());

		LocatedChar c = input.next();
		if (c.getCharacter() < MIN_CHARACTER ||
				c.getCharacter() > MAX_CHARACTER) {
			lexicalError(firstChar);
			input.pushback(c);
		} else {
			buffer.append(c.getCharacter());
			LocatedChar end = input.next();
			if (!isCharacterStart(end)) {
				lexicalError(firstChar);
				input.pushback(end);
			} else {
				buffer.append(end.getCharacter());
			}
		}

		String lexeme = buffer.toString();
		return CharacterToken.make(firstChar.getLocation(), lexeme);
	}

	//////////////////////////////////////////////////////////////////////////////
	// String lexical analysis

	private Token scanString(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		Boolean validflag = appendSubsequentString(buffer);

		String lexeme = buffer.toString();
		// check invalid string
		if (!validflag) {
			lexicalError(firstChar);
		}
		return StringToken.make(firstChar.getLocation(), lexeme);
	}

	private boolean appendSubsequentString(StringBuffer buffer) {
		Boolean validflag = true;
		LocatedChar c = input.next();
		while (isStringContinue(c)) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		if (isNewLine(c)) {
			validflag = false;
		} else {
			buffer.append(c.getCharacter());
		}
		return validflag;
	}

	//////////////////////////////////////////////////////////////////////////////
	// Punctuator lexical analysis
	// old method left in to show a simple scanning method.
	// current method is the algorithm object PunctuatorScanner.java

	@SuppressWarnings("unused")
	private Token oldScanPunctuator(LocatedChar ch) {
		TextLocation location = ch.getLocation();

		switch (ch.getCharacter()) {
			case '*':
				return LextantToken.make(location, "*", Punctuator.MULTIPLY);
			case '+':
				return LextantToken.make(location, "+", Punctuator.ADD);
			case '>':
				return LextantToken.make(location, ">", Punctuator.GREATER);
			case ':':
				if (ch.getCharacter() == '=') {
					return LextantToken.make(location, ":=", Punctuator.ASSIGN);
				} else {
					throw new IllegalArgumentException("found : not followed by = in scanOperator");
				}
			case ',':
				return LextantToken.make(location, ",", Punctuator.SEPARATOR);
			case ';':
				return LextantToken.make(location, ";", Punctuator.TERMINATOR);
			default:
				throw new IllegalArgumentException("bad LocatedChar " + ch + "in scanOperator");
		}
	}


	//////////////////////////////////////////////////////////////////////////////
	// Character-classification routines specific to Pika scanning.

	private boolean isPunctuatorStart(LocatedChar lc) {
		char c = lc.getCharacter();
		return isPunctuatorStartingCharacter(c);
	}

	private boolean isEndOfInput(LocatedChar lc) {
		return lc == LocatedCharStream.FLAG_END_OF_INPUT;
	}

	private boolean isNumberStart(LocatedChar lc) {
		if (lc.isDigit()) {
			return true;
		} else if (lc.getCharacter() == '+' || lc.getCharacter() == '-'
				|| lc.getCharacter() == '.') {  // maybe floating number .x or +x, -x
			LocatedChar checknumber = input.next();
			if (checknumber.isDigit()) {
				input.pushback(checknumber);
				return true;
			} else if (lc.getCharacter() != '.' && checknumber.getCharacter() == '.') {  // maybe floating number +.x (-.x)
				LocatedChar checkfloating = input.next();
				input.pushback(checkfloating);
				input.pushback(checknumber);
				return checkfloating.isDigit();
			} else {
				input.pushback(checknumber);
				return false;
			}
		} else {
			return false;
		}
	}

	private boolean isIntegerStart(LocatedChar lc) {
		if (lc.isDigit()) {
			return true;
		} else if (lc.getCharacter() == '+' || lc.getCharacter() == '-') {
			LocatedChar checknumber = input.next();
			input.pushback(checknumber);
			return checknumber.isDigit();
		} else {
			return false;
		}
	}

	private boolean isIdentifierStart(LocatedChar lc) {
		return lc.isAlphabetic();
	}

	private boolean isIdentifierContinue(LocatedChar lc) {
		return lc.isAlphabetic() || lc.isDigit() || lc.getCharacter() == '$';
	}

	private boolean isCharacterStart(LocatedChar lc) {
		return lc.getCharacter() == '^';
	}

	private boolean isStringStart(LocatedChar lc) {
		return lc.getCharacter() == '"';
	}

	private boolean isStringContinue(LocatedChar lc) {
		return lc.getCharacter() != '"' && lc.getCharacter() != '\n';
	}

	private boolean isNewLine(LocatedChar lc) {
		return lc.getCharacter() == '\n';
	}

	//////////////////////////////////////////////////////////////////////////////
	// Error-reporting

	private void lexicalError(LocatedChar ch) {
		PikaLogger log = PikaLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: invalid character " + ch);
	}


}
