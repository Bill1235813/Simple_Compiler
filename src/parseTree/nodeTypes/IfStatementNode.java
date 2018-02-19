package parseTree.nodeTypes;

import lexicalAnalyzer.Lextant;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.LextantToken;
import tokens.Token;

public class IfStatementNode extends ParseNode {
    private Boolean else_flag;

    public IfStatementNode(Token token) {
        super(token);
    }

    public IfStatementNode(Token token, Boolean else_flag) {
        super(token);
        this.else_flag = else_flag;
    }

    public IfStatementNode(ParseNode node) {
        super(node);
    }


    ////////////////////////////////////////////////////////////
    // attributes

    public Lextant getIfStatementType() {
        return lextantToken().getLextant();
    }

    public LextantToken lextantToken() {
        return (LextantToken) token;
    }

    public Boolean getElse_flag() {
        return else_flag;
    }

    public void setElse_flag(Boolean else_flag) {
        this.else_flag = else_flag;
    }

    ////////////////////////////////////////////////////////////
    // convenience factory

    public static IfStatementNode withChildren(Boolean else_flag, Token token,
                                               ParseNode... children) {
        IfStatementNode node = new IfStatementNode(token, else_flag);
        if (else_flag) {
            assert children.length == 3;
        } else {
            assert children.length == 2;
        }
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
