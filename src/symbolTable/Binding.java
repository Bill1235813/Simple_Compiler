package symbolTable;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import inputHandler.TextLocation;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class Binding {
    private Type type;
    private TextLocation textLocation;
    private MemoryLocation memoryLocation;
    private String lexeme;
    private Boolean constflag;

    public Binding(Type type, TextLocation location, MemoryLocation memoryLocation,
                   String lexeme, Boolean constflag) {
        super();
        this.type = type;
        this.textLocation = location;
        this.memoryLocation = memoryLocation;
        this.lexeme = lexeme;
        this.constflag = constflag;
    }


    public String toString() {
        return "[" + lexeme +
                " " + type +
                " Const=" + constflag +
                // " " + textLocation +
                " " + memoryLocation +
                "]";
    }

    public String getLexeme() {
        return lexeme;
    }

    public Type getType() {
        return type;
    }

    public TextLocation getLocation() {
        return textLocation;
    }

    public MemoryLocation getMemoryLocation() {
        return memoryLocation;
    }

    public void generateAddress(ASMCodeFragment code) {
        memoryLocation.generateAddress(code, "%% " + lexeme);
    }

////////////////////////////////////////////////////////////////////////////////////
//Null Binding object
////////////////////////////////////////////////////////////////////////////////////

    public static Binding nullInstance() {
        return NullBinding.getInstance();
    }

    public Boolean getConstflag() {
        return constflag;
    }

    public void setConstflag(Boolean constflag) {
        this.constflag = constflag;
    }

    private static class NullBinding extends Binding {
        private static NullBinding instance = null;

        private NullBinding() {
            super(PrimitiveType.ERROR,
                    TextLocation.nullInstance(),
                    MemoryLocation.nullInstance(),
                    "the-null-binding",
                    true);
        }

        public static NullBinding getInstance() {
            if (instance == null)
                instance = new NullBinding();
            return instance;
        }
    }
}
