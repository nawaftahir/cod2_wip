import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileOptions;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.listing.Function;
import java.io.File;
import java.io.PrintWriter;

public class DecompileIntrinsic extends GhidraScript
{
    @Override
    public void run() throws Exception
    {
        Function function = getFunctionAt(toAddr("10073752"));
        if (function == null)
        {
            throw new IllegalStateException("Missing original EmitIntrinsic function");
        }
        DecompileOptions options = new DecompileOptions();
        options.setMaxInstructions(1000000);
        options.setMaxPayloadMBytes(100);
        options.setMaxJumpTableEntries(1024);
        DecompInterface decompiler = new DecompInterface();
        decompiler.setOptions(options);
        decompiler.openProgram(currentProgram);
        try
        {
            DecompileResults result = decompiler.decompileFunction(function, 300, monitor);
            File output = new File(getScriptArgs()[0]);
            try (PrintWriter writer = new PrintWriter(output, "UTF-8"))
            {
                writer.println("// Research export only, zero source credit");
                writer.println("// " + function.getEntryPoint() + " " + function.getName());
                writer.println("// Ghidra function body addresses: " + function.getBody().getNumAddresses());
                writer.println("// Completed: " + result.decompileCompleted());
                writer.println("// Error: " + result.getErrorMessage());
                if (result.getDecompiledFunction() != null)
                {
                    writer.println(result.getDecompiledFunction().getC());
                }
            }
            println("EmitIntrinsic completed=" + result.decompileCompleted() + "; " + result.getErrorMessage());
        }
        finally
        {
            decompiler.dispose();
        }
    }
}
