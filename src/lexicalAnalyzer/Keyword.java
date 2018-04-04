package lexicalAnalyzer;

import tokens.LextantToken;
import tokens.Token;


public enum Keyword implements Lextant {
    CONST("const"),
    VAR("var"),
    STATIC("static"),
    PRINT("print"),
    NEWLINE("_n_"),
    TAB("_t_"),
    IF("if"),
    ELSE("else"),
    WHILE("while"),
    RELEASE("release"),
    LENGTH("length"),
    NEW("new"),
    CLONE("clone"),
    BOOL("bool"),
    CHAR("char"),
    INT("int"),
    FLOAT("float"),
    STRING("string"),
    RAT("rat"),
    TRUE("_true_"),
    FALSE("_false_"),
    EXEC("exec"),
    VOID("void"),
    FUNC("func"),
    RETURN("return"),
    FOR("for"),
    INDEX("index"),
    ELEM("elem"),
    OF("of"),
    CALL("call"),
    BREAK("break"),
    CONTINUE("continue"),
    REVERSE("reverse"),
    ZIP("zip"),
    MAP("map"),
    REDUCE("reduce"),
    FOLD("fold"),
    START_PROGRAM(""),
    GLOBAL_DEFINITION(""),
    NULL_KEYWORD("");

    private String lexeme;
    private Token prototype;


    private Keyword(String lexeme) {
        this.lexeme = lexeme;
        this.prototype = LextantToken.make(null, lexeme, this);
    }

    public String getLexeme() {
        return lexeme;
    }

    public Token prototype() {
        return prototype;
    }

    public static Keyword forLexeme(String lexeme) {
        for (Keyword keyword : values()) {
            if (keyword.lexeme.equals(lexeme)) {
                return keyword;
            }
        }
        return NULL_KEYWORD;
    }

    public static boolean isAKeyword(String lexeme) {
        return forLexeme(lexeme) != NULL_KEYWORD;
    }
	
	/*   the following hashtable lookup can replace the serial-search implementation of forLexeme() above. It is faster but less clear. 
	private static LexemeMap<Keyword> lexemeToKeyword = new LexemeMap<Keyword>(values(), NULL_KEYWORD);
	public static Keyword forLexeme(String lexeme) {
		return lexemeToKeyword.forLexeme(lexeme);
	}
	*/
}
