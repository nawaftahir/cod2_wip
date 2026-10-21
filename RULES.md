# CoD2Radiant track: rules and pinned facts

Agents: read `AGENTS.md`; that's the operating contract. This file holds the facts behind it.
Owner-edited only.

## Target
- `binaries/CoD2Radiant.exe`, 1,794,048 bytes, SHA-256 `b6fc8cff...616bb8` (`checksums.yml`).
- `.text` 0x401000-0x52720e (1,204,750 bytes), 6,234 functions (`data/functions_cod2radiant.json`, Ghidra).
- PE timestamp 0x4408e56e (2006-03-04), linker 7.10.

## Toolchain (PINNED unless marked; see "Mixed build" below)
- Image `cod2-radiant-msvc71` (`toolchain/`): cl 13.10.3077 + link 7.10.3077 from VS.NET 2003 disc 1,
  the VS2003 Platform SDK, x86 MFC/ATL 7.1 from the same disc, Wine 5 (bullseye).
  The old `cod2-msvc71-build` image (Wine 8, SP1 SDK, no x86 MFC) is not used.
- Flags `/O2 /Oy- /Op` for the engine-shared files: 6 of 35 ledger rows fail without `/Op`; `/Gy`
  makes no difference to them. Radiant's own files are not tested yet (`data/flags.tsv`).
- Rich header, build 3077 entries: prodid 95 x225, 96 x106, 99 x104, 15 x52, 90 x1 (the linker).
  Older builds also appear (2067/2179/9466/8491/9210: prebuilt lib objects).
- **Mixed build: 104 objects are C compiled with `/GL` (link-time code generation). PINNED** 2026-10-21 by
  linking test exes in our image (`scratch/richtest/`): plain C = 95, plain C++ = 96, `/GL` C = 99,
  `/GL` C++ = 100, MASM = 15, link = 90. The `@comp.id` stamps say MFC (`nafxcw.lib`) objects are 96 and
  CRT objects 95/96/15. Retail has 99 x104 and no 100, so: 104 C files built `/GL` and linked `/LTCG`,
  while the C++ files (radiant's MFC editor code, MFC itself) are plain. The engine-shared files
  (`src/universal`, `src/xanim`, `src/script`, ...) are the likely `/GL` C set: that range is where the
  "register arguments / no prologue" functions sit (LTCG custom calling conventions). Which files exactly is
  still open.
- **Correction (PINNED by test, `research/richtest/static.sh`):** plain `/O2` without `/GL` already passes
  arguments in registers (`_p$ = esi`) to a `static` function called from the same file. Register
  arguments alone don't prove LTCG. They mean "static, with its callers in the same file": write it
  `static` next to its real callers.
- **Game files are C++ (PINNED):** RTTI type names `.?AVCMainFrame@@`, `.?AVCCamWnd@@`, `.?AVCXYWnd@@`,
  `.?AVCRadiantApp@@`, `.?AVidCameraPosition@@` (splines) are in the exe. `/GL` C++ is always prodid 100
  whatever the other flags (`research/richtest/flags.sh`), and retail has none. So the C++ game files are
  plain `/O2`; the 104 `/GL` objects are C files, and which ones is still open. Note: a plain link also
  puts every object before library code, so "game code first, MFC/CRT after" does not prove LTCG.
- **Unity build (PINNED 2026-10-21).** Plain `/O2` gives register arguments only to `static` functions
  (`research/richtest/nonstatic.sh`: non-static and `inline` stay on the stack). Retail has 72 register-argument
  calls between *different* pinned files, e.g. CamWnd.cpp 0x4061f0 -> XYWnd.cpp 0x44f5d0 (ESI).
  `scratch/claude/unity_test.cpp` reproduces 0x44f5d0 byte-identical as a `static` function called from another
  class's method in the same compile unit. So the game C++ files were compiled as shared compile units.
  `tools/units.py` groups files by those calls (`data/units.tsv`): 28 files in one group, 5 in another,
  the rest unlinked. All of them interleave in address order: xmodel_load_obj (group 0) sits after group
  1's files, cmdlib sits between CamWnd and draw. So it is **one compile unit**: a file that `#include`s
  every source file in this order: editor files sorted ignoring case (CamWnd, cmdlib, draw, GfxWrapper ...
  XYWnd), Q3-core files (brush ... z), src/universal sorted, splines, then xanim/script.
  Consequence: every register-argument function is a `static` in its own file, called from wherever. It
  matches once written `static` inside the unit build.
- **Mixed-link layout (PINNED, `research/richtest/order.sh`):** with `/LTCG`, all `/GL` code is placed
  before every plain object, each group in link order.
- **Open (evidence, not yet resolved):** `tools/ltcg_scan.py` finds 854 register-argument functions, and 142
  of them are called from *other* files with register arguments, which only LTCG can produce. Several sit
  inside radiant `.cpp` ranges, e.g. 0x41b190 in the MainFrm.cpp range, called with EAX from MainFrm, Pmesh,
  brush, drag and select. That conflicts with "no /GL C++" from the Rich header. Leading hypothesis: LTCG
  emits all `/GL` code in its own order, interleaved with the plain objects, so contiguity-based SUPPORTED
  entries in `data/tu_map.tsv` are unreliable around LTCG code. Only PINNED (assert string) entries are
  solid. Resolve before trusting any SUPPORTED file assignment.
- The linked-exe referee (`tools/linkcheck.py`) proves rows inside the real linked exe; all 61 pass.
- Link options: retail keeps 238 groups of byte-identical functions at separate addresses, so no `/OPT:ICF`.
  With `/DEBUG`, 7.1 defaults to NOREF and NOICF, so link.py passes no `/OPT`. SUPPORTED.

## Link settings (PINNED from the PE header, 2026-10-21; used by tools/link.py)
- Base 0x400000, relocations stripped (`/FIXED`), GUI subsystem 4.0, OS 4.0, section and file
  alignment 0x1000, stack and heap 1 MB reserve / 4 KB commit, checksum 0, entry 0x4dbd4b.
- Sections `.text .rdata .data .rsrc`; `.data` virtual size 13.5 MB (large BSS).
- Imports: KERNEL32 195, USER32 193, GDI32 96, OLEAUT32 38, WS2_32 25, ADVAPI32 17, ole32 17,
  COMCTL32 11, comdlg32 9, SHELL32 5, SHLWAPI 5, WINSPOOL.DRV 4, WINMM 1; delay-loaded OLEACC.dll (3).
  No OpenGL import: the renderer is loaded at run time.
- Debug: one CodeView RSDS record, age 4, PDB `e:\trees\cod2\bin\CoD2Radiant.pdb` (`/DEBUG`).
  link.py maps Wine's E: into build/ so the linker writes that exact path.
- Open: the header timestamp and the RSDS GUID/age change on every link. Needs a deterministic link
  (pinned clock and GUID source under Wine), never output patching. The client track has the same open item.

## Layout (PINNED from the binary)
- 49 source paths are embedded via assert `__FILE__`. `tools/tu_map.py` pins 492 functions to 48 files
  (+707 SUPPORTED by sitting between pins of one file). See `data/tu_map.tsv`, `link/order.txt`.
- Link order: radiant's own files first, in VS project order (uppercase names before lowercase:
  `CamWnd.cpp` ... `XYWnd.cpp`, then `brush.cpp` ... `z.cpp`). Then `src/universal/*`
  alphabetically, then `src/xanim/dobj.cpp`, `src/script/*`, the rest of `src/xanim/*`, then MFC/CRT.
  `xmodel.cpp` interleaves with `scr_memorytree.cpp`; unresolved.
- `__FILE__` spelling: engine files are `\trees\cod2src\src\...` (some `e:\trees\...` in headers);
  radiant files are `.\Name.cpp`. Compiling them with the same paths is a link-stage task.
- Asserts embed `__LINE__`, so source line layout is part of the SHA.
- Each function gets its own COMDAT section; emission order can differ from definition order
  (`Hunk_AllocInternal`). The emit rule is not pinned yet, so `WARN-ORD` is only a warning.

## Referee (`tools/verify.py`)
- Relocation-normalized byte equality, both relocation masks combined; a candidate longer than retail
  (non-padding tail) fails.
- Calls to functions already in the ledger or `data/lib_funcs.tsv` must name the same function (`CALLEE`).
- Rejects `__asm`, `_emit`, naked functions and code byte arrays anywhere in `src/`.
- `make verify` recompiles every ledger row from scratch. A row counts only while it passes.

## History
- 2026-10-20: workspace rebuilt. Old ledger had 39 rows: 1 was MFC library code (`CWnd::GetControlUnknown`,
  now lib), 3 no longer compile to retail (assert lines drifted; in `ledger/defer.tsv`), 35 verified.
  The old `opencode/modtools/cod2radiant*` work was salvaged into `research/opencode/` and `data/decomp/`.
- 2026-10-20 evening: fleet paused at 61 verified functions (0.39% of game code). Free DeepSeek did best;
  Copilot (credits out), agy and mimo were dropped. Stalled because the same hard rows were re-claimed
  every batch with nothing landed and no deferral. Before restarting: rotate rows after an empty batch,
  and widen the queue (only 1,194 functions have a known file; the TU map needs more coverage).
