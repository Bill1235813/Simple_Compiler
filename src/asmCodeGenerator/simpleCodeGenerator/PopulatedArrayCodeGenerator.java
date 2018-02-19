package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class PopulatedArrayCodeGenerator implements SimpleCodeGenerator {
    private int statusFlag = 0;

    public PopulatedArrayCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        assert node.nChildren() == 1;
        fragment.add(PushI, node.child(0).nChildren()); // number of the child [... exprList nElems]

        // create an empty array first
        assert node.getType() instanceof Array;
        Array arrayType = (Array) node.getType();
        Type subType = arrayType.getSubtype();
        if (arrayType.subtypeIsReference()) {
            statusFlag = 1 << Record.SUBTYPE_REFERENCE_SHIFT;
        }
        RunTime.createEmptyArrayRecord(fragment, statusFlag, subType.getSize()); // [... exprList]

        // insert the children - addr still in RunTime.RECORD_CREATION_TEMPORARY
        fragment.add(PushI, node.child(0).nChildren()); // number of the child [... exprList nElems]
        loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);
        fragment.add(PushI, Record.ARRAY_HEADER_SIZE);
        fragment.add(Add); // [... exprList nElems location]

        RunTime.insertToRecord(fragment, subType);
        loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);

        return fragment;
    }

}
