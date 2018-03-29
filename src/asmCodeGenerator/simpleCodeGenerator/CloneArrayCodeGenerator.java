package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.COPY_LOCATION_TEMP;
import static asmCodeGenerator.runtime.RunTime.RECORD_CREATION_TEMPORARY;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;
import semanticAnalyzer.types.PrimitiveType;

public class CloneArrayCodeGenerator implements SimpleCodeGenerator {

    public CloneArrayCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        Labeller labeller = new Labeller("clone-array");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        // store location and size
        storeITo(frag, COPY_LOCATION_TEMP);
        loadIFrom(frag, COPY_LOCATION_TEMP);
        RunTime.getArrayLength(frag); // [... length]
        loadIFrom(frag, COPY_LOCATION_TEMP);
        readIOffset(frag, Record.ARRAY_SUBTYPE_SIZE_OFFSET); // [... length subsize]
        frag.add(Multiply);
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        frag.add(Add); // [... totalsize]
        frag.add(Duplicate); // [... totalsize totalsize]

        // allocate new location
        frag.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE); // [... totalsize location]
        frag.add(Duplicate);
        storeITo(frag, RunTime.RECORD_CREATION_TEMPORARY);

        // move char by char
        RunTime.moveToRecord(frag, PrimitiveType.CHARACTER, false);

        loadIFrom(frag, RECORD_CREATION_TEMPORARY);
        return frag;
    }

}
