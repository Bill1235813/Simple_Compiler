package asmCodeGenerator.runtime;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.Macros.*;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.Labeller;
import asmCodeGenerator.Macros;
import asmCodeGenerator.Record;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.ParseNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class RunTime {
    public static final String EAT_LOCATION_ZERO = "$eat-location-zero";        // helps us distinguish null pointers from real ones.
    public static final String INTEGER_PRINT_FORMAT = "$print-format-integer";
    public static final String FLOATING_PRINT_FORMAT = "$print-format-floating";
    public static final String CHARACTER_PRINT_FORMAT = "$print-format-character";
    public static final String STRING_PRINT_FORMAT = "$print-format-string";
    public static final String BOOLEAN_PRINT_FORMAT = "$print-format-boolean";
    public static final String RATIONAL_PRINT_ORIGINAL = "$print-format-rational-original";
    public static final String RATIONAL_PRINT_NO_FRACTION = "$print-format-rational-no-frac";
    public static final String RATIONAL_PRINT_NO_INTEGER_POS = "$print-format-rational-no-int-pos";
    public static final String RATIONAL_PRINT_NO_INTEGER_NEG = "$print-format-rantional-no-int-neg";
    public static final String ARRAY_PRINT_START = "$array-print-start";
    public static final String ARRAY_PRINT_END = "$array-print-end";
    public static final String ARRAY_PRINT_MIDDLE = "$array-print-middle";
    public static final String NEWLINE_PRINT_FORMAT = "$print-format-newline";
    public static final String TAB_PRINT_FORMAT = "$print-format-tab";
    public static final String SPACE_PRINT_FORMAT = "$print-format-space";
    public static final String BOOLEAN_TRUE_STRING = "$boolean-true-string";
    public static final String BOOLEAN_FALSE_STRING = "$boolean-false-string";
    public static final String GLOBAL_MEMORY_BLOCK = "$global-memory-block";
    public static final String USABLE_MEMORY_START = "$usable-memory-start";
    public static final String MAIN_PROGRAM_LABEL = "$$main";

    // temporary variables
    public static final String ARRAY_INDEXING_ARRAY = "$a-indexing-array";
    public static final String ARRAY_INDEXING_INDEX = "$a-indexing-index";
    public static final String FIRST_NUMERATOR = "$first-numerator";
    public static final String SECOND_NUMERATOR = "$second-numerator";
    public static final String FIRST_DENOMINATOR = "$first-denominator";
    public static final String SECOND_DENOMINATOR = "$second-denominator";
    public static final String RETURN_FOR_RUNTIME_FUNCTION = "$return-for-runtime-func";
    public static final String GCD_TEMP_NUMERATOR = "$gcd-temp-numerator";
    public static final String GCD_TEMP_DENOMINATOR = "$gcd-temp-denominator";
    public static final String PRINT_TEMP = "$print-temp";
    public static final String EXPRESS_OVER_DENOMINATOR = "$express-over-denominator";
    public static final String RECORD_CREATION_TEMPORARY = "$record-creation-temporary";
    public static final String ARRAY_DATASIZE_TEMPORARY = "$array-datasize-temporary";
    public static final String CLEANING_SIZE_TEMP = "$clear-size-temp";
    public static final String INSERT_SIZE_TEMP = "$insert-size-temp";
    public static final String INSERT_LOCATION_TEMP = "insert-location-temp";
    public static final String CLONE_LOCATION_TEMP = "clone-location-temp";
    public static final String CLONE_SIZE_TEMP = "clone-size-temp";
    public static final String CLONE_NEW_LOCATION_TEMP = "clone-new-location-temp";

    public static final String LOWEST_TERMS = "$$convert-to-lowest-terms";
    public static final String CLEAR_N_BYTES = "$$clear-n-bytes";
    public static final String PRINT_RATIONAL = "$$print-rational";
    public static final String RELEASE_REFERENCE = "$$release-reference";
    public static final String GENERAL_RUNTIME_ERROR = "$$general-runtime-error";
    public static final String INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$i-divide-by-zero";
    public static final String FLOATING_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$f-divide-by-zero";
    public static final String RATIONAL_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$r-divide-by-zero";
    public static final String NEGATIVE_LENGTH_ARRAY_RUNTIME_ERROR = "$$array-size-is-negative";
    public static final String NULL_ARRAY_RUNTIME_ERROR = "$$array-is-null";
    public static final String OVERFLOW_ARRAY_RUNTIME_ERROR = "$$array-size-is-out-of-bound";

    private ASMCodeFragment environmentASM() {
        ASMCodeFragment result = new ASMCodeFragment(GENERATES_VOID);
        result.append(jumpToMain());
        result.append(stringsForPrintf());
        result.append(runtimeErrors());
        result.append(temporaryVariables());
        result.append(subroutinesGenerator());
        result.add(DLabel, USABLE_MEMORY_START);
        return result;
    }

    private ASMCodeFragment jumpToMain() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
        frag.add(Jump, MAIN_PROGRAM_LABEL);
        return frag;
    }

    private ASMCodeFragment stringsForPrintf() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
        frag.add(DLabel, EAT_LOCATION_ZERO);
        frag.add(DataZ, 8);
        frag.add(DLabel, INTEGER_PRINT_FORMAT);
        frag.add(DataS, "%d");
        frag.add(DLabel, FLOATING_PRINT_FORMAT);
        frag.add(DataS, "%g");
        frag.add(DLabel, CHARACTER_PRINT_FORMAT);
        frag.add(DataS, "%c");
        frag.add(DLabel, STRING_PRINT_FORMAT);
        frag.add(DataS, "%s");
        frag.add(DLabel, BOOLEAN_PRINT_FORMAT);
        frag.add(DataS, "%s");
        frag.add(DLabel, RATIONAL_PRINT_NO_FRACTION);
        frag.add(DataS, "%d");
        frag.add(DLabel, RATIONAL_PRINT_NO_INTEGER_POS);
        frag.add(DataS, "_%d/%d");
        frag.add(DLabel, RATIONAL_PRINT_NO_INTEGER_NEG);
        frag.add(DataS, "-_%d/%d");
        frag.add(DLabel, RATIONAL_PRINT_ORIGINAL);
        frag.add(DataS, "%d_%d/%d");
        frag.add(DLabel, NEWLINE_PRINT_FORMAT);
        frag.add(DataS, "\n");
        frag.add(DLabel, TAB_PRINT_FORMAT);
        frag.add(DataS, "\t");
        frag.add(DLabel, SPACE_PRINT_FORMAT);
        frag.add(DataS, " ");
        frag.add(DLabel, BOOLEAN_TRUE_STRING);
        frag.add(DataS, "true");
        frag.add(DLabel, BOOLEAN_FALSE_STRING);
        frag.add(DataS, "false");
        frag.add(DLabel, ARRAY_PRINT_START);
        frag.add(DataS, "[");
        frag.add(DLabel, ARRAY_PRINT_END);
        frag.add(DataS, "]");
        frag.add(DLabel, ARRAY_PRINT_MIDDLE);
        frag.add(DataS, ", ");

        return frag;
    }


    private ASMCodeFragment runtimeErrors() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);

        generalRuntimeError(frag);
        integerDivideByZeroError(frag);
        floatingDivideByZeroError(frag);
        rationalDivideByZeroError(frag);
        negativeArraySizeError(frag);
        nullArrayError(frag);
        overflowArraySizeError(frag);
        return frag;
    }

    private ASMCodeFragment generalRuntimeError(ASMCodeFragment frag) {
        String generalErrorMessage = "$errors-general-message";

        frag.add(DLabel, generalErrorMessage);
        frag.add(DataS, "Runtime error: %s\n");

        frag.add(Label, GENERAL_RUNTIME_ERROR);
        frag.add(PushD, generalErrorMessage);
        frag.add(Printf);
        frag.add(Halt);
        return frag;
    }

    private void negativeArraySizeError(ASMCodeFragment frag) {
        String negativeArraySizeMessage = "$errors-negative-array-size";

        frag.add(DLabel, negativeArraySizeMessage);
        frag.add(DataS, "negative array size");

        frag.add(Label, NEGATIVE_LENGTH_ARRAY_RUNTIME_ERROR);
        frag.add(PushD, negativeArraySizeMessage);
        frag.add(Jump, GENERAL_RUNTIME_ERROR);
    }

    private void nullArrayError(ASMCodeFragment frag) {
        String nullArrayMessage = "$errors-null-array-size";

        frag.add(DLabel, nullArrayMessage);
        frag.add(DataS, "array is null");

        frag.add(Label, NULL_ARRAY_RUNTIME_ERROR);
        frag.add(PushD, nullArrayMessage);
        frag.add(Jump, GENERAL_RUNTIME_ERROR);
    }

    private void overflowArraySizeError(ASMCodeFragment frag) {
        String overflowArraySizeMessage = "$errors-overflow-array-size";

        frag.add(DLabel, overflowArraySizeMessage);
        frag.add(DataS, "overflow array size");

        frag.add(Label, OVERFLOW_ARRAY_RUNTIME_ERROR);
        frag.add(PushD, overflowArraySizeMessage);
        frag.add(Jump, GENERAL_RUNTIME_ERROR);
    }

    private void integerDivideByZeroError(ASMCodeFragment frag) {
        String intDivideByZeroMessage = "$errors-int-divide-by-zero";

        frag.add(DLabel, intDivideByZeroMessage);
        frag.add(DataS, "integer divide by zero");

        frag.add(Label, INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        frag.add(PushD, intDivideByZeroMessage);
        frag.add(Jump, GENERAL_RUNTIME_ERROR);
    }

    private void floatingDivideByZeroError(ASMCodeFragment frag) {
        String floatDivideByZeroMessage = "$errors-float-divide-by-zero";

        frag.add(DLabel, floatDivideByZeroMessage);
        frag.add(DataS, "floating divide by zero");

        frag.add(Label, FLOATING_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        frag.add(PushD, floatDivideByZeroMessage);
        frag.add(Jump, GENERAL_RUNTIME_ERROR);
    }

    private void rationalDivideByZeroError(ASMCodeFragment frag) {
        String ratDivideByZeroMessage = "$errors-rat-divide-by-zero";

        frag.add(DLabel, ratDivideByZeroMessage);
        frag.add(DataS, "rational divide by zero");

        frag.add(Label, RATIONAL_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        frag.add(PushD, ratDivideByZeroMessage);
        frag.add(Jump, GENERAL_RUNTIME_ERROR);
    }

    private ASMCodeFragment temporaryVariables() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
        declareI(frag, ARRAY_INDEXING_ARRAY);
        declareI(frag, ARRAY_INDEXING_INDEX);
        declareI(frag, FIRST_NUMERATOR);
        declareI(frag, SECOND_NUMERATOR);
        declareI(frag, FIRST_DENOMINATOR);
        declareI(frag, SECOND_DENOMINATOR);
        declareI(frag, RETURN_FOR_RUNTIME_FUNCTION);
        declareI(frag, GCD_TEMP_NUMERATOR);
        declareI(frag, GCD_TEMP_DENOMINATOR);
        declareI(frag, PRINT_TEMP);
        declareI(frag, EXPRESS_OVER_DENOMINATOR);
        declareI(frag, RECORD_CREATION_TEMPORARY);
        declareI(frag, ARRAY_DATASIZE_TEMPORARY);
        declareI(frag, CLEANING_SIZE_TEMP);
        declareI(frag, INSERT_SIZE_TEMP);
        declareI(frag, INSERT_LOCATION_TEMP);
        declareI(frag, CLONE_NEW_LOCATION_TEMP);
        declareI(frag, CLONE_LOCATION_TEMP);
        declareI(frag, CLONE_SIZE_TEMP);
        return frag;
    }

    private ASMCodeFragment subroutinesGenerator() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
        frag.append(lowestTermsConverter());
        frag.append(clearNBytes());
        frag.append(printRational());
        frag.append(releaseReference());
        return frag;
    }

    private ASMCodeFragment lowestTermsConverter() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);  //	[... num denom returnAddr]
        Labeller labeller = new Labeller("$function-lowest");
        String loopcontinue = labeller.newLabel("loop-continue");
        String loopend = labeller.newLabel("loop-end");

        frag.add(Label, LOWEST_TERMS);
        // store return addr
        storeITo(frag, RETURN_FOR_RUNTIME_FUNCTION);  //	[... num denom]

        // check denominator not 0
        frag.add(Duplicate);  //	[... num denom denom]
        frag.add(JumpFalse, RunTime.RATIONAL_DIVIDE_BY_ZERO_RUNTIME_ERROR);  //	[... num denom denom]

        // store arguments
        frag.add(Duplicate);
        storeITo(frag, FIRST_DENOMINATOR);
        storeITo(frag, GCD_TEMP_DENOMINATOR);  //		[... num]
        frag.add(Duplicate);
        storeITo(frag, FIRST_NUMERATOR);
        storeITo(frag, GCD_TEMP_NUMERATOR);  //	[...]

        // gcd
        frag.add(Label, loopcontinue);
        loadIFrom(frag, GCD_TEMP_NUMERATOR);  //	[... num]
        loadIFrom(frag, GCD_TEMP_DENOMINATOR);  //		[... num denom]
        frag.add(Remainder);  //	[... num%denom]
        frag.add(Duplicate);  //	[...	 num%denom num%denom]
        frag.add(JumpFalse, loopend);  //	[...num%denom]
        moveIMemory(frag, GCD_TEMP_DENOMINATOR, GCD_TEMP_NUMERATOR); // [...num%denom] denom -> num
        storeITo(frag, GCD_TEMP_DENOMINATOR);  //	[...]
        frag.add(Jump, loopcontinue);
        frag.add(Label, loopend);
        frag.add(Pop);  //	[...]

        //  perform lowest convert
        loadIFrom(frag, FIRST_NUMERATOR);
        loadIFrom(frag, GCD_TEMP_DENOMINATOR);  //		[... num gcd]
        frag.add(Divide);  //		[... num(lowest)]
        loadIFrom(frag, FIRST_DENOMINATOR);
        loadIFrom(frag, GCD_TEMP_DENOMINATOR);  //		[... num(lowest) denom gcd]
        frag.add(Divide);  //	[.. num(lowest) denom(lowest)]

        loadIFrom(frag, RETURN_FOR_RUNTIME_FUNCTION);  //	[.. num(lowest) denom(lowest) return addr]       
        frag.add(Return);  //	[.. num(lowest) denom(lowest)]
        return frag;
    }

    // set elemSize bytes start from elemsPtr 0	// [...elemsPtr elemSize (return)]
    private ASMCodeFragment clearNBytes() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
        Labeller labeller = new Labeller("$function-clear");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        frag.add(Label, CLEAR_N_BYTES);
        // store return addr
        storeITo(frag, RETURN_FOR_RUNTIME_FUNCTION); // [...elemsPtr elemSize]
        // store size
        storeITo(frag, CLEANING_SIZE_TEMP);

        frag.add(Label, loopflag);
        loadIFrom(frag, CLEANING_SIZE_TEMP); // [... elemsPtr elemSize]
        frag.add(JumpFalse, endflag); // [... elemsPtr]
        frag.add(Duplicate); // [... elemsPtr elemsPtr]
        frag.add(PushI, 0);
        frag.add(StoreC); // [... elemsPtr]
        frag.add(PushI, 1); // [... elemsPtr 1]
        frag.add(Add); // [... elemsPtr+1]
        decrementInteger(frag, CLEANING_SIZE_TEMP); // elemsSize -= 1
        frag.add(Jump, loopflag);

        frag.add(Label, endflag);
        frag.add(Pop);
        loadIFrom(frag, RETURN_FOR_RUNTIME_FUNCTION);
        frag.add(Return);
        return frag;
    }

    // print rational numbers [... num denom (return)] -> print num/denom
    private ASMCodeFragment printRational() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
        // set label
        Labeller labeller = new Labeller("$print-rational");
        String endwith_nofraction = labeller.newLabel("end-with-no-fraction");
        String endwith_noint = labeller.newLabel("end-with-no-int");
        String endwith_nointpos = labeller.newLabel("end-with-no-int-pos");
        String endwith_nointneg = labeller.newLabel("end-with-no-int-neg");
        String endwith_original = labeller.newLabel("end-with-original");
        String endjoin = labeller.newLabel("end-join");
        String positive1 = labeller.newLabel("positive1");
        String positive2 = labeller.newLabel("positive2");

        frag.add(Label, PRINT_RATIONAL);
        // store return addr
        storeITo(frag, RETURN_FOR_RUNTIME_FUNCTION);

        // put the negative sign from denominator to numerator
        frag.add(Duplicate);    //  [... num denom denom]
        frag.add(JumpPos, positive2);   //  [... num denom]
        frag.add(Negate);   //  [... num (pos)denom]
        frag.add(Exchange);     //  [... (pos)denom num]
        frag.add(Negate);   //  [... (pos)denom -num]
        frag.add(Exchange);   //  [... -num (pos)denom]
        frag.add(Label, positive2);
        storeITo(frag, RunTime.FIRST_DENOMINATOR);
        storeITo(frag, RunTime.FIRST_NUMERATOR);
        loadIFrom(frag, RunTime.FIRST_NUMERATOR);
        loadIFrom(frag, RunTime.FIRST_DENOMINATOR);
        frag.add(Divide);   //  [... int]
        frag.add(Duplicate);    //  [... int int]
        loadIFrom(frag, RunTime.FIRST_DENOMINATOR);  //  [... int int denom]
        frag.add(Multiply); //  [... int int*denom]
        loadIFrom(frag, RunTime.FIRST_NUMERATOR);    //  [... int int*denom num]
        frag.add(Exchange); //  [... int num int*denom]
        frag.add(Subtract); //  [... int fact.num]
        frag.add(Duplicate);    //  [... int fact.num fact.num]
        frag.add(JumpFalse, endwith_nofraction);    //  [... int fact.num] if (fact.num==0) jump

        // has faction
        storeITo(frag, RunTime.FIRST_NUMERATOR); //  [... int]
        frag.add(Duplicate);    //  [... int int]
        storeITo(frag, RunTime.PRINT_TEMP);  //  [... int]
        frag.add(JumpFalse, endwith_noint); //  [...]

        // has int
        loadIFrom(frag, RunTime.FIRST_NUMERATOR);    //  [... fact.num]
        frag.add(Duplicate);    //  [... fact.num fact.num]
        frag.add(JumpPos, positive1);   //  [... fact.num]
        frag.add(Negate);   //  [... (pos)fact.num]
        frag.add(Label, positive1);    //  [... (pos)fact.num]
        loadIFrom(frag, RunTime.FIRST_DENOMINATOR);    //  [... (pos)fact.num (pos)denom]
        frag.add(Exchange); //  [... (pos)denom (pos)fact.num]
        loadIFrom(frag, RunTime.PRINT_TEMP); //  [... (pos)denom (pos)fact.num int]
        frag.add(Jump, endwith_original);

        // determine format
        frag.add(Label, endwith_nofraction);   //  [... int fact.num]
        frag.add(Pop);  //  [... int]
        frag.add(PushD, RunTime.RATIONAL_PRINT_NO_FRACTION);    //  [... int %d]
        frag.add(Jump, endjoin);

        frag.add(Label, endwith_noint);    //  [...] denom must be positive
        loadIFrom(frag, RunTime.FIRST_NUMERATOR);
        frag.add(Duplicate);    //  [... num num]
        frag.add(JumpPos, endwith_nointpos);    //  [... num]
        frag.add(Negate);   //  [... -num]
        frag.add(Jump, endwith_nointneg);
        frag.add(Label, endwith_nointpos);
        loadIFrom(frag, RunTime.FIRST_DENOMINATOR);  //  [... num denom]
        frag.add(Exchange);  //  [... denom num]
        frag.add(PushD, RunTime.RATIONAL_PRINT_NO_INTEGER_POS);
        frag.add(Jump, endjoin);
        frag.add(Label, endwith_nointneg);
        loadIFrom(frag, RunTime.FIRST_DENOMINATOR);  //  [... num denom]
        frag.add(Exchange); //  [... denom num]
        frag.add(PushD, RunTime.RATIONAL_PRINT_NO_INTEGER_NEG);
        frag.add(Jump, endjoin);

        frag.add(Label, endwith_original);  //  [... (pos)denom (pos)fact.num int]
        frag.add(PushD, RunTime.RATIONAL_PRINT_ORIGINAL);
        frag.add(Jump, endjoin);

        // join
        frag.add(Label, endjoin);
        frag.add(Printf);

        loadIFrom(frag, RETURN_FOR_RUNTIME_FUNCTION);
        frag.add(Return);
        return frag;
    }

    // [... ref_addr] -> [...] release
    private ASMCodeFragment releaseReference() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID); // [... ref_addr (return)]
        // set label
        Labeller labeller = new Labeller("$release-reference");
        String endflag = labeller.newLabel("endflag");
        String subtypeIsRefflag = labeller.newLabel("subtypeIsRefflag");
        String returnflag = labeller.newLabel("returnflag");

        frag.add(Label, RELEASE_REFERENCE);
        frag.add(Exchange); // [... (return) ref_addr]
        // check permanent
        frag.add(Duplicate);
        frag.add(PushI, Record.RECORD_PERMANENT_OFFSET);
        frag.add(Add);
        frag.add(LoadC); // [... (return) ref_addr permanent]
        frag.add(JumpTrue, endflag);
        // check is_deleted
        frag.add(Duplicate);
        frag.add(PushI, Record.RECORD_IS_DELETED_OFFSET);
        frag.add(Add);
        frag.add(LoadC); // [... (return) ref_addr deleted]
        frag.add(JumpTrue, endflag);
        // check subtype_is_ref
        frag.add(Duplicate);
        frag.add(PushI, Record.RECORD_SUBTYPE_IS_REF_OFFSET);
        frag.add(Add);
        frag.add(LoadC); // [... (return) ref_addr subtype]
        frag.add(JumpTrue, subtypeIsRefflag); // [... (return) ref_addr]
        // deal with subtype not ref
        frag.add(Duplicate);
        frag.add(PushI, Record.RECORD_IS_DELETED_OFFSET);
        frag.add(Add);
        frag.add(PushI, 1);
        frag.add(StoreC); // [... (return) ref_addr] set deleted bit
        frag.add(Call, MemoryManager.MEM_MANAGER_DEALLOCATE);
        frag.add(Jump, returnflag); // [... (return)]
        // deal with subtype is ref
        frag.add(Label, subtypeIsRefflag);
        releaseSubtype(frag); // [... (return) ref_addr_bottom]

        // end
        frag.add(Label, endflag); // [... (return) ref_addr]
        frag.add(Pop);
        frag.add(Label, returnflag); // [... (return)]
        frag.add(Return);
        return frag;
    }

    // subtype reference release [... ref_addr] -> [... ref_addr_bottom]
    private static void releaseSubtype(ASMCodeFragment code) {
        Labeller labeller = new Labeller("$release-subtype-reference");
        String endflag = labeller.newLabel("endflag");
        String loopflag = labeller.newLabel("loopflag");

        code.add(Duplicate);
        getLength(code); // [... ref_addr length]
        code.add(Exchange); // [... length ref_addr]
        code.add(PushI, Record.ARRAY_HEADER_SIZE);
        code.add(Add); // [... length ref_addr_start]
        code.add(Exchange); // [... ref_addr length]

        code.add(Label, loopflag);
        code.add(Duplicate); // [... ref_addr length length]
        code.add(JumpFalse, endflag); // [... ref_addr length]
        code.add(Exchange);
        code.add(Duplicate); // [... length ref_addr ref_addr]
        code.add(LoadI); // [... length ref_addr sub_addr]
        code.add(Call, RELEASE_REFERENCE); // [... length ref_addr]
        code.add(PushI, PrimitiveType.INTEGER.getSize());
        code.add(Add); // [... length next_ref_addr]
        code.add(Exchange); // [... next_ref_addr length]
        code.add(PushI, -1);
        code.add(Add); // [... next_ref_addr length-1]
        code.add(Jump, loopflag);

        code.add(Label, endflag); // [... ref_addr length]
        code.add(Pop); // [... ref_addr]

    }

    // insert exprList to the specific location [... exprList nElems location]
    public static void insertToRecord(ASMCodeFragment code, Type subType) {

        storeITo(code, RunTime.INSERT_LOCATION_TEMP);
        storeITo(code, RunTime.INSERT_SIZE_TEMP); // [... exprList]

        Labeller labeller = new Labeller("function-insert");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        code.add(Label, loopflag);
        loadIFrom(code, RunTime.INSERT_SIZE_TEMP); // [... exprList nElems]
        code.add(JumpFalse, endflag); // [... exprList]

        // store one element
        if (subType.equivalent(PrimitiveType.RATIONAL)) {
            loadIFrom(code, RunTime.INSERT_LOCATION_TEMP);
            writeIOffset(code, 4);
            loadIFrom(code, RunTime.INSERT_LOCATION_TEMP);
            writeIOffset(code, 0);
        } else {
            loadIFrom(code, RunTime.INSERT_LOCATION_TEMP);
            code.add(Exchange);
            code.add(ASMCodeGenerator.opcodeForStore(subType));
        }

        decrementInteger(code, RunTime.INSERT_SIZE_TEMP); // elemsSize -= 1
        code.add(PushI, subType.getSize());
        addITo(code, RunTime.INSERT_LOCATION_TEMP); // location += subtype.size()
        code.add(Jump, loopflag);

        code.add(Label, endflag);
    }

    // leaves new record in RECORD_CREATION_TEMPORARY // [... stringExprList length+1]
    public static void createStringRecord(ASMCodeFragment code, int length) {
        final int typecode = Record.STRING_TYPE_ID;
        final int statusFlags = Record.STRING_STATUSFLAG;

        code.add(Duplicate);
        code.add(PushI, Record.STRING_HEADER_SIZE);
        code.add(Add); // [... stringExprList length+1 total]

        createRecord(code, typecode, statusFlags);
        loadIFrom(code, RECORD_CREATION_TEMPORARY); // [... stringExprList length+1 addr]
        code.add(PushI, Record.STRING_HEADER_SIZE);
        code.add(Add); // [... stringExprList length+1 start_addr]

        insertToRecord(code, PrimitiveType.CHARACTER); // [...]
        writeIPBaseOffset(code, RECORD_CREATION_TEMPORARY,
                Record.STRING_LENGTH_OFFSET, length); // [...]
    }

    // leaves new record in RECORD_CREATION_TEMPORARY
    // [... size] -> [...]
    public static void createRecord(ASMCodeFragment code, int typecode, int statusFlags) {
        code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
        storeITo(code, RECORD_CREATION_TEMPORARY);
        writeIPBaseOffset(code, RECORD_CREATION_TEMPORARY,
                Record.RECORD_TYPEID_OFFSET, typecode);
        writeIPBaseOffset(code, RECORD_CREATION_TEMPORARY,
                Record.RECORD_STATUS_OFFSET, statusFlags);
    }

    // leaves new record in RECORD_CREATION_TEMPORARY // [... nElems] -> [...]
    public static void createEmptyArrayRecord(ASMCodeFragment code,
                                              int statusFlags, int subtypeSize) {
        final int typecode = Record.ARRAY_TYPE_ID;

        code.add(Duplicate); // [... nElems nElems]
        code.add(JumpNeg, RunTime.NEGATIVE_LENGTH_ARRAY_RUNTIME_ERROR); // [... nElems]

        code.add(Duplicate); // [... nElems nElems]
        code.add(PushI, subtypeSize); // [... nElems nElems subSize]
        code.add(Multiply); // [... nElems elemsSize]
        code.add(Duplicate); // [... nElems elemsSize elemsSize]
        storeITo(code, ARRAY_DATASIZE_TEMPORARY); // [... nElems elemsSize]
        code.add(PushI, Record.ARRAY_HEADER_SIZE); // [... nElems elemsSize AHS]
        code.add(Add); // [... nElems totalRecordSize]

        createRecord(code, typecode, statusFlags); // [... nElems]
        loadIFrom(code, RECORD_CREATION_TEMPORARY); // [... nElems ptr]
        code.add(PushI, Record.ARRAY_HEADER_SIZE); // [... nElems ptr AHS]
        code.add(Add); // [... nElems elemsPtr]
        loadIFrom(code, ARRAY_DATASIZE_TEMPORARY); // [... nElems elemsPtr elemSize]
        code.add(Call, CLEAR_N_BYTES); // [...nElems]

        writeIPBaseOffset(code, RECORD_CREATION_TEMPORARY,
                Record.ARRAY_SUBTYPE_SIZE_OFFSET, subtypeSize); // [... length]
        writeIPtrOffset(code, RECORD_CREATION_TEMPORARY,
                Record.ARRAY_LENGTH_OFFSET); // [...]
    }

    // [... addr] -> [... addr2]
    public static void cloneArray(ASMCodeFragment code) {
        Labeller labeller = new Labeller("clone-array");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        // store location and size
        storeITo(code, CLONE_LOCATION_TEMP);
        loadIFrom(code, CLONE_LOCATION_TEMP);
        getLength(code); // [... length]
        loadIFrom(code, CLONE_LOCATION_TEMP);
        readIOffset(code, Record.ARRAY_SUBTYPE_SIZE_OFFSET); // [... length subsize]
        code.add(Multiply);
        code.add(PushI, Record.ARRAY_HEADER_SIZE);
        code.add(Add); // [... totalsize]
        storeITo(code, CLONE_SIZE_TEMP);
        loadIFrom(code, CLONE_SIZE_TEMP);

        // allocate new location
        code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
        storeITo(code, CLONE_NEW_LOCATION_TEMP);
        moveIMemory(code, CLONE_NEW_LOCATION_TEMP, RECORD_CREATION_TEMPORARY);

        // move char by char
        code.add(Label, loopflag);
        loadIFrom(code, CLONE_SIZE_TEMP);
        code.add(JumpFalse, endflag);
        loadIFrom(code, CLONE_LOCATION_TEMP);
        code.add(LoadC);
        loadIFrom(code, CLONE_NEW_LOCATION_TEMP);
        code.add(Exchange);
        code.add(StoreC);
        decrementInteger(code, CLONE_SIZE_TEMP); // elemsSize -= 1
        incrementInteger(code, CLONE_LOCATION_TEMP);
        incrementInteger(code, CLONE_NEW_LOCATION_TEMP); // location += 1
        code.add(Jump, loopflag);
        code.add(Label, endflag);
    }

    // [... addr] -> [... length]
    public static void getLength(ASMCodeFragment code) {
        readIOffset(code, Record.ARRAY_LENGTH_OFFSET);
    }

    public static ASMCodeFragment getEnvironment() {
        RunTime rt = new RunTime();
        return rt.environmentASM();
    }
}
