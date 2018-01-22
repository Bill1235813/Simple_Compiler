package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.BNegate;

public class CastToBooleanCodeGenerator implements SimpleCodeGenerator {


    public CastToBooleanCodeGenerator() {
        super();
    }

    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(BNegate);
        fragment.add(BNegate);

        return fragment;
    }

}
