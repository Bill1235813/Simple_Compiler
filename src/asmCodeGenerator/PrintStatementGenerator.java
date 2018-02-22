package asmCodeGenerator;

import parseTree.ParseNode;
import parseTree.nodeTypes.NewlineNode;
import parseTree.nodeTypes.PrintStatementNode;
import parseTree.nodeTypes.SpaceNode;
import parseTree.nodeTypes.TabNode;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import asmCodeGenerator.ASMCodeGenerator.CodeVisitor;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;

import static asmCodeGenerator.Macros.loadIFrom;
import static asmCodeGenerator.Macros.storeITo;
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
        code.markAsVoid();
    }

    private void appendPrintCode(ParseNode node) {
        code.append(visitor.removeValueCode(node));
        appendPrintCode(node.getType());
    }

    private void appendPrintCode(Type type) {
        convertToStringIfBoolean(type);
        applyOffsetIfString(type);

        if (type == PrimitiveType.RATIONAL) {
            code.add(Call, RunTime.PRINT_RATIONAL);
        } else if (type instanceof Array) {
            recursiveAppendPrintCode((Array) type);
        } else {
            String format = printFormat(type);
            code.add(PushD, format);
            code.add(Printf);
        }
    }

    // [... array_addr]
    private void recursiveAppendPrintCode(Array type) {
        Type subtype = type.getSubtype();

        Labeller labeller = new Labeller("recursive-print-array");
        String startflag = labeller.newLabel("startflag");
        String loopflag = labeller.newLabel("loopflag");
        String endflag = labeller.newLabel("endflag");

        // check array is not null
        code.add(Duplicate);
        code.add(JumpFalse, RunTime.NULL_ARRAY_RUNTIME_ERROR);

        // start
        code.add(PushD, RunTime.ARRAY_PRINT_START);
        code.add(Printf);

        code.add(Duplicate); // [... array_addr array_addr]
        RunTime.getLength(code); // [... array_addr length]
        code.add(Exchange); // [... length array_addr]
        code.add(PushI, Record.ARRAY_HEADER_SIZE);
        code.add(Add); // [... length start_addr]
        code.add(Exchange); // [... addr length]

        // begin check
        code.add(Label, startflag);
        code.add(Duplicate); // [... addr length length]
        code.add(JumpFalse, endflag); // [... addr length]

        // start to loop
        code.add(Label, loopflag);
        code.add(Exchange); // [... length addr]
        code.add(Duplicate); // [... length addr addr]
        ASMCodeGenerator.turnAddressIntoValue(code, subtype); // [... length addr value]
        appendPrintCode(subtype); // [... length addr]
        code.add(PushI, subtype.getSize());
        code.add(Add); // [... length next_addr]
        code.add(Exchange); // [... next_addr length]
        code.add(PushI, -1);
        code.add(Add); // [... next_addr new_length]
        code.add(Duplicate);
        code.add(JumpFalse, endflag); // [... next_addr new_length]
        code.add(PushD, RunTime.ARRAY_PRINT_MIDDLE);
        code.add(Printf);
        code.add(Jump, loopflag);

        // end of loop
        code.add(Label, endflag);
        code.add(Pop);
        code.add(Pop); // [...]

        code.add(PushD, RunTime.ARRAY_PRINT_END);
        code.add(Printf);
    }

    // [... string_addr]
    private void applyOffsetIfString(Type type) {
        if (type != PrimitiveType.STRING) {
            return;
        }

        // check if string is null
        code.add(Duplicate);
        code.add(JumpFalse, RunTime.NULL_STRING_RUNTIME_ERROR);
        
        code.add(PushI, Record.STRING_HEADER_SIZE);
        code.add(Add);
    }

    private void convertToStringIfBoolean(Type type) {
        if (type != PrimitiveType.BOOLEAN) {
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
