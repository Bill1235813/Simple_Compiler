package asmCodeGenerator.simpleCodeGenerator;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.LambdaType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.Add;
import static asmCodeGenerator.codeStorage.ASMOpcode.PushI;
import static asmCodeGenerator.runtime.RunTime.*;

public class MapCodeGenerator implements SimpleCodeGenerator{
    public MapCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node) {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VALUE);

        Type subType = ((Array) node.child(0).getType()).getSubtype();
        Type resultType = ((LambdaType) node.child(node.nChildren()-1).getType()).getReturntype();

        Labeller labeller = new Labeller("map");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        // store addr [... array_addr func_addr]
        storeITo(frag, FUNCTION_TEMP);
        storeITo(frag, COPY_LOCATION_TEMP); // [...]

        // store length
        loadIFrom(frag, COPY_LOCATION_TEMP);
        getArrayLength(frag); // [... length]
        storeITo(frag, COPY_SIZE_TEMP);

        // add offset
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        addITo(frag, COPY_LOCATION_TEMP);

        // allocate new
        loadIFrom(frag, COPY_SIZE_TEMP);
        frag.append(new EmptyArrayCodeGenerator().generate(resultType)); // [... addr] in record_creation_temp
        frag.add(PushI, Record.ARRAY_HEADER_SIZE);
        frag.add(Add);
        storeITo(frag, COPY_NEW_LOCATION_TEMP); // [...]

        // store before loop
        loadIFrom(frag, RECORD_CREATION_TEMPORARY);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);

        // loop
        frag.add(Label, loopflag);
        loadIFrom(frag, COPY_SIZE_TEMP); // [... nElems]
        frag.add(JumpFalse, endflag); // [...]

        decrementInteger(frag, COPY_SIZE_TEMP); // elemsSize -= 1
        loadIFrom(frag, FUNCTION_TEMP); // [... func_addr]
        getOneFromRecord(frag, subType, 1); // [... func_addr value]

        // store before invocation
        loadIFrom(frag, COPY_LOCATION_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        loadIFrom(frag, COPY_NEW_LOCATION_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        loadIFrom(frag, COPY_SIZE_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        loadIFrom(frag, FUNCTION_TEMP);
        pushStack(frag, 4);
        ASMCodeGenerator.storeValueIntoAddress(frag, PrimitiveType.INTEGER, STACK_POINTER);
        frag.append(new FunctionInvocationCodeGenerator()
                .generate(new Type[]{subType}, resultType)); // [... returnType]
        // get after invocation
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, FUNCTION_TEMP);
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, COPY_SIZE_TEMP);
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, COPY_NEW_LOCATION_TEMP);
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4);
        storeITo(frag, COPY_LOCATION_TEMP);

        insertOneToRecord(frag, resultType);
        frag.add(Jump, loopflag);
        frag.add(Label, endflag);

        // get after loop
        ASMCodeGenerator.turnAddressIntoValue(frag, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(frag, 4); // [... record-creation-temp]
        return frag;
    }
}