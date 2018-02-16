package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class PopulatedArrayCodeGenerator implements SimpleCodeGenerator {
	private int statusFlag = 0;
	
	public PopulatedArrayCodeGenerator() {
		super();
	}
	
	@Override
	public ASMCodeFragment generate(ParseNode node) {
		ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

		assert node.nChildren() == 1;
		fragment.add(PushI, node.child(0).nChildren()); // number of the child [... exprList nElems]
		
		// create an empty array first
		assert node.getType() instanceof Array;
		Array arrayType = (Array) node.getType();
		Type subType = arrayType.getSubtype();
		if (arrayType.subtypeIsReference()) {
			statusFlag = 1 << Record.SUBTYPE_REFERENCE_SHIFT;
		}
		RunTime.createEmptyArrayRecord(fragment, statusFlag, subType.getSize()); // [... exprList]
		
		// insert the children - addr still in RunTime.RECORD_CREATION_TEMPORARY
		fragment.add(PushI, node.child(0).nChildren()); // number of the child [... exprList nElems]
		loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);
		fragment.add(PushI, Record.ARRAY_HEADER_SIZE);
		fragment.add(Add);
		storeITo(fragment, RunTime.INSERT_LOCATION_TEMP);
		storeITo(fragment, RunTime.INSERT_SIZE_TEMP); // [... exprList]
		
		Labeller labeller = new Labeller("function-insert");
		String loopflag = labeller.newLabel("loopflag");
		String endflag = labeller.newLabel("endflag");
		
		fragment.add(Label, loopflag);
		loadIFrom(fragment, RunTime.INSERT_SIZE_TEMP); // [... exprList nElems]
		fragment.add(JumpFalse, endflag); // [... exprList]
		
		// store one element
		if (subType.equivalent(PrimitiveType.RATIONAL)) {
			loadIFrom(fragment, RunTime.INSERT_LOCATION_TEMP);
			writeIOffset(fragment, 4);
			loadIFrom(fragment, RunTime.INSERT_LOCATION_TEMP);
			writeIOffset(fragment, 0);
		} else {
			loadIFrom(fragment, RunTime.INSERT_LOCATION_TEMP);
			fragment.add(Exchange);
			fragment.add(opcodeForStore(subType));
		}
		
		decrementInteger(fragment, RunTime.INSERT_SIZE_TEMP); // elemsSize -= 1
		fragment.add(PushI, subType.getSize());
        addITo(fragment, RunTime.INSERT_LOCATION_TEMP); // location += subtype.size()
		fragment.add(Jump, loopflag);
		
		fragment.add(Label, endflag);
		loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);
		return fragment;
	}
	
    private ASMOpcode opcodeForStore(Type type) {
        if (type == PrimitiveType.INTEGER ||
                type == PrimitiveType.STRING || 
                type instanceof Array) {
            return StoreI;
        }
        if (type == PrimitiveType.FLOATING) {
            return StoreF;
        }
        if (type == PrimitiveType.BOOLEAN ||
                type == PrimitiveType.CHARACTER) {
            return StoreC;
        }
        assert false : "Type " + type + " unimplemented in opcodeForStore()";
        return null;
    }

}
