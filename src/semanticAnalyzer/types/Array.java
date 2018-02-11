package semanticAnalyzer.types;

import static semanticAnalyzer.types.PrimitiveType.*;

public class Array implements Type{
	private Type subtype;
	
	public Array(Type subtype) {
		this.subtype = subtype;
	}
	
	public Type getSubtype() {
		return subtype;
	}
	
	private void setSubtype(Type subtype) {
		this.subtype = subtype;
	}
	
	@Override
	public int getSize() {
		return INTEGER.getSize();
	}

	@Override
	public String infoString() {
		return toString();
	}
	
	public String toString() {
		return "[" + subtype.toString() + "]";
	}

    public boolean subtypeIsReference() {
		if (subtype instanceof Array) {
			return true;
		} else {
			return subtype.equivalent(PrimitiveType.STRING);
		}
    }
    
	@Override
	public boolean equivalent(Type otherType) {
		if (otherType instanceof Array) {
			Array otherArray= (Array) otherType;
			return subtype.equivalent(otherArray.getSubtype());
		}
		return false;
	}

	@Override
	public Type getConcreteType() { 
		Type concreteSubtype = subtype.getConcreteType(); 
		return new Array(concreteSubtype);
	}
}
