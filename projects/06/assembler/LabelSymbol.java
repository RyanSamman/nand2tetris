import java.util.HashMap;
import java.util.Map;

public class LabelSymbol extends AInstructionSymbol {
    private static final Map<String, Integer> labelMap = new HashMap<>();
    private static Integer labelMemoryIndex = 16;

    private static void populateLabelMap()
    {
        if (!labelMap.isEmpty()) {
            return;
        }

        labelMap.put("SP", 0);
        labelMap.put("LCL", 1);
        labelMap.put("ARG", 2);
        labelMap.put("THIS", 3);
        labelMap.put("THAT", 4);
        labelMap.put("SCREEN", 16384);
        labelMap.put("KBD", 24576);
        labelMap.put("R1", 1);
        labelMap.put("R2", 2);
        labelMap.put("R3", 3);
        labelMap.put("R4", 4);
        labelMap.put("R5", 5);
        labelMap.put("R6", 6);
        labelMap.put("R7", 7);
        labelMap.put("R8", 8);
        labelMap.put("R9", 9);
        labelMap.put("R10", 10);
        labelMap.put("R11", 11);
        labelMap.put("R12", 12);
        labelMap.put("R13", 13);
        labelMap.put("R14", 14);
        labelMap.put("R15", 15);
    }

    public LabelSymbol(String aInstruction) {

        super(aInstruction);

        populateLabelMap();

    }

    public static void addLabel(String label) {

        labelMap.put(label, labelMemoryIndex);
        labelMemoryIndex++;
    }

    @Override
    public String toBinaryString() {
        if (labelMap.containsKey(symbolString)) {
            index = labelMap.get(symbolString);
            return super.toBinaryString();
        } else {
            System.out.println("Can't find " + symbolString);
        }

        return null;

    }
}
