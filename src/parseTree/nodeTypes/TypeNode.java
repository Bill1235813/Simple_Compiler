package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class TypeNode extends ParseNode {

    public TypeNode(ParseNode node) {
        super(node);
        initChildren();
    }

    public TypeNode(Token token) {
        super(token);
        initChildren();
    }

    public static TypeNode withSubType(Token token, ParseNode subtype) {
        TypeNode node = new TypeNode(token);
        node.appendChild(subtype);
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
