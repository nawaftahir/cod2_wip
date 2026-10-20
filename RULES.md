# CoD2Radiant track: rules and pinned facts

Agents: read `AGENTS.md`; that's the operating contract. This file holds the facts behind it.
Owner-edited only.

## Target
- `binaries/CoD2Radiant.exe`, 1,794,048 bytes, SHA-256 `b6fc8cff...616bb8` (`checksums.yml`).
- `.text` 0x401000-0x52720e (1,204,750 bytes), 6,234 functions (`data/functions_cod2radiant.json`, Ghidra).
- PE timestamp 0x4408e56e (2006-03-04), linker 7.10.

## Toolchain (PINNED unless marked)
- Image `cod2-radiant-msvc71` (`toolchain/`): cl 13.10.3077 + link 7.10.3077 from VS.NET 2003 disc 1,
  the VS2003 Platform SDK, x86 MFC/ATL 7.1 from the same disc, Wine 5 (bullseye).
  The old `cod2-msvc71-build` image (Wine 8, SP1 SDK, no x86 MFC) is not used.
- Flags `/O2 /Oy- /Op` for the engine-shared files: 6 of 35 ledger rows fail without `/Op`; `/Gy`
  makes no difference to them. Radiant's own files are not tested yet (`data/flags.tsv`).
- Rich header, build 3077 entries: prodid 95 x225, 96 x106, 99 x104, 15 x52, 90 x1 (the linker).
  Older builds also appear (2067/2179/9466/8491/9210: prebuilt lib objects). Which prodid means
  C, C++ or MASM is HYPOTHESIS until compared with an exe linked in our image.

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
