package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.Macros.*;

import asmCodeGenerator.runtime.RunTime;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

public class CloneArrayCodeGenerator implements SimpleCodeGenerator {

    public CloneArrayCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        RunTime.cloneArray(fragment);
        loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);

        return fragment;
    }

}
