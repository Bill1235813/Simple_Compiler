package parseTree.nodeTypes;

import lexicalAnalyzer.Lextant;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.LextantToken;
import tokens.Token;

public class WhileStatementNode extends ParseNode {

    public WhileStatementNode(Token token) {
        super(token);
    }

    public WhileStatementNode(ParseNode node) {
        super(node);
    }


    ////////////////////////////////////////////////////////////
    // attributes

    public Lextant getWhileStatementType() {
        return lextantToken().getLextant();
    }

    public LextantToken lextantToken() {
        return (LextantToken) token;
    }


    ////////////////////////////////////////////////////////////
    // convenience factory

    public static WhileStatementNode withChildren(Token token, ParseNode condition, ParseNode body) {
        WhileStatementNode node = new WhileStatementNode(token);
        node.appendChild(condition);
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
