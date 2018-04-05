package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ForStatementNode extends ParseNode {
    private boolean indexFlag;
    private boolean breakflag;
    private boolean continueflag;
    private String breakLabel;
    private String continueLabel;

    public ForStatementNode(Token token) {
        super(token);
        this.breakflag = false;
        this.continueflag = false;
        this.breakLabel =null;
        this.continueLabel = null;
    }

    public ForStatementNode(ParseNode node) {
        super(node);
        this.breakflag = false;
        this.continueflag = false;
        this.breakLabel =null;
        this.continueLabel = null;
    }

    ////////////////////////////////////////////////////////////
    // attributes

    public static ForStatementNode withChildren(Token token, ParseNode identifier,
                                                ParseNode sequence, ParseNode body) {
        ForStatementNode node = new ForStatementNode(token);
        node.appendChild(identifier);
        node.appendChild(sequence);
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

    public boolean isIndexFlag() {
        return indexFlag;
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

    public void setIndexFlag(boolean indexFlag) {
        this.indexFlag = indexFlag;
    }
}
