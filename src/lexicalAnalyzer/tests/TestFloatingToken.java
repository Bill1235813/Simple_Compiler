package lexicalAnalyzer.tests;

import applications.PikaTokenPrinter;
import tests.FileFixturesTestCase;
import tokens.Tokens;

import java.io.FileNotFoundException;
import java.io.PrintStream;

import static lexicalAnalyzer.tests.FixtureDefinitions.FLOATING_INPUT_FILENAME;
import static lexicalAnalyzer.tests.FixtureDefinitions.FLOATING_EXPECTED_FILENAME;

public class TestFloatingToken extends FileFixturesTestCase {

    public void testTokenPrinter() throws Exception {
        String actualOutput = tokenPrinterOutput(FLOATING_INPUT_FILENAME);
        String expectedOutput = getContents(FLOATING_EXPECTED_FILENAME);
        assertEquals(expectedOutput, actualOutput);
    }

    private String tokenPrinterOutput(String filename) throws Exception {
        return outputFor(new TestFloatingToken.TokenPrinterCommand(filename));
    }

    public class TokenPrinterCommand implements Command {
        String filename;

        public TokenPrinterCommand(String filename) {
            this.filename = filename;
        }

        public void run(PrintStream out) throws FileNotFoundException {
            Tokens.setPrintLevel(Tokens.Level.TYPE_AND_VALUE);
            PikaTokenPrinter.scanFile(filename, out);
        }
    }

}
