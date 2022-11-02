import java.io.IOException;
import java.nio.file.Path;

public class Main {
    public static void main(String[] args) throws IOException {
        Assembler assembler = new Assembler();
        assembler.loadSymbolsFromFile(args[0]);
        assembler.dumpBinaryToFile(args[1]);
    }
}
