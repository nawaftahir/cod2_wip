import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.data.StringDataInstance;
import ghidra.program.model.address.Address;
import java.io.File;
import java.io.PrintWriter;

// Per-function referenced strings -> strings_gfx10.json (naming bootstrap)
public class DumpStringsGfx extends GhidraScript {
    @Override
    public void run() throws Exception {
        File file = new File(System.getProperty("user.dir"), "strings_gfx10.json");
        PrintWriter out = new PrintWriter(file, "UTF-8");
        out.println("{");

        FunctionIterator iter = currentProgram.getFunctionManager().getFunctions(true);
        boolean first = true;

        while (iter.hasNext()) {
            Function func = iter.next();
            StringBuilder sb = new StringBuilder();

            InstructionIterator iIter = currentProgram.getListing().getInstructions(func.getBody(), true);
            while (iIter.hasNext()) {
                Instruction ins = iIter.next();
                Reference[] refs = ins.getReferencesFrom();
                for (Reference ref : refs) {
                    Address toAddr = ref.getToAddress();
                    Data data = currentProgram.getListing().getDataAt(toAddr);
                    if (data != null) {
                        String s = StringDataInstance.getStringDataInstance(data).getStringValue();
                        if (s != null && s.length() >= 4) {
                            if (sb.length() > 0) sb.append(", ");
                            String esc = s.replace("\\", "\\\\").replace("\"", "\\\"")
                                          .replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t");
                            if (esc.length() > 200) esc = esc.substring(0, 200);
                            sb.append("\"" + esc + "\"");
                            if (sb.length() > 2000) break;
                        }
                    }
                }
                if (sb.length() > 2000) break;
            }

            if (sb.length() > 0) {
                if (!first) out.println(",");
                first = false;
                out.print("  \"" + func.getEntryPoint() + "\": [" + sb + "]");
            }
        }

        out.println();
        out.println("}");
        out.close();
        println("wrote " + file.getAbsolutePath());
    }
}
