package semanticAnalyzer.signatures;

import java.util.ArrayList;
import java.util.List;

import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeVariable;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;

//immutable
public class FunctionSignature {
    private static final boolean ALL_TYPES_ACCEPT_ERROR_TYPES = true;
    private Type resultType;
    private Type[] paramTypes;
    Object whichVariant;
    List<TypeVariable> typeVariables;


    ///////////////////////////////////////////////////////////////
    // construction

    public FunctionSignature(Object whichVariant, Type... types) {
        this(whichVariant, new ArrayList<TypeVariable>(), types);
    }

    public FunctionSignature(Object whichVariant, List<TypeVariable> typeVariables, Type... types) {
        assert (types.length >= 1);
        this.typeVariables = typeVariables;
        storeParamTypes(types);
        resultType = types[types.length - 1];
        this.whichVariant = whichVariant;
    }

    private void storeParamTypes(Type[] types) {
        paramTypes = new Type[types.length - 1];
        for (int i = 0; i < types.length - 1; i++) {
            paramTypes[i] = types[i];
        }
    }

    ///////////////////////////////////////////////////////////////
    // accessors
    public FunctionSignature getConcreteSignature() {
        if (typeVariables.size() != 0) {
            Type[] concreteparam = new Type[paramTypes.length + 1];
            for (int i = 0; i < paramTypes.length; ++i) {
                concreteparam[i] = paramTypes[i].getConcreteType();
            }
            concreteparam[paramTypes.length] = resultType().getConcreteType();
            return new FunctionSignature(whichVariant, concreteparam);
        } else {
            return this;
        }
    }

    public Object getVariant() {
        return whichVariant;
    }

    public Type resultType() {
        return resultType.getConcreteType();
    }

    public boolean isNull() {
        return false;
    }

    public Type firstParamType() {
        if (paramTypes.length > 0) {
            return paramTypes[0];
        } else {
            assert false : "no parameter in this operation";
            return PrimitiveType.ERROR;
        }
    }

    public Type[] getParamTypes() {
        return paramTypes;
    }
    ///////////////////////////////////////////////////////////////
    // main query

    public boolean accepts(List<Type> types) {
        resetTypeVariables();
        if (types.size() != paramTypes.length) {
            return false;
        }

        for (int i = 0; i < paramTypes.length; i++) {
            if (!assignableTo(paramTypes[i], types.get(i))) {
                return false;
            }
        }
        return true;
    }

    private void resetTypeVariables() {
        for (TypeVariable T : typeVariables) {
            T.reset();
        }
    }

    private boolean assignableTo(Type variableType, Type valueType) {
        if (valueType == PrimitiveType.ERROR && ALL_TYPES_ACCEPT_ERROR_TYPES) {
        		if (variableType instanceof TypeVariable) {
        			variableType.equivalent(valueType);
        		}
            return true;
        }
        return variableType.equivalent(valueType);
    }

    // Null object pattern
    private static FunctionSignature neverMatchedSignature = new FunctionSignature(1, PrimitiveType.ERROR) {
        public boolean accepts(List<Type> types) {
            return false;
        }

        public boolean isNull() {
            return true;
        }
    };

    public static FunctionSignature nullInstance() {
        return neverMatchedSignature;
    }

}