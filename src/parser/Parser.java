package parser;

import java.util.Arrays;

import logging.PikaLogger;
import parseTree.*;
import parseTree.nodeTypes.*;
import tokens.*;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import lexicalAnalyzer.Scanner;


public class Parser {
    private Scanner scanner;
    private Token nowReading;
    private Token previouslyRead;

    public static ParseNode parse(Scanner scanner) {
        Parser parser = new Parser(scanner);
        return parser.parse();
    }

    public Parser(Scanner scanner) {
        super();
        this.scanner = scanner;
    }

    public ParseNode parse() {
        readToken();
        return parseProgram();
    }

    ////////////////////////////////////////////////////////////
    // "program" is the start symbol S
    // S -> EXEC blockStatement

    private ParseNode parseProgram() {
        if (!startsProgram(nowReading)) {
            return syntaxErrorNode("program");
        }
        ParseNode program = new ProgramNode(nowReading);

        expect(Keyword.EXEC);
        ParseNode blockStatement = parseBlockStatement();
        program.appendChild(blockStatement);

        if (!(nowReading instanceof NullToken)) {
            return syntaxErrorNode("end of program");
        }

        return program;
    }

    private boolean startsProgram(Token token) {
        return token.isLextant(Keyword.EXEC);
    }


    ///////////////////////////////////////////////////////////
    // blockStatement

    // blockStatement -> { statement* }
    private ParseNode parseBlockStatement() {
        if (!startsBlockStatement(nowReading)) {
            return syntaxErrorNode("blockStatement");
        }
        ParseNode blockStatement = new BlockStatementNode(nowReading);
        expect(Punctuator.OPEN_BRACE);

        while (startsStatement(nowReading)) {
            ParseNode statement = parseStatement();
            blockStatement.appendChild(statement);
        }
        expect(Punctuator.CLOSE_BRACE);
        return blockStatement;
    }

    private boolean startsBlockStatement(Token token) {
        return token.isLextant(Punctuator.OPEN_BRACE);
    }


    ///////////////////////////////////////////////////////////
    // statements

    // statement-> declaration | printStmt | blockStmt | assignmentStmt | ifStmt | whileStmt
    private ParseNode parseStatement() {
        if (!startsStatement(nowReading)) {
            return syntaxErrorNode("statement");
        }
        if (startsDeclaration(nowReading)) {
            return parseDeclaration();
        }
        if (startsPrintStatement(nowReading)) {
            return parsePrintStatement();
        }
        if (startsBlockStatement(nowReading)) {
            return parseBlockStatement();
        }
        if (startsAssignmentStatement(nowReading)) {
            return parseAssignmentStatement();
        }
        if (startsIfStatement(nowReading)) {
            return parseIfStatement();
        }
        if (startsWhileStatement(nowReading)) {
            return parseWhileStatement();
        }
        return syntaxErrorNode("statement");
    }

    private boolean startsStatement(Token token) {
        return startsPrintStatement(token) ||
                startsDeclaration(token) || 
                startsBlockStatement(token) ||
                startsAssignmentStatement(token) ||
                startsIfStatement(token) ||
                startsWhileStatement(token);
    }

    // whileStmt -> while (expr) blockStmt
    private ParseNode parseWhileStatement() {
        if (!startsWhileStatement(nowReading)) {
            return syntaxErrorNode("whileStatement");
        }
        Token whileToken = nowReading;

        expect(Keyword.WHILE);
        expect(Punctuator.OPEN_PARENTHESE);
        ParseNode condition = parseExpression();
        expect(Punctuator.CLOSE_PARENTHESE);
        ParseNode body= parseBlockStatement();
        return WhileStatementNode.withChildren(whileToken, condition, body);
    }

    private boolean startsWhileStatement(Token token) {
        return token.isLextant(Keyword.WHILE);
    }

    // ifStmt -> if (expr) blockStmt (else blockStmt)?
    private ParseNode parseIfStatement() {
        if (!startsIfStatement(nowReading)) {
            return syntaxErrorNode("ifStatement");
        }
        Token ifToken = nowReading;
        Boolean else_flag = false;

        expect(Keyword.IF);
        expect(Punctuator.OPEN_PARENTHESE);
        ParseNode condition = parseExpression();
        expect(Punctuator.CLOSE_PARENTHESE);
        ParseNode true_branch= parseBlockStatement();
        if (haveElse(nowReading)) {
            else_flag = true;
            expect(Keyword.ELSE);
            ParseNode false_branch= parseBlockStatement();
            return IfStatementNode.withChildren(else_flag, ifToken, condition, true_branch, false_branch);
        } else {
            return IfStatementNode.withChildren(else_flag, ifToken, condition, true_branch);
        }
    }

    private boolean startsIfStatement(Token token) {
        return token.isLextant(Keyword.IF);
    }
    private boolean haveElse(Token token) {
        return token.isLextant(Keyword.ELSE);
    }

    // assignmentStmt -> target (identifier) := expression .
    private ParseNode parseAssignmentStatement() {
        if (!startsAssignmentStatement(nowReading)) {
            return syntaxErrorNode("assignmentStatement");
        }
        Token assignmentToken = nowReading;

        ParseNode target = parseTarget();
        expect(Punctuator.ASSIGN);
        ParseNode initializer = parseExpression();
        expect(Punctuator.TERMINATOR);

        return AssignmentStatementNode.withChildren(assignmentToken, target, initializer);
    }

    private boolean startsAssignmentStatement(Token token) {
        return startsTarget(token);
    }
    
    // target -> identifier
    private ParseNode parseTarget() {
        if (!startsTarget(nowReading)) {
            return syntaxErrorNode("target");
        }
        return parseIdentifier();
    }

    private boolean startsTarget(Token token) {
        return startsIdentifier(token);
    }
    
    // printStmt -> PRINT printExpressionList .
    private ParseNode parsePrintStatement() {
        if (!startsPrintStatement(nowReading)) {
            return syntaxErrorNode("print statement");
        }
        PrintStatementNode result = new PrintStatementNode(nowReading);

        readToken();
        result = parsePrintExpressionList(result);

        expect(Punctuator.TERMINATOR);
        return result;
    }

    private boolean startsPrintStatement(Token token) {
        return token.isLextant(Keyword.PRINT);
    }

    // This adds the printExpressions it parses to the children of the given parent
    // printExpressionList -> printExpression* bowtie (,|;)  (note that this is nullable)

    private PrintStatementNode parsePrintExpressionList(PrintStatementNode parent) {
        while (startsPrintExpression(nowReading) || startsPrintSeparator(nowReading)) {
            parsePrintExpression(parent);
            parsePrintSeparator(parent);
        }
        return parent;
    }


    // This adds the printExpression it parses to the children of the given parent
    // printExpression -> (expr | nl)?     (nullable)

    private void parsePrintExpression(PrintStatementNode parent) {
        if (startsExpression(nowReading)) {
            ParseNode child = parseExpression();
            parent.appendChild(child);
        } else if (nowReading.isLextant(Keyword.NEWLINE)) {
            readToken();
            ParseNode child = new NewlineNode(previouslyRead);
            parent.appendChild(child);
        } else if (nowReading.isLextant(Keyword.TAB)) {
            readToken();
            ParseNode child = new TabNode(previouslyRead);
            parent.appendChild(child);
        }
        // else we interpret the printExpression as epsilon, and do nothing
    }

    private boolean startsPrintExpression(Token token) {
        return startsExpression(token) || token.isLextant(Keyword.NEWLINE, Keyword.TAB);
    }


    // This adds the printExpression it parses to the children of the given parent
    // printExpression -> expr? ,? nl?

    private void parsePrintSeparator(PrintStatementNode parent) {
        if (!startsPrintSeparator(nowReading) && !nowReading.isLextant(Punctuator.TERMINATOR)) {
            ParseNode child = syntaxErrorNode("print separator");
            parent.appendChild(child);
            return;
        }

        if (nowReading.isLextant(Punctuator.SPACE)) {
            readToken();
            ParseNode child = new SpaceNode(previouslyRead);
            parent.appendChild(child);
        } else if (nowReading.isLextant(Punctuator.SEPARATOR)) {
            readToken();
        } else if (nowReading.isLextant(Punctuator.TERMINATOR)) {
            // we're at the end of the bowtie and this printSeparator is not required.
            // do nothing.  Terminator is handled in a higher-level nonterminal.
        }
    }

    private boolean startsPrintSeparator(Token token) {
        return token.isLextant(Punctuator.SEPARATOR, Punctuator.SPACE);
    }


    // declaration -> CONST identifier := expression .
    private ParseNode parseDeclaration() {
        if (!startsDeclaration(nowReading)) {
            return syntaxErrorNode("declaration");
        }
        Token declarationToken = nowReading;
        readToken();

        ParseNode identifier = parseIdentifier();
        expect(Punctuator.ASSIGN);
        ParseNode initializer = parseExpression();
        expect(Punctuator.TERMINATOR);

        return DeclarationNode.withChildren(declarationToken, identifier, initializer);
    }

    private boolean startsDeclaration(Token token) {
        return token.isLextant(Keyword.CONST, Keyword.VAR);
    }


    ///////////////////////////////////////////////////////////
    // expressions
    // expr                     -> orExpression
    // orExpression             -> andExpression [&& andExpression]* (left-assoc)
    // andExpression            -> comparisonExpression [|| comparisonExpression]* (left-assoc)
    // comparisonExpression     -> additiveExpression [> additiveExpression]* (left-assoc)
    // additiveExpression       -> multiplicativeExpression [+ multiplicativeExpression]*  (left-assoc)
    // multiplicativeExpression -> unaryExpression [MULT unaryExpression]*  (left-assoc)
    // unaryExpression          -> [!]* indexingExpression (prefix right-assoc)
    // indexingExpression       -> atomicExpression [ Expression ]* (left-assoc)
    // atomicExpression         -> literal
    // literal                  -> integerConstant | identifier | booleanConstant

    // expr  -> comparisonExpression
    private ParseNode parseExpression() {
        if (!startsExpression(nowReading)) {
            return syntaxErrorNode("expression");
        }
        return parseOrExpression();
    }

    private boolean startsExpression(Token token) {
        return startsOrExpression(token);
    }

    // orExpression -> andExpression [&& andExpression]* (left-assoc)
    private ParseNode parseOrExpression() {
        if (!startsOrExpression(nowReading)) {
            return syntaxErrorNode("or expression");
        }

        ParseNode left = parseAndExpression();
        while (nowReading.isLextant(Punctuator.BOOLEAN_OR)) {
            Token orToken = nowReading;
            readToken();
            ParseNode right = parseAndExpression();

            left = OperatorNode.withChildren(orToken, left, right);
        }
        return left;

    }

    private boolean startsOrExpression(Token token) {
        return startsAndExpression(token);
    }

    // andExpression -> comparisonExpression [|| comparisonExpression]* (left-assoc)
    private ParseNode parseAndExpression() {
        if (!startsAndExpression(nowReading)) {
            return syntaxErrorNode("and expression");
        }

        ParseNode left = parseComparisonExpression();
        while (nowReading.isLextant(Punctuator.BOOLEAN_AND)) {
            Token andToken = nowReading;
            readToken();
            ParseNode right = parseComparisonExpression();

            left = OperatorNode.withChildren(andToken, left, right);
        }
        return left;

    }

    private boolean startsAndExpression(Token token) {
        return startsComparisonExpression(token);
    }
    
    // comparisonExpression -> additiveExpression [> additiveExpression]* (left-assoc)
    private ParseNode parseComparisonExpression() {
        if (!startsComparisonExpression(nowReading)) {
            return syntaxErrorNode("comparison expression");
        }

        ParseNode left = parseAdditiveExpression();
        while (nowReading.isLextant(Punctuator.comparisons)) {
            Token compareToken = nowReading;
            readToken();
            ParseNode right = parseAdditiveExpression();

            left = OperatorNode.withChildren(compareToken, left, right);
        }
        return left;

    }

    private boolean startsComparisonExpression(Token token) {
        return startsAdditiveExpression(token);
    }

    // additiveExpression -> multiplicativeExpression [+ multiplicativeExpression]*  (left-assoc)
    private ParseNode parseAdditiveExpression() {
        if (!startsAdditiveExpression(nowReading)) {
            return syntaxErrorNode("additiveExpression");
        }

        ParseNode left = parseMultiplicativeExpression();
        while (nowReading.isLextant(Punctuator.ADD, Punctuator.SUBTRACT)) {
            Token additiveToken = nowReading;
            readToken();
            ParseNode right = parseMultiplicativeExpression();

            left = OperatorNode.withChildren(additiveToken, left, right);
        }
        return left;
    }

    private boolean startsAdditiveExpression(Token token) {
        return startsMultiplicativeExpression(token);
    }

    // multiplicativeExpression -> unaryExpression [MULT unaryExpression]*  (left-assoc)
    private ParseNode parseMultiplicativeExpression() {
        if (!startsMultiplicativeExpression(nowReading)) {
            return syntaxErrorNode("multiplicativeExpression");
        }

        ParseNode left = parseUnaryExpression();
        while (nowReading.isLextant(Punctuator.multiplicative)) {
            Token multiplicativeToken = nowReading;
            readToken();
            ParseNode right = parseUnaryExpression();

            left = OperatorNode.withChildren(multiplicativeToken, left, right);
        }
        return left;
    }

    private boolean startsMultiplicativeExpression(Token token) {
        return startsUnaryExpression(token);
    }

    // unaryExpression -> [!]* indexingExpression (prefix right-assoc)
    private ParseNode parseUnaryExpression() {
        if (!startsUnaryExpression(nowReading)) {
            return syntaxErrorNode("unaryExpression");
        }

        // prefix unary
        ParseNode right;
        if (haveUnary(nowReading)) {
            Token unaryToken = nowReading;
            readToken();
            right = parseUnaryExpression();
            right = OperatorNode.withChildren(unaryToken, right);
        } else {
            right = parseIndexingExpression();
        }
        return right;
    }

    private boolean startsUnaryExpression(Token token) {
        return haveUnary(token) | startsIndexingExpression(token);
    }
    private boolean haveUnary(Token token) {
        return token.isLextant(Punctuator.BOOLEAN_NOT, Keyword.CLONE, Keyword.LENGTH);
    }

    // indexingExpression -> atomicExpression [ Expression ]* (left-assoc)
    private ParseNode parseIndexingExpression() {
        if (!startsIndexingExpression(nowReading)) {
            return syntaxErrorNode("indexingExpression");
        }

        ParseNode base = parseAtomicExpression();
        while (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
            Token realToken = nowReading;
            Token indexToken = LextantToken.artificial(realToken, Punctuator.ARRAY_INDEXING);

            readToken();
            ParseNode index = parseExpression();
            expect(Punctuator.CLOSE_BRACKET);

            base = OperatorNode.withChildren(indexToken, base, index);
        }
        return base;
    }

    private boolean startsIndexingExpression(Token token) {
        return startsAtomicExpression(token);
    }
    
    // atomicExpression -> literal | parentheses | casting
    private ParseNode parseAtomicExpression() {
        if (!startsAtomicExpression(nowReading)) {
            return syntaxErrorNode("atomic expression");
        }
        if (startsParenthesesExpression(nowReading)) {
            return parseParenthesesExpression();
        }
        if (startsCastingExpression(nowReading)) {
            return parseCastingExpression();
        }
        return parseLiteral();
    }

    private boolean startsAtomicExpression(Token token) {
        return startsLiteral(token) || startsParenthesesExpression(token) ||
                startsCastingExpression(token);
    }

    // parentheses expression -> ( expression )
    private ParseNode parseParenthesesExpression() {
        if (!startsParenthesesExpression(nowReading)) {
            return syntaxErrorNode("parentheses expression");
        }

        ParseNode parenthesesExpression = new ParenthesesNode(nowReading);
        expect(Punctuator.OPEN_PARENTHESE);
        ParseNode expression = parseExpression();
        parenthesesExpression.appendChild(expression);
        expect(Punctuator.CLOSE_PARENTHESE);
        
        return parenthesesExpression;
    }
    
    private boolean startsParenthesesExpression(Token token) {
        return token.isLextant(Punctuator.OPEN_PARENTHESE);  
    }
    
    // casting expression -> [ expression | type ] 
    private ParseNode parseCastingExpression() {
        if (!startsCastingExpression(nowReading)) {
            return syntaxErrorNode("casting expression");
        }

        Token realToken = nowReading;
        Token indexToken = LextantToken.artificial(realToken, Punctuator.CASTING);

        expect(Punctuator.OPEN_BRACKET);
        ParseNode expression = parseExpression();
        expect(Punctuator.VERTICAL_LINE);
        ParseNode type = parseType();
        expect(Punctuator.CLOSE_BRACKET);

        return OperatorNode.withChildren(indexToken, expression, type);
    }

    private boolean startsCastingExpression(Token token) {
        return token.isLextant(Punctuator.OPEN_BRACKET);
    }

    // type -> bool | char | string | int | float | rat | arrayType
    private ParseNode parseType() {
        if (!startsType(nowReading)) {
            return syntaxErrorNode("Type ");
        }

        if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
            Token realToken = nowReading;
            Token indexToken = LextantToken.artificial(realToken, Punctuator.ARRAY_TYPE);
            readToken();
            ParseNode subtype = parseType();
            expect(Punctuator.CLOSE_BRACKET);
            return TypeNode.withSubType(indexToken, subtype);
        } else {
            readToken();
            return new TypeNode(previouslyRead);
        }
    }

    private boolean startsType(Token token) {
        return token.isLextant(Keyword.BOOL, Keyword.CHAR, Keyword.STRING,
                Keyword.INT, Keyword.FLOAT, Keyword.RAT, Punctuator.OPEN_BRACKET);
    }
    
    // literal -> integerConstant | identifier | booleanConstant
    //     characterConstant | stringConstant | floatingConstant
    private ParseNode parseLiteral() {
        if (!startsLiteral(nowReading)) {
            return syntaxErrorNode("literal");
        }

        if (startsIntegerConstant(nowReading)) {
            return parseIntegerConstant();
        }
        if (startsFloatingConstant(nowReading)) {
            return parseFloatingConstant();
        }
        if (startsIdentifier(nowReading)) {
            return parseIdentifier();
        }
        if (startsBooleanConstant(nowReading)) {
            return parseBooleanConstant();
        }
        if (startsCharacterConstant(nowReading)) {
            return parseCharacterConstant();
        }
        if (startsStringConstant(nowReading)) {
            return parseStringConstant();
        }

        return syntaxErrorNode("literal");
    }

    private boolean startsLiteral(Token token) {
        return startsIntegerConstant(token) || startsFloatingConstant(token) ||
                startsIdentifier(token) || startsBooleanConstant(token) ||
                startsCharacterConstant(token) || startsStringConstant(token);
    }

    // integer (terminal)
    private ParseNode parseIntegerConstant() {
        if (!startsIntegerConstant(nowReading)) {
            return syntaxErrorNode("integer constant");
        }
        readToken();
        return new IntegerConstantNode(previouslyRead);
    }

    private boolean startsIntegerConstant(Token token) {
        return token instanceof IntegerToken;
    }

    // floating (terminal)
    private ParseNode parseFloatingConstant() {
        if (!startsFloatingConstant(nowReading)) {
            return syntaxErrorNode("floating constant");
        }
        readToken();
        return new FloatingConstantNode(previouslyRead);
    }

    private boolean startsFloatingConstant(Token token) {
        return token instanceof FloatingToken;
    }

    // character (terminal)
    private ParseNode parseCharacterConstant() {
        if (!startsCharacterConstant(nowReading)) {
            return syntaxErrorNode("character constant");
        }
        readToken();
        return new CharacterConstantNode(previouslyRead);
    }

    private boolean startsCharacterConstant(Token token) {
        return token instanceof CharacterToken;
    }
    
    // string (terminal)
    private ParseNode parseStringConstant() {
        if (!startsStringConstant(nowReading)) {
            return syntaxErrorNode("string constant");
        }
        readToken();
        return new StringConstantNode(previouslyRead);
    }

    private boolean startsStringConstant(Token token) {
        return token instanceof StringToken;
    }
    
    // identifier (terminal)
    private ParseNode parseIdentifier() {
        if (!startsIdentifier(nowReading)) {
            return syntaxErrorNode("identifier");
        }
        readToken();
        return new IdentifierNode(previouslyRead);
    }

    private boolean startsIdentifier(Token token) {
        return token instanceof IdentifierToken;
    }

    // boolean constant (terminal)
    private ParseNode parseBooleanConstant() {
        if (!startsBooleanConstant(nowReading)) {
            return syntaxErrorNode("boolean constant");
        }
        readToken();
        return new BooleanConstantNode(previouslyRead);
    }

    private boolean startsBooleanConstant(Token token) {
        return token.isLextant(Keyword.TRUE, Keyword.FALSE);
    }

    private void readToken() {
        previouslyRead = nowReading;
        nowReading = scanner.next();
    }

    // if the current token is one of the given lextants, read the next token.
    // otherwise, give a syntax error and read next token (to avoid endless looping).
    private void expect(Lextant... lextants) {
        if (!nowReading.isLextant(lextants)) {
            syntaxError(nowReading, "expecting " + Arrays.toString(lextants));
        }
        readToken();
    }

    private ErrorNode syntaxErrorNode(String expectedSymbol) {
        syntaxError(nowReading, "expecting " + expectedSymbol);
        ErrorNode errorNode = new ErrorNode(nowReading);
        readToken();
        return errorNode;
    }

    private void syntaxError(Token token, String errorDescription) {
        String message = "" + token.getLocation() + " " + errorDescription;
        error(message);
    }

    private void error(String message) {
        PikaLogger log = PikaLogger.getLogger("compiler.Parser");
        log.severe("syntax error: " + message);
    }
}

