package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.Macros;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.Macros.storeITo;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class RationalExpressOverCodeGenerator implements SimpleCodeGenerator{

    public RationalExpressOverCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(Duplicate);
        fragment.add(JumpFalse, RunTime.RATIONAL_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        storeITo(fragment, RunTime.EXPRESS_OVER_DENOMINATOR);
        storeITo(fragment, RunTime.FIRST_DENOMINATOR);
        storeITo(fragment, RunTime.FIRST_NUMERATOR);
        loadIFrom(fragment, RunTime.FIRST_NUMERATOR);
        loadIFrom(fragment, RunTime.EXPRESS_OVER_DENOMINATOR);
        fragment.add(Multiply);
        loadIFrom(fragment, RunTime.FIRST_DENOMINATOR);
        fragment.add(Divide);

        return fragment;
    }
}
