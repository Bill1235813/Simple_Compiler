package semanticAnalyzer;

import java.util.Arrays;
import java.util.List;

import lexicalAnalyzer.Lextant;
import logging.PikaLogger;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.FunctionSignature;
import semanticAnalyzer.signatures.FunctionSignatures;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;
import tokens.LextantToken;
import tokens.Token;

class SemanticAnalysisVisitor extends ParseNodeVisitor.Default {
    @Override
    public void visitLeave(ParseNode node) {
        throw new RuntimeException("Node class unimplemented in SemanticAnalysisVisitor: " + node.getClass());
    }

    ///////////////////////////////////////////////////////////////////////////
    // constructs larger than statements
    @Override
    public void visitEnter(ProgramNode node) {
        enterProgramScope(node);
    }

    public void visitLeave(ProgramNode node) {
        leaveScope(node);
    }

    public void visitEnter(BlockStatementNode node) {
    }

    public void visitLeave(BlockStatementNode node) {
    }


    ///////////////////////////////////////////////////////////////////////////
    // helper methods for scoping.
    private void enterProgramScope(ParseNode node) {
        Scope scope = Scope.createProgramScope();
        node.setScope(scope);
    }

    @SuppressWarnings("unused")
    private void enterSubscope(ParseNode node) {
        Scope baseScope = node.getLocalScope();
        Scope scope = baseScope.createSubscope();
        node.setScope(scope);
    }

    private void leaveScope(ParseNode node) {
        node.getScope().leave();
    }

    ///////////////////////////////////////////////////////////////////////////
    // statements and declarations
    @Override
    public void visitLeave(PrintStatementNode node) {
    }

    @Override
    public void visitLeave(DeclarationNode node) {
        IdentifierNode identifier = (IdentifierNode) node.child(0);
        ParseNode initializer = node.child(1);

        Type declarationType = initializer.getType();
        node.setType(declarationType);

        identifier.setType(declarationType);
        addBinding(identifier, declarationType);
    }

    ///////////////////////////////////////////////////////////////////////////
    // expressions
    @Override
    public void visitLeave(BinaryOperatorNode node) {
        assert node.nChildren() == 2;
        ParseNode left = node.child(0);
        ParseNode right = node.child(1);
        List<Type> childTypes = Arrays.asList(left.getType(), right.getType());

        Lextant operator = operatorFor(node);
        FunctionSignatures signatures = FunctionSignatures.signaturesOf(operator);
        FunctionSignature signature = signatures.acceptingSignature(childTypes);

        if (signature.accepts(childTypes)) {
            node.setType(signature.resultType());
            node.setSignature(signature);
        } else {
            typeCheckError(node, childTypes);
            node.setType(PrimitiveType.ERROR);
        }
    }

    private Lextant operatorFor(BinaryOperatorNode node) {
        LextantToken token = (LextantToken) node.getToken();
        return token.getLextant();
    }


    ///////////////////////////////////////////////////////////////////////////
    // simple leaf nodes
    @Override
    public void visit(BooleanConstantNode node) {
        node.setType(PrimitiveType.BOOLEAN);
    }

    @Override
    public void visit(ErrorNode node) {
        node.setType(PrimitiveType.ERROR);
    }

    @Override
    public void visit(IntegerConstantNode node) {
        node.setType(PrimitiveType.INTEGER);
    }

    @Override
    public void visit(FloatingConstantNode node) {
        node.setType(PrimitiveType.FLOATING);
    }

    @Override
    public void visit(NewlineNode node) {
    }

    @Override
    public void visit(SpaceNode node) {
    }

    ///////////////////////////////////////////////////////////////////////////
    // IdentifierNodes, with helper methods
    @Override
    public void visit(IdentifierNode node) {
        if (!isBeingDeclared(node)) {
            Binding binding = node.findVariableBinding();

            node.setType(binding.getType());
            node.setBinding(binding);
        }
        // else parent DeclarationNode does the processing.
    }

    private boolean isBeingDeclared(IdentifierNode node) {
        ParseNode parent = node.getParent();
        return (parent instanceof DeclarationNode) && (node == parent.child(0));
    }

    private void addBinding(IdentifierNode identifierNode, Type type) {
        Scope scope = identifierNode.getLocalScope();
        Binding binding = scope.createBinding(identifierNode, type);
        identifierNode.setBinding(binding);
    }

    ///////////////////////////////////////////////////////////////////////////
    // error logging/printing

    private void typeCheckError(ParseNode node, List<Type> operandTypes) {
        Token token = node.getToken();

        logError("operator " + token.getLexeme() + " not defined for types "
                + operandTypes + " at " + token.getLocation());
    }

    private void logError(String message) {
        PikaLogger log = PikaLogger.getLogger("compiler.semanticAnalyzer");
        log.severe(message);
    }
}