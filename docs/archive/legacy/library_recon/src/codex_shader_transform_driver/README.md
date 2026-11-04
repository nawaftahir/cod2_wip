# Instruction-transform driver

driver.cpp reconstructs Apply100cc228/1129, SDK91 section17, as one complete
readable C++ method. Standalone discovery reproduces the whole SDK section,
including relocation sites/types. Strict clean V2 passes. Private V3 passes613
matches, retaining all612; actual CPU fixtures agree on1284 full shader/error/
constant-table outputs with current input hashes. Aggregate inclusion remains
pending. No whole-DLL identity, GPU or exhaustive internal-branch claim.

It uses the independently reconstructed transform helpers. Original cleanup,
allocation checks and early returns are preserved, not silently fixed.
Observed private layout names are descriptive prefixes, not historical headers.
