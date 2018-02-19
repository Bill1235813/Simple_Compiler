package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class FloatingExpressOverCodeGenerator implements SimpleCodeGenerator {

    public FloatingExpressOverCodeGenerator() {
        super();
    }


    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(Duplicate);
        fragment.add(JumpFalse, RunTime.FLOATING_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        fragment.add(ConvertF);
        fragment.add(FMultiply);
        fragment.add(ConvertI);

        return fragment;
    }
}
