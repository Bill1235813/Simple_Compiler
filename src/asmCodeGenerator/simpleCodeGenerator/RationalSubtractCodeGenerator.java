package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.Macros;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.Macros.storeITo;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class RationalSubtractCodeGenerator implements SimpleCodeGenerator {

    public RationalSubtractCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        storeITo(fragment, RunTime.SECOND_DENOMINATOR);
        storeITo(fragment, RunTime.SECOND_NUMERATOR);
        storeITo(fragment, RunTime.FIRST_DENOMINATOR);
        storeITo(fragment, RunTime.FIRST_NUMERATOR);
        loadIFrom(fragment, RunTime.FIRST_NUMERATOR);
        loadIFrom(fragment, RunTime.SECOND_DENOMINATOR);
        fragment.add(Multiply);
        loadIFrom(fragment, RunTime.FIRST_DENOMINATOR);
        loadIFrom(fragment, RunTime.SECOND_NUMERATOR);
        fragment.add(Multiply);
        fragment.add(Subtract);
        loadIFrom(fragment, RunTime.FIRST_DENOMINATOR);
        loadIFrom(fragment, RunTime.SECOND_DENOMINATOR);
        fragment.add(Multiply);
        fragment.add(Call, RunTime.LOWEST_TERMS);

        return fragment;
    }
}
