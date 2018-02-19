package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

public class LengthArrayCodeGenerator implements SimpleCodeGenerator {

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        RunTime.getLength(fragment);
        return fragment;
    }

}
