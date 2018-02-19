package parseTree.nodeTypes;

import lexicalAnalyzer.Lextant;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.LextantToken;
import tokens.Token;

public class ReleaseStatementNode extends ParseNode {

    public ReleaseStatementNode(Token token) {
        super(token);
    }

    public ReleaseStatementNode(ParseNode node) {
        super(node);
    }

    ////////////////////////////////////////////////////////////
    // attributes

    public Lextant getReleaseStatementType() {
        return lextantToken().getLextant();
    }

    public LextantToken lextantToken() {
        return (LextantToken) token;
    }


    ////////////////////////////////////////////////////////////
    // convenience factory

    public static ReleaseStatementNode withChildren(Token token, ParseNode expression) {
        ReleaseStatementNode node = new ReleaseStatementNode(token);
        node.appendChild(expression);
        return node;
    }

    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visitEnter(this);
        visitChildren(visitor);
        visitor.visitLeave(this);
    }

}
