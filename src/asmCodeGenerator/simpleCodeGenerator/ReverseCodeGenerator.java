package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.*;

public class ReverseCodeGenerator implements SimpleCodeGenerator{

    public ReverseCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_ADDRESS);

        // get child
        assert node.nChildren() == 1;
        ParseNode child = node.child(0);

        // create empty record and copy reversely
        storeITo(frag, COPY_LOCATION_TEMP); // [...]
        loadIFrom(frag, COPY_LOCATION_TEMP); // [... addr]
        if (child.getType() instanceof Array) {
            getArrayLength(frag); // [...length]
            frag.add(Duplicate); // [... length length]
            frag.append(new EmptyArrayCodeGenerator().generate(child)); // [... length new_addr]
            frag.add(Duplicate);
            getArrayLength(frag);
            frag.add(PushI, -1);
            frag.add(Add); // [... length new_addr length-1]
            loadIFrom(frag, COPY_LOCATION_TEMP);
            readIOffset(frag, Record.ARRAY_SUBTYPE_SIZE_OFFSET); // [... length new_addr length-1 subsize]
            frag.add(Multiply);
            frag.add(Add);
            frag.add(PushI, Record.ARRAY_HEADER_SIZE);
            frag.add(Add); // [... length new_location]
            // update starting point
            frag.add(PushI, Record.ARRAY_HEADER_SIZE);
            addITo(frag, COPY_LOCATION_TEMP);
            moveToRecord(frag, ((Array) child.getType()).getSubtype(), true);
        } else if (child.getType().equivalent(PrimitiveType.STRING)) {
            getStringLength(frag);
            frag.add(Duplicate);
            createEmptyString(frag); // [... length]
            frag.add(Duplicate);
            frag.add(PushI, -1);
            frag.add(Add); // [... length length-1]
            loadIFrom(frag, RECORD_CREATION_TEMPORARY); // [... length length-1 addr]
            frag.add(PushI, Record.STRING_HEADER_SIZE); // [... length length-1 addr header]
            frag.add(Add);
            frag.add(Add); // [... length location]
            // update starting point
            frag.add(PushI, Record.STRING_HEADER_SIZE);
            addITo(frag, COPY_LOCATION_TEMP);
            moveToRecord(frag, PrimitiveType.CHARACTER, true);
        } else {
            assert false: "bad operator for reverse";
        }

        loadIFrom(frag, RECORD_CREATION_TEMPORARY);
        return frag;
    }
}
