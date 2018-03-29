package semanticAnalyzer;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.LambdaType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Scope;
import tokens.LextantToken;

import java.util.ArrayList;
import java.util.List;

import static semanticAnalyzer.SemanticAnalysisVisitor.*;

public class PreSemanticAnalysisVisitor extends ParseNodeVisitor.Default {
    @Override
    public void visitLeave(ParseNode node) {
        throw new RuntimeException("Node class unimplemented in PreSemanticAnalysisVisitor: " + node.getClass());
    }

    public void visitEnter(ProgramNode node) {
        Scope scope = Scope.createProgramScope();
        node.setScope(scope);
    }

    public void visitLeave(ProgramNode node) {
    }

    public void visitLeave(GlobalDefinitionNode node) {
    }

    public void visitLeave(FunctionDefinitionNode node) {
        IdentifierNode identifier = (IdentifierNode) node.child(0);
        ParseNode lambda = node.child(1);

        LambdaType functionType = (LambdaType) lambda.getType();
        node.setType(functionType);

        identifier.setType(functionType);
        addBinding(identifier, functionType, true);
    }

    public void visitLeave(LambdaNode node) {
        LambdaType lambdaType = (LambdaType) node.child(0).getType();
        Scope scope = Scope.createParameterScope();
        List<Type> typeList = lambdaType.getTypeList();
        int totalSize = 0; // the negative total
        for (Type type: typeList) {
            totalSize -= type.getSize();
        }
        scope.preAllocatedSize(totalSize);
        node.setType(lambdaType);
        node.setScope(scope);
    }

    public void visitLeave(LambdaParamTypeNode node) {
        setLambdaType(node);
    }

    public void visitLeave(ParamListNode node) {
        getListOfTypes(node);
    }

    public void visitLeave(ParamSpecNode node) {
        node.setType(node.child(0).getType());
    }

    public void visitLeave(TypeNode node) {
        assert node.getToken() instanceof LextantToken;
        assert node.nChildren() <= 2;
        setType(node);
    }

    public void visitLeave(TypeListNode node) {
        getListOfTypes(node);
    }
}
