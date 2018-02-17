package asmCodeGenerator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import asmCodeGenerator.FullCodeGenerator.FullCodeGenerator;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import asmCodeGenerator.simpleCodeGenerator.SimpleCodeGenerator;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import parseTree.*;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.Promotion;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

// do not call the code generator if any errors have occurred during analysis.
public class ASMCodeGenerator {
    ParseNode root;

    public static ASMCodeFragment generate(ParseNode syntaxTree) {
        ASMCodeGenerator codeGenerator = new ASMCodeGenerator(syntaxTree);
        return codeGenerator.makeASM();
    }

    public ASMCodeGenerator(ParseNode root) {
        super();
        this.root = root;
    }

    public ASMCodeFragment makeASM() {
        ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

        code.append(RunTime.getEnvironment());
        code.append(globalVariableBlockASM());
        code.append(programASM());
		code.append(MemoryManager.codeForAfterApplication());

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
        code.append(MemoryManager.codeForInitialization());
        code.append(programCode());
        code.add(Halt);

        return code;
    }

    private ASMCodeFragment programCode() {
        CodeVisitor visitor = new CodeVisitor();
        root.accept(visitor);
        return visitor.removeRootCode(root);
    }

    ////////////////////////////////////////////////////////////
    // Some static functions for other code generator
    public static ASMOpcode opcodeForStore(Type type) {
        if (type == PrimitiveType.INTEGER ||
                type == PrimitiveType.STRING ||
                type instanceof Array) {
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

    public static void turnAddressIntoValue(ASMCodeFragment code, Type type) {
        if (type == PrimitiveType.INTEGER ||
                type == PrimitiveType.STRING ||
                type instanceof Array) {
            code.add(LoadI);
        } else if (type == PrimitiveType.FLOATING) {
            code.add(LoadF);
        } else if (type == PrimitiveType.BOOLEAN ||
                type == PrimitiveType.CHARACTER) {
            code.add(LoadC);
        } else if (type == PrimitiveType.RATIONAL) {
            code.add(Duplicate);
            code.add(LoadI);
            code.add(Exchange);
            Macros.readIOffset(code, 4);
        } else {
            assert false : "node type" + type;
        }
        code.markAsValue();
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

        ASMCodeFragment removeAddressCode(ParseNode node) {
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
                turnAddressIntoValue(code, node.getType());
            }
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

        public void visitLeave(AssignmentStatementNode node) {
            ASMCodeFragment [] args = getAssignChildren(node);
            applyPromotion(node.getPromotion(), node, args);
            setAndStore(node, args);
        }

        public void visitLeave(DeclarationNode node) {
            ASMCodeFragment [] args = getAssignChildren(node);
            setAndStore(node, args);
        }

        private ASMCodeFragment [] getAssignChildren(ParseNode node) {
            ASMCodeFragment lvalue = removeAddressCode(node.child(0));
            ASMCodeFragment rvalue = removeValueCode(node.child(1));
            return new ASMCodeFragment[] {lvalue, rvalue};
        }
        
        private void setAndStore(ParseNode node, ASMCodeFragment [] args) {
            newVoidCode(node);

            Type type = node.getType();
            if (type == PrimitiveType.RATIONAL) {
                code.append(args[0]);
                code.add(Duplicate);
                code.append(args[1]);
                Macros.storeITo(code, RunTime.FIRST_DENOMINATOR);
                code.add(StoreI);
                code.add(PushI, 4);
                code.add(Add);
                Macros.loadIFrom(code, RunTime.FIRST_DENOMINATOR);
                code.add(StoreI);
            } else {
                appendUndeterminedChildren(args);
                code.add(opcodeForStore(type));
            }
        }

        public void visitLeave(IfStatementNode node) {

            ASMCodeFragment condition = removeValueCode(node.child(0));
            ASMCodeFragment true_branch = removeVoidCode(node.child(1));

            // Set several Labels
            Labeller labeller = new Labeller("if");
            String conditionLabel = labeller.newLabel("condition");
            String trueLabel = labeller.newLabel("true");
            String falseLabel = labeller.newLabel("false");
            String joinLabel = labeller.newLabel("join");

            newVoidCode(node);
            code.add(Label, conditionLabel);
            code.append(condition);
            code.add(JumpFalse, falseLabel);

            code.add(Label, trueLabel);
            code.append(true_branch);
            code.add(Jump, joinLabel);

            // deal with else
            code.add(Label, falseLabel);
            if (node.getElse_flag()) {
                ASMCodeFragment false_branch = removeVoidCode(node.child(2));
                code.append(false_branch);
            }

            code.add(Jump, joinLabel);
            code.add(Label, joinLabel);

        }

        public void visitLeave(WhileStatementNode node) {

            ASMCodeFragment condition = removeValueCode(node.child(0));
            ASMCodeFragment body = removeVoidCode(node.child(1));

            // Set several Labels
            Labeller labeller = new Labeller("while");
            String conditionLabel = labeller.newLabel("condition");
            String startsLabel = labeller.newLabel("starts");
            String endsLabel = labeller.newLabel("ends");

            newVoidCode(node);
            code.add(Label, conditionLabel);
            code.append(condition);
            code.add(JumpFalse, endsLabel);

            code.add(Label, startsLabel);
            code.append(body);
            code.add(Jump, conditionLabel);

            code.add(Label, endsLabel);
        }

        ///////////////////////////////////////////////////////////////////////////
        // expressions
        public void visitLeave(OperatorNode node) {
            newValueCode(node);
            ASMCodeFragment[] args = getUndeterminedChildren(node);
            applyPromotion(node.getPromotion(), node, args);

            // determine signature variant
            Object variant = node.getPromotion().getSignature().getVariant();
            if (variant instanceof ASMOpcode) {
                appendUndeterminedChildren(args);
                ASMOpcode opcode = (ASMOpcode) variant;
                code.add(opcode);                            // type-dependent! (opcode is different for floats and for ints)
            } else if (variant instanceof SimpleCodeGenerator) {
                appendUndeterminedChildren(args);
                SimpleCodeGenerator generator = (SimpleCodeGenerator) variant;
                ASMCodeFragment fragment = generator.generate(node);
                code.append(fragment);
                if (fragment.isAddress()) {
                    code.markAsAddress();
                }
            } else if (variant instanceof FullCodeGenerator) {
                FullCodeGenerator generator = (FullCodeGenerator) variant;
                ASMCodeFragment fragment = generator.generate(node, args);
                code.append(fragment);
                if (fragment.isAddress()) {
                    code.markAsAddress();
                }
            } else {
                // throw exception
                assert false : "unimplemented operator in Operator";
            }
        }

        private void applyPromotion(Promotion promotion, ParseNode node, ASMCodeFragment[] args) {
            List<Object> methods = promotion.getMethods();
            if (promotion.getLevel() == Promotion.Level.BOTH) {
                assert (methods.size() == 2);
                applyPromotionMethods(methods.get(0), node, args[0]);
                applyPromotionMethods(methods.get(1), node, args[1]);
            } else if (promotion.getLevel() == Promotion.Level.FIRST) {
                assert (promotion.getMethods().size() == 1);
                applyPromotionMethods(methods.get(0), node, args[0]);
            } else if (promotion.getLevel() == Promotion.Level.SECOND) {
                assert (promotion.getMethods().size() == 1);
                applyPromotionMethods(methods.get(0), node, args[1]);
            }
        }

        private void applyPromotionMethods(Object variant, ParseNode node, ASMCodeFragment arg) {
            if (variant instanceof ASMOpcode) {
                ASMOpcode opcode = (ASMOpcode) variant;
                arg.add(opcode);
            } else if (variant instanceof SimpleCodeGenerator) {
                SimpleCodeGenerator generator = (SimpleCodeGenerator) variant;
                arg.append(generator.generate(node));
            }
        }

        private void appendUndeterminedChildren(ASMCodeFragment[] args) {
            for (ASMCodeFragment arg: args) {
                code.append(arg);
            }
        }

        private ASMCodeFragment[] getUndeterminedChildren(ParseNode node) {
            List<ASMCodeFragment> args = new ArrayList<>();
            for (int i = 0; i < node.nChildren(); ++i) {
                if (node.child(i) instanceof TypeNode) {
                    continue;
                }
                args.add(removeValueCode(node.child(i)));
            }
            return args.toArray(new ASMCodeFragment[args.size()]);
        }

        public void visitLeave(ExpressionListNode node) {
	    		newValueCode(node);
	    		Type finaltype = ((Array) node.getType()).getSubtype();
	    		ASMCodeFragment[] args = getUndeterminedChildren(node);
	    		for (int i = node.nChildren() - 1; i >= 0; --i) {
	    			Object varient = Promotion.getMethod(node.child(i).getType(), finaltype);
	    			if (varient != null) {
	    				applyPromotionMethods(varient, node, args[i]);
	    			}
                    code.append(args[i]);
	    		}
	    }
        
        ///////////////////////////////////////////////////////////////////////////
        // parentheses and casting nodes
        public void visitLeave(ParenthesesNode node) {
            newValueCode(node);
            ASMCodeFragment child = removeValueCode(node.child(0));
            code.append(child);
        }

        public void visitLeave(TypeNode node) {
        }

        ///////////////////////////////////////////////////////////////////////////
        // leaf nodes (TypeNode and ErrorNode not necessary)
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
            code.add(PushI, (int) node.getValue());
        }

        public void visit(StringConstantNode node) {
            newValueCode(node);

            int length = node.getValue().length();
            code.add(PushI, 0);
            for (int i = length - 1; i >= 0; --i) {
                code.add(PushI, (int) node.getValue().charAt(i));
            }
            code.add(PushI, length + 1);
            RunTime.createStringRecord(code, length);
            Macros.loadIFrom(code, RunTime.RECORD_CREATION_TEMPORARY);
        }
    }

}
