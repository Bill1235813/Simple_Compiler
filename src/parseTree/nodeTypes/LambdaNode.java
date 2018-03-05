package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class LambdaNode extends ParseNode {
    
    public LambdaNode(Token token) {
        super(token);
    }

    public LambdaNode(ParseNode node) {
        super(node);
    }

    ////////////////////////////////////////////////////////////
    // attributes

    public static LambdaNode withChildren(Token token, ParseNode param, ParseNode body) {
        LambdaNode node = new LambdaNode(token);
        node.appendChild(param);
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
}
