# CoD2 / IW3xRadiant comparison, 2026-11-01

BinDiff 8 compared real Ghidra/BinExport exports from the anchored CoD2Radiant.exe
and iw3xo-radiant/assets/bin/IW3xRadiant.exe. The reference binary is 4.2 MB;
KisakCOD supplies source only in this checkout, with no Radiant executable.
inputs.json pins both binaries and the source references. References were read
without modification. No binary, export or Ghidra project is committed.

BinDiff found 5,652 candidate pairs among 6,158 / 9,233 graph functions.
Overall structural similarity is 39.6317%, confidence 84.2398%. THESE ARE NOT
RECONSTRUCTION COVERAGE. Both initial Ghidra analyses reached the bounded
180-second limit (IW3's last pass returned after 241 seconds), so the exports
are incomplete. Original function spans and the unchanged source referee
remain authoritative. Tiny/empty functions may be absent from the graphs.

Several useful PatchDialog pairs agree with independent Kisak source comments:
424c70->436d30 (inspector), 424d10->436dd0 (destroy), 424d50->436e10 (row/column).
The registry pair 47a140->499930 and 47a1d0->4999c0 scores about 98.7% similarity,
98.98% confidence. Reference source and retail instructions confirm the actual
registry path and that LoadRegistryInfo ignores RegOpenKeyExA's return value.
The held Gemini draft used a Quake 3 path and added an early failure branch;
masked addresses alone would not establish the correct string or behavior.

Low-quality pairs are rejected as evidence: 424590 (constructor) is mapped to
451af0 with 7.4% similarity; 424f10 (spinners) is mapped to 457cf0 with 30.8%.
Pmesh's texture-info helper also gets a false-looking 5.5% pair. Use local
instructions, callers and agreeing source rather than carrying those names over.

Artifacts are cached under .agents/codex/scratch/bindiff_takeover. Ghidra project
paths are in root scratch/bindiff_takeover/projects because Ghidra refuses path
elements starting with a dot. ExportForDiff.java works with the installed
Ghidra 12.1.4 / BinExport extension. Future launches must set application.cachedir,
application.tempdir, application.settingsdir, java.io.tmpdir and Java preferences
to paths under radiant, alongside explicit headless log/scriptlog paths.

To compare the saved exports:

    bindiff --primary=CoD2Radiant.BinExport --secondary=IW3xRadiant.BinExport --output_dir=results --output_format=bin,log
    python3 workspace/research/codex_refdiff/report.py path/to/result.BinDiff radiant/PatchDialog.cpp

The report is read-only and uses the retail TU inventory. Full source matching,
data/callback binding checks, regression and file metadata audits follow each
candidate. Nothing is credited from these similarity scores.
