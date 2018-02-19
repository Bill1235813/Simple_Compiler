package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.PushI;

public class FloatingToRationalCodeGenerator implements SimpleCodeGenerator {
    private static final int MAGIC_VALUE = 223092870;

    public FloatingToRationalCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        fragment.add(PushI, MAGIC_VALUE);

        FloatingRationalizeCodeGenerator generator = new FloatingRationalizeCodeGenerator();
        fragment.append(generator.generate(node));

        return fragment;
    }
}
