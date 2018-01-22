package asmCodeGenerator;

import java.util.HashMap;
import java.util.Map;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.RunTime;
import asmCodeGenerator.simpleCodeGenerator.SimpleCodeGenerator;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import parseTree.*;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.FunctionSignatures;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

// do not call the code generator if any errors have occurred during analysis.
public class ASMCodeGenerator {
    ParseNode root;
    private static final ASMOpcode[] defaultJumpList = {JumpFalse, JumpPos, JumpNeg};
    private static final Map<Type,ASMOpcode> comparisonOperationMap = new HashMap<Type, ASMOpcode>();
    private static final Map<Type,ASMOpcode[]> comparisonJumpMap = new HashMap<Type, ASMOpcode[]>();
    private static final Map<Punctuator, Integer> comparisonJumpIndexMap = new HashMap<Punctuator, Integer>();
    private static final Map<Punctuator, Integer> comparisonBooleanIndexMap = new HashMap<Punctuator, Integer>();

    public static ASMCodeFragment generate(ParseNode syntaxTree) {
        ASMCodeGenerator codeGenerator = new ASMCodeGenerator(syntaxTree);
        return codeGenerator.makeASM();
    }

    public ASMCodeGenerator(ParseNode root) {
        super();
        makeComparisonOperationMap();
        makeComparisonJumpMap();
        makeComparisonIndexMap();
        this.root = root;
    }

    private void makeComparisonOperationMap() {
        comparisonOperationMap.put(PrimitiveType.FLOATING, FSubtract);
        comparisonOperationMap.put(PrimitiveType.BOOLEAN, Xor);
    }
    private void makeComparisonJumpMap() {
        ASMOpcode[] floatingJumpList = {JumpFZero, JumpFPos, JumpFNeg};
        comparisonJumpMap.put(PrimitiveType.FLOATING, floatingJumpList);
    }
    private void makeComparisonIndexMap() {
        // '>' -> JumpPos True
        comparisonJumpIndexMap.put(Punctuator.GREATER, 1);
        comparisonBooleanIndexMap.put(Punctuator.GREATER, 1);
        // '<' -> JumpNeg True
        comparisonJumpIndexMap.put(Punctuator.LESS, 2);
        comparisonBooleanIndexMap.put(Punctuator.LESS, 1);
        // '>=' -> JumpNeg False
        comparisonJumpIndexMap.put(Punctuator.GREATEROREQUAL, 2);
        comparisonBooleanIndexMap.put(Punctuator.GREATEROREQUAL, 0);
        // '<=' -> JumpPos False
        comparisonJumpIndexMap.put(Punctuator.LESSOREQUAL, 1);
        comparisonBooleanIndexMap.put(Punctuator.LESSOREQUAL, 0);
        // '==' -> JumpFalse True
        comparisonJumpIndexMap.put(Punctuator.EQUAL, 0);
        comparisonBooleanIndexMap.put(Punctuator.EQUAL, 1);
        // '!=' -> JumpFalse False
        comparisonJumpIndexMap.put(Punctuator.NOTEQUAL, 0);
        comparisonBooleanIndexMap.put(Punctuator.NOTEQUAL, 0);
    }

    public ASMCodeFragment makeASM() {
        ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

        code.append(RunTime.getEnvironment());
        code.append(globalVariableBlockASM());
        code.append(programASM());
//		code.append( MemoryManager.codeForAfterApplication() );

        return code;
    }

    private ASMCodeFragment globalVariableBlockASM() {
        assert root.hasScope();
        Scope scope = root.getScope();
        int globalBlockSize = scope.getAllocatedSize();

        ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
        code.add(DLabel, RunTime.GLOBAL_MEMORY_BLOCK);
        code.add(DataZ, globalBlockSize);
        return code;
    }

    private ASMCodeFragment programASM() {
        ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

        code.add(Label, RunTime.MAIN_PROGRAM_LABEL);
        code.append(programCode());
        code.add(Halt);

        return code;
    }

    private ASMCodeFragment programCode() {
        CodeVisitor visitor = new CodeVisitor();
        root.accept(visitor);
        return visitor.removeRootCode(root);
    }


    protected class CodeVisitor extends ParseNodeVisitor.Default {
        private Map<ParseNode, ASMCodeFragment> codeMap;
        ASMCodeFragment code;

        public CodeVisitor() {
            codeMap = new HashMap<ParseNode, ASMCodeFragment>();
        }


        ////////////////////////////////////////////////////////////////////
        // Make the field "code" refer to a new fragment of different sorts.
        private void newAddressCode(ParseNode node) {
            code = new ASMCodeFragment(GENERATES_ADDRESS);
            codeMap.put(node, code);
        }

        private void newValueCode(ParseNode node) {
            code = new ASMCodeFragment(GENERATES_VALUE);
            codeMap.put(node, code);
        }

        private void newVoidCode(ParseNode node) {
            code = new ASMCodeFragment(GENERATES_VOID);
            codeMap.put(node, code);
        }

        ////////////////////////////////////////////////////////////////////
        // Get code from the map.
        private ASMCodeFragment getAndRemoveCode(ParseNode node) {
            ASMCodeFragment result = codeMap.get(node);
            codeMap.remove(node);
            return result;
        }

        public ASMCodeFragment removeRootCode(ParseNode tree) {
            return getAndRemoveCode(tree);
        }

        ASMCodeFragment removeValueCode(ParseNode node) {
            ASMCodeFragment frag = getAndRemoveCode(node);
            makeFragmentValueCode(frag, node);
            return frag;
        }

        private ASMCodeFragment removeAddressCode(ParseNode node) {
            ASMCodeFragment frag = getAndRemoveCode(node);
            assert frag.isAddress();
            return frag;
        }

        ASMCodeFragment removeVoidCode(ParseNode node) {
            ASMCodeFragment frag = getAndRemoveCode(node);
            assert frag.isVoid();
            return frag;
        }

        ////////////////////////////////////////////////////////////////////
        // convert code to value-generating code.
        private void makeFragmentValueCode(ASMCodeFragment code, ParseNode node) {
            assert !code.isVoid();

            if (code.isAddress()) {
                turnAddressIntoValue(code, node);
            }
        }

        private void turnAddressIntoValue(ASMCodeFragment code, ParseNode node) {
            if (node.getType() == PrimitiveType.INTEGER ||
                    node.getType() == PrimitiveType.STRING) {
                code.add(LoadI);
            } else if (node.getType() == PrimitiveType.FLOATING) {
                code.add(LoadF);
            } else if (node.getType() == PrimitiveType.BOOLEAN ||
                    node.getType() == PrimitiveType.CHARACTER) {
                code.add(LoadC);
            } else {
                assert false : "node " + node;
            }
            code.markAsValue();
        }

        ////////////////////////////////////////////////////////////////////
        // ensures all types of ParseNode in given AST have at least a visitLeave	
        public void visitLeave(ParseNode node) {
            assert false : "node " + node + " not handled in ASMCodeGenerator";
        }

        ///////////////////////////////////////////////////////////////////////////
        // constructs larger than statements
        public void visitLeave(ProgramNode node) {
            newVoidCode(node);
            for (ParseNode child : node.getChildren()) {
                ASMCodeFragment childCode = removeVoidCode(child);
                code.append(childCode);
            }
        }

        public void visitLeave(BlockStatementNode node) {
            newVoidCode(node);
            for (ParseNode child : node.getChildren()) {
                ASMCodeFragment childCode = removeVoidCode(child);
                code.append(childCode);
            }
        }

        ///////////////////////////////////////////////////////////////////////////
        // statements and declarations

        public void visitLeave(PrintStatementNode node) {
            newVoidCode(node);
            new PrintStatementGenerator(code, this).generate(node);
        }

        public void visit(NewlineNode node) {
            newVoidCode(node);
            code.add(PushD, RunTime.NEWLINE_PRINT_FORMAT);
            code.add(Printf);
        }

        public void visit(TabNode node) {
            newVoidCode(node);
            code.add(PushD, RunTime.TAB_PRINT_FORMAT);
            code.add(Printf);
        }

        public void visit(SpaceNode node) {
            newVoidCode(node);
            code.add(PushD, RunTime.SPACE_PRINT_FORMAT);
            code.add(Printf);
        }


        public void visitLeave(DeclarationNode node) {
            newVoidCode(node);
            ASMCodeFragment lvalue = removeAddressCode(node.child(0));
            ASMCodeFragment rvalue = removeValueCode(node.child(1));

            code.append(lvalue);
            code.append(rvalue);

            Type type = node.getType();
            code.add(opcodeForStore(type));
        }

        private ASMOpcode opcodeForStore(Type type) {
            if (type == PrimitiveType.INTEGER ||
                type == PrimitiveType.STRING) {
                return StoreI;
            }
            if (type == PrimitiveType.FLOATING) {
                return StoreF;
            }
            if (type == PrimitiveType.BOOLEAN ||
                type == PrimitiveType.CHARACTER) {
                return StoreC;
            }
            assert false : "Type " + type + " unimplemented in opcodeForStore()";
            return null;
        }


        ///////////////////////////////////////////////////////////////////////////
        // expressions
        public void visitLeave(BinaryOperatorNode node) {
            Lextant operator = node.getOperator();

            if (isComparisonOperatorNode(operator)) {
                visitComparisonOperatorNode(node, operator);
            } else {
                visitNormalBinaryOperatorNode(node);
            }
        }
        
        private boolean isComparisonOperatorNode(Lextant operator) {
        		for (Punctuator comparison: Punctuator.comparisons) {
        			if (operator == comparison) {
        				return true;
        			}
        		}
        		return false;
        }

        private void visitComparisonOperatorNode(BinaryOperatorNode node,
                                                 Lextant operator) {

            ASMCodeFragment arg1 = removeValueCode(node.child(0));
            ASMCodeFragment arg2 = removeValueCode(node.child(1));

            // based on Type and Punctuator, find the correct way to compare
            Type compareType = node.getSignature().firstParamType();
            ASMOpcode comparisonOperation = comparisonOperationMap.getOrDefault(compareType, Subtract);
            ASMOpcode comparisonJumpList[] = comparisonJumpMap.getOrDefault(compareType, defaultJumpList);
            int jumpIndex = comparisonJumpIndexMap.getOrDefault(operator, -1);
            int booleanIndex = comparisonBooleanIndexMap.getOrDefault(operator, -1);

            // Set several Labels
            Labeller labeller = new Labeller("compare");
            String startLabel = labeller.newLabel("arg1");
            String arg2Label = labeller.newLabel("arg2");
            String subLabel = labeller.newLabel("sub");
            String trueLabel = labeller.newLabel("true");
            String falseLabel = labeller.newLabel("false");
            String joinLabel = labeller.newLabel("join");
            String[] booleanList = {falseLabel, trueLabel};

            newValueCode(node);
            code.add(Label, startLabel);
            code.append(arg1);
            code.add(Label, arg2Label);
            code.append(arg2);
            code.add(Label, subLabel);
            code.add(comparisonOperation);

            code.add(comparisonJumpList[jumpIndex], booleanList[booleanIndex]);
            code.add(Jump, booleanList[1 - booleanIndex]);

            code.add(Label, trueLabel);
            code.add(PushI, 1);
            code.add(Jump, joinLabel);
            code.add(Label, falseLabel);
            code.add(PushI, 0);
            code.add(Jump, joinLabel);
            code.add(Label, joinLabel);

        }

        private void visitNormalBinaryOperatorNode(BinaryOperatorNode node) {
            newValueCode(node);
            ASMCodeFragment arg1 = removeValueCode(node.child(0));
            ASMCodeFragment arg2 = removeValueCode(node.child(1));

            code.append(arg1);
            code.append(arg2);

            Object variant = node.getSignature().getVariant();
            if (variant instanceof ASMOpcode) {
                ASMOpcode opcode = (ASMOpcode)variant;
                code.add(opcode);                            // type-dependent! (opcode is different for floats and for ints)
            } else if (variant instanceof SimpleCodeGenerator) {
                SimpleCodeGenerator generator = (SimpleCodeGenerator)variant;
                ASMCodeFragment fragment = generator.generate(node);
                code.append(fragment);

                if (fragment.isAddress()) {
                    code.markAsAddress();  // cannot understand it
                }
            } else {
                // throw exception
                assert false : "unimplemented operator in opcodeForOperator";
            }
        }

        // unused
        private ASMOpcode opcodeForOperator(Lextant lextant) {
            assert (lextant instanceof Punctuator);
            Punctuator punctuator = (Punctuator) lextant;
            switch (punctuator) {
                case ADD:
                    return Add;                // type-dependent!
                case MULTIPLY:
                    return Multiply;        // type-dependent!
                default:
                    assert false : "unimplemented operator in opcodeForOperator";
            }
            return null;
        }

        ///////////////////////////////////////////////////////////////////////////
        // leaf nodes (ErrorNode not necessary)
        public void visit(BooleanConstantNode node) {
            newValueCode(node);
            code.add(PushI, node.getValue() ? 1 : 0);
        }

        public void visit(IdentifierNode node) {
            newAddressCode(node);
            Binding binding = node.getBinding();

            binding.generateAddress(code);
        }

        public void visit(IntegerConstantNode node) {
            newValueCode(node);
            code.add(PushI, node.getValue());
        }

        public void visit(FloatingConstantNode node) {
            newValueCode(node);
            code.add(PushF, node.getValue());
        }

        public void visit(CharacterConstantNode node) {
            newValueCode(node);
            code.add(PushI, (int)node.getValue());
        }

        public void visit(StringConstantNode node) {
            newValueCode(node);

            Labeller labeller = new Labeller("string");
            String stringlabel = labeller.newLabel("constant");

            code.add(DLabel, stringlabel);
            code.add(DataS, node.getValue());
            code.add(PushD, stringlabel);
        }
    }

}
