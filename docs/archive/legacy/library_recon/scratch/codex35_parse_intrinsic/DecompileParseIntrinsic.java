import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileOptions;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.util.demangler.DemangledObject;
import ghidra.app.util.demangler.DemanglerOptions;
import ghidra.app.util.demangler.microsoft.MicrosoftDemangler;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class DecompileParseIntrinsic extends GhidraScript
{
    @Override
    public void run() throws Exception
    {
        String[] args = getScriptArgs();
        if (!isRunningHeadless())
        {
            throw new IllegalStateException("Use headless -readOnly; do not modify the shared database");
        }
        Map<String, Set<String>> names = new HashMap<>();
        try (var reader = Files.newBufferedReader(Path.of(args[0])))
        {
            for (JsonElement element : JsonParser.parseReader(reader).getAsJsonArray())
            {
                var row = element.getAsJsonObject();
                if (row.getAsJsonArray("placements").size() != 1)
                {
                    continue;
                }
                String address = row.getAsJsonArray("placements").get(0).getAsString();
                for (JsonElement symbol : row.getAsJsonArray("symbols"))
                {
                    if (symbol.getAsString().startsWith("?"))
                    {
                        names.computeIfAbsent(address, key -> new HashSet<>()).add(symbol.getAsString());
                    }
                }
            }
        }
        MicrosoftDemangler demangler = new MicrosoftDemangler();
        DemanglerOptions options = demangler.createDefaultOptions();
        int applied = 0;
        for (var entry : names.entrySet())
        {
            if (entry.getValue().size() != 1)
            {
                continue;
            }
            Address address = toAddr(entry.getKey());
            Function function = getFunctionAt(address);
            if (function == null)
            {
                continue;
            }
            String name = entry.getValue().iterator().next();
            try
            {
                DemangledObject object = demangler.demangle(
                    demangler.createMangledContext(name, options, currentProgram, address));
                if (object != null && object.applyTo(currentProgram, address, options, monitor))
                {
                    ++applied;
                }
            }
            catch (Exception exception)
            {
                println("SKIP " + address + " " + name + ": " + exception.getMessage());
            }
        }
        println("Research-only SDK signatures applied in memory: " + applied);
        Function function = getFunctionAt(toAddr("1009cd0b"));
        DecompileOptions settings = new DecompileOptions();
        settings.setMaxInstructions(1000000);
        settings.setMaxPayloadMBytes(100);
        settings.setMaxJumpTableEntries(1024);
        DecompInterface decompiler = new DecompInterface();
        decompiler.setOptions(settings);
        decompiler.openProgram(currentProgram);
        try
        {
            DecompileResults result = decompiler.decompileFunction(function, 300, monitor);
            try (PrintWriter writer = new PrintWriter(args[1], "UTF-8"))
            {
                writer.println("// Research export only; zero source credit; SDK discovery is not binding proof");
                writer.println("// In-memory signature hypotheses only; no source/layout provenance claim");
                writer.println("// SDK signatures applied: " + applied);
                writer.println("// Completed: " + result.decompileCompleted());
                writer.println("// Error: " + result.getErrorMessage());
                if (result.getDecompiledFunction() != null)
                {
                    writer.println(result.getDecompiledFunction().getC());
                }
            }
            println("Typed EvalIntrinsic completed=" + result.decompileCompleted());
        }
        finally
        {
            decompiler.dispose();
        }
    }
}
