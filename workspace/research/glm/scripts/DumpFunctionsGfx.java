import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import java.io.PrintWriter;
import java.io.File;

// Dumps the function inventory of the current program to functions_gfx10.json
public class DumpFunctionsGfx extends GhidraScript {
    @Override
    public void run() throws Exception {
        File file = new File(System.getProperty("user.dir"), "functions_gfx10.json");
        PrintWriter w = new PrintWriter(file, "UTF-8");
        w.println("{");
        w.println("  \"imagebase\": \"" + currentProgram.getImageBase() + "\",");
        w.println("  \"functions\": [");

        FunctionIterator it = currentProgram.getFunctionManager().getFunctions(true);
        boolean first = true;
        while (it.hasNext()) {
            Function f = it.next();
            if (!first) w.println(",");
            first = false;
            String name = f.getName().replace("\\", "\\\\").replace("\"", "\\\"");
            w.print("    {\"name\": \"" + name + "\", ");
            w.print("\"addr\": \"" + f.getEntryPoint() + "\", ");
            w.print("\"size\": " + f.getBody().getNumAddresses() + ", ");
            w.print("\"thunk\": " + f.isThunk());
            w.print("}");
        }
        w.println();
        w.println("  ]");
        w.println("}");
        w.close();
        println("wrote " + file.getAbsolutePath());
    }
}
