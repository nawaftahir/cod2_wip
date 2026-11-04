import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.symbol.SourceType;
import ghidra.program.model.data.DWordDataType;
import java.io.File;
import java.util.Scanner;

// Label dword entries of the refimport table (and any "addr name" lines) as data
// Usage: -postScript LabelDwordsGfx.java <names.txt>
public class LabelDwordsGfx extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        Scanner sc = new Scanner(new File(args[0]), "UTF-8");
        int labeled = 0;
        while (sc.hasNextLine()) {
            String line = sc.nextLine().trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            String[] p = line.split("\\s+");
            if (p.length < 2) continue;
            Address a = currentProgram.getAddressFactory().getAddress(p[0]);
            try {
                clearListing(a, a.add(3));
                createData(a, new DWordDataType());
                setEOLComment(a, p[1]);
                createLabel(a, p[1], true, SourceType.USER_DEFINED);
                labeled++;
            } catch (Exception e) {
                println("skip " + p[0] + ": " + e.getMessage());
            }
        }
        sc.close();
        println("labeled=" + labeled);
    }
}
