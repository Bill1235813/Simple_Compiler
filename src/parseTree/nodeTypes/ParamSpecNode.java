package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ParamSpecNode extends ParseNode {

    public ParamSpecNode(Token token) {
        super(token);
    }

    public ParamSpecNode(ParseNode node) {
        super(node);
    }

    ////////////////////////////////////////////////////////////
    // attributes

    public static ParamSpecNode withChildren(Token token, ParseNode type, ParseNode identifier) {
        ParamSpecNode node = new ParamSpecNode(token);
        node.appendChild(type);
        node.appendChild(identifier);
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
