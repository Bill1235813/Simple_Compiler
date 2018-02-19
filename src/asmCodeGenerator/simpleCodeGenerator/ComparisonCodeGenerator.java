package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import parseTree.ParseNode;
import parseTree.nodeTypes.OperatorNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import java.util.HashMap;
import java.util.Map;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.JumpFNeg;

public class ComparisonCodeGenerator implements SimpleCodeGenerator {
    private static final ASMOpcode[] defaultJumpList = {JumpFalse, JumpPos, JumpNeg};
    private static final Map<Type, ASMOpcode> comparisonOperationMap = new HashMap<Type, ASMOpcode>();
    private static final Map<Type, ASMOpcode[]> comparisonJumpMap = new HashMap<Type, ASMOpcode[]>();
    private static final Map<Punctuator, Integer> comparisonJumpIndexMap = new HashMap<Punctuator, Integer>();
    private static final Map<Punctuator, Integer> comparisonBooleanIndexMap = new HashMap<Punctuator, Integer>();

    static {
        // makeComparisonOperationMap
        comparisonOperationMap.put(PrimitiveType.FLOATING, FSubtract);
        comparisonOperationMap.put(PrimitiveType.BOOLEAN, Xor);

        // makeComparisonJumpMap
        ASMOpcode[] floatingJumpList = {JumpFZero, JumpFPos, JumpFNeg};
        comparisonJumpMap.put(PrimitiveType.FLOATING, floatingJumpList);

        // makeComparisonIndexMap
        // '>' -> JumpPos True
        comparisonJumpIndexMap.put(Punctuator.GREATER, 1);
        comparisonBooleanIndexMap.put(Punctuator.GREATER, 1);
        // '<' -> JumpNeg True
        comparisonJumpIndexMap.put(Punctuator.LESS, 2);
        comparisonBooleanIndexMap.put(Punctuator.LESS, 1);
        // '>=' -> JumpNeg False
        comparisonJumpIndexMap.put(Punctuator.GREATEROREQUAL, 2);
        comparisonBooleanIndexMap.put(Punctuator.GREATEROREQUAL, 0);
        // '<=' -> JumpPos False
        comparisonJumpIndexMap.put(Punctuator.LESSOREQUAL, 1);
        comparisonBooleanIndexMap.put(Punctuator.LESSOREQUAL, 0);
        // '==' -> JumpFalse True
        comparisonJumpIndexMap.put(Punctuator.EQUAL, 0);
        comparisonBooleanIndexMap.put(Punctuator.EQUAL, 1);
        // '!=' -> JumpFalse False
        comparisonJumpIndexMap.put(Punctuator.NOTEQUAL, 0);
        comparisonBooleanIndexMap.put(Punctuator.NOTEQUAL, 0);
    }

    public ComparisonCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        OperatorNode operatorNode = (OperatorNode) node;
        Lextant operator = operatorNode.getOperator();

        // based on Type and Punctuator, find the correct way to compare
        Type compareType = operatorNode.getPromotion().getSignature().firstParamType();
        ASMOpcode comparisonOperation = comparisonOperationMap.getOrDefault(compareType, Subtract);
        ASMOpcode comparisonJumpList[] = comparisonJumpMap.getOrDefault(compareType, defaultJumpList);
        int jumpIndex = comparisonJumpIndexMap.getOrDefault(operator, -1);
        int booleanIndex = comparisonBooleanIndexMap.getOrDefault(operator, -1);

        // Set several Labels
        Labeller labeller = new Labeller("compare");
        String subLabel = labeller.newLabel("sub");
        String trueLabel = labeller.newLabel("true");
        String falseLabel = labeller.newLabel("false");
        String joinLabel = labeller.newLabel("join");
        String[] booleanList = {falseLabel, trueLabel};

        fragment.add(Label, subLabel);
        fragment.add(comparisonOperation);

        fragment.add(comparisonJumpList[jumpIndex], booleanList[booleanIndex]);
        fragment.add(Jump, booleanList[1 - booleanIndex]);

        fragment.add(Label, trueLabel);
        fragment.add(PushI, 1);
        fragment.add(Jump, joinLabel);
        fragment.add(Label, falseLabel);
        fragment.add(PushI, 0);
        fragment.add(Jump, joinLabel);
        fragment.add(Label, joinLabel);

        return fragment;
    }
}
