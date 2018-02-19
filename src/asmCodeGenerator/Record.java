package asmCodeGenerator;

public class Record {
    public static final int RECORD_TYPEID_OFFSET = 0;
    public static final int RECORD_STATUS_OFFSET = 4;
    public static final int RECORD_SUBTYPE_IS_REF_OFFSET = 5;
    public static final int RECORD_IS_DELETED_OFFSET = 6;
    public static final int RECORD_PERMANENT_OFFSET = 7;
    public static final int SUBTYPE_REFERENCE_SHIFT = 16;

    public static final int ARRAY_SUBTYPE_SIZE_OFFSET = 8;
    public static final int ARRAY_LENGTH_OFFSET = 12;
    public static final int STRING_LENGTH_OFFSET = 8;

    public static final int STRING_TYPE_ID = 6;
    public static final int ARRAY_TYPE_ID = 7;

    public static final int ARRAY_HEADER_SIZE = 16;

    public static final int STRING_HEADER_SIZE = 12;
    public static final int STRING_TAIL_SIZE = 1;
    public static final int STRING_EXTRA_SIZE = 13;

    public static final int STRING_STATUSFLAG = (1 << 24) + 1;
}
