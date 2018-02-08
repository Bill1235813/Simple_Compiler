package semanticAnalyzer.types;

import static semanticAnalyzer.types.PrimitiveType.*;

public class TypeLiteral implements Type {
    private Type literaltype;
    public static final TypeLiteral TYPE_INTEGER = new TypeLiteral(INTEGER);
    public static final TypeLiteral TYPE_FLOATING = new TypeLiteral(FLOATING);
    public static final TypeLiteral TYPE_CHARACTER = new TypeLiteral(CHARACTER);
    public static final TypeLiteral TYPE_RATIONAL = new TypeLiteral(RATIONAL);
    public static final TypeLiteral TYPE_BOOLEAN = new TypeLiteral(BOOLEAN);

    public TypeLiteral(Type literaltype) {
        this.literaltype = literaltype;
    }

    public Type getLiteraltype() {
        return literaltype;
    }

    public void setLiteraltype(Type literaltype) {
        this.literaltype = literaltype;
    }

    @Override
    public int getSize() {
        return literaltype.getSize();
    }

    @Override
    public String infoString() {
        return toString();
    }

    @Override
    public String toString() {
        return "[TYPE " + literaltype.toString() + "]";
    }

    @Override
    public boolean equivalent(Type othertype) {
        if (othertype instanceof TypeLiteral) {
            TypeLiteral otherTypeLiteral = (TypeLiteral) othertype;
            return literaltype.equivalent(otherTypeLiteral.getLiteraltype());
        }
        return false;
    }

    @Override
    public Type getConcreteType() {
        return literaltype.getConcreteType();
    }
}
