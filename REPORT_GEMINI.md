# Gemini delivery report

Assigned TU: src/universal/com_files.cpp and com_files.h.
Baseline: main 747a45c / commit 4242057 (383 game rows / 48,845 B, 2 compiler rows / 35 B, same-offset 25,291 B).

## Summary of Results
- **Commit hash**: 754c328
- **Newly matched addresses and bytes** (+3 functions, +438 game bytes):
  - `0x00481040` (147 B): `IwdFileLanguage` (`?IwdFileLanguage@@YAPBDPBD@Z`)
  - `0x004810e0` (244 B): `iwdsort` (`?iwdsort@@YAHPBX0@Z`)
  - `0x004811e0` (47 B): `FS_AddSearchPath` (`?FS_AddSearchPath@@YAXPAUsearchpath_t@@@Z`)
- **Verification results**:
  - `make try S=src/universal/com_files.cpp A=0x00481040` -> `MATCH 0x00481040 ?IwdFileLanguage@@YAPBDPBD@Z at 0x004041b0`
  - `make try S=src/universal/com_files.cpp A=0x004810e0` -> `MATCH 0x004810e0 ?iwdsort@@YAHPBX0@Z at 0x00404250`
  - `make try S=src/universal/com_files.cpp A=0x004811e0` -> `MATCH 0x004811e0 ?FS_AddSearchPath@@YAXPAUsearchpath_t@@@Z at 0x00404350`
  - `make gate` -> `verify: 386/386 rows match, 0 failures`, `unverified functions in src/: 50` (zero regression, zero growth).
- **Whole-file same-offset measurement**:
  - `same_offset_bytes`: 25,546 (+255 bytes gained over 25,291 baseline, 1.424%).
  - `game code bytes`: 49,283 (7.04% vs 6.98% baseline).

## Caller / Callee Structure & Inlining Findings
1. **`iwdsort` & `IwdFileLanguage`**:
   `0x004810e0` (`iwdsort`) is an address-taken comparator passed to `qsort` (`link.address_taken({0x004810e0})` is true). Declaring it with external linkage (`signed int iwdsort(...)`) ensures MSVC emits it as a standard `__cdecl` function matching retail exactly. It calls `IwdFileLanguage` (`0x00481040`) twice, locking `IwdFileLanguage` into code generation with 100% byte match.
2. **`FS_AddSearchPath`**:
   `0x004811e0` (`FS_AddSearchPath`) matches 100% at retail size 47 bytes when declared with external linkage. In retail, larger callers like `FS_AddIwdFilesForGameDirectory` inlined this logic while retail retained the out-of-line COMDAT definition at `0x004811e0`.
3. **Assert Line Preservation**:
   Absorbed the newly introduced function line counts from the empty padding below them, keeping `assert(gfx)` on line 4099 and `GetBspExtension` at 100% match, alongside lines 526, 544, 585, 662, and 2160.

## Remaining TU Functions & Known Blockers
1. **Deletion binding defect (`0x004dad56`)**:
   `data/lib_funcs.tsv` mislabels `0x004dad56` as `__rmdir`. As confirmed by direct binary analysis, this entry wraps `KERNEL32!DeleteFileA`. This blocks matching `FS_Remove` (`0x0047e160`, 8 B) and `FS_Rename` (`0x0047e1f0`, 257 B). Withheld per overseer instruction until Codex applies the library correction.
2. **Directory & IWD loading chain (`0x00481210` - `0x00481b00`)**:
   `FS_AddIwdFilesForGameDirectory` (`0x00481210`, 963 B) and `FS_AddGameDirectoryInternal` (`0x004815e0`, 773 B) require matching together with `FS_AddGameDirectory` and `FS_Startup` due to cross-inlining and caller dependencies.
3. **Read graph external calling convention (`FS_FOpenFileRead_Internal`)**:
   `FS_FOpenFileRead_Internal` (`0x0047ed20`, 1396 B) is called externally by `0x00440ca0` in `radiant/TexWnd.cpp`. Without external callers or `symbols.tsv` inclusion, LTCG optimizes arguments into ECX rather than stack.

## Overseer checkpoint

This report describes the accepted 754c328 delivery. Main now includes the
independently verified 407-row camera checkpoint. No additional Gemini game rows
are accepted from Batch 4: four helper matches reproduce, but the read core is
39% and two existing wrappers regress. Exact drafts, hashes and review results
are preserved under research/gemini_delivery/20261028. Read current TASK_GEMINI.md
for the corrected deletion binding, shutdown pair and narrow TexWnd assignment.
