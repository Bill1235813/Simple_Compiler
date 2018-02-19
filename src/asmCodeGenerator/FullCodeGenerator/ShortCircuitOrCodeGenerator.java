package asmCodeGenerator.FullCodeGenerator;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class ShortCircuitOrCodeGenerator implements FullCodeGenerator {

    public ShortCircuitOrCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node, ASMCodeFragment... args) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        Labeller labeller = new Labeller("SC-Or");
        final String trueLabel = labeller.newLabel("short-circuit-true");
        final String endLabel = labeller.newLabel("end");

        // compute arg 1
        fragment.append(args[0]); // [... bool]

        // short circuiting test
        fragment.add(Duplicate); // [... bool bool]
        fragment.add(JumpTrue, trueLabel); // [... bool]
        fragment.add(Pop); // [... 0] -> [...]

        // compute arg 2
        fragment.append(args[1]); // [... bool]
        fragment.add(Jump, endLabel);

        // the end
        fragment.add(Label, trueLabel); // [... 1]
        fragment.add(Label, endLabel);

        return fragment;
    }

}
