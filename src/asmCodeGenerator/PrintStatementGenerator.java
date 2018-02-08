package asmCodeGenerator;

import parseTree.ParseNode;
import parseTree.nodeTypes.NewlineNode;
import parseTree.nodeTypes.PrintStatementNode;
import parseTree.nodeTypes.SpaceNode;
import parseTree.nodeTypes.TabNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import asmCodeGenerator.ASMCodeGenerator.CodeVisitor;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class PrintStatementGenerator {
    ASMCodeFragment code;
    ASMCodeGenerator.CodeVisitor visitor;


    public PrintStatementGenerator(ASMCodeFragment code, CodeVisitor visitor) {
        super();
        this.code = code;
        this.visitor = visitor;
    }

    public void generate(PrintStatementNode node) {
        for (ParseNode child : node.getChildren()) {
            if (child instanceof NewlineNode ||
                child instanceof SpaceNode ||
                child instanceof TabNode) {
                ASMCodeFragment childCode = visitor.removeVoidCode(child);
                code.append(childCode);
            } else {
                appendPrintCode(child);
            }
        }
    }

    private void appendPrintCode(ParseNode node) {
        String format = printFormat(node.getType());

        code.append(visitor.removeValueCode(node));
        convertToStringIfBoolean(node);
        if (node.getType() != PrimitiveType.RATIONAL) {
            code.add(PushD, format);
            code.add(Printf);
        } else {
            convertIfRational(node);
        }
    }

    private void convertIfRational(ParseNode node) {
        Labeller labeller = new Labeller("print-rational");
        String endwith_nofraction = labeller.newLabel("end-with-no-fraction");
        String endwith_noint = labeller.newLabel("end-with-no-int");
        String endwith_nointpos = labeller.newLabel("end-with-no-int-pos");
        String endwith_nointneg = labeller.newLabel("end-with-no-int-neg");
        String endwith_original = labeller.newLabel("end-with-original");
        String endjoin = labeller.newLabel("end-join");
        String positive1 = labeller.newLabel("positive1");
        String positive2 = labeller.newLabel("positive2");

        // put the negative sign from denominator to numerator
        code.add(Duplicate);    //  [... num denom denom]
        code.add(JumpPos, positive2);   //  [... num denom]
        code.add(Negate);   //  [... num (pos)denom]
        code.add(Exchange);     //  [... (pos)denom num]
        code.add(Negate);   //  [... (pos)denom -num]
        code.add(Exchange);   //  [... -num (pos)denom]
        code.add(Label, positive2);
        Macros.storeITo(code, RunTime.FIRST_DENOMINATOR);
        Macros.storeITo(code, RunTime.FIRST_NUMERATOR);
        Macros.loadIFrom(code, RunTime.FIRST_NUMERATOR);
        Macros.loadIFrom(code, RunTime.FIRST_DENOMINATOR);
        code.add(Divide);   //  [... int]
        code.add(Duplicate);    //  [... int int]
        Macros.loadIFrom(code, RunTime.FIRST_DENOMINATOR);  //  [... int int denom]
        code.add(Multiply); //  [... int int*denom]
        Macros.loadIFrom(code, RunTime.FIRST_NUMERATOR);    //  [... int int*denom num]
        code.add(Exchange); //  [... int num int*denom]
        code.add(Subtract); //  [... int fact.num]
        code.add(Duplicate);    //  [... int fact.num fact.num]
        code.add(JumpFalse, endwith_nofraction);    //  [... int fact.num] if (fact.num==0) jump

        // has faction
        Macros.storeITo(code, RunTime.FIRST_NUMERATOR); //  [... int]
        code.add(Duplicate);    //  [... int int]
        Macros.storeITo(code, RunTime.PRINT_TEMP);  //  [... int]
        code.add(JumpFalse, endwith_noint); //  [...]

        // has int
        Macros.loadIFrom(code, RunTime.FIRST_NUMERATOR);    //  [... fact.num]
        code.add(Duplicate);    //  [... fact.num fact.num]
        code.add(JumpPos, positive1);   //  [... fact.num]
        code.add(Negate);   //  [... (pos)fact.num]
        code.add(Label, positive1);    //  [... (pos)fact.num]
        Macros.loadIFrom(code, RunTime.FIRST_DENOMINATOR);    //  [... (pos)fact.num (pos)denom]
        code.add(Exchange); //  [... (pos)denom (pos)fact.num]
        Macros.loadIFrom(code, RunTime.PRINT_TEMP); //  [... (pos)denom (pos)fact.num int]
        code.add(Jump, endwith_original);

        // determine format
        code.add(Label, endwith_nofraction);   //  [... int fact.num]
        code.add(Pop);  //  [... int]
        code.add(PushD, RunTime.RATIONAL_PRINT_NO_FRACTION);    //  [... int %d]
        code.add(Jump, endjoin);

        code.add(Label, endwith_noint);    //  [...] denom must be positive
        Macros.loadIFrom(code, RunTime.FIRST_NUMERATOR);
        code.add(Duplicate);    //  [... num num]
        code.add(JumpPos, endwith_nointpos);    //  [... num]
        code.add(Negate);   //  [... -num]
        code.add(Jump, endwith_nointneg);
        code.add(Label, endwith_nointpos);
        Macros.loadIFrom(code, RunTime.FIRST_DENOMINATOR);  //  [... num denom]
        code.add(Exchange);  //  [... denom num]
        code.add(PushD, RunTime.RATIONAL_PRINT_NO_INTEGER_POS);
        code.add(Jump, endjoin);
        code.add(Label, endwith_nointneg);
        Macros.loadIFrom(code, RunTime.FIRST_DENOMINATOR);  //  [... num denom]
        code.add(Exchange); //  [... denom num]
        code.add(PushD, RunTime.RATIONAL_PRINT_NO_INTEGER_NEG);
        code.add(Jump, endjoin);

        code.add(Label, endwith_original);  //  [... (pos)denom (pos)fact.num int]
        code.add(PushD, RunTime.RATIONAL_PRINT_ORIGINAL);
        code.add(Jump, endjoin);

        // join
        code.add(Label, endjoin);
        code.add(Printf);
    }

    private void convertToStringIfBoolean(ParseNode node) {
        if (node.getType() != PrimitiveType.BOOLEAN) {
            return;
        }

        Labeller labeller = new Labeller("print-boolean");
        String trueLabel = labeller.newLabel("true");
        String endLabel = labeller.newLabel("join");

        code.add(JumpTrue, trueLabel);
        code.add(PushD, RunTime.BOOLEAN_FALSE_STRING);
        code.add(Jump, endLabel);
        code.add(Label, trueLabel);
        code.add(PushD, RunTime.BOOLEAN_TRUE_STRING);
        code.add(Label, endLabel);
    }


    private static String printFormat(Type type) {
        assert type instanceof PrimitiveType;

        switch ((PrimitiveType) type) {
            case INTEGER:
                return RunTime.INTEGER_PRINT_FORMAT;
            case FLOATING:
                return RunTime.FLOATING_PRINT_FORMAT;
            case BOOLEAN:
                return RunTime.BOOLEAN_PRINT_FORMAT;
            case CHARACTER:
                return RunTime.CHARACTER_PRINT_FORMAT;
            case STRING:
                return RunTime.STRING_PRINT_FORMAT;
            case RATIONAL:
                return RunTime.RATIONAL_PRINT_ORIGINAL;
            default:
                assert false : "Type " + type + " unimplemented in PrintStatementGenerator.printFormat()";
                return "";
        }
    }
}
