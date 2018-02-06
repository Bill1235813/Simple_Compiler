package asmCodeGenerator.FullCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

public interface FullCodeGenerator {
    public ASMCodeFragment generate(ParseNode node, ASMCodeFragment... operandCode);
}
