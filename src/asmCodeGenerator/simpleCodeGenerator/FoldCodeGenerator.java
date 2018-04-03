package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.LambdaType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.*;

public class FoldCodeGenerator implements SimpleCodeGenerator{
    public FoldCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VALUE);

        Type subType = ((Array) node.child(0).getType()).getSubtype();
        Type resultType = ((LambdaType) node.child(node.nChildren()-1).getType()).getReturntype();

        Labeller labeller = new Labeller("fold");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        // store addr [... array_addr func_addr]
        storeITo(frag, FUNCTION_TEMP);
        if (node.nChildren() == 3) {
            pushStack(frag, resultType.getSize());
            ASMCodeGenerator.storeValueIntoAddress(frag, resultType, STACK_POINTER);
        }
        storeITo(frag, COPY_LOCATION_TEMP); // [...] or [... U]

        // store length
        loadIFrom(frag, COPY_LOCATION_TEMP);
        getArrayLength(frag); // [... length]
        storeITo(frag, COPY_SIZE_TEMP);

        // add offset
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        addITo(frag, COPY_LOCATION_TEMP);

        // check and add first elem
        if (node.nChildren() == 2) {
            loadIFrom(frag, COPY_SIZE_TEMP);
            frag.add(JumpFalse, FOLD_WITH_EMPTY_ARRAY);
            decrementInteger(frag, COPY_SIZE_TEMP);
            getOneFromRecord(frag, subType, 1); // [... U or T]
            pushStack(frag, resultType.getSize());
            ASMCodeGenerator.storeValueIntoAddress(frag, resultType, STACK_POINTER);
        }

        // loop
        frag.add(Label, loopflag);
        loadIFrom(frag, COPY_SIZE_TEMP); // [... nElems]
        frag.add(JumpFalse, endflag); // [...]

        decrementInteger(frag, COPY_SIZE_TEMP); // elemsSize -= 1
        loadIFrom(frag, FUNCTION_TEMP); // [... func_addr]
        getOneFromRecord(frag, subType, 1); // [... func_addr value]
        ASMCodeGenerator.turnAddressIntoValue(frag, resultType, STACK_POINTER);
        popStack(frag, resultType.getSize()); // [... func_addr value value]

        // store before invocation
        loadIFrom(frag, COPY_LOCATION_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        loadIFrom(frag, COPY_SIZE_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        loadIFrom(frag, FUNCTION_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        frag.append(new FunctionInvocationCodeGenerator()
                .generate(new Type[]{resultType, subType}, resultType)); // [... returnType]
        // get after invocation
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, FUNCTION_TEMP);
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, COPY_SIZE_TEMP);
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, COPY_LOCATION_TEMP);
        // store return type
        pushStack(frag, resultType.getSize());
        ASMCodeGenerator.storeValueIntoAddress(frag, resultType, STACK_POINTER);

        frag.add(Jump, loopflag);
        frag.add(Label, endflag);

        ASMCodeGenerator.turnAddressIntoValue(frag, resultType, STACK_POINTER);
        popStack(frag, resultType.getSize()); // [... func_addr value]
        return frag;
    }
}
