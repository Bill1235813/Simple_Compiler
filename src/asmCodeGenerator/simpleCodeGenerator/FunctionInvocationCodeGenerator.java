package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import parseTree.nodeTypes.ExpressionListNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.COPY_LOCATION_TEMP;
import static asmCodeGenerator.runtime.RunTime.STACK_POINTER;
import static asmCodeGenerator.runtime.RunTime.STACK_POP_TEMP;

public class FunctionInvocationCodeGenerator implements SimpleCodeGenerator {

    public FunctionInvocationCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VALUE);
        
        // store temp
        loadIFrom(frag, STACK_POP_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        frag.add(PushI, 0);
        storeITo(frag, STACK_POP_TEMP);

        ParseNode expressionList = node.child(1);
        Type[] types = ((ExpressionListNode)expressionList).getSignature().getParamTypes();
        for (int i=0;i< types.length;++i) {
            pushStack(frag, types[i].getSize());
            ASMCodeGenerator.storeValueIntoAddress(frag, types[i], RunTime.STACK_POINTER);
        }
        frag.add(CallV); // [... addr] -> [... (return)]

        // get return value
        ASMCodeGenerator.turnAddressIntoValue(frag, node.getType(), RunTime.STACK_POINTER);
        popStack(frag, node.getType().getSize());
        return frag;
    }

    public ASMCodeFragment generate(Type[] types, Type resultType) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VALUE);

        // store temp
        loadIFrom(frag, STACK_POP_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        frag.add(PushI, 0);
        storeITo(frag, STACK_POP_TEMP);

        for (int i=0;i< types.length;++i) {
            pushStack(frag, types[i].getSize());
            ASMCodeGenerator.storeValueIntoAddress(frag, types[i], RunTime.STACK_POINTER);
        }
        frag.add(CallV); // [... addr] -> [... (return)]

        // get return value
        ASMCodeGenerator.turnAddressIntoValue(frag, resultType, RunTime.STACK_POINTER);
        popStack(frag, resultType.getSize());
        return frag;
    }
}
