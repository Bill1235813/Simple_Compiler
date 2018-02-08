package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class RationalToFloatingCodeGenerator implements SimpleCodeGenerator{

    public RationalToFloatingCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(ConvertF);
        fragment.add(Exchange);
        fragment.add(ConvertF);
        fragment.add(Exchange);
        fragment.add(FDivide);

        return fragment;
    }
}
