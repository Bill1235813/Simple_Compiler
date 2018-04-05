package asmCodeGenerator.FullCodeGenerator;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;
import parseTree.nodeTypes.ForStatementNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.Macros.popStack;
import static asmCodeGenerator.Macros.storeITo;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.Label;
import static asmCodeGenerator.runtime.RunTime.*;
import static asmCodeGenerator.runtime.RunTime.COPY_LOCATION_TEMP;
import static asmCodeGenerator.runtime.RunTime.STACK_POINTER;

public class ForStatementCodeGenerator implements FullCodeGenerator {
    public ForStatementCodeGenerator() {
        super();
    }

    @Override
    public ASMCodeFragment generate(ParseNode node, ASMCodeFragment... args) {
        ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VOID);
        ForStatementNode forNode = (ForStatementNode) node;

        Type type = node.child(1).getType();
        Type subType = node.child(0).getType();
        
        // Set several Labels
        Labeller labeller = new Labeller("for");
        String continuesLabel = labeller.newLabel("continue");
        String breaksLabel = labeller.newLabel("starts");
        String endsLabel = labeller.newLabel("ends");
        if (forNode.isBreakflag()) {
            endsLabel = forNode.getBreakLabel();

        }
        if (forNode.isContinueflag()) {
            continuesLabel = forNode.getContinueLabel();
        }
        
        // preparation
        fragment.append(args[0]);
        fragment.append(args[1]);
        storeITo(fragment, COPY_LOCATION_TEMP);
        storeITo(fragment, STORE_ADDRESS_TEMP); // [...]
        loadIFrom(fragment, COPY_LOCATION_TEMP);
        if (type instanceof Array) {
            getArrayLength(fragment); // [... length]
            storeITo(fragment, COPY_SIZE_TEMP);
            fragment.add(PushI, Record.ARRAY_HEADER_SIZE);
        } else {
            getStringLength(fragment);
            storeITo(fragment, COPY_SIZE_TEMP);
            fragment.add(PushI, Record.STRING_HEADER_SIZE);
        }
        addITo(fragment, COPY_LOCATION_TEMP);  
        if (forNode.isIndexFlag()) {
            loadIFrom(fragment, STORE_ADDRESS_TEMP);
            fragment.add(PushI, -1);
            fragment.add(StoreI);
        }

        // store before body
        fragment.add(Label, continuesLabel);
        loadIFrom(fragment, COPY_SIZE_TEMP); // [... nElems]
        fragment.add(JumpFalse, endsLabel); // [...]
        decrementInteger(fragment, COPY_SIZE_TEMP); // elemsSize -= 1
        if (forNode.isIndexFlag()) {
            loadIFrom(fragment, STORE_ADDRESS_TEMP); // [... addr]
            fragment.add(LoadI);
            fragment.add(PushI, 1);
            fragment.add(Add); // [... value]
            ASMCodeGenerator.storeValueIntoAddress(fragment, subType, STORE_ADDRESS_TEMP);
        } else {
            getOneFromRecord(fragment, subType, 1); // [... elem]
            ASMCodeGenerator.storeValueIntoAddress(fragment, subType, STORE_ADDRESS_TEMP);
        }

        // add to pop-temp
        fragment.add(PushI, 12);
        addITo(fragment, STACK_POP_TEMP);
        
        loadIFrom(fragment, COPY_LOCATION_TEMP);
        pushStack(fragment, 4);
        ASMCodeGenerator.storeValueIntoAddress(fragment, PrimitiveType.INTEGER, STACK_POINTER);
        loadIFrom(fragment, COPY_SIZE_TEMP);
        pushStack(fragment, 4);
        ASMCodeGenerator.storeValueIntoAddress(fragment, PrimitiveType.INTEGER, STACK_POINTER);
        loadIFrom(fragment, STORE_ADDRESS_TEMP);
        pushStack(fragment, 4);
        ASMCodeGenerator.storeValueIntoAddress(fragment, PrimitiveType.INTEGER, STACK_POINTER);
        fragment.append(args[2]);
        ASMCodeGenerator.turnAddressIntoValue(fragment, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(fragment, 4);
        storeITo(fragment, STORE_ADDRESS_TEMP);
        ASMCodeGenerator.turnAddressIntoValue(fragment, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(fragment, 4);
        storeITo(fragment, COPY_SIZE_TEMP);
        ASMCodeGenerator.turnAddressIntoValue(fragment, PrimitiveType.INTEGER, STACK_POINTER);
        popStack(fragment, 4);
        storeITo(fragment, COPY_LOCATION_TEMP);
        fragment.add(Jump, continuesLabel);

        // break and end
        fragment.add(Label, breaksLabel);
        popStack(fragment, 12);
        fragment.add(Label, endsLabel);

        // set pop-temp back
        fragment.add(PushI, -12);
        addITo(fragment, STACK_POP_TEMP);
        return fragment;
    }
}
