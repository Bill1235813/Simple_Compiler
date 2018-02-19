package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.signatures.FunctionSignature;
import lexicalAnalyzer.Lextant;
import semanticAnalyzer.signatures.Promotion;
import tokens.LextantToken;
import tokens.Token;

public class OperatorNode extends ParseNode {

    //	private FunctionSignature signature = FunctionSignature.nullInstance();
    private Promotion promotion = Promotion.nullPromotion;

    public OperatorNode(Token token) {
        super(token);
        assert (token instanceof LextantToken);
    }

    public OperatorNode(ParseNode node) {
        super(node);
    }


    ////////////////////////////////////////////////////////////
    // attributes

    public Lextant getOperator() {
        return lextantToken().getLextant();
    }

    public LextantToken lextantToken() {
        return (LextantToken) token;
    }


    ////////////////////////////////////////////////////////////
    // convenience factory

    public static OperatorNode withChildren(Token token, ParseNode... children) {
        OperatorNode node = new OperatorNode(token);
        for (ParseNode child : children) {
            node.appendChild(child);
        }
        return node;
    }


    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visitEnter(this);
        visitChildren(visitor);
        visitor.visitLeave(this);
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }
}
