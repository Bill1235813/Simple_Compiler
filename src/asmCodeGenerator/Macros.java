package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class Macros {

    public static void addITo(ASMCodeFragment frag, String location) {
        loadIFrom(frag, location);
        frag.add(Add);
        storeITo(frag, location);
    }

    public static void incrementInteger(ASMCodeFragment frag, String location) {
        frag.add(PushI, 1);
        addITo(frag, location);
    }

    public static void decrementInteger(ASMCodeFragment frag, String location) {
        frag.add(PushI, -1);
        addITo(frag, location);
    }

    public static void loadIFrom(ASMCodeFragment frag, String location) {
        frag.add(PushD, location);
        frag.add(LoadI);
    }

    public static void storeITo(ASMCodeFragment frag, String location) {
        frag.add(PushD, location);
        frag.add(Exchange);
        frag.add(StoreI);
    }

    public static void declareI(ASMCodeFragment frag, String variableName) {
        frag.add(DLabel, variableName);
        frag.add(DataZ, 4);
    }

    public static void moveIMemory(ASMCodeFragment frag, String fromlocation, String tolocation) {
    		loadIFrom(frag, fromlocation);
    		storeITo(frag, tolocation);
    }
    
    public static void swap(ASMCodeFragment frag, String firstlocation, String secondlocation) {
    		loadIFrom(frag, firstlocation);
    		loadIFrom(frag, secondlocation);
    		storeITo(frag, firstlocation);
    		storeITo(frag, secondlocation);
    }
    
    /**
     * [... baseLocation] -> [... intValue]
     *
     * @param frag   ASMCodeFragment to add code to
     * @param offset amount to add to the base location before reading
     */
    public static void readIOffset(ASMCodeFragment frag, int offset) {
        frag.add(PushI, offset);    // [base offset]
        frag.add(Add);                // [base+off]
        frag.add(LoadI);            // [*(base+off)]
    }

    /**
     * [... baseLocation] -> [... charValue]
     *
     * @param frag   ASMCodeFragment to add code to
     * @param offset amount to add to the base location before reading
     */
    public static void readCOffset(ASMCodeFragment frag, int offset) {
        frag.add(PushI, offset);    // [base offset]
        frag.add(Add);                // [base+off]
        frag.add(LoadC);            // [*(base+off)]
    }

    /**
     * [... intToWrite baseLocation] -> [...]
     *
     * @param frag   ASMCodeFragment to add code to
     * @param offset amount to add to the base location before writing
     */
    public static void writeIOffset(ASMCodeFragment frag, int offset) {
        frag.add(PushI, offset);    // [datum base offset]
        frag.add(Add);                // [datum base+off]
        frag.add(Exchange);            // [base+off datum]
        frag.add(StoreI);            // []
    }

    /**
     * [... charToWrite baseLocation] -> [...]
     *
     * @param frag   ASMCodeFragment to add code to
     * @param offset amount to add to the base location before writing
     */
    public static void writeCOffset(ASMCodeFragment frag, int offset) {
        frag.add(PushI, offset);    // [datum base offset]
        frag.add(Add);                // [datum base+off]
        frag.add(Exchange);            // [base+off datum]
        frag.add(StoreC);            // []
    }

    /**
     * 
     * @param frag	ASMCodeFragment to add code to
     * @param location	the pointer stored location
     * @param offset	amount to add to the base location before writing
     * @param num	the number to be written
     */
    public static void writeIPBaseOffset(ASMCodeFragment frag, String location, int offset, int num) {
    		loadIFrom(frag, location); // [...pointer at location]
    		frag.add(PushI, offset);
    		frag.add(Add); // [...pointer+offset]
    		frag.add(PushI, num); // [...pointer+offset num]
    		frag.add(StoreI);
    }
    
    /**
     * there should be one element on stack
     * @param frag	ASMCodeFragment to add code to
     * @param location	the pointer stored location
     * @param offset	amount to add to the base location before writing
     */
    public static void writeIPtrOffset(ASMCodeFragment frag, String location, int offset) {
    		loadIFrom(frag, location); // [...num pointer at location]
		frag.add(PushI, offset);
		frag.add(Add); // [...num pointer+offset]
		frag.add(Exchange);
		frag.add(StoreI);
    }
    
    ////////////////////////////////////////////////////////////////////
    // debugging aids

    // does not disturb accumulator.  Takes a format string - no %'s!
    public static void printString(ASMCodeFragment code, String format) {
        String stringLabel = new Labeller("pstring").newLabel("");
        code.add(DLabel, stringLabel);
        code.add(DataS, format);
        code.add(PushD, stringLabel);
        code.add(Printf);
    }

    // does not disturb accumulator.  Takes a format string
    public static void printAccumulatorTop(ASMCodeFragment code, String format) {
        String stringLabel = new Labeller("ptop").newLabel("");
        code.add(Duplicate);
        code.add(DLabel, stringLabel);
        code.add(DataS, format);
        code.add(PushD, stringLabel);
        code.add(Printf);
    }

    public static void printAccumulator(ASMCodeFragment code, String string) {
        String stringLabel = new Labeller("pstack").newLabel("");
        code.add(DLabel, stringLabel);
        code.add(DataS, string + " ");
        code.add(PushD, stringLabel);
        code.add(Printf);
        code.add(PStack);
    }
}
