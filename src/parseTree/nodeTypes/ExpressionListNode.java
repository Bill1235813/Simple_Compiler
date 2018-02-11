package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ExpressionListNode extends ParseNode{

	public ExpressionListNode(Token token) {
		super(token);
	}
	
    public ExpressionListNode(ParseNode node) {
        super(node);
    }
    
    public static ExpressionListNode withChildren(Token token, ParseNode... children) {
    		ExpressionListNode node = new ExpressionListNode(token);
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
