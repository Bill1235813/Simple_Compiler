package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class LambdaParamTypeNode extends ParseNode {

    public LambdaParamTypeNode(Token token) {
        super(token);
    }

    public LambdaParamTypeNode(ParseNode node) {
        super(node);
    }

    ////////////////////////////////////////////////////////////
    // attributes

    public static LambdaParamTypeNode withChildren(Token token, ParseNode paramList, ParseNode type) {
        LambdaParamTypeNode node = new LambdaParamTypeNode(token);
        node.appendChild(paramList);
        node.appendChild(type);
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
