package semanticAnalyzer.types;

import semanticAnalyzer.signatures.FunctionSignature;

import java.util.ArrayList;
import java.util.List;

import static semanticAnalyzer.types.PrimitiveType.INTEGER;

public class LambdaType implements Type {
    private List<Type> typeList;
    private Type returntype;
    private int size;
    private FunctionSignature signature;

    public LambdaType(List<Type> typeList) {
        this.typeList = typeList;
        this.returntype = PrimitiveType.NO_TYPE;
        this.size = INTEGER.getSize();
    }

    public LambdaType(List<Type> typeList, Type returntype) {
        this.typeList = typeList;
        this.returntype = returntype;
        this.size = INTEGER.getSize();
        computeSignature();
    }

    @Override
    public int getSize() {
        return size;
    }

    @Override
    public String infoString() {
        return toString();
    }

    @Override
    public String toString() {
        StringBuilder s = new StringBuilder("<");
        for (Type type : typeList) {
            s.append(type.toString());
            s.append(",");
        }
        s.deleteCharAt(s.length() - 1);
        s.append(">->");
        s.append(returntype.toString());
        return s.toString();
    }

    @Override
    public boolean equivalent(Type othertype) {
        if (othertype instanceof LambdaType) {
            LambdaType otherLambda = (LambdaType) othertype;
            if (!returntype.equivalent(otherLambda.returntype)) {
                return false;
            }
            for (int i = 0; i < typeList.size(); ++i) {
                if (!typeList.get(i).equivalent(otherLambda.typeList.get(i))) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    @Override
    public Type getConcreteType() {
        List<Type> concreteTypeList = new ArrayList<>();
        for (Type type : typeList) {
            concreteTypeList.add(type.getConcreteType());
        }
        Type concreteReturn = returntype.getConcreteType();
        return new LambdaType(concreteTypeList, concreteReturn);
    }

    public Type getReturntype() {
        return returntype;
    }

    public void setReturntype(Type returntype) {
        this.returntype = returntype;
        computeSignature();
    }

    public List<Type> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<Type> typeList) {
        this.typeList = typeList;
    }

    public void setSize(int size) {
        this.size = size;
    }

    private void computeSignature() {
        Type[] types = new Type[typeList.size() + 1];
        for (int i = 0; i < typeList.size(); ++i) {
            types[i] = typeList.get(i);
        }
        types[typeList.size()] = returntype;
        this.signature = new FunctionSignature(1, types);
    }

    public FunctionSignature getSignature() {
        return signature;
    }
}
