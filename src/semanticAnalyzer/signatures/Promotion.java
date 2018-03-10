package semanticAnalyzer.signatures;

import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.simpleCodeGenerator.IntegerToRationalCodeGenerator;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import java.util.*;

import static semanticAnalyzer.types.PrimitiveType.*;

public class Promotion {
    private static final int NUMBER_OF_LEVELS = 4;
    // very ugly and need to rewrite
    private static final Type[][] PROMOTION_TYPES = {
            {CHARACTER, INTEGER},
            {INTEGER, FLOATING},
            {INTEGER, RATIONAL},
            {CHARACTER, FLOATING},
            {CHARACTER, RATIONAL},
    };
    private static final Map<Type[], Object> PROMOTION_METHODS = new HashMap<Type[], Object>();

    static {
        PROMOTION_METHODS.put(PROMOTION_TYPES[0], ASMOpcode.Nop);
        PROMOTION_METHODS.put(PROMOTION_TYPES[1], ASMOpcode.ConvertF);
        PROMOTION_METHODS.put(PROMOTION_TYPES[2], new IntegerToRationalCodeGenerator());
        PROMOTION_METHODS.put(PROMOTION_TYPES[3], ASMOpcode.ConvertF);
        PROMOTION_METHODS.put(PROMOTION_TYPES[4], new IntegerToRationalCodeGenerator());
    }

    public enum Level {
        NONE(0),
        FIRST(1),
        SECOND(2),
        BOTH(3),
        ERROR(-1);

        private int levelCode;

        private Level(int levelCode) {
            this.levelCode = levelCode;
        }

        public static Level getindex(int index) {
            if (index == 0) {
                return NONE;
            } else if (index == 1) {
                return FIRST;
            } else if (index == 2) {
                return SECOND;
            } else if (index == 3) {
                return BOTH;
            } else {
                return ERROR;
            }
        }
    }

    private Level level;
    private List<Object> methods;
    private FunctionSignature signature;

    private Promotion(Level level, List<Object> methods, FunctionSignature signature) {
        this.level = level;
        this.methods = methods;
        this.signature = signature;
    }


    // function for random type comparison
    public static Boolean promotable(Type type1, Type type2) {
        if (type1.equivalent(type2)) {
            return true;
        }
        for (Type[] types : PROMOTION_TYPES) {
            if (type1.equivalent(types[0]) && type2.equivalent(types[1])) {
                return true;
            }
        }
        return false;
    }

    public static Object getMethod(Type type1, Type type2) {
        for (Type[] types : PROMOTION_TYPES) {
            if (type1.equivalent(types[0]) && type2.equivalent(types[1])) {
                return PROMOTION_METHODS.get(types);
            }
        }
        return null;
    }

    // static flag is for assignment
    public static Promotion checkPromotion(List<Type> checktypes,
                                           FunctionSignatures signatures,
                                           Boolean staticflag) {
        if (checktypes.size() <= 0) {
            return nullPromotion;
        } else if (checktypes.size() == 1) {
            return checkunary(checktypes, signatures);
        } else if (checktypes.size() == 2 && staticflag) {
            return  checkassign(checktypes, signatures);
        } else {
            return checkbinary(checktypes, signatures);
        }
    }

    // for different operators
    private static Promotion checkunary(List<Type> checktypes, FunctionSignatures signatures) {
        Promotion promotion;
        promotion = noPromotion(checktypes, signatures);
        if (promotion != nullPromotion) {
            return promotion;
        } else {
            return firstPromotion(checktypes, signatures);
        }
    }

    private static Promotion checkassign(List<Type> checktypes, FunctionSignatures signatures) {
        Promotion promotion;
        promotion = noPromotion(checktypes, signatures);
        if (promotion != nullPromotion) {
            return promotion;
        } else {
            return secondPromotion(checktypes, signatures);
        }
    }

    private static Promotion checkbinary(List<Type> checktypes, FunctionSignatures signatures) {
        Promotion promotion;
        promotion = noPromotion(checktypes, signatures);
        if (promotion != nullPromotion) {
            return promotion;
        }
        promotion = firstPromotion(checktypes, signatures);
        if (promotion != nullPromotion) {
            return promotion;
        }
        promotion = secondPromotion(checktypes, signatures);
        if (promotion != nullPromotion) {
            return promotion;
        }
        return bothPromotion(checktypes, signatures);
    }

    // basic promotions
    private static Promotion noPromotion(List<Type> checktypes, FunctionSignatures signatures) {
        FunctionSignature signature = signatures.acceptingSignature(checktypes);
        if (signature.accepts(checktypes)) {
            return new Promotion(Level.NONE, new ArrayList<>(), signature.getConcreteSignature());
        }
        return nullPromotion;
    }

    private static Promotion firstPromotion(List<Type> checktypes, FunctionSignatures signatures) {
        return onePromotion(checktypes, signatures, 0);
    }

    private static Promotion secondPromotion(List<Type> checktypes, FunctionSignatures signatures) {
        return onePromotion(checktypes, signatures, 1);
    }

    private static Promotion onePromotion(List<Type> checktypes, FunctionSignatures signatures, int index) {
        List<Promotion> promotions = new ArrayList<>();
        for (Type[] type_pro : PROMOTION_TYPES) {
            if (!checktypes.get(index).equivalent(type_pro[0])) {
                continue;
            }
            checktypes.set(index, type_pro[1]);
            if (signatures.accepts(checktypes)) {
                FunctionSignature signature = 
                        signatures.acceptingSignature(checktypes).getConcreteSignature();
                promotions.add(new Promotion(
                        Level.getindex(index + 1),
                        new ArrayList<>(Arrays.asList(PROMOTION_METHODS.get(type_pro))),
                        signature));
            }
            checktypes.set(index, type_pro[0]);
        }
        return returnBySize(promotions);
    }

    private static Promotion bothPromotion(List<Type> checktypes, FunctionSignatures signatures) {
        List<Promotion> promotions = new ArrayList<>();
        for (Type[] type_pro : PROMOTION_TYPES) {
            if (!checktypes.get(0).equivalent(type_pro[0])) {
                continue;
            }
            checktypes.set(0, type_pro[1]);
            for (Type[] type_pro2 : PROMOTION_TYPES) {
                if (!checktypes.get(1).equivalent(type_pro2[0])) {
                    continue;
                }
                checktypes.set(1, type_pro2[1]);
                if (signatures.accepts(checktypes)) {
                    FunctionSignature signature = 
                            signatures.acceptingSignature(checktypes).getConcreteSignature();
                    promotions.add(new Promotion(
                            Level.BOTH,
                            new ArrayList<>(Arrays.asList(
                                    PROMOTION_METHODS.get(type_pro),
                                    PROMOTION_METHODS.get(type_pro2))),
                            signature));
                }
                checktypes.set(1, type_pro2[0]);
            }
            checktypes.set(0, type_pro[0]);
        }
        return returnBySize(promotions);
    }

    private static Promotion returnBySize(List<Promotion> promotions) {
        if (promotions.size() == 0) {
            return nullPromotion;
        } else if (promotions.size() == 1) {
            return promotions.get(0);
        } else {
            if (existASimplestPromotion(promotions)) {
                return promotions.get(0);
            } else {
                return overOnePromotion;
            }
        }
    }

    private static Boolean existASimplestPromotion(List<Promotion> promotions) {
        while (promotions.size() > 1) {
            Type[] types1 = promotions.get(0).getSignature().getParamTypes();
            Type[] types2 = promotions.get(1).getSignature().getParamTypes();
            int fatherflag = 0;
            for (int i = 0; i < types1.length; ++i) {
                if (types1[i].equivalent(types2[i])) {
                    continue;
                } else if (promotable(types1[i], types2[i])) {
                    if (fatherflag == 2) {
                        return false;
                    }
                    fatherflag = 1;
                } else if (promotable(types2[i], types1[i])) {
                    if (fatherflag == 1) {
                        return false;
                    }
                    fatherflag = 2;
                } else {
                    return false;
                }
            }
            if (fatherflag == 1) {
                promotions.remove(1);
            } else {
                promotions.remove(0);
            }
        }
        return true;
    }

    ///////////////////////////////////////////////////////////////////////
    // the error promotion condition
    public static Promotion nullPromotion = new Promotion(
            Level.NONE, new ArrayList<>(), FunctionSignature.nullInstance()
    );
    public static Promotion overOnePromotion = new Promotion(
            Level.NONE, new ArrayList<>(), FunctionSignature.nullInstance()
    );

    // getter and setter
    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public List<Object> getMethods() {
        return methods;
    }

    public void setMethods(List<Object> methods) {
        this.methods = methods;
    }

    public FunctionSignature getSignature() {
        return signature;
    }

    public void setSignature(FunctionSignature signature) {
        this.signature = signature;
    }
}
