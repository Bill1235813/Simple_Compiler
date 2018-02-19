package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.FloatingToken;
import tokens.Token;

public class FloatingConstantNode extends ParseNode {
    public FloatingConstantNode(Token token) {
        super(token);
        assert (token instanceof FloatingToken);
    }

    public FloatingConstantNode(ParseNode node) {
        super(node);
    }

////////////////////////////////////////////////////////////
// attributes

    public double getValue() {
        return numberToken().getValue();
    }

    public FloatingToken numberToken() {
        return (FloatingToken) token;
    }

///////////////////////////////////////////////////////////
// accept a visitor

    public void accept(ParseNodeVisitor visitor) {
        visitor.visit(this);
    }

}
