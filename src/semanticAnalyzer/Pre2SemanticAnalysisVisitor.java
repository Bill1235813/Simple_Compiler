package semanticAnalyzer;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import static semanticAnalyzer.SemanticAnalysisVisitor.*;

public class Pre2SemanticAnalysisVisitor extends ParseNodeVisitor.Default{
    @Override
    public void visitLeave(ParseNode node) {
        throw new RuntimeException("Node class unimplemented in Pre2SemanticAnalysisVisitor: " + node.getClass());
    }

    @Override
    public void visitEnter(ProgramNode node) {
        setProgramNode(node);
    }

    @Override
    public void visitLeave(DeclarationNode node) {
        if (!isChildOfBlock(node)) {
            setDeclaration(node);
        }
    }
    
    @Override
    public void visitLeave(OperatorNode node) {
        if (!isChildOfBlock(node)) {
            getOperator(node);
        }
    }

    // expressionList in ad hoc method
    @Override
    public void visitLeave(ExpressionListNode node) {
        if (!isChildOfBlock(node)) {
            getExpressionList(node);
        }
    }
    
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
    public void visit(CharacterConstantNode node) {
        node.setType(PrimitiveType.CHARACTER);
    }

    @Override
    public void visit(StringConstantNode node) {
        node.setType(PrimitiveType.STRING);
    }
    
    @Override
    public void visit(IdentifierNode node) {
        if (!isChildOfBlock(node)) {
            getIdentifier(node);
        }
    }
    
    private boolean isChildOfBlock(ParseNode node) {
        while (!(node instanceof BlockStatementNode)) {
            node = node.getParent();
            if (node instanceof ProgramNode) {
                return false;
            }
        }
        return true;
    }
}
