package semanticAnalyzer.types;

import java.util.ArrayList;
import java.util.List;

import static semanticAnalyzer.types.PrimitiveType.INTEGER;

public class LambdaType implements Type {
    private List<Type> typeList;
    private Type returntype;

    public LambdaType(List<Type> typeList) {
        this.typeList = typeList;
    }

    public LambdaType(List<Type> typeList, Type returntype) {
        this.typeList = typeList;
        this.returntype = returntype;
    }
    @Override
    public int getSize() {
        return INTEGER.getSize();
    }

    @Override
    public String infoString() {
        return toString();
    }

    @Override
    public String toString() {
        StringBuilder s = new StringBuilder("<");
        for (Type type: typeList) {
            s.append(type.toString());
            s.append(",");
        }
        s.deleteCharAt(s.length()-1);
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
            for (int i=0;i<typeList.size();++i) {
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
        for (Type type:typeList) {
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
    }

    public List<Type> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<Type> typeList) {
        this.typeList = typeList;
    }
}
