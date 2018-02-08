package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.Macros.storeITo;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.ConvertI;

public class FloatingRationalizeCodeGenerator implements SimpleCodeGenerator{

    public FloatingRationalizeCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(Duplicate);
        fragment.add(JumpFalse, RunTime.FLOATING_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        fragment.add(Duplicate);
        storeITo(fragment, RunTime.EXPRESS_OVER_DENOMINATOR);
        fragment.add(ConvertF);
        fragment.add(FMultiply);
        fragment.add(ConvertI);

        loadIFrom(fragment, RunTime.EXPRESS_OVER_DENOMINATOR);
        fragment.add(Call, RunTime.LOWEST_TERMS);

        return fragment;
    }
}
