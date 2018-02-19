package semanticAnalyzer.types;

public interface Type {
    /**
     * returns the size of an instance of this type, in bytes.
     *
     * @return number of bytes per instance
     */
    public int getSize();

    /**
     * Yields a printable string for information about this type.
     * use this rather than toString() if you want an abbreviated string.
     * In particular, this yields an empty string for PrimitiveType.NO_TYPE.
     *
     * @return string representation of type.
     */
    public String infoString();

    public boolean equivalent(Type type);

    /**
     * compare if two types is the same
     *
     * @return two types equivalent or not
     */

    public Type getConcreteType();
    /**
     * substitute out TypeVariables
     *
     * @return just the type
     */
}
