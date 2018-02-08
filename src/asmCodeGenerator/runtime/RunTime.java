package asmCodeGenerator.runtime;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.Macros;
import asmCodeGenerator.codeStorage.ASMCodeFragment;

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

    public static final String LOWEST_TERMS = "$$convert-to-lowest-terms";
    public static final String GENERAL_RUNTIME_ERROR = "$$general-runtime-error";
    public static final String INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$i-divide-by-zero";
    public static final String FLOATING_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$f-divide-by-zero";

    private ASMCodeFragment environmentASM() {
        ASMCodeFragment result = new ASMCodeFragment(GENERATES_VOID);
        result.append(jumpToMain());
        result.append(stringsForPrintf());
        result.append(runtimeErrors());
        result.append(temporaryVariables());
        result.append(lowestTermsConverter());
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

        return frag;
    }


    private ASMCodeFragment runtimeErrors() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);

        generalRuntimeError(frag);
        integerDivideByZeroError(frag);
        floatingDivideByZeroError(frag);

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

    private ASMCodeFragment temporaryVariables() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
        Macros.declareI(frag, ARRAY_INDEXING_ARRAY);
        Macros.declareI(frag, ARRAY_INDEXING_INDEX);
        Macros.declareI(frag, FIRST_NUMERATOR);
        Macros.declareI(frag, SECOND_NUMERATOR);
        Macros.declareI(frag, FIRST_DENOMINATOR);
        Macros.declareI(frag, SECOND_DENOMINATOR);
        Macros.declareI(frag, RETURN_FOR_RUNTIME_FUNCTION);
        Macros.declareI(frag, GCD_TEMP_NUMERATOR);
        Macros.declareI(frag, GCD_TEMP_DENOMINATOR);
        Macros.declareI(frag, PRINT_TEMP);
        return frag;
    }

    private ASMCodeFragment lowestTermsConverter() {
        ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);  //	[... num denom returnAddr]
        Labeller labeller = new Labeller("$function");
//    		String trueflag = labeller.newLabel("compare-trueflag");
//    		String endflag = labeller.newLabel("compare-endflag");
        String loopcontinue = labeller.newLabel("loop-continue");
        String loopend = labeller.newLabel("loop-end");

        frag.add(Label, LOWEST_TERMS);
        // store return addr
        Macros.storeITo(frag, RETURN_FOR_RUNTIME_FUNCTION);  //	[... num denom]

        // check denominator not 0
        frag.add(Duplicate);  //	[... num denom denom]
        frag.add(JumpFalse, RunTime.INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);  //	[... num denom denom]

        // store arguments
        frag.add(Duplicate);
        Macros.storeITo(frag, FIRST_DENOMINATOR);
        Macros.storeITo(frag, GCD_TEMP_DENOMINATOR);  //		[... num]
        frag.add(Duplicate);
        Macros.storeITo(frag, FIRST_NUMERATOR);
        Macros.storeITo(frag, GCD_TEMP_NUMERATOR);  //	[...]

        // find bigger as numerator, ensure num >= denom
        //        Macros.loadIFrom(frag, GCD_TEMP_NUMERATOR);  //	[... num]
        //        Macros.loadIFrom(frag, GCD_TEMP_DENOMINATOR);  //		[... num denom]
        //        frag.add(Subtract);  //	[... num-denom]
        //        frag.add(JumpNeg, trueflag);  //	[...]
        //        frag.add(Jump, endflag);
        //        frag.add(DLabel, trueflag);  // num < denom need exchange
        //        Macros.swap(frag, GCD_TEMP_NUMERATOR, GCD_TEMP_DENOMINATOR);
        //        frag.add(DLabel, endflag);

        // gcd
        frag.add(Label, loopcontinue);
        Macros.loadIFrom(frag, GCD_TEMP_NUMERATOR);  //	[... num]
        Macros.loadIFrom(frag, GCD_TEMP_DENOMINATOR);  //		[... num denom]
        frag.add(Remainder);  //	[... num%denom]
        frag.add(Duplicate);  //	[...	 num%denom num%denom]
        frag.add(JumpFalse, loopend);  //	[...num%denom]
        Macros.moveIMemory(frag, GCD_TEMP_DENOMINATOR, GCD_TEMP_NUMERATOR); // [...num%denom] denom -> num
        Macros.storeITo(frag, GCD_TEMP_DENOMINATOR);  //	[...]
        frag.add(Jump, loopcontinue);
        frag.add(Label, loopend);
        frag.add(Pop);  //	[...]

        //  perform lowest convert
        Macros.loadIFrom(frag, FIRST_NUMERATOR);
        Macros.loadIFrom(frag, GCD_TEMP_DENOMINATOR);  //		[... num gcd]
        frag.add(Divide);  //		[... num(lowest)]
        Macros.loadIFrom(frag, FIRST_DENOMINATOR);
        Macros.loadIFrom(frag, GCD_TEMP_DENOMINATOR);  //		[... num(lowest) denom gcd]
        frag.add(Divide);  //	[.. num(lowest) denom(lowest)]
        Macros.loadIFrom(frag, RETURN_FOR_RUNTIME_FUNCTION);  //	[.. num(lowest) denom(lowest) return addr]
        frag.add(Return);  //	[.. num(lowest) denom(lowest)]
        return frag;
    }

    public static ASMCodeFragment getEnvironment() {
        RunTime rt = new RunTime();
        return rt.environmentASM();
    }
}
