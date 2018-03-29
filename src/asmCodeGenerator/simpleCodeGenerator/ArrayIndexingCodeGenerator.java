package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.Type;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.INDEXING_ELEM;
import static asmCodeGenerator.runtime.RunTime.INDEXING_INDEX;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;

public class ArrayIndexingCodeGenerator implements SimpleCodeGenerator {

    public ArrayIndexingCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_ADDRESS);
        Labeller labeller = new Labeller("array-indexing");
        String startflag = labeller.newLabel("startflag");

        // [... array index]
        storeITo(frag, INDEXING_INDEX);
        storeITo(frag, INDEXING_ELEM);

        // [...]
        loadIFrom(frag, INDEXING_ELEM);
        frag.add(JumpFalse, RunTime.NULL_ARRAY_RUNTIME_ERROR);
        loadIFrom(frag, INDEXING_INDEX);
        frag.add(JumpNeg, RunTime.NEGATIVE_LENGTH_ARRAY_RUNTIME_ERROR);

        loadIFrom(frag, INDEXING_INDEX); // [... index]
        loadIFrom(frag, INDEXING_ELEM); // [... index array]
        RunTime.getArrayLength(frag); // [... index length]
        frag.add(Subtract);
        frag.add(JumpNeg, startflag);
        frag.add(Jump, RunTime.OVERFLOW_ARRAY_RUNTIME_ERROR);

        frag.add(Label, startflag); // [...]
        loadIFrom(frag, INDEXING_ELEM); // [... array]
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        frag.add(Add); // [... start_addr]

        loadIFrom(frag, INDEXING_INDEX); // [... start_addr index]
        Array arrayType = (Array) (node.child(0).getType());
        Type subtype = arrayType.getSubtype();
        frag.add(PushI, subtype.getSize());
        frag.add(Multiply);
        frag.add(Add);

        return frag;
    }
}
