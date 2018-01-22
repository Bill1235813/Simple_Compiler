package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.BTAnd;
import static asmCodeGenerator.codeStorage.ASMOpcode.PushI;

public class CastToCharacterCodeGenerator implements SimpleCodeGenerator {
    private static final int CAST_HELPER_NUMBER = 255;

    public CastToCharacterCodeGenerator() {
        super();
    }

    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(PushI, CAST_HELPER_NUMBER);
        fragment.add(BTAnd);

        return fragment;
    }
}
