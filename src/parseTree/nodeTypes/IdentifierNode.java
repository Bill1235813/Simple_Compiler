package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import logging.PikaLogger;
import semanticAnalyzer.SemanticAnalysisVisitor;
import symbolTable.Binding;
import symbolTable.ParameterMemoryAllocator;
import symbolTable.Scope;
import tokens.IdentifierToken;
import tokens.Token;

public class IdentifierNode extends ParseNode {
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

    public void setConst(Boolean constflag) {
        binding.setConstflag(constflag);
    }

    public Boolean getConst() {
        return binding.getConstflag();
    }

    public Binding findVariableBinding() {
        String identifier = token.getLexeme();

        for (ParseNode current : pathToRoot()) {
            if (current.containsBindingOf(identifier)) {
                declarationScope = current.getScope();
                return current.bindingOf(identifier);
            }
            if (checkParameterMemoryAllocator(current)) {
                ParseNode programNode = SemanticAnalysisVisitor.getProgramNode();
                if (programNode.containsBindingOf(identifier)) {
                    declarationScope = programNode.getScope();
                    return programNode.bindingOf(identifier);
                } else {
                    break;
                }
            }
        }
        useBeforeDefineError();
        return Binding.nullInstance();
    }

    private boolean checkParameterMemoryAllocator(ParseNode node) {
        return node.hasScope()
                && node.getScope().getAllocationStrategy() instanceof ParameterMemoryAllocator;
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
