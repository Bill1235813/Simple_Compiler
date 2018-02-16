package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;

public class ArrayIndexingCodeGenerator implements SimpleCodeGenerator {

    public ArrayIndexingCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_ADDRESS);

        return frag;
    }
}
