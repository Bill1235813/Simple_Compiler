package semanticAnalyzer;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import parseTree.*;


public class SemanticAnalyzer {
    ParseNode ASTree;

    public static ParseNode analyze(ParseNode ASTree) {
        SemanticAnalyzer analyzer = new SemanticAnalyzer(ASTree);
        return analyzer.analyze();
    }

    public SemanticAnalyzer(ParseNode ASTree) {
        this.ASTree = ASTree;
    }

    public ParseNode analyze() {
        ASTree.accept(new PreSemanticAnalysisVisitor());
        ASTree.accept(new Pre2SemanticAnalysisVisitor());
        ASTree.accept(new SemanticAnalysisVisitor());

        return ASTree;
    }
}
