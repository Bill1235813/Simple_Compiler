package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import parseTree.nodeTypes.ExpressionListNode;
import semanticAnalyzer.types.PrimitiveType;
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
            if (expressionList.child(i).getType().equivalent(PrimitiveType.RATIONAL)) {
                pushStack(frag, 4);
                pushStack(frag, 4);
            } else {
                pushStack(frag, types[i].getSize());
            }
        }
        frag.add(CallV); // [... addr] -> [... (return)]

        // get return value
        if (node.getType().equivalent(PrimitiveType.RATIONAL)) {
            popStack(frag, 4);
            popStack(frag, 4);
        } else {
            popStack(frag, node.getType().getSize());
        }
        return frag;
    }
}
