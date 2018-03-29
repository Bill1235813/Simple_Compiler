package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import parseTree.nodeTypes.ExpressionListNode;
import semanticAnalyzer.types.Type;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class FunctionInvocationCodeGenerator implements SimpleCodeGenerator {

    public FunctionInvocationCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VALUE);
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
}
