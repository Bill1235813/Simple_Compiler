package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.Macros.*;

import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class EmptyArrayCodeGenerator implements SimpleCodeGenerator {

    public EmptyArrayCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
        int statusFlag;

        assert node.getType() instanceof Array;
        Array arrayType = (Array) node.getType();
        if (arrayType.subtypeIsReference()) {
            statusFlag = 1 << Record.SUBTYPE_REFERENCE_SHIFT;
        } else {
            statusFlag = 0;
        }

        RunTime.createEmptyArrayRecord(fragment, statusFlag, arrayType.getSubtype().getSize());
        loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);

        return fragment;
    }

    public ASMCodeFragment generate(Type type) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
        int statusFlag;

        if (type.equivalent(PrimitiveType.STRING) || type instanceof Array) {
            statusFlag = 1 << Record.SUBTYPE_REFERENCE_SHIFT;
        } else {
            statusFlag = 0;
        }

        RunTime.createEmptyArrayRecord(fragment, statusFlag, type.getSize());
        loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);

        return fragment;
    }
}
