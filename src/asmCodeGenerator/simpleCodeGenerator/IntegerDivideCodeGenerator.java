package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMOpcode.Divide;
import static asmCodeGenerator.codeStorage.ASMOpcode.Duplicate;
import static asmCodeGenerator.codeStorage.ASMOpcode.JumpFalse;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

public class IntegerDivideCodeGenerator implements SimpleCodeGenerator {

    public IntegerDivideCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(Duplicate);
        fragment.add(JumpFalse, RunTime.INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        fragment.add(Divide);

        return fragment;
    }
}
