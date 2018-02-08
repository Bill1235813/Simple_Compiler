package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.codeStorage.ASMOpcode.Call;

public class RationalRationalizeCodeGenerator implements SimpleCodeGenerator{

    public RationalRationalizeCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        RationalExpressOverCodeGenerator generator = new RationalExpressOverCodeGenerator();
        ASMCodeFragment fragment = generator.generate(node);

        loadIFrom(fragment, RunTime.EXPRESS_OVER_DENOMINATOR);
        fragment.add(Call, RunTime.LOWEST_TERMS);

        return fragment;
    }
}
