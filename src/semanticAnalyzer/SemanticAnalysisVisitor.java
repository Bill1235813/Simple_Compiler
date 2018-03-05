package semanticAnalyzer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import logging.PikaLogger;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.FunctionSignature;
import semanticAnalyzer.signatures.FunctionSignatures;
import semanticAnalyzer.signatures.Promotion;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeLiteral;
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
        enterSubscope(node);
    }

    public void visitLeave(BlockStatementNode node) {
        leaveScope(node);
    }


    ///////////////////////////////////////////////////////////////////////////
    // helper methods for scoping.
    private void enterProgramScope(ParseNode node) {
        Scope scope = Scope.createProgramScope();
        node.setScope(scope);
    }

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

        Boolean constflag = (lextantFor(node) == Keyword.CONST);
        identifier.setType(declarationType);
        addBinding(identifier, declarationType, constflag);
    }

    @Override
    public void visitLeave(AssignmentStatementNode node) {
        ParseNode target = node.child(0);
        if (!target.getTargetable()) {
            targetableAssignError(node);
            node.setType(PrimitiveType.ERROR);
            return;
        }

        ParseNode result = node.child(1);
        Type targetType = target.getType();
        Type resultType = result.getType();
        List<Type> childTypes = new ArrayList<Type>(Arrays.asList(targetType, resultType));
        FunctionSignatures signatures = FunctionSignatures.signaturesOf(Punctuator.ASSIGN);
        Promotion promotion = Promotion.checkPromotion(childTypes, signatures, true);

        if (promotion == Promotion.nullPromotion) {
            typeCheckError(node, Arrays.asList(targetType, resultType));
            node.setType(PrimitiveType.ERROR);
        } else if (promotion == Promotion.overOnePromotion) {
            overOnePromotionError(node, childTypes);
            node.setType(PrimitiveType.ERROR);
        } else {
            node.setType(targetType);
            node.setPromotion(promotion);
        }
    }

    @Override
    public void visitLeave(IfStatementNode node) {
        checkConditionBoolean(node);
    }

    @Override
    public void visitLeave(WhileStatementNode node) {
        checkConditionBoolean(node);
    }

    private void checkConditionBoolean(ParseNode node) {
        ParseNode condition = node.child(0);
        if (condition.getType() != PrimitiveType.BOOLEAN) {
            notBooleanConditionError(node);
            node.setType(PrimitiveType.ERROR);
        }
    }

    ///////////////////////////////////////////////////////////////////////////
    // expressions
    @Override
    public void visitLeave(OperatorNode node) {
//        assert node.nChildren() == 2;
        List<Type> childTypes = new ArrayList<Type>();
        for (int i = 0; i < node.nChildren(); ++i) {
            if (node.child(i) instanceof TypeNode) {
                childTypes.add(new TypeLiteral(node.child(i).getType()));
            } else {
                childTypes.add(node.child(i).getType());
            }
        }

        Lextant operator = lextantFor(node);
        FunctionSignatures signatures = FunctionSignatures.signaturesOf(operator);
        Promotion promotion = Promotion.checkPromotion(childTypes, signatures, false);

        if (promotion == Promotion.overOnePromotion) {
            overOnePromotionError(node, childTypes);
            node.setType(PrimitiveType.ERROR);
        } else if (promotion == Promotion.nullPromotion) {
            typeCheckError(node, childTypes);
            node.setType(PrimitiveType.ERROR);
        } else {
            FunctionSignature signature = promotion.getSignature();
            node.setType(signature.resultType());
            node.setTargetable(node.getToken().isLextant(Punctuator.ARRAY_INDEXING));
            node.setPromotion(promotion);
        }
    }

    @Override
    public void visitLeave(TypeNode node) {
        assert node.getToken() instanceof LextantToken;
        assert node.nChildren() <= 2;
        if (node.nChildren() == 0) {
            Lextant type = lextantFor(node);
            node.setType(PrimitiveType.getTypeFromLextant(type));
        } else if (node.nChildren() == 1) {
            node.setType(new Array(node.child(0).getType()));
        } else {
        }
    }

    @Override
    public void visitLeave(ExpressionListNode node) {
        assert node.nChildren() >= 1;
        Type temptype = node.child(0).getType();
        for (int i = 0; i < node.nChildren(); ++i) {
            Type nexttype = node.child(i).getType();
            if (nexttype.equivalent(temptype) || Promotion.promotable(nexttype, temptype)) {
                continue;
            } else if (Promotion.promotable(temptype, nexttype)) {
                temptype = nexttype;
            } else {
                expressionListPromotionError(node, i + 1);
                node.setType(PrimitiveType.ERROR);
            }
        }
        node.setType(new Array(temptype));
    }

    @Override
    public void visitLeave(ReleaseStatementNode node) {
        assert node.nChildren() == 1;
        Type referencetype = node.child(0).getType();
        if (Array.typeIsReference(referencetype)) {
            node.setType(referencetype);
        } else {
            notReferenceTypeError(node);
        }
    }

    //    @Override
//    public void visitLeave(ParenthesesNode node) {
//        assert node.nChildren() == 1;
//        ParseNode expression = node.child(0);
//        Type resultType = expression.getType();
//        node.setType(resultType);
//        node.setTargetable(expression.getTargetable());
//    }

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
    public void visit(CharacterConstantNode node) {
        node.setType(PrimitiveType.CHARACTER);
    }

    @Override
    public void visit(StringConstantNode node) {
        node.setType(PrimitiveType.STRING);
    }

    @Override
    public void visit(NewlineNode node) {
    }

    @Override
    public void visit(TabNode node) {
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
            node.setTargetable(!node.getConst()); // const is not targetable
        }
        // else parent DeclarationNode does the processing.
    }

    @Override
    public void visit(BreakStatementNode node) {
        ParseNode parent = getParentLoop(node);
        if (parent instanceof WhileStatementNode) {
            node.setLoopLink((WhileStatementNode) parent);
            ((WhileStatementNode) parent).setBreakflag(true);
        }
    }

    @Override
    public void visit(ContinueStatementNode node) {
        ParseNode parent = getParentLoop(node);
        if (parent instanceof WhileStatementNode) {
            node.setLoopLink((WhileStatementNode) parent);
            ((WhileStatementNode) parent).setContinueflag(true);
        }
    }

    private ParseNode getParentLoop(ParseNode node) {
        ParseNode parent = node.getParent();
        while (!(parent instanceof WhileStatementNode)) {
            parent = parent.getParent();
            if (parent instanceof ProgramNode) {
                noParentLoop(node);
                break;
            }
        }
        return parent;
    }

    private boolean isBeingDeclared(IdentifierNode node) {
        ParseNode parent = node.getParent();
        return (parent instanceof DeclarationNode) && (node == parent.child(0));
    }

    private void addBinding(IdentifierNode identifierNode, Type type, Boolean constflag) {
        Scope scope = identifierNode.getLocalScope();
        Binding binding = scope.createBinding(identifierNode, type, constflag);
        identifierNode.setBinding(binding);
    }

    ///////////////////////////////////////////////////////////////////////////
    // helper functions for finding Lextant
    private Lextant lextantFor(ParseNode node) {
        LextantToken token = (LextantToken) node.getToken();
        return token.getLextant();
    }

    ///////////////////////////////////////////////////////////////////////////
    // error logging/printing
    private void noParentLoop(ParseNode node) {
        Token token = node.getToken();

        logError("no parent loop for " + token.getLexeme() +
                "statement at" + token.getLocation());
    }

    private void notReferenceTypeError(ParseNode node) {
        Token token = node.getToken();

        logError("ReleaseStatement must have reference type"
                + " at " + token.getLocation());
    }

    private void notBooleanConditionError(ParseNode node) {
        Token token = node.getToken();

        logError(token.getLexeme() + " statement must have boolean condition"
                + " at " + token.getLocation());
    }

    private void targetableAssignError(ParseNode node) {
        Token token = node.getToken();

        logError("assign to untargetable variable " + token.getLexeme()
                + " at " + token.getLocation());
    }

    private void expressionListPromotionError(ParseNode node, int child) {
        Token token = node.getToken();

        logError("expression " + child + " in expressionList cannot get legal promotion at "
                + token.getLocation());
    }

    private void overOnePromotionError(ParseNode node, List<Type> operandTypes) {
        Token token = node.getToken();

        logError("operator " + token.getLexeme() + " have over one available promotions for "
                + operandTypes + " at " + token.getLocation());
    }

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