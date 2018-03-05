package parseTree;

import parseTree.nodeTypes.*;

// Visitor pattern with pre- and post-order visits
public interface ParseNodeVisitor {

    // non-leaf nodes: visitEnter and visitLeave
    void visitEnter(OperatorNode node);

    void visitLeave(OperatorNode node);

    void visitEnter(BlockStatementNode node);

    void visitLeave(BlockStatementNode node);

    void visitEnter(DeclarationNode node);

    void visitLeave(DeclarationNode node);


    void visitEnter(ParseNode node);

    void visitLeave(ParseNode node);

    void visitEnter(PrintStatementNode node);

    void visitLeave(PrintStatementNode node);

    void visitEnter(ProgramNode node);

    void visitLeave(ProgramNode node);

    void visitEnter(ParenthesesNode node);

    void visitLeave(ParenthesesNode node);

    void visitEnter(CastingNode node);

    void visitLeave(CastingNode node);

    void visitEnter(AssignmentStatementNode node);

    void visitLeave(AssignmentStatementNode node);

    void visitEnter(WhileStatementNode node);

    void visitLeave(WhileStatementNode node);

    void visitEnter(IfStatementNode node);

    void visitLeave(IfStatementNode node);

    void visitEnter(TypeNode node);

    void visitLeave(TypeNode node);

    void visitEnter(ExpressionListNode node);

    void visitLeave(ExpressionListNode node);

    void visitEnter(ReleaseStatementNode node);

    void visitLeave(ReleaseStatementNode node);

    void visitEnter(FunctionDefinitionNode node);

    void visitLeave(FunctionDefinitionNode node);

    void visitEnter(GlobalDefinitionNode node);

    void visitLeave(GlobalDefinitionNode node);

    void visitEnter(LambdaNode node);

    void visitLeave(LambdaNode node);

    void visitEnter(LambdaParamTypeNode node);

    void visitLeave(LambdaParamTypeNode node);

    void visitEnter(ParamListNode node);

    void visitLeave(ParamListNode node);

    void visitEnter(ParamSpecNode node);

    void visitLeave(ParamSpecNode node);

    void visitEnter(TypeListNode node);

    void visitLeave(TypeListNode node);

    // leaf nodes: visitLeaf only
    void visit(BooleanConstantNode node);

    void visit(ErrorNode node);

    void visit(IdentifierNode node);

    void visit(IntegerConstantNode node);

    void visit(FloatingConstantNode node);

    void visit(NewlineNode node);

    void visit(SpaceNode node);

    void visit(TabNode node);

    void visit(CharacterConstantNode node);

    void visit(StringConstantNode node);

    void visit(BreakStatementNode node);

    void visit(ContinueStatementNode node);

    public static class Default implements ParseNodeVisitor {
        public void defaultVisit(ParseNode node) {
        }

        public void defaultVisitEnter(ParseNode node) {
            defaultVisit(node);
        }

        public void defaultVisitLeave(ParseNode node) {
            defaultVisit(node);
        }

        public void defaultVisitForLeaf(ParseNode node) {
            defaultVisit(node);
        }

        public void visitEnter(OperatorNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(OperatorNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(DeclarationNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(DeclarationNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(BlockStatementNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(BlockStatementNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(ParseNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(ParseNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(PrintStatementNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(PrintStatementNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(ProgramNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(ProgramNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(ParenthesesNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(ParenthesesNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(CastingNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(CastingNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(AssignmentStatementNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(AssignmentStatementNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(WhileStatementNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(WhileStatementNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(IfStatementNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(IfStatementNode node) {
            defaultVisitLeave(node);
        }

        public void visitEnter(TypeNode node) {
            defaultVisitEnter(node);
        }

        public void visitLeave(TypeNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(ExpressionListNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(ExpressionListNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(ReleaseStatementNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(ReleaseStatementNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(FunctionDefinitionNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(FunctionDefinitionNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(GlobalDefinitionNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(GlobalDefinitionNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(LambdaNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(LambdaNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(LambdaParamTypeNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(LambdaParamTypeNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(ParamListNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(ParamListNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(ParamSpecNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(ParamSpecNode node) {
            defaultVisitLeave(node);
        }

        @Override
        public void visitEnter(TypeListNode node) {
            defaultVisitEnter(node);
        }

        @Override
        public void visitLeave(TypeListNode node) {
            defaultVisitLeave(node);
        }

        public void visit(BooleanConstantNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(ErrorNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(IdentifierNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(IntegerConstantNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(FloatingConstantNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(NewlineNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(SpaceNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(TabNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(CharacterConstantNode node) {
            defaultVisitForLeaf(node);
        }

        public void visit(StringConstantNode node) {
            defaultVisitForLeaf(node);
        }

        @Override
        public void visit(BreakStatementNode node) {
            defaultVisit(node);
        }

        @Override
        public void visit(ContinueStatementNode node) {
            defaultVisit(node);
        }

    }
}
