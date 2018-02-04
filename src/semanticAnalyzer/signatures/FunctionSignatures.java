package semanticAnalyzer.signatures;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.simpleCodeGenerator.CastToBooleanCodeGenerator;
import asmCodeGenerator.simpleCodeGenerator.CastToCharacterCodeGenerator;
import com.sun.org.apache.bcel.internal.generic.NOP;
import lexicalAnalyzer.Punctuator;
import semanticAnalyzer.types.Type;
import asmCodeGenerator.simpleCodeGenerator.IntegerDivideCodeGenerator;
import asmCodeGenerator.simpleCodeGenerator.FloatingDivideCodeGenerator;
import static semanticAnalyzer.types.PrimitiveType.*;

public class FunctionSignatures extends ArrayList<FunctionSignature> {
    private static final long serialVersionUID = -4907792488209670697L;
    private static Map<Object, FunctionSignatures> signaturesForKey = new HashMap<Object, FunctionSignatures>();

    Object key;

    public FunctionSignatures(Object key, FunctionSignature... functionSignatures) {
        this.key = key;
        for (FunctionSignature functionSignature : functionSignatures) {
            add(functionSignature);
        }
        signaturesForKey.put(key, this);
    }

    public Object getKey() {
        return key;
    }

    public boolean hasKey(Object key) {
        return this.key.equals(key);
    }

    public FunctionSignature acceptingSignature(List<Type> types) {
        for (FunctionSignature functionSignature : this) {
            if (functionSignature.accepts(types)) {
                return functionSignature;
            }
        }
        return FunctionSignature.nullInstance();
    }

    public boolean accepts(List<Type> types) {
        return !acceptingSignature(types).isNull();
    }


    /////////////////////////////////////////////////////////////////////////////////
    // access to FunctionSignatures by key object.

    public static FunctionSignatures nullSignatures = new FunctionSignatures(0, FunctionSignature.nullInstance());

    public static FunctionSignatures signaturesOf(Object key) {
        if (signaturesForKey.containsKey(key)) {
            return signaturesForKey.get(key);
        }
        return nullSignatures;
    }

    public static FunctionSignature signature(Object key, List<Type> types) {
        FunctionSignatures signatures = FunctionSignatures.signaturesOf(key);
        return signatures.acceptingSignature(types);
    }


    /////////////////////////////////////////////////////////////////////////////////
    // Put the signatures for operators in the following static block.

    static {
        // here's one example to get you started with FunctionSignatures: the signatures for addition.
        // for this to work, you should statically import PrimitiveType.*

        // arithmetic +, -, *, /
		new FunctionSignatures(
		        Punctuator.ADD,
                new FunctionSignature(ASMOpcode.Add, INTEGER, INTEGER, INTEGER),
		        new FunctionSignature(ASMOpcode.FAdd, FLOATING, FLOATING, FLOATING)
		);

		new FunctionSignatures(
		        Punctuator.SUBTRACT,
                new FunctionSignature(ASMOpcode.Subtract, INTEGER, INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.FSubtract, FLOATING, FLOATING, FLOATING)
        );

		new FunctionSignatures(
		        Punctuator.MULTIPLY,
			    new FunctionSignature(ASMOpcode.Multiply, INTEGER, INTEGER, INTEGER),
			    new FunctionSignature(ASMOpcode.FMultiply, FLOATING, FLOATING, FLOATING)
		);

		new FunctionSignatures(
                Punctuator.DIVIDE,
                new FunctionSignature(new IntegerDivideCodeGenerator(), INTEGER, INTEGER, INTEGER),
                new FunctionSignature(new FloatingDivideCodeGenerator(), FLOATING, FLOATING, FLOATING)
        );

		// comparison <. >, <=, >=, !=, ==
		for (Punctuator comparison: Punctuator.comparisons) {
			FunctionSignature iSignature = new FunctionSignature(1, INTEGER, INTEGER, BOOLEAN);
			FunctionSignature cSignature = new FunctionSignature(1, CHARACTER, CHARACTER, BOOLEAN);
			FunctionSignature fSignature = new FunctionSignature(1, FLOATING, FLOATING, BOOLEAN);
			FunctionSignature bSignature = new FunctionSignature(1, BOOLEAN, BOOLEAN, BOOLEAN);
			FunctionSignature sSignature = new FunctionSignature(1, STRING, STRING, BOOLEAN);
			
			if (comparison == Punctuator.EQUAL || comparison == Punctuator.NOTEQUAL) {
				new FunctionSignatures(comparison, iSignature, 
						cSignature, fSignature, bSignature, sSignature);
			} else {
				new FunctionSignatures(comparison, iSignature, 
						cSignature, fSignature);
			}
		}

		// casting
        new FunctionSignatures(
                Punctuator.VERTICAL_LINE,
                new FunctionSignature(ASMOpcode.Nop, INTEGER, INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.Nop, FLOATING, FLOATING, FLOATING),
                new FunctionSignature(ASMOpcode.Nop, CHARACTER, CHARACTER, CHARACTER),
                new FunctionSignature(ASMOpcode.Nop, BOOLEAN, BOOLEAN, BOOLEAN),
                new FunctionSignature(ASMOpcode.Nop, STRING, STRING, STRING),
                new FunctionSignature(ASMOpcode.ConvertI, FLOATING, INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.ConvertF, INTEGER, FLOATING, FLOATING),
                new FunctionSignature(new CastToBooleanCodeGenerator(), INTEGER, BOOLEAN, BOOLEAN),
                new FunctionSignature(new CastToBooleanCodeGenerator(), CHARACTER, BOOLEAN, BOOLEAN),
                new FunctionSignature(new CastToCharacterCodeGenerator(), INTEGER, CHARACTER, CHARACTER),
                new FunctionSignature(ASMOpcode.Nop, CHARACTER, INTEGER, INTEGER)
        );

		// boolean &&, ||, !
		new FunctionSignatures(
		        Punctuator.BOOLEAN_AND,
                new FunctionSignature(ASMOpcode.And, BOOLEAN, BOOLEAN, BOOLEAN)
        );

        new FunctionSignatures(
                Punctuator.BOOLEAN_OR,
                new FunctionSignature(ASMOpcode.Or, BOOLEAN, BOOLEAN, BOOLEAN)
        );

        new FunctionSignatures(
                Punctuator.BOOLEAN_NOT,
                new FunctionSignature(ASMOpcode.BNegate, BOOLEAN, BOOLEAN)
        );

        // First, we use the operator itself (in this case the Punctuator ADD) as the key.
        // Then, we give that key two signatures: one an (INT x INT -> INT) and the other
        // a (FLOAT x FLOAT -> FLOAT).  Each signature has a "whichVariant" parameter where
        // I'm placing the instruction (ASMOpcode) that needs to be executed.
        //
        // I'll follow the convention that if a signature has an ASMOpcode for its whichVariant,
        // then to generate code for the operation, one only needs to generate the code for
        // the operands (in order) and then add to that the Opcode.  For instance, the code for
        // floating addition should look like:
        //
        //		(generate argument 1)	: may be many instructions
        //		(generate argument 2)   : ditto
        //		FAdd					: just one instruction
        //
        // If the code that an operator should generate is more complicated than this, then
        // I will not use an ASMOpcode for the whichVariant.  In these cases I typically use
        // a small object with one method (the "Command" design pattern) that generates the
        // required code.

    }

}
