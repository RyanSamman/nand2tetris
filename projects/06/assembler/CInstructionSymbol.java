import java.util.HashMap;
import java.util.Map;

public class CInstructionSymbol extends Symbol {

    String destStr = "", compStr = "", jumpStr = "";
    private static final Map<String, String> compMap = new HashMap<>();
    private static final Map<String, String> jumpMap = new HashMap<>();

    private static void populateCompMap() {
        if (!compMap.isEmpty()) {
            return;
        }

        compMap.put("0", "101010");
        compMap.put("1", "111111");
        compMap.put("-1", "111010");
        compMap.put("D", "001100");
        compMap.put("A", "110000");
        compMap.put("M", "110000");
        compMap.put("!D", "001101");
        compMap.put("!A", "110001");
        compMap.put("!M", "110001");
        compMap.put("-D", "001111");
        compMap.put("-A", "110011");
        compMap.put("-M", "110011");
        compMap.put("D+1", "011111");
        compMap.put("A+1", "110111");
        compMap.put("M+1", "110111");
        compMap.put("D-1", "001110");
        compMap.put("A-1", "110010");
        compMap.put("M-1", "110010");
        compMap.put("D+A", "000010");
        compMap.put("D+M", "000010");
        compMap.put("D-A", "010011");
        compMap.put("D-M", "010011");
        compMap.put("A-D", "000111");
        compMap.put("M-D", "000111");
        compMap.put("D&A", "000000");
        compMap.put("D&M", "000000");
        compMap.put("D|A", "010101");
        compMap.put("D|M", "010101");
    }


    private static void populateJumpMap() {
        if (!jumpMap.isEmpty()) {
            return;
        }

        jumpMap.put("null", "000");
        jumpMap.put("JGT", "001");
        jumpMap.put("JEQ", "010");
        jumpMap.put("JGE", "011");
        jumpMap.put("JLT", "100");
        jumpMap.put("JNE", "101");
        jumpMap.put("JLE", "110");
        jumpMap.put("JMP", "111");

    }

    protected void processSymbolIntoCompDestJumpStr() {

        String symbol = this.symbolString;
        String[] symbols = symbol.split("=");
        if (symbols.length == 2) {
            destStr = symbols[0];
            symbol = symbols[1];
        } else {
            symbol = symbols[0];
        }


        symbols = symbol.split(";");
        if (symbols.length == 2) {
            compStr = symbols[0];
            jumpStr = symbols[1];
        } else {
            compStr = symbols[0];
        }

    }

    public CInstructionSymbol(String symbol) {
        super(symbol);

        if (compMap.isEmpty()) {
            populateCompMap();
        }

        if (jumpMap.isEmpty()) {
            populateJumpMap();
        }


    }

    public String processA() {
        if (compStr.contains("M")) {
            return "1";
        }

        return "0";
    }

    public String processComp() {
        return compMap.getOrDefault(compStr, "101010");
    }

    public String processDest() {
        String dest = "";
        if (destStr.contains("A")) {
            dest = dest + "1";
        } else {
            dest = dest + "0";
        }

        if (destStr.contains("D")) {
            dest = dest + "1";
        } else {
            dest = dest + "0";
        }
        if (destStr.contains("M")) {
            dest = dest + "1";
        } else {
            dest = dest + "0";
        }

        return dest;
    }

    public String processJump() {
        return jumpMap.getOrDefault(jumpStr, "000");
    }

    @Override
    public String toBinaryString() {
        processSymbolIntoCompDestJumpStr();
        return "111" + processA() + processComp() + processDest() + processJump();
    }
}
