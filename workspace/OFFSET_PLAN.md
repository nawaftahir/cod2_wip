# Radiant: offset first (2026-11-05)

Primary meter: whole-file same-offset (`tools/sections.py`). Drift per function: `tools/drift.py`.

## Measured baseline (clean build, radiant/main bb146a51)
- Whole file same-offset 27,792 / 1,794,048 = 1.549%. `.rsrc` 99.71%, `.text` 0.96%, `.rdata` 7.66%, `.data` 0.37%.
- Our `.text` is 430,080 bytes raw vs retail 1,208,320.
- Game functions at their retail address: 10 / 3,578. 2,743 game functions (610,770 B) have no
  symbol in our exe at all; 835 are matched, the rest are FUN_ placeholders.
- Retail layout: game code from 0x401000, then MFC/CRT/extlib from 0x4d0c8c. Library code is linked
  only when something calls it, so every library offset depends on all game code before it.

## Tried
- Full retail `/ORDER` (ledger + symbols + lib + auto + FUN_ names, 3,450 entries): same-offset
  1,218 vs 1,219 bytes, emit-order warnings 12 -> 28. Reverted. Order is not the blocker while code
  is missing; redo it once phase 2 has filled a region.

## Order of work
1. Phase 2, front to back: every game function exists at its retail SIZE, in retail order, file by
   file from 0x401000 (first drift: 0x00401780 AdvCurveDlg.cpp). Real C/C++ drafts from Q3Radiant,
   the server source or the retail code; register differences are fine at this stage.
2. Lanes own address regions (whole files); each fixes the first drift inside its region.
3. When a region is complete, retail `/ORDER` for it, then library placement, then `.rdata`/`.data`.
4. Bytes last: register/scheduling residues once offsets hold.
5. `src/` keeps verified files only; unfinished bodies move to `workspace/` (41 today).
