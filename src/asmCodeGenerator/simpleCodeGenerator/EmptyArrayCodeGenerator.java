package asmCodeGenerator.simpleCodeGenerator;

import static asmCodeGenerator.Macros.*;

import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class EmptyArrayCodeGenerator implements SimpleCodeGenerator {
	private int statusFlag = 0;
	
	public EmptyArrayCodeGenerator() {
		super();
	}
	
	@Override
	public ASMCodeFragment generate(ParseNode node) {
		ASMCodeFragment fragment = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
		
		assert node.getType() instanceof Array;
		Array arrayType = (Array) node.getType();		
		if (arrayType.subtypeIsReference()) {
			statusFlag = 1 << Record.SUBTYPE_REFERENCE_SHIFT;
		}
		
		RunTime.createEmptyArrayRecord(fragment, statusFlag, arrayType.getSubtype().getSize());
		loadIFrom(fragment, RunTime.RECORD_CREATION_TEMPORARY);
		
		return fragment;
	}
}
