package semanticAnalyzer.types;


import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;

public enum PrimitiveType implements Type {
    BOOLEAN(1),
    CHARACTER(1),
    INTEGER(4),
    FLOATING(8),
    STRING(4),
    ERROR(0),            // use as a value when a syntax error has occurred
    NO_TYPE(0, "");        // use as a value when no type has been assigned.

    private int sizeInBytes;
    private String infoString;

    public static PrimitiveType getTypeFromLextant(Lextant lextant) {
        assert (lextant instanceof Keyword);
        Keyword keyword = (Keyword) lextant;

        switch (keyword) {
            case BOOL: return BOOLEAN;
            case INT: return INTEGER;
            case FLOAT: return  FLOATING;
            case CHAR: return CHARACTER;
            case STRING: return STRING;
            default: return ERROR;
        }
    }

    private PrimitiveType(int size) {
        this.sizeInBytes = size;
        this.infoString = toString();
    }

    private PrimitiveType(int size, String infoString) {
        this.sizeInBytes = size;
        this.infoString = infoString;
    }

    public int getSize() {
        return sizeInBytes;
    }

    public String infoString() {
        return infoString;
    }
}
