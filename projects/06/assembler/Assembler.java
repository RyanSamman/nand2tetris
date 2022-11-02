import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Assembler {
    List<Symbol> symbolList;

    public Assembler() {
        symbolList = new ArrayList<>();
    }

    public void loadSymbolsFromFile(String path) throws IOException {
        Scanner assemblyFile = new Scanner(new File(path));

        while (assemblyFile.hasNextLine()) {
            String line = assemblyFile.nextLine().strip();

            if (line.startsWith("//")) {
                continue;
            }

            if (line.isEmpty()) {
                continue;
            }

            System.out.println(line);

            if (line.startsWith("@")) {
                String aInstruction = line.substring(1);
                if (aInstruction.matches("^\\d+$")) {
                    symbolList.add(new AInstructionSymbol(aInstruction));
                } else {
                    symbolList.add(new LabelSymbol(aInstruction));
                }
            } else if (line.startsWith("(") && line.endsWith(")")) {
                String newLabel = line.substring(1, line.length() - 1);
                LabelSymbol.addLabel(newLabel);
            } else {
                symbolList.add(new CInstructionSymbol(line));
            }
        }

        assemblyFile.close();
    }

    public void dumpBinaryToFile(String path) throws IOException {
        FileWriter writer = new FileWriter(path);

        for (Symbol s: symbolList) {
            String str = s.toBinaryString();
            System.out.println(str);
            writer.write(str);
            writer.write('\n');
        }

        writer.close();

    }
}
