package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;

public class LengthCodeGenerator implements SimpleCodeGenerator {

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        assert node.nChildren() == 1;
        ParseNode child = node.child(0);

        if (child.getType() instanceof Array) {
            RunTime.getArrayLength(fragment);
        } else if (child.getType().equivalent(PrimitiveType.STRING)) {
            RunTime.getStringLength(fragment);
        } else {
            assert false: "Bad Child of Length Operator";
        }

        return fragment;
    }

}
