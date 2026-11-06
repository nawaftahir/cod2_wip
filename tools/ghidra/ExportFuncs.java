// Export functions: entry, size, name, callers, called functions, referenced data.
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.address.*;
import java.io.*;
import java.util.*;

public class ExportFuncs extends GhidraScript {
    @Override
    public void run() throws Exception {
        String out = getScriptArgs().length > 0 ? getScriptArgs()[0] : "/tmp/funcs.tsv";
        PrintWriter w = new PrintWriter(new FileWriter(out));
        FunctionIterator it = currentProgram.getFunctionManager().getFunctions(true);
        while (it.hasNext() && !monitor.isCancelled()) {
            Function f = it.next();
            StringBuilder callers = new StringBuilder(), callees = new StringBuilder(), data = new StringBuilder();
            for (Function c : f.getCallingFunctions(monitor)) callers.append(c.getEntryPoint()).append(',');
            for (Function c : f.getCalledFunctions(monitor)) callees.append(c.getEntryPoint()).append(',');
            for (Address a : f.getBody().getAddresses(true)) {
                for (Reference r : getReferencesFrom(a)) {
                    if (r.getReferenceType().isData()) data.append(r.getToAddress()).append(',');
                }
            }
            w.println(f.getEntryPoint() + "\t" + f.getBody().getNumAddresses() + "\t" + f.getName()
                + "\t" + callers + "\t" + callees + "\t" + data);
        }
        w.close();
    }
}
