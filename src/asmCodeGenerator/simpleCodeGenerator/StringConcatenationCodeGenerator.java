package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.PrimitiveType;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class StringConcatenationCodeGenerator implements SimpleCodeGenerator{

    public StringConcatenationCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_ADDRESS);
        Labeller labeller = new Labeller("string-concatenation");
        String startflag = labeller.newLabel("startflag");
        int length = 0;

        assert node.nChildren() == 2;
        storeITo(frag, RunTime.STRING_CONCATENATION_SECOND);
        storeITo(frag, RunTime.STRING_CONCATENATION_FIRST);
        
        getChildLength(node, frag, 0);
        getChildLength(node, frag, 1);
        frag.add(Add); // [... totalLength]

        // create an empty string first
        RunTime.createEmptyString(frag);

        loadIFrom(frag, RunTime.RECORD_CREATION_TEMPORARY);
        frag.add(PushI, Record.STRING_HEADER_SIZE);
        frag.add(Add); // [start_addr]
        storeITo(frag, RunTime.STRING_LOCATION_TEMP); // [...]
        
        loadIFrom(frag, RunTime.STRING_CONCATENATION_FIRST);
        insertChild(node, frag, 0);
        loadIFrom(frag, RunTime.STRING_CONCATENATION_SECOND);
        insertChild(node, frag, 1);
        
        loadIFrom(frag, RunTime.RECORD_CREATION_TEMPORARY);
        return frag;
    }
    
    private void insertChild(ParseNode node, ASMCodeFragment frag, int childIndex) {
        if (node.child(childIndex).getType() == PrimitiveType.STRING) {
            frag.add(Duplicate); // [... clone_Addr clone_Addr]
            frag.add(PushI, Record.STRING_HEADER_SIZE);
            frag.add(Add); // [... clone_Addr clone_start_addr]
            storeITo(frag, RunTime.COPY_LOCATION_TEMP);
            RunTime.getStringLength(frag); // [... size]
            frag.add(Duplicate); // [... size size]
            loadIFrom(frag, RunTime.STRING_LOCATION_TEMP); // [... size size location]
            RunTime.moveToRecord(frag, PrimitiveType.CHARACTER, false); // [... size]
            addITo(frag, RunTime.STRING_LOCATION_TEMP);
        } else if (node.child(childIndex).getType() == PrimitiveType.CHARACTER) {
            ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.CHARACTER, RunTime.STRING_LOCATION_TEMP);
            incrementInteger(frag, RunTime.STRING_LOCATION_TEMP);
        }
    }
    
    private void getChildLength(ParseNode node, ASMCodeFragment frag, int childIndex) {
        if (node.child(childIndex).getType() == PrimitiveType.STRING) {
            loadIFrom(frag, RunTime.STRING_CONCATENATION_FIRST);
            RunTime.getStringLength(frag); // [... length]
        } else if (node.child(childIndex).getType() == PrimitiveType.CHARACTER) {
            frag.add(PushI, 1);
        } else {
            assert false: "not a valid string concatenation";
        }
    }
}
