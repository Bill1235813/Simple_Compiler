package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.LextantToken;
import tokens.Token;

public class ContinueStatementNode extends ParseNode {
    private ParseNode loopLink;

    public ContinueStatementNode(Token token) {
        super(token);
        assert (token instanceof LextantToken);
    }

    public ContinueStatementNode(ParseNode node) {
        super(node);
    }

    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visit(this);
    }

    public ParseNode getLoopLink() {
        return loopLink;
    }

    public void setLoopLink(ParseNode loopLink) {
        this.loopLink = loopLink;
    }
}
