package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import logging.PikaLogger;
import semanticAnalyzer.SemanticAnalysisVisitor;
import symbolTable.Binding;
import symbolTable.Scope;
import tokens.IdentifierToken;
import tokens.Token;

public class IdentifierNode extends ParseNode {
    private static int count = 0;
    private Binding binding;
    private Scope declarationScope;

    public IdentifierNode(Token token) {
        super(token);
        assert (token instanceof IdentifierToken);
        this.binding = null;
    }

    public IdentifierNode(ParseNode node) {
        super(node);

        if (node instanceof IdentifierNode) {
            this.binding = ((IdentifierNode) node).binding;
        } else {
            this.binding = null;
        }
    }

////////////////////////////////////////////////////////////
// attributes

    public IdentifierToken identifierToken() {
        return (IdentifierToken) token;
    }

    public void setBinding(Binding binding) {
        this.binding = binding;
    }

    public Binding getBinding() {
        return binding;
    }

////////////////////////////////////////////////////////////
// Speciality functions
    public IdentifierNode createArtificialNode(String suffix) {
        IdentifierNode artificial = new IdentifierNode(this);
        String lexeme = "#" + artificial.token.getLexeme() + "-" + count + suffix;
        artificial.token = IdentifierToken.make(artificial.token.getLocation(), lexeme);
        count++;
        return artificial;
    }

    public void setConst(Boolean constflag) {
        binding.setConstflag(constflag);
    }

    public Boolean getConst() {
        return binding.getConstflag();
    }

    public Binding findVariableBinding() {
        String identifier = token.getLexeme();

        boolean lambdaFlag = false;
        for (ParseNode current : pathToRoot()) {
            if (!lambdaFlag && current.containsBindingOf(identifier)) {
                declarationScope = current.getScope();
                return current.bindingOf(identifier);
            } else if (lambdaFlag && current.containsStaticBindingOf(identifier)) {
                declarationScope = current.getScope();
                return current.bindingOf(identifier);
            } else if (current instanceof ProgramNode && current.containsBindingOf(identifier)){
                declarationScope = current.getScope();
                return current.bindingOf(identifier);
            }
            if (isLambdaNode(current)) {
                lambdaFlag = true;
            }
        }
        useBeforeDefineError();
        return Binding.nullInstance();
    }

    private boolean isLambdaNode(ParseNode node) {
        return node instanceof LambdaNode;
    }

    public Scope getDeclarationScope() {
        findVariableBinding();
        return declarationScope;
    }

    public void useBeforeDefineError() {
        PikaLogger log = PikaLogger.getLogger("compiler.semanticAnalyzer.identifierNode");
        Token token = getToken();
        log.severe("identifier " + token.getLexeme() + " used before defined at " + token.getLocation());
    }

///////////////////////////////////////////////////////////
// accept a visitor

    public void accept(ParseNodeVisitor visitor) {
        visitor.visit(this);
    }
}
