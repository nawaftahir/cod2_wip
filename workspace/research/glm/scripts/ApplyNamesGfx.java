import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.symbol.SourceType;
import java.io.File;
import java.util.Scanner;

// Apply names from data/refexport_gfx10.json lines: "addr name" (one per line, JSON array filtered upstream)
// Usage: -postScript ApplyNamesGfx.java <names.txt>
public class ApplyNamesGfx extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        Scanner sc = new Scanner(new File(args[0]), "UTF-8");
        int applied = 0, created = 0, skipped = 0;
        while (sc.hasNextLine()) {
            String line = sc.nextLine().trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            String[] parts = line.split("\\s+");
            if (parts.length < 2) continue;
            Address addr = currentProgram.getAddressFactory().getAddress(parts[0]);
            String name = parts[1];
            Function f = getFunctionAt(addr);
            try {
                if (f != null) {
                    f.setName(name, SourceType.USER_DEFINED);
                    applied++;
                } else {
                    createFunction(addr, name);
                    if (getFunctionAt(addr) != null) created++;
                    else skipped++;
                }
            } catch (Exception e) {
                skipped++;
                println("skip " + parts[0] + " " + name + ": " + e.getMessage());
            }
        }
        sc.close();
        println("applied=" + applied + " created=" + created + " skipped=" + skipped);
    }
}
