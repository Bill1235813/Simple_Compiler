package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ParamListNode extends ParseNode {

    public ParamListNode(Token token) {
        super(token);
    }

    public ParamListNode(ParseNode node) {
        super(node);
    }

    ////////////////////////////////////////////////////////////
    // attributes

    public static ParamListNode withChildren(Token token, ParseNode... children) {
        ParamListNode node = new ParamListNode(token);
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
}
