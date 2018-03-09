package parseTree.nodeTypes;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.simpleCodeGenerator.SimpleCodeGenerator;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class LambdaNode extends ParseNode {
    private String exitHandshake;

    public LambdaNode(Token token) {
        super(token);
        setExitHandshake(new Labeller("function-exit").newLabel("handshake"));
    }

    public LambdaNode(ParseNode node) {
        super(node);
        setExitHandshake(new Labeller("function-exit").newLabel("handshake"));
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

    public String getExitHandshake() {
        return exitHandshake;
    }

    private void setExitHandshake(String exitHandshake) {
        this.exitHandshake = exitHandshake;
    }
}
