package asmCodeGenerator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import asmCodeGenerator.FullCodeGenerator.ForStatementCodeGenerator;
import asmCodeGenerator.FullCodeGenerator.FullCodeGenerator;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import asmCodeGenerator.simpleCodeGenerator.SimpleCodeGenerator;
import parseTree.*;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.Promotion;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.LambdaType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;

import static asmCodeGenerator.Macros.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import static asmCodeGenerator.runtime.RunTime.*;
import static semanticAnalyzer.SemanticAnalysisVisitor.getParentLambda;

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
        code.append(initializeFrameStack());
        code.append(programCode());
        code.add(Halt);

        return code;
    }

    private ASMCodeFragment initializeFrameStack() {
        ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

        code.add(Memtop);
        code.add(Duplicate);
        storeITo(code, RunTime.FRAME_POINTER);
        storeITo(code, RunTime.STACK_POINTER);

        return code;
    }

    private ASMCodeFragment programCode() {
        CodeVisitor visitor = new CodeVisitor();
        root.accept(visitor);
        return visitor.removeRootCode(root);
    }

    ////////////////////////////////////////////////////////////
    // Some static functions for other code generator, store and load
    private static ASMOpcode opcodeForStore(Type type) {
        if (type == PrimitiveType.INTEGER ||
                type == PrimitiveType.STRING ||
                type == PrimitiveType.RATIONAL ||
                type instanceof Array ||
                type instanceof LambdaType) {
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

    // [... address] -> [... value]
    public static void turnAddressIntoValue(ASMCodeFragment code, Type type) {
        if (type == PrimitiveType.INTEGER ||
                type == PrimitiveType.STRING ||
                type instanceof Array ||
                type instanceof LambdaType) {
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
            readIOffset(code, 4);
        } else if (type == PrimitiveType.VOID) {
            code.add(Pop);
        } else {
            assert false : "node type" + type;
        }
        code.markAsValue();
    }

    // [...]->[... value], address in stack-pointer or ...
    public static void turnAddressIntoValue(ASMCodeFragment code, Type type, String address) {
        loadIFrom(code, address);
        turnAddressIntoValue(code, type);
    }

    // [... value]->[...], address in store-address-temp or stack-pointer ...
    public static void storeValueIntoAddress(ASMCodeFragment code, Type type, String address) {
        if (type == PrimitiveType.RATIONAL) {
            loadIFrom(code, address);
            code.add(PushI, 4);
            code.add(Add);
            code.add(Exchange);
            code.add(opcodeForStore(type));
        }
        if (type != PrimitiveType.VOID) {
            loadIFrom(code, address);
            code.add(Exchange);
            code.add(opcodeForStore(type));
        }
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
            ASMCodeFragment functionCode = new ASMCodeFragment(GENERATES_VOID);
            ASMCodeFragment otherCode = new ASMCodeFragment(GENERATES_VOID);
            for (ParseNode child : node.getChildren()) {
                ASMCodeFragment childCode = removeVoidCode(child);
                if (child.nChildren()>0 && child.child(0) instanceof FunctionDefinitionNode) {
                    functionCode.append(childCode);
                } else {
                    otherCode.append(childCode);
                }
            }
            code.append(functionCode);
            code.append(otherCode);
        }

        public void visitLeave(GlobalDefinitionNode node) {
            newVoidCode(node);
            code.append(removeVoidCode(node.child(0)));
        }

        public void visitLeave(FunctionDefinitionNode node) {
            newVoidCode(node);
            ASMCodeFragment[] args = getAssignChildren(node);
            setAndStore(node, args);
        }

        public void visitLeave(LambdaNode node) {
            newValueCode(node);
            removeVoidCode(node.child(0));
            ASMCodeFragment body = removeVoidCode(node.child(1));
            Scope procedureScope = node.child(1).getScope();
            int bodysize = procedureScope.getAllocatedSize();
            int totalsize = node.getScope().getAllocatedSize() + bodysize;

            Labeller labeller = new Labeller("function-definition");
            String starts = labeller.newLabel("starts");
            String ends = labeller.newLabel("ends");

            code.add(PushPC);
            code.add(Jump, ends); // [... PC(at jump)]

            // preparation
            code.add(Label, starts);
            loadIFrom(code, RunTime.STACK_POINTER); // [... (return) SP]
            code.add(Duplicate);
            code.add(PushI, -4);
            code.add(Add); // [... (return) SP SP-4]
            loadIFrom(code, RunTime.FRAME_POINTER); // [... (return) SP SP oldFP]
            code.add(StoreI);
            code.add(PushI, -8);
            code.add(Add); // [... (return) SP-8]
            code.add(Exchange);
            code.add(StoreI); // [...]
            moveIMemory(code, RunTime.STACK_POINTER, RunTime.FRAME_POINTER);
            code.add(PushI, -bodysize);
            addITo(code, RunTime.STACK_POINTER);

            // real body
            code.append(body);
            code.add(Jump, RunTime.FUNCTION_NO_RETURN_ERROR);

            // exit handshake
            code.add(Label, node.getExitHandshake());
            RunTime.returnFrame(code, totalsize, ((LambdaType)node.getType()).getReturntype());

            code.add(Label, ends);
            code.add(PushI, 1);
            code.add(Add); // [... PC(at body)]
        }

        public void visitLeave(LambdaParamTypeNode node) {
            removeVoidChildren(node);
        }

        public void visitLeave(ParamListNode node) {
            removeVoidChildren(node);
        }

        public void visitLeave(ParamSpecNode node) {
            removeVoidChildren(node);
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
            newVoidCode(node);
            ASMCodeFragment[] args = getAssignChildren(node);
            applyPromotion(node.getPromotion(), node, args);
            setAndStore(node, args);
        }

        public void visitLeave(DeclarationNode node) {
            newVoidCode(node);
            // initializer for static
            String endflag = null;
            if (node.isStaticFlag()) {
                assert node.nChildren() > 2;
                Labeller labeller = new Labeller("static-initializer");
                endflag = labeller.newLabel("endflag");
                ASMCodeFragment initializer = removeAddressCode(node.child(2));
                code.append(initializer);
                code.add(Duplicate);
                storeITo(code, RunTime.STORE_ADDRESS_TEMP);
                code.add(LoadC);
                code.add(JumpTrue, endflag); // [...]
                loadIFrom(code, RunTime.STORE_ADDRESS_TEMP);
                code.add(PushI, 1);
                code.add(StoreC);
            }

            ASMCodeFragment[] args = getAssignChildren(node);
            setAndStore(node, args);

            if (node.isStaticFlag()) {
                code.add(Label, endflag);
            }
        }

        private ASMCodeFragment[] getAssignChildren(ParseNode node) {
            ASMCodeFragment lvalue = removeAddressCode(node.child(0));
            ASMCodeFragment rvalue = removeValueCode(node.child(1));
            return new ASMCodeFragment[]{lvalue, rvalue};
        }

        private void setAndStore(ParseNode node, ASMCodeFragment[] args) {
            Type type = node.getType();
            code.append(args[1]);
            code.append(args[0]);
            storeITo(code, RunTime.STORE_ADDRESS_TEMP);

            storeValueIntoAddress(code, type, RunTime.STORE_ADDRESS_TEMP);
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

            if (node.isBreakflag()) {
                endsLabel = node.getBreakLabel();

            }
            if (node.isContinueflag()) {
                conditionLabel = node.getContinueLabel();
            }

            newVoidCode(node);
            code.add(Label, conditionLabel);
            code.append(condition);
            code.add(JumpFalse, endsLabel);

            code.add(Label, startsLabel);
            code.append(body);
            code.add(Jump, conditionLabel);

            code.add(Label, endsLabel);
        }

        public void visitLeave(ForStatementNode node) {
            ASMCodeFragment identifier = removeAddressCode(node.child(0));
            ASMCodeFragment sequence = removeValueCode(node.child(1));
            ASMCodeFragment body = removeVoidCode(node.child(2));
            newVoidCode(node);
            code.append(new ForStatementCodeGenerator().generate(node, identifier, sequence, body));
        }

        public void visitLeave(ReleaseStatementNode node) {

            ASMCodeFragment ref = removeValueCode(node.child(0));
            newVoidCode(node);

            code.append(ref);
            code.add(Call, RunTime.RELEASE_REFERENCE);
        }

        public void visitLeave(CallStatementNode node) {
            // only trash collection
            ASMCodeFragment addr = removeValueCode(node.child(0));
            newVoidCode(node);

            code.append(addr);
            if (node.getType().equivalent(PrimitiveType.RATIONAL)) {
                code.add(Pop);
                code.add(Pop);
            } else if (!node.getType().equivalent(PrimitiveType.VOID)) {
                code.add(Pop);
            }
        }

        public void visitLeave(ReturnStatementNode node) {
            newVoidCode(node);

            if (node.nChildren() !=0) {
                ASMCodeFragment returnValue = removeValueCode(node.child(0));
                Object varient = Promotion.getMethod(node.child(0).getType(), node.getType());
                if (varient != null) {
                    applyPromotionMethods(varient, node, returnValue);
                }
                code.append(returnValue);
            }

            LambdaNode parent = (LambdaNode) getParentLambda(node);
            code.add(Jump, parent.getExitHandshake());
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
                code.add(opcode);
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

        public void visitLeave(ExpressionListNode node) {
            newValueCode(node);
            Type[] finaltypes = node.getSignature().getParamTypes();
            ASMCodeFragment[] args = getUndeterminedChildren(node);
            for (int i = node.nChildren() - 1; i >= 0; --i) {
                Object varient = Promotion.getMethod(node.child(i).getType(), finaltypes[i]);
                if (varient != null) {
                    applyPromotionMethods(varient, node, args[i]);
                }
                code.append(args[i]);
            }
        }

        public void visitLeave(TypeNode node) {
            removeVoidChildren(node);
        }

        public void visitLeave(TypeListNode node) {
            removeVoidChildren(node);
        }

        ///////////////////////////////////////////////////////////////////////////
        // parentheses and casting nodes
        // unused
//        public void visitLeave(ParenthesesNode node) {
//            newValueCode(node);
//            ASMCodeFragment child = getAndRemoveCode(node.child(0));
//            code.append(child);
//            if (child.isAddress()) {
//            		code.markAsAddress();
//            }
//        }

        // function for promotion application
        private void applyPromotion(Promotion promotion, ParseNode node, ASMCodeFragment[] args) {
            List<Object> methods = promotion.getMethods();
            if (promotion.getLevel() == Promotion.Level.NONE) {
                return;
            } else if (promotion.getLevel() == Promotion.Level.BOTH) {
                assert (methods.size() == 2);
                applyPromotionMethods(methods.get(0), node, args[0]);
                applyPromotionMethods(methods.get(1), node, args[1]);
            } else if (promotion.getLevel() == Promotion.Level.FIRST) {
                assert (promotion.getMethods().size() == 1);
                applyPromotionMethods(methods.get(0), node, args[0]);
            } else if (promotion.getLevel() == Promotion.Level.SECOND) {
                assert (promotion.getMethods().size() == 1);
                applyPromotionMethods(methods.get(0), node, args[1]);
            } else {
                assert false : "promotion error!";
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

        // get, remove children (value) and append
        private void appendUndeterminedChildren(ASMCodeFragment[] args) {
            for (ASMCodeFragment arg : args) {
                code.append(arg);
            }
        }

        private ASMCodeFragment[] getUndeterminedChildren(ParseNode node) {
            List<ASMCodeFragment> args = new ArrayList<>();
            for (int i = 0; i < node.nChildren(); ++i) {
                if (node.child(i) instanceof TypeNode) {
                    args.add(removeVoidCode(node.child(i)));
                } else {
                    args.add(removeValueCode(node.child(i)));
                }
            }
            return args.toArray(new ASMCodeFragment[args.size()]);
        }

        private void removeVoidChildren(ParseNode node) {
            newVoidCode(node);
            for (int i = 0; i < node.nChildren(); ++i) {
                removeVoidCode(node.child(i));
            }
        }

        ///////////////////////////////////////////////////////////////////////////
        // leaf nodes (ErrorNode not necessary)
        public void visit(BooleanConstantNode node) {
            newValueCode(node);
            code.add(PushI, node.getValue() ? 1 : 0);
        }

        public void visit(IdentifierNode node) {
            if (node.getParent() instanceof ParamSpecNode
                    || node.getParent() instanceof BlockStatementNode) {
                newVoidCode(node);
            } else {
                newAddressCode(node);
                Binding binding = node.getBinding();

                binding.generateAddress(code);
            }
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
            for (int i = length - 1; i >= 0; --i) {
                code.add(PushI, (int) node.getValue().charAt(i));
            }
            code.add(PushI, length);
            RunTime.createStringRecord(code, false);
            Macros.loadIFrom(code, RunTime.RECORD_CREATION_TEMPORARY);
        }

        public void visit(BreakStatementNode node) {
            newVoidCode(node);

            ParseNode parent = node.getLoopLink();
            String breakLabel = null;
            if (parent instanceof WhileStatementNode) {
                WhileStatementNode whileParent = (WhileStatementNode) parent;
                breakLabel = whileParent.getBreakLabel();
                if (breakLabel == null) {
                    Labeller labeller = new Labeller("loop-break");
                    breakLabel = labeller.newLabel("ends");
                    whileParent.setBreakLabel(breakLabel);
                }
            } else if (parent instanceof ForStatementNode) {
                ForStatementNode forParent = (ForStatementNode) parent;
                breakLabel = forParent.getBreakLabel();
                if (breakLabel == null) {
                    Labeller labeller = new Labeller("loop-break");
                    breakLabel = labeller.newLabel("ends");
                    forParent.setBreakLabel(breakLabel);
                }
            }
            code.add(Jump, breakLabel);  
        }

        public void visit(ContinueStatementNode node) {
            newVoidCode(node);

            ParseNode parent = node.getLoopLink();
            String continueLabel = null;
            if (parent instanceof WhileStatementNode) {
                WhileStatementNode whileParent = (WhileStatementNode) parent;
                continueLabel = whileParent.getContinueLabel();
                if (continueLabel == null) {
                    Labeller labeller = new Labeller("loop-continue");
                    continueLabel = labeller.newLabel("condition");
                    whileParent.setContinueLabel(continueLabel);
                }
            } else if (parent instanceof ForStatementNode) {
                ForStatementNode forParent = (ForStatementNode) parent;
                continueLabel = forParent.getContinueLabel();
                if (continueLabel == null) {
                    Labeller labeller = new Labeller("loop-continue");
                    continueLabel = labeller.newLabel("condition");
                    forParent.setContinueLabel(continueLabel);
                }
            }
            code.add(Jump, continueLabel);
        }
    }

}
