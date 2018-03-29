package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.CLONE_LOCATION_TEMP;
import static asmCodeGenerator.runtime.RunTime.CLONE_NEW_LOCATION_TEMP;
import static asmCodeGenerator.runtime.RunTime.CLONE_SIZE_TEMP;
import static asmCodeGenerator.runtime.RunTime.RECORD_CREATION_TEMPORARY;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;

public class CloneArrayCodeGenerator implements SimpleCodeGenerator {

    public CloneArrayCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        Labeller labeller = new Labeller("clone-array");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        // store location and size
        storeITo(fragment, CLONE_LOCATION_TEMP);
        loadIFrom(fragment, CLONE_LOCATION_TEMP);
        RunTime.getArrayLength(fragment); // [... length]
        loadIFrom(fragment, CLONE_LOCATION_TEMP);
        readIOffset(fragment, Record.ARRAY_SUBTYPE_SIZE_OFFSET); // [... length subsize]
        fragment.add(Multiply);
        fragment.add(PushI, Record.ARRAY_HEADER_SIZE);
        fragment.add(Add); // [... totalsize]
        storeITo(fragment, CLONE_SIZE_TEMP);
        loadIFrom(fragment, CLONE_SIZE_TEMP);

        // allocate new location
        fragment.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
        storeITo(fragment, CLONE_NEW_LOCATION_TEMP);
        moveIMemory(fragment, CLONE_NEW_LOCATION_TEMP, RECORD_CREATION_TEMPORARY);

        // move char by char
        fragment.add(Label, loopflag);
        loadIFrom(fragment, CLONE_SIZE_TEMP);
        fragment.add(JumpFalse, endflag);
        loadIFrom(fragment, CLONE_LOCATION_TEMP);
        fragment.add(LoadC);
        loadIFrom(fragment, CLONE_NEW_LOCATION_TEMP);
        fragment.add(Exchange);
        fragment.add(StoreC);
        decrementInteger(fragment, CLONE_SIZE_TEMP); // elemsSize -= 1
        incrementInteger(fragment, CLONE_LOCATION_TEMP);
        incrementInteger(fragment, CLONE_NEW_LOCATION_TEMP); // location += 1
        fragment.add(Jump, loopflag);
        fragment.add(Label, endflag);
        
        loadIFrom(fragment, RECORD_CREATION_TEMPORARY);

        return fragment;
    }

}
