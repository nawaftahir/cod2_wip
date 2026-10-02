import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.Function;
import java.io.File;
import java.io.PrintWriter;

// Reuses GLM's DecompileGfx flow; retain the actual failure instead of a marker.
public class RecoverCompiler extends GhidraScript
{
    public void run() throws Exception
    {
        String[] args = getScriptArgs();
        File output = new File(args[1]);
        output.mkdirs();
        DecompInterface decompiler = new DecompInterface();
        DecompileOptions options = new DecompileOptions();
        decompiler.setOptions(options);
        decompiler.openProgram(currentProgram);
        try
        {
            for (String entry : args[0].split(","))
            {
                Function function = getFunctionAt(toAddr(entry));
                if (function == null) throw new IllegalArgumentException(entry);
                DecompileResults result = decompiler.decompileFunction(function, 300, monitor);
                println(entry + " completed=" + result.decompileCompleted() + " error=" + result.getErrorMessage());
                try (PrintWriter writer = new PrintWriter(new File(output, entry + ".c"), "UTF-8"))
                {
                    writer.println("// Analysis output only; no reconstructed-source credit.");
                    writer.println("// " + function.getEntryPoint() + " body=" + function.getBody().getNumAddresses());
                    writer.println("// " + result.getErrorMessage());
                    if (result.getDecompiledFunction() != null) writer.println(result.getDecompiledFunction().getC());
                }
            }
        }
        finally
        {
            decompiler.dispose();
        }
    }
}
