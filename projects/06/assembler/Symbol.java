public abstract class Symbol {
    static protected int symbolCount = 0;
    protected final String symbolString;

    public Symbol(String symbolString) {
        this.symbolString = symbolString;
        symbolCount++;
    }

    public abstract String toBinaryString();
}
