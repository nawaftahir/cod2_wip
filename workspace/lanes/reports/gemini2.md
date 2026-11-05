# Gemini2 Lane Report

## csg.cpp Reconstruction (commit 3, 2026-11-04)
Target file: `src/radiant/csg.cpp` (12 functions total in `data/tu_map.tsv`).

### Matched Functions (4 / 12, 688 bytes)
1. `0x00460160` (373 B): `?Brush_GetFaceFlags@@YAXPAUbrush_t@@PAH111@Z` — `Brush_GetFaceFlags` (PINNED)
   - Evidence: Target asserts on lines 300 (`def`), 301 (`!def->patch`), 309 (`def->faces[faceIndex].texdef[g_qeglobals.activeMaterial].radMat`). KisakCOD `src/radiant/csg.cpp:142`.
2. `0x004602e0` (225 B): `?Brush_IsFixedOrPatch@@YA_NPAUbrush_t@@@Z` — `Brush_IsFixedOrPatch` (PINNED)
   - Evidence: Target asserts on lines 333 (`def`), 334 (`def->owner`), 335 (`def->owner->eclass`). KisakCOD `src/radiant/csg.cpp:151`.
3. `0x004603d0` (37 B): `?Brush_FaceFlags_Check80@@YADPAUbrush_t@@@Z` — `Brush_FaceFlags_Check80` (SUPPORTED)
   - Evidence: KisakCOD `src/radiant/csg.cpp:161`.
4. `0x00460400` (53 B): `?Brush_IsFiltered@@YA_NPAUbrush_t@@@Z` — `Brush_IsFiltered` (SUPPORTED)
   - Evidence: KisakCOD `src/radiant/csg.cpp:169`.

### Deferred Functions (8 / 12, drafts in scratch/gemini2/)
1. `0x0045f8b0` (653 B, `CSG_MakeHollow`): Best 45%, first diff at +0x5. Blocked on unwritten cross-TU LTCG callees in `brush.cpp` (`0x00458af0`, `0x00458440`, `0x00459210`, `0x00458c00`) and `entity.cpp` (`0x00467240`). Draft in `scratch/gemini2/csg_0045f8b0.cpp`.
2. `0x0045fb40` (1002 B, `Brush_MergeList`): Best 0%. Blocked on unwritten cross-TU LTCG callees in `brush.cpp`. Draft in `scratch/gemini2/csg_0045fb40.cpp`.
3. `0x0045ff30` (560 B, `CSG_Merge`): Best 0%. Blocked on unwritten cross-TU LTCG callees in `brush.cpp`. Draft in `scratch/gemini2/csg_0045ff30.cpp`.
4. `0x00460440` (33 B, `Brush_IsCulled`): Best 13%, first diff at +0x0. MSVC inlines `Brush_IsFiltered` due to whole-program call graph inlining when unreferenced. Draft in `scratch/gemini2/csg_00460440.cpp`.
5. `0x00460470` (477 B, `CSG_FaceVisible`): Best 44%, first diff at +0x5. Blocked on loop/prologue register allocation with LTCG. Draft in `scratch/gemini2/csg_00460470.cpp`.
6. `0x00460650` (63 B, `Brush_FaceHidden`): Best 0%. Blocked on LTCG custom register calling convention (`face` in `eax`). Draft in `scratch/gemini2/csg_00460650.cpp`.
7. `0x00460690` (97 B, `Brush_AutoCaulkFace`): Best 0%. Blocked on cross-TU LTCG callees in `brush.cpp` (`0x00459430`) and `TexWnd.cpp` (`0x00440840`). Draft in `scratch/gemini2/csg_00460690.cpp`.
8. `0x00460700` (411 B, `Brush_AutoCaulk`): Best 0%. Blocked on callee `0x00460690` and cross-TU dependencies. Draft in `scratch/gemini2/csg_00460700.cpp`.

## texturevecs.cpp Reconstruction (2026-11-05)
Target file: `src/common/texturevecs.cpp` (4 functions total in `data/tu_map.tsv`).
Status: 4 / 4 functions present in retail address order; size hole closed.

### Functions Status
1. `0x0043f8a0` (335 B): `TextureAxisFromPlane` — MATCH (336 B, in ledger)
2. `0x0043f9f0` (459 B): `TextureVecsForNormal` — MATCH (464 B, in ledger)
3. `0x0043fbc0` (1540 B): `FUN_0043fbc0` — RECONSTRUCTED (1536 B vs 1540 B retail; 73% referee match, first diff +0xc)
   - Function computes inverse texture matrix / decomposes into size, shift, rotate, crossterm.
   - Restored level-1 assertions on exact retail line numbers (85, 88, 89, 90, 92, 93, 94, 97).
   - Preserved retail orientation condition (`texMat[1][t] * texMat[0][s] * pvecs[0][s] * pvecs[1][t] < 0.0f`) and index copy-paste behavior.
   - Recovered downstream drift in `texturevecs.cpp` from -230976 to -229440.
4. `0x004401d0` (985 B): `BuildTextureVecs` — MATCH (992 B, in ledger)

## Gate Meter
| meter | value |
|---|---|
| **SHA goal: rebuilt exe bytes in place** | 1.523% (+754) |
| game functions matched from source | 838 / 3578 (23.42%) (+269) |
| ...of those, proven inside the linked exe | 838 |
| game code bytes matched | 12.72% (88969 / 699591 bytes) |
| game functions with a known source file | 3508 / 3578 |
| MFC/CRT library functions identified (linked, not written; not counted as done) | 3940 |
| compiler-emitted header code (AUTO) / external lib code (EXTLIB), not counted as game | 637 / 1779 |
| SHA-256 identical | no |
| failing ledger rows | 0 |
| emit-order warnings | 14 |
| unverified functions in src/ (must not grow) | 42 |

`verify: 838/838 rows match, 0 failures`
`compiler: 8/8 rows match (excluded from game coverage)`
