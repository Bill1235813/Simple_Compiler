package symbolTable;

import inputHandler.TextLocation;
import logging.PikaLogger;
import parseTree.ParseNode;
import parseTree.nodeTypes.IdentifierNode;
import semanticAnalyzer.types.Type;
import tokens.Token;

public class Scope {
    private Scope baseScope;
    private MemoryAllocator allocator;
    private SymbolTable symbolTable;

//////////////////////////////////////////////////////////////////////
// factories

    public static Scope createProgramScope() {
        return new Scope(programScopeAllocator(), nullInstance());
    }

    public static Scope createProcedureScope() {
        return new Scope(procedureScopeAllocator(), nullInstance());
    }

    public static Scope createParameterScope() {
        return new Scope(parameterScopeAllocator(), nullInstance());
    }

    public Scope createSubscope() {
        return new Scope(allocator, this);
    }

    private static MemoryAllocator programScopeAllocator() {
        return new PositiveMemoryAllocator(
                MemoryAccessMethod.DIRECT_ACCESS_BASE,
                MemoryLocation.GLOBAL_VARIABLE_BLOCK);
    }

    private static MemoryAllocator procedureScopeAllocator() {
        return new NegativeMemoryAllocator(
                MemoryAccessMethod.INDIRECT_ACCESS_BASE,
                MemoryLocation.FRAME_POINTER);
    }

    private static MemoryAllocator parameterScopeAllocator() {
        return new ParameterMemoryAllocator.Builder();
    }

    //////////////////////////////////////////////////////////////////////
    // private constructor.
    private Scope(MemoryAllocator allocator, Scope baseScope) {
        super();
        this.baseScope = (baseScope == null) ? this : baseScope;
        this.symbolTable = new SymbolTable();

        this.allocator = allocator;
    }

    public void enter() {
        allocator.saveState();
    }
    ///////////////////////////////////////////////////////////////////////
//  basic queries	
    public Scope getBaseScope() {
        return baseScope;
    }

    public MemoryAllocator getAllocationStrategy() {
        return allocator;
    }

    public SymbolTable getSymbolTable() {
        return symbolTable;
    }

    ///////////////////////////////////////////////////////////////////////
//memory allocation
    // must call leave() when destroying/leaving a scope.
    public void leave() {
        allocator.restoreState();
    }

    public int getAllocatedSize() {
        return allocator.getMaxAllocatedSize();
    }

    public void manualAllocate(int size) {
        allocator.allocate(size);
    }

    ///////////////////////////////////////////////////////////////////////
//bindings
    public Binding createBinding(IdentifierNode identifierNode, Type type, Boolean constflag) {
        Token token = identifierNode.getToken();
        symbolTable.errorIfAlreadyDefined(token);

        String lexeme = token.getLexeme();
        Binding binding = allocateNewBinding(type, token.getLocation(), lexeme, constflag);
        symbolTable.install(lexeme, binding);

        return binding;
    }

    private Binding allocateNewBinding(Type type, TextLocation textLocation, String lexeme, Boolean constflag) {
        MemoryLocation memoryLocation = allocator.allocate(type.getSize());
        return new Binding(type, textLocation, memoryLocation, lexeme, constflag);
    }

    ///////////////////////////////////////////////////////////////////////
//toString
    public String toString() {
        String result = "scope: ";
        result += " hash " + hashCode() + "\n";
        result += symbolTable;
        return result;
    }

    ////////////////////////////////////////////////////////////////////////////////////
//Null Scope object - lazy singleton (Lazy Holder) implementation pattern
    public static Scope nullInstance() {
        return NullScope.instance;
    }

    private static class NullScope extends Scope {
        private static NullScope instance = new NullScope();

        private NullScope() {
            super(new PositiveMemoryAllocator(MemoryAccessMethod.NULL_ACCESS, "", 0),
                    null);
        }

        public String toString() {
            return "scope: the-null-scope";
        }

        @Override
        public Binding createBinding(IdentifierNode identifierNode, Type type, Boolean constflag) {
            unscopedIdentifierError(identifierNode.getToken());
            return super.createBinding(identifierNode, type, constflag);
        }

        // subscopes of null scope need their own strategy.  Assumes global block is static.
        public Scope createSubscope() {
            return new Scope(programScopeAllocator(), this);
        }
    }


    ///////////////////////////////////////////////////////////////////////
//error reporting
    private static void unscopedIdentifierError(Token token) {
        PikaLogger log = PikaLogger.getLogger("compiler.scope");
        log.severe("variable " + token.getLexeme() +
                " used outside of any scope at " + token.getLocation());
    }

}
