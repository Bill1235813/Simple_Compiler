package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.*;

public class ReduceCodeGenerator implements SimpleCodeGenerator{
    public ReduceCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VALUE);

        Type subType = ((Array) node.child(0).getType()).getSubtype();
        Labeller labeller = new Labeller("reduce");
        String loopflag1 = labeller.newLabel("loopflag1");
        String endflag1 = labeller.newLabel("endflag1");
        String loopflag2 = labeller.newLabel("loopflag2");
        String endflag2 = labeller.newLabel("endflag2");
        String continueflag2 = labeller.newLabel("continueflag2");

        // store array addr
        frag.add(Exchange); // [... func_addr array_addr]
        frag.add(Duplicate); // [... func_addr array_addr array_addr]
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        frag.add(Exchange);

        // use map to get a boolean-array
        frag.append(new MapCodeGenerator().generate(node)); // [... boolean-record]

        // get old array addr
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, COPY_LOCATION_TEMP); // [... boolean-record]
        
        // store boolean array
        storeITo(frag, COPY_LOCATION_TEMP2); // [...]
        loadIFrom(frag, COPY_LOCATION_TEMP2);
        getArrayLength(frag); // [... length]
        storeITo(frag, COPY_SIZE_TEMP);
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        addITo(frag, COPY_LOCATION_TEMP2);
        loadIFrom(frag, COPY_LOCATION_TEMP2); // [... start-addr2]

        // get new array length
        frag.add(PushI, 0);
        frag.add(Label, loopflag1);
        loadIFrom(frag, COPY_SIZE_TEMP); // [... nElems]
        frag.add(JumpFalse, endflag1); // [...]
        decrementInteger(frag, COPY_SIZE_TEMP); // elemsSize -= 1
        getOneFromRecord(frag, PrimitiveType.CHARACTER, 2); // [... value value]
        frag.add(Add);
        frag.add(Jump, loopflag1);
        frag.add(Label, endflag1); // [... new-nElems]

        // create new record
        frag.append(new EmptyArrayCodeGenerator().generate(subType)); // [... start-addr2 new-record-addr]
        storeITo(frag, COPY_NEW_LOCATION_TEMP);

        // move preparation
        storeITo(frag, COPY_LOCATION_TEMP2); // [...]
        loadIFrom(frag, COPY_LOCATION_TEMP);
        getArrayLength(frag); // [... length]
        storeITo(frag, COPY_SIZE_TEMP);
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        addITo(frag, COPY_LOCATION_TEMP);
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        addITo(frag, COPY_NEW_LOCATION_TEMP); // [... start-addr2]
        
        // move available record
        frag.add(Label, loopflag2);
        loadIFrom(frag, COPY_SIZE_TEMP); // [... nElems]
        frag.add(JumpFalse, endflag2); // [...]
        decrementInteger(frag, COPY_SIZE_TEMP); // elemsSize -= 1
        getOneFromRecord(frag, PrimitiveType.CHARACTER, 2);
        frag.add(JumpFalse, continueflag2); // [...]
        moveMemory(frag,subType, COPY_LOCATION_TEMP, COPY_NEW_LOCATION_TEMP);
        frag.add(PushI, subType.getSize());
        addITo(frag, COPY_NEW_LOCATION_TEMP);
        frag.add(Label, continueflag2);
        frag.add(PushI, subType.getSize());
        addITo(frag, COPY_LOCATION_TEMP);
        frag.add(Jump, loopflag2);
        frag.add(Label, endflag2);

        loadIFrom(frag, RECORD_CREATION_TEMPORARY);
        return frag;
    }
}
