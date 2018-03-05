package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class GlobalDefinitionNode extends ParseNode {

    public GlobalDefinitionNode(Token token) {
        super(token);
    }

    public GlobalDefinitionNode(ParseNode node) {
        super(node);
    }

    ////////////////////////////////////////////////////////////
    // attributes


    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visitEnter(this);
        visitChildren(visitor);
        visitor.visitLeave(this);
    }
}
