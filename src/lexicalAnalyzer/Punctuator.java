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
    OVER("//"),
    EXPRESS_OVER("///"),
    RATIONALIZE("////"),
    BOOLEAN_AND("&&"),
    BOOLEAN_OR("||"),
    BOOLEAN_NOT("!"),
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
    LAMBDA_TYPE(""),
    INDEXING(""),
    ARRAY_TYPE(""),
    POPULATED_ARRAY(""),
    EMPTY_ARRAY(""),
    TYPELIST(""),
    EXPRESSIONLIST(""),
    LAMBDA(""),
    LAMBDA_PARAM_TYPE(""),
    PARAMLIST(""),
    CASTING(""),
    FUNCTION_INVOCATION(""),
    NULL_PUNCTUATOR("");

    private String lexeme;
    private Token prototype;
    // All comparison nodes
    public static final Punctuator[] comparisons = {
            GREATER, GREATEROREQUAL, LESS,
            LESSOREQUAL, EQUAL, NOTEQUAL
    };

    public static final Punctuator[] multiplicative = {
            MULTIPLY, DIVIDE, OVER,
            EXPRESS_OVER, RATIONALIZE
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


