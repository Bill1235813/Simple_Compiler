package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.signatures.Promotion;
import tokens.LextantToken;
import tokens.Token;

public class AssignmentStatementNode extends ParseNode {
    private Promotion promotion = Promotion.nullPromotion;

    public AssignmentStatementNode(Token token) {
        super(token);
    }

    public AssignmentStatementNode(ParseNode node) {
        super(node);
    }


    ////////////////////////////////////////////////////////////
    // attributes

    public Lextant getAssignmentStatementType() {
        return lextantToken().getLextant();
    }

    public LextantToken lextantToken() {
        return (LextantToken) token;
    }


    ////////////////////////////////////////////////////////////
    // convenience factory

    public static AssignmentStatementNode withChildren(Token token, ParseNode target, ParseNode assignexpr) {
        AssignmentStatementNode node = new AssignmentStatementNode(token);
        node.appendChild(target);
        node.appendChild(assignexpr);
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
