package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class IntegerToRationalCodeGenerator implements SimpleCodeGenerator {

    public IntegerToRationalCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(PushI, 1);

        return fragment;
    }
}
