package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class TypeListNode extends ParseNode {

    public TypeListNode(Token token) {
        super(token);
    }

    public TypeListNode(ParseNode node) {
        super(node);
    }

    public static TypeListNode withChildren(Token token, ParseNode... children) {
        TypeListNode node = new TypeListNode(token);
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
