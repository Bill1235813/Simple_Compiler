package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.LextantToken;
import tokens.Token;

public class BreakStatementNode extends ParseNode {
    private WhileStatementNode loopLink;

    public BreakStatementNode(Token token) {
        super(token);
        assert (token instanceof LextantToken);
    }

    public BreakStatementNode(ParseNode node) {
        super(node);
    }

    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visit(this);
    }

    public WhileStatementNode getLoopLink() {
        return loopLink;
    }

    public void setLoopLink(WhileStatementNode loopLink) {
        this.loopLink = loopLink;
    }
}
