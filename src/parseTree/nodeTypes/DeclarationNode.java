package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class DeclarationNode extends ParseNode {
    private boolean staticFlag;

    public DeclarationNode(Token token) {
        super(token);
        assert (token.isLextant(Keyword.CONST, Keyword.VAR));
    }

    public DeclarationNode(ParseNode node) {
        super(node);
    }


    ////////////////////////////////////////////////////////////
    // attributes

    public Lextant getDeclarationType() {
        return lextantToken().getLextant();
    }

    public LextantToken lextantToken() {
        return (LextantToken) token;
    }

    ////////////////////////////////////////////////////////////
    // convenience factory

    public static DeclarationNode withChildren(Token token, ParseNode declaredName,
                                               ParseNode initializer) {
        DeclarationNode node = new DeclarationNode(token);
        node.appendChild(declaredName);
        node.appendChild(initializer);
        return node;
    }


    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visitEnter(this);
        visitChildren(visitor);
        visitor.visitLeave(this);
    }

    public boolean isStaticFlag() {
        return staticFlag;
    }

    public void setStaticFlag(boolean staticFlag) {
        this.staticFlag = staticFlag;
    }
}
