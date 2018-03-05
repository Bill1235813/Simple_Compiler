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

    public static TypeNode withChildren(Token token, ParseNode... childrentypes) {
        TypeNode node = new TypeNode(token);
        for (ParseNode childtype: childrentypes) {
            node.appendChild(childtype);
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
