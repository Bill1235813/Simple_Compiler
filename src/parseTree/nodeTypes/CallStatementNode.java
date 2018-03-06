package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class CallStatementNode extends ParseNode{

    public CallStatementNode(Token token) {
        super(token);
    }

    public CallStatementNode(ParseNode node) {
        super(node);
    }

    ////////////////////////////////////////////////////////////
    // attributes

    public static CallStatementNode withChildren(Token token, ParseNode invocation) {
        CallStatementNode node = new CallStatementNode(token);
        node.appendChild(invocation);
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
