package semanticAnalyzer.signatures;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import asmCodeGenerator.FullCodeGenerator.ShortCircuitAndCodeGenerator;
import asmCodeGenerator.FullCodeGenerator.ShortCircuitOrCodeGenerator;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.simpleCodeGenerator.*;
import com.sun.org.apache.bcel.internal.generic.NOP;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Punctuator;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeLiteral;
import semanticAnalyzer.types.TypeVariable;

import static semanticAnalyzer.types.PrimitiveType.*;
import static semanticAnalyzer.types.TypeLiteral.*;

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

    private static TypeLiteral Type(Type type) {
        return new TypeLiteral(type);
    }

    /////////////////////////////////////////////////////////////////////////////////
    // Put the signatures for operators in the following static block.

    static {
        // here's one example to get you started with FunctionSignatures: the signatures for addition.
        // for this to work, you should statically import PrimitiveType.*
        TypeVariable S = new TypeVariable("S");
        TypeVariable T = new TypeVariable("T");
        Array arrayOfS = new Array(S);
        List<TypeVariable> setST = Arrays.asList(S,T);
        List<TypeVariable> setS = Arrays.asList(S);

        // arithmetic +, -, *, /, //, ///, ////
        new FunctionSignatures(
                Punctuator.ADD,
                new FunctionSignature(ASMOpcode.Add, INTEGER, INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.FAdd, FLOATING, FLOATING, FLOATING),
                new FunctionSignature(new RationalAddCodeGenerator(), RATIONAL, RATIONAL, RATIONAL)
        );

        new FunctionSignatures(
                Punctuator.SUBTRACT,
                new FunctionSignature(ASMOpcode.Subtract, INTEGER, INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.FSubtract, FLOATING, FLOATING, FLOATING),
                new FunctionSignature(new RationalSubtractCodeGenerator(), RATIONAL, RATIONAL, RATIONAL)
        );

        new FunctionSignatures(
                Punctuator.MULTIPLY,
                new FunctionSignature(ASMOpcode.Multiply, INTEGER, INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.FMultiply, FLOATING, FLOATING, FLOATING),
                new FunctionSignature(new RationalMultiplyCodeGenerator(), RATIONAL, RATIONAL, RATIONAL)
        );

        new FunctionSignatures(
                Punctuator.DIVIDE,
                new FunctionSignature(new IntegerDivideCodeGenerator(), INTEGER, INTEGER, INTEGER),
                new FunctionSignature(new FloatingDivideCodeGenerator(), FLOATING, FLOATING, FLOATING),
                new FunctionSignature(new RationalDivideCodeGenerator(), RATIONAL, RATIONAL, RATIONAL)
        );

        new FunctionSignatures(
                Punctuator.OVER,
                new FunctionSignature(new FormRationalCodeGenerator(), INTEGER, INTEGER, RATIONAL)
        );

        new FunctionSignatures(
                Punctuator.EXPRESS_OVER,
                new FunctionSignature(new RationalExpressOverCodeGenerator(), RATIONAL, INTEGER, INTEGER),
                new FunctionSignature(new FloatingExpressOverCodeGenerator(), FLOATING, INTEGER, INTEGER)
        );

        new FunctionSignatures(
                Punctuator.RATIONALIZE,
                new FunctionSignature(new RationalRationalizeCodeGenerator(), RATIONAL, INTEGER, RATIONAL),
                new FunctionSignature(new FloatingRationalizeCodeGenerator(), FLOATING, INTEGER, RATIONAL)
        );

        // comparison <. >, <=, >=, !=, ==
        for (Punctuator comparison : Punctuator.comparisons) {
            FunctionSignature iSignature = new FunctionSignature(new ComparisonCodeGenerator(), INTEGER, INTEGER, BOOLEAN);
            FunctionSignature cSignature = new FunctionSignature(new ComparisonCodeGenerator(), CHARACTER, CHARACTER, BOOLEAN);
            FunctionSignature fSignature = new FunctionSignature(new ComparisonCodeGenerator(), FLOATING, FLOATING, BOOLEAN);
            FunctionSignature bSignature = new FunctionSignature(new ComparisonCodeGenerator(), BOOLEAN, BOOLEAN, BOOLEAN);
//            FunctionSignature sSignature = new FunctionSignature(new ComparisonCodeGenerator(), STRING, STRING, BOOLEAN);
            FunctionSignature rSignature = new FunctionSignature(new ComparisonCodeGenerator(), RATIONAL, RATIONAL, BOOLEAN);
//            FunctionSignature aSignature = new FunctionSignature(new ComparisonCodeGenerator(), setS, arrayOfS, arrayOfS, BOOLEAN);

            if (comparison == Punctuator.EQUAL || comparison == Punctuator.NOTEQUAL) {
                new FunctionSignatures(
                		comparison,
                		new FunctionSignature(new ComparisonCodeGenerator(), setS, S, S, BOOLEAN)
            		);
            } else {
                new FunctionSignatures(comparison, iSignature,
                        cSignature, fSignature, rSignature);
            }
        }

        // assignment
        new FunctionSignatures(
                Punctuator.ASSIGN,
                new FunctionSignature(ASMOpcode.Nop, setS, S, S, S)
        );

        // casting
        new FunctionSignatures(
                Punctuator.CASTING,
                new FunctionSignature(ASMOpcode.Nop, setS, S, Type(S), S),
                new FunctionSignature(ASMOpcode.ConvertI, FLOATING, TYPE_INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.ConvertF, INTEGER, TYPE_FLOATING, FLOATING),
                new FunctionSignature(new CastToBooleanCodeGenerator(), INTEGER, TYPE_BOOLEAN, BOOLEAN),
                new FunctionSignature(new CastToBooleanCodeGenerator(), CHARACTER, TYPE_BOOLEAN, BOOLEAN),
                new FunctionSignature(new CastToCharacterCodeGenerator(), INTEGER, TYPE_CHARACTER, CHARACTER),
                new FunctionSignature(ASMOpcode.Nop, CHARACTER, TYPE_INTEGER, INTEGER),
                new FunctionSignature(ASMOpcode.Divide, RATIONAL, TYPE_INTEGER, INTEGER),
                new FunctionSignature(new RationalToFloatingCodeGenerator(), RATIONAL, TYPE_FLOATING, FLOATING),
                new FunctionSignature(new IntegerToRationalCodeGenerator(), INTEGER, TYPE_RATIONAL, RATIONAL),
                new FunctionSignature(new IntegerToRationalCodeGenerator(), CHARACTER, TYPE_RATIONAL, RATIONAL),
                new FunctionSignature(new FloatingToRationalCodeGenerator(), FLOATING, TYPE_RATIONAL, RATIONAL)
        );

        // boolean &&, ||, !
        new FunctionSignatures(
                Punctuator.BOOLEAN_AND,
                new FunctionSignature(new ShortCircuitAndCodeGenerator(), BOOLEAN, BOOLEAN, BOOLEAN)
        );

        new FunctionSignatures(
                Punctuator.BOOLEAN_OR,
                new FunctionSignature(new ShortCircuitOrCodeGenerator(), BOOLEAN, BOOLEAN, BOOLEAN)
        );

        new FunctionSignatures(
                Punctuator.BOOLEAN_NOT,
                new FunctionSignature(ASMOpcode.BNegate, BOOLEAN, BOOLEAN)
        );

        /////////////////////////////////////////////////////////////////////////////////////////////////
        // arrays

        // populated array creation
        new FunctionSignatures(
                Punctuator.POPULATED_ARRAY,
                new FunctionSignature(new PopulatedArrayCodeGenerator(), setS, S, arrayOfS)
        );

        // empty array creation
        new FunctionSignatures(
                Punctuator.EMPTY_ARRAY,
                new FunctionSignature(new EmptyArrayCodeGenerator(), setS, Type(arrayOfS), INTEGER, arrayOfS)
        );

        // array-indexing []
        new FunctionSignatures(
                Punctuator.ARRAY_INDEXING,
                new FunctionSignature(new ArrayIndexingCodeGenerator(), setS, arrayOfS, INTEGER, S)
        );

        // clone
        new FunctionSignatures(
                Keyword.CLONE,
                new FunctionSignature(new CloneArrayCodeGenerator(), setS, arrayOfS, arrayOfS)
        );

        // length
        new FunctionSignatures(
                Keyword.LENGTH,
                new FunctionSignature(new LengthArrayCodeGenerator(), setS, arrayOfS, INTEGER)
        );

        //////////////////////////////////////////////////////////////////////////////////////
        // functions

        new FunctionSignatures(
                Punctuator.FUNCTION_INVOCATION,
                new FunctionSignature(new FunctionInvocationCodeGenerator(), setST, S, T, T)
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
