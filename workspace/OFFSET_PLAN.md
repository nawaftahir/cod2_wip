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

## AdvCurveDlg.cpp (first file, 0x401000)
- In place and right-sized from 0x401000 to 0x402240 except one body: drift there is a constant -464 =
  0x004015a0 (453 B apply, called by OnOK 0x401770 and the kill-focus handler 0x401f90; draft in
  workspace/drafts, best 511/453, only diff: FUN_00401cd0 inlined into it, retail calls it).
- Tried for 0x004015a0: float locals for the atof results (fixed the arg passing); FUN_00401cd0 as a
  plain function (breaks 0x401cd0: 79/81, it is a member, thiscall). Next: caller context.
- 0x00402230 (5 B jmp into a dialog destructor), called from library EH code at 0x4f3b0c; the library
  labels there are ambiguous. Open.
- 0x004024b0..0x00402940: compiler-emitted MFC/ATL header inlines (CString, CMenu, modal state) that
  retail keeps inside this file; ours are emitted after it. Placement work (order), not source.
- PINNED (retail tu_map + auto_funcs): the ATL CString Win9x helpers (`*WThunk` 71 B + `*WFake`,
  `AtlA2WHelper`, `_AtlGetConversionACP`, CTempBuffer/CW2AEX) sit in MapInfo.cpp at 0x420420..0x420dd0.
  No earlier retail file has them. Ours emits ~2.8 KB of them inside AdvCurveDlg.obj (0x4022d0..0x402e00),
  because every file that includes cstringt.h defines the selectany `ATL::_strthunks` table holding their
  addresses, and AdvCurveDlg.obj is first in link order. This is the main offset break inside file 1.
- Tried: `/Zc:wchar_t` on every editor .cpp (our helpers mangle wchar_t as `G`, nafxcw as `_W`):
  838/838 still match, but AdvCurveDlg.obj still emits 7 `*Fake` helpers, file-1 drift unchanged,
  whole-file same-offset 1.549% -> 1.514%. Reverted. Next: find what makes retail's first files not own
  `_strthunks` (header frame / defines in retail's stdafx, or MapInfo.obj contributing it first).
- `_strthunks` is `__declspec(selectany)` with an initializer in cstringt.h:298, so every CString file
  defines it. PINNED on our build: the copy (and the helpers) follow whichever object is first on the
  link line (CamWnd first -> helpers in CamWnd.obj), and .text order follows the link line too, so
  retail cannot have had MapInfo first.
- Tried `/OPT:REF /OPT:NOICF` (retail keeps identical functions apart, so NOICF; REF unproven): the
  helpers leave AdvCurveDlg (consistent with retail), but 517/838 rows drop because callers are still
  missing and REF discards uncalled functions. Reverted. HYPOTHESIS: retail linked with /OPT:REF.
  Re-test when a region's callers exist; until then file 1's tail placement stays open.
