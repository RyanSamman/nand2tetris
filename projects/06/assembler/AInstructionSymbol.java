import java.nio.ByteBuffer;

public class AInstructionSymbol extends Symbol {
    Integer index = null;

    public AInstructionSymbol(String aInstruction) {
        super(aInstruction);
    }

    @Override
    public String toBinaryString() {
        if (index == null) {
            index = Integer.valueOf(symbolString);
        }

        StringBuffer buffer = new StringBuffer();

        int x = index;
        for (int i = 15; i >= 0; i++) {
            buffer.append(x % 2);
            x /= 2;
        }

        buffer.reverse();
        buffer
        return String.format("0%15s", buffer.reverse());
    }
}
