package semanticAnalyzer.types;

import asmCodeGenerator.codeStorage.ASMOpcode;

public class TypeVariable implements Type{
	private String name;
	private Type typeConstraint;

	public TypeVariable(String name) { 
		this.setName(name); 
		this.setTypeConstraint(PrimitiveType.NO_TYPE);
	}
	
	public String getName() {
		return name;
	}

	private void setName(String name) {
		this.name = name;
	}

	public Type getTypeConstraint() {
		return typeConstraint;
	}

	private void setTypeConstraint(Type typeConstraint) {
		this.typeConstraint = typeConstraint;
	}
	
	////////////////////////////////////////
	// attributes
	public void reset() {
		if (typeConstraint instanceof TypeVariable) {
			((TypeVariable)typeConstraint).reset();
		}
		setTypeConstraint(PrimitiveType.NO_TYPE);
	}
	
	@Override
	public int getSize() {
		return 0;
	}

	@Override
	public String infoString() {
		return toString();
	}
	
	public String pikaNativeString() {
		return toString();
	}
	
	public String toString() {
		return "<" + getName() + ">";
	}
	
	@Override
	public boolean equivalent(Type otherType) {
		if (otherType instanceof TypeVariable) {
			throw new RuntimeException("equals attempted on two types containing type variables."); 
		}
		if (this.getTypeConstraint() == PrimitiveType.NO_TYPE) { 
			setTypeConstraint(otherType);
			return true;
		}
		return this.getTypeConstraint().equivalent(otherType);
	}

	@Override
	public Type getConcreteType() {
		return getTypeConstraint().getConcreteType();
	}	
}
