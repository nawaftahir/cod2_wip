import ghidra.app.script.GhidraScript;
import com.google.security.binexport.BinExportExporter;
import java.io.File;
public class ExportForDiff extends GhidraScript {
    public void run() throws Exception {
        File output = new File(getScriptArgs()[0]);
        if (!new BinExportExporter().export(output, currentProgram, null, monitor))
            throw new Exception("BinExport failed");
        println("EXPORTED " + output + " functions=" + currentProgram.getFunctionManager().getFunctionCount());
    }
}
