package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.Macros.storeITo;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.INDEXING_ELEM;
import static asmCodeGenerator.runtime.RunTime.INDEXING_INDEX;

public class StringIndexingCodeGenerator implements SimpleCodeGenerator{
    
    public StringIndexingCodeGenerator() {
        super();
    }
    
    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VALUE);
        Labeller labeller = new Labeller("string-indexing");
        String startflag = labeller.newLabel("startflag");
        
        // [... string index]
        storeITo(frag, INDEXING_INDEX);
        storeITo(frag, INDEXING_ELEM);

        // [...]
        loadIFrom(frag, INDEXING_ELEM);
        frag.add(JumpFalse, RunTime.NULL_STRING_RUNTIME_ERROR);
        loadIFrom(frag, INDEXING_INDEX);
        frag.add(JumpNeg, RunTime.NEGATIVE_LENGTH_STRING_RUNTIME_ERROR);

        loadIFrom(frag, INDEXING_INDEX); // [... index]
        loadIFrom(frag, INDEXING_ELEM); // [... index string]
        RunTime.getStringLength(frag); // [... index length]
        frag.add(Subtract);
        frag.add(JumpNeg, startflag);
        frag.add(Jump, RunTime.OVERFLOW_STRING_RUNTIME_ERROR);

        frag.add(Label, startflag); // [...]
        loadIFrom(frag, INDEXING_ELEM); // [... string]
        frag.add(PushI, Record.STRING_HEADER_SIZE);
        frag.add(Add); // [... start_addr]

        loadIFrom(frag, INDEXING_INDEX); // [... start_addr index]
        frag.add(Add); // [... addr]
        frag.add(LoadC);

        return frag;
    }
}
