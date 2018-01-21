package parser.tests;

import applications.PikaAbstractSyntaxTree;
import parseTree.ParseTreePrinter;
import tests.FileFixturesTestCase;

import java.io.FileNotFoundException;
import java.io.PrintStream;

import static parser.tests.FixtureDefinitions.CASTING_EXPECTED_FILENAME;
import static parser.tests.FixtureDefinitions.CASTING_INPUT_FILENAME;

public class TestCasting extends FileFixturesTestCase {

    public void testAbstractSyntaxTreeFull() throws Exception {
        tokenPrinterSingleTest(ParseTreePrinter.Level.FULL, CASTING_EXPECTED_FILENAME);
    }

//    public void testAbstractSyntaxTreeTokenOnly() throws Exception {
//        tokenPrinterSingleTest(ParseTreePrinter.Level.TOKEN_ONLY, CASTING_EXPECTED_FILENAME);
//    }

    public void tokenPrinterSingleTest(ParseTreePrinter.Level level, String string) throws Exception {
        ParseTreePrinter.setPrintLevel(level);
        String actualOutput = tokenPrinterOutput(CASTING_INPUT_FILENAME);
        String expectedOutput = getContents(string);
        assertEquals(expectedOutput, actualOutput);
    }

    private String tokenPrinterOutput(String filename) throws Exception {
        return outputFor(new TestCasting.ASTCommand(filename));
    }

    public class ASTCommand implements Command {
        String filename;

        public ASTCommand(String filename) {
            this.filename = filename;
        }

        public void run(PrintStream out) throws FileNotFoundException {
            PikaAbstractSyntaxTree.parseFileToAST(filename, out);
        }
    }
}
