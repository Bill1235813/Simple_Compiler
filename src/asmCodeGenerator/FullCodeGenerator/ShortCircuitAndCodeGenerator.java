package asmCodeGenerator.FullCodeGenerator;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.Label;

public class ShortCircuitAndCodeGenerator implements FullCodeGenerator {

    public ShortCircuitAndCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate (ParseNode node, ASMCodeFragment... args) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        Labeller labeller = new Labeller("SC-And");
        final String falseLabel = labeller.newLabel("short-circuit-true");
        final String endLabel = labeller.newLabel("end");

        // compute arg 1
        fragment.append(args[0]); // [... bool]

        // short circuiting test
        fragment.add(Duplicate); // [... bool bool]
        fragment.add(JumpFalse, falseLabel); // [... bool]
        fragment.add(Pop); // [... 1] -> [...]

        // compute arg 2
        fragment.append(args[1]); // [... bool]
        fragment.add(Jump, endLabel);

        // the end
        fragment.add(Label, falseLabel); // [... 0]
        fragment.add(Label, endLabel);

        return fragment;
    }
}
