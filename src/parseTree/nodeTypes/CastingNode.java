package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.signatures.FunctionSignature;
import tokens.LextantToken;
import tokens.Token;

// nobody use it now ~ smile
public class CastingNode extends ParseNode{

    private FunctionSignature signature = FunctionSignature.nullInstance();

    public CastingNode(Token token) {
        super(token);
        assert (token instanceof LextantToken);
    }

    public CastingNode(ParseNode node) {
        super(node);
    }

    ///////////////////////////////////////////////////////////
    // boilerplate for visitors

    public void accept(ParseNodeVisitor visitor) {
        visitor.visitEnter(this);
        visitChildren(visitor);
        visitor.visitLeave(this);
    }

    public final FunctionSignature getSignature() {
        return signature;
    }
    public final void setSignature(FunctionSignature signature) {
        this.signature = signature;
    }
}
