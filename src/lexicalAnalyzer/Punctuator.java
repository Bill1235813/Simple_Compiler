package lexicalAnalyzer;

import tokens.LextantToken;
import tokens.Token;


public enum Punctuator implements Lextant {
	ADD("+"),
	SUBTRACT("-"),
	MULTIPLY("*"),
	DIVIDE("/"),
	LESS("<"),
	LESSOREQUAL("<="),
	EQUAL("=="),
	NOTEQUAL("!="),
	GREATER(">"),
	GREATEROREQUAL(">="),
	ASSIGN(":="),
	SEPARATOR(","),
	SPACE(";"),
	TERMINATOR("."),
	OPEN_BRACE("{"),
	CLOSE_BRACE("}"),
	OPEN_BRACKET("["),
	CLOSE_BRACKET("]"),
	OPEN_PARENTHESE("("),
	CLOSE_PARENTHESE(")"),
	VERTICAL_LINE("|"),
	SHARP("#"),
	NULL_PUNCTUATOR("");

	private String lexeme;
	private Token prototype;
	// All comparison nodes
	public static final Punctuator []comparisons = {
			GREATER, GREATEROREQUAL, LESS,
			LESSOREQUAL, EQUAL, NOTEQUAL
	};

	private Punctuator(String lexeme) {
		this.lexeme = lexeme;
		this.prototype = LextantToken.make(null, lexeme, this);
	}

	public String getLexeme() {
		return lexeme;
	}

	public Token prototype() {
		return prototype;
	}


	public static Punctuator forLexeme(String lexeme) {
		for (Punctuator punctuator : values()) {
			if (punctuator.lexeme.equals(lexeme)) {
				return punctuator;
			}
		}
		return NULL_PUNCTUATOR;
	}
	
/*
	//   the following hashtable lookup can replace the implementation of forLexeme above. It is faster but less clear. 
	private static LexemeMap<Punctuator> lexemeToPunctuator = new LexemeMap<Punctuator>(values(), NULL_PUNCTUATOR);
	public static Punctuator forLexeme(String lexeme) {
		   return lexemeToPunctuator.forLexeme(lexeme);
	}
*/

}


