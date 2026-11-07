// Decompile the functions whose entry addresses are listed (one hex per line) into one C file.
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.*;
import java.io.*;
import java.nio.file.*;

public class DecompileList extends GhidraScript {
    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        DecompInterface d = new DecompInterface();
        d.openProgram(currentProgram);
        PrintWriter w = new PrintWriter(new FileWriter(args[1]));
        for (String line : Files.readAllLines(Paths.get(args[0]))) {
            if (line.isBlank()) continue;
            Function f = getFunctionAt(toAddr(line.trim()));
            if (f == null) { w.println("// no function at " + line); continue; }
            DecompileResults r = d.decompileFunction(f, 60, monitor);
            w.println("// ==== " + f.getEntryPoint() + " size " + f.getBody().getNumAddresses());
            w.println(r.decompileCompleted() ? r.getDecompiledFunction().getC() : "// decompile failed");
        }
        w.close();
        d.dispose();
    }
}
