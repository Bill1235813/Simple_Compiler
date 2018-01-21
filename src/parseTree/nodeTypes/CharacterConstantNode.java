package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.CharacterToken;
import tokens.Token;

public class CharacterConstantNode extends ParseNode {
    
    public CharacterConstantNode(Token token) {
        super(token);
        assert (token instanceof CharacterToken);
    }

    public CharacterConstantNode(ParseNode node) {
        super(node);
    }

////////////////////////////////////////////////////////////
// attributes

    public char getValue() {
        return numberToken().getValue();
    }

    public CharacterToken numberToken() {
        return (CharacterToken) token;
    }

///////////////////////////////////////////////////////////
// accept a visitor

    public void accept(ParseNodeVisitor visitor) {
        visitor.visit(this);
    }
}
