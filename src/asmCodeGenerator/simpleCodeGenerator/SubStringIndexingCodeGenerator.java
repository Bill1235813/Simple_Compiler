package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.Macros.storeITo;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.INDEXING_ELEM;
import static asmCodeGenerator.runtime.RunTime.INDEXING_INDEX2;
import static asmCodeGenerator.runtime.RunTime.INDEXING_INDEX;

public class SubStringIndexingCodeGenerator implements SimpleCodeGenerator{

    public SubStringIndexingCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_ADDRESS);
        Labeller labeller = new Labeller("substring-indexing");
        String startflag = labeller.newLabel("startflag");

        // [... string index index2]
        storeITo(frag, INDEXING_INDEX2);
        storeITo(frag, INDEXING_INDEX);
        storeITo(frag, INDEXING_ELEM);

        // [...]
        loadIFrom(frag, INDEXING_ELEM);
        frag.add(JumpFalse, RunTime.NULL_STRING_RUNTIME_ERROR);
        loadIFrom(frag, INDEXING_INDEX);
        frag.add(JumpNeg, RunTime.NEGATIVE_LENGTH_STRING_RUNTIME_ERROR);

        loadIFrom(frag, INDEXING_INDEX2); // [... index2]
        loadIFrom(frag, INDEXING_ELEM); // [... index2 string]
        RunTime.getStringLength(frag); // [... index2 length]
        frag.add(Subtract);
        frag.add(JumpPos, RunTime.OVERFLOW_STRING_RUNTIME_ERROR);

        loadIFrom(frag, INDEXING_INDEX2);
        loadIFrom(frag, INDEXING_INDEX);
        frag.add(Subtract); // [... index2-index]
        frag.add(JumpPos, startflag);
        frag.add(Jump, RunTime.OVERFLOW_SUBSTRING_RUNTIME_ERROR);

        frag.add(Label, startflag);
        loadIFrom(frag, INDEXING_ELEM); // [... string]
        frag.add(PushI, Record.STRING_HEADER_SIZE);
        frag.add(Add); // [... start_addr]
        loadIFrom(frag, INDEXING_INDEX); // [... start_addr index]
        frag.add(Add); // [... addr]
        storeITo(frag, RunTime.COPY_LOCATION_TEMP);
        loadIFrom(frag, INDEXING_INDEX2);
        loadIFrom(frag, INDEXING_INDEX);
        frag.add(Subtract); // [... length]

        RunTime.createStringRecord(frag, true);
        loadIFrom(frag, RunTime.RECORD_CREATION_TEMPORARY);
        return frag;
    }
}
