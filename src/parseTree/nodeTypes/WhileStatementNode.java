package parseTree.nodeTypes;

import lexicalAnalyzer.Lextant;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.LextantToken;
import tokens.Token;

public class WhileStatementNode extends ParseNode {
    private boolean breakflag;
    private boolean continueflag;
    private String breakLabel;
    private String continueLabel;

    public WhileStatementNode(Token token) {
        super(token);
        this.breakflag = false;
        this.continueflag = false;
        this.breakLabel =null;
        this.continueLabel = null;
    }

    public WhileStatementNode(ParseNode node) {
        super(node);
        this.breakflag = false;
        this.continueflag = false;
        this.breakLabel =null;
        this.continueLabel = null;
    }


    ////////////////////////////////////////////////////////////
    // attributes

    public Lextant getWhileStatementType() {
        return lextantToken().getLextant();
    }

    public LextantToken lextantToken() {
        return (LextantToken) token;
    }


    ////////////////////////////////////////////////////////////
    // convenience factory

    public static WhileStatementNode withChildren(Token token, ParseNode condition, ParseNode body) {
        WhileStatementNode node = new WhileStatementNode(token);
        node.appendChild(condition);
        node.appendChild(body);
        return node;
    }


    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visitEnter(this);
        visitChildren(visitor);
        visitor.visitLeave(this);
    }

    public boolean isBreakflag() {
        return breakflag;
    }

    public void setBreakflag(boolean breakflag) {
        this.breakflag = breakflag;
    }

    public boolean isContinueflag() {
        return continueflag;
    }

    public void setContinueflag(boolean continueflag) {
        this.continueflag = continueflag;
    }

    public String getBreakLabel() {
        return breakLabel;
    }

    public void setBreakLabel(String breakLabel) {
        this.breakLabel = breakLabel;
    }

    public String getContinueLabel() {
        return continueLabel;
    }

    public void setContinueLabel(String continueLabel) {
        this.continueLabel = continueLabel;
    }
}
