import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import java.io.File;
import java.io.PrintWriter;
import java.util.Scanner;

// Decompile functions given as comma-separated addresses in GLM_DECOMP_ADDR env/property,
// or all functions if none given. Output: one .c file per function under outdir.
public class DecompileGfx extends GhidraScript {
    @Override
    public void run() throws Exception {
        // usage: -postScript DecompileGfx.java [addr,addr,... outdir]  (no args = all functions -> ./decomp)
        String[] args = getScriptArgs();
        String addrProp = args.length > 0 ? args[0] : "";
        String outdirProp = args.length > 1 ? args[1] : "decomp";
        File outdir = new File(outdirProp);
        outdir.mkdirs();
        if (addrProp.startsWith("@")) {
            // chunk file: one address per line
            java.util.List<String> lst = new java.util.ArrayList<>();
            Scanner sc = new Scanner(new File(addrProp.substring(1)), "UTF-8");
            while (sc.hasNextLine()) {
                String l = sc.nextLine().trim();
                if (!l.isEmpty()) lst.add(l);
            }
            sc.close();
            addrProp = String.join(",", lst);
        }

        DecompInterface di = new DecompInterface();
        DecompileOptions opts = new DecompileOptions();
        di.setOptions(opts);
        di.openProgram(currentProgram);

        String[] addrs = addrProp.isEmpty() ? new String[0] : addrProp.split(",");
        if (addrs.length > 0) {
            for (String a : addrs) {
                Address addr = currentProgram.getAddressFactory().getAddress(a.trim());
                Function f = getFunctionAt(addr);
                if (f == null) { println("no function at " + a); continue; }
                dump(di, f, outdir);
            }
        } else {
            for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
                dump(di, f, outdir);
            }
        }
        di.dispose();
    }

    private void dump(DecompInterface di, Function f, File outdir) throws Exception {
        DecompileResults res = di.decompileFunction(f, 60, monitor);
        String c = res.getDecompiledFunction() != null ? res.getDecompiledFunction().getC() : "// DECOMPILE FAILED";
        String name = f.getName().replaceAll("[^A-Za-z0-9_]", "_");
        String addr = f.getEntryPoint().toString();
        PrintWriter w = new PrintWriter(new File(outdir, addr + "_" + name + ".c"), "UTF-8");
        w.println("// " + f.getEntryPoint() + " size=" + f.getBody().getNumAddresses() + " " + f.getName());
        w.println(c);
        w.close();
    }
}
