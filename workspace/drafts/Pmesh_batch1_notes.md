# Pmesh.cpp Batch 1 (`0x00425770`..`0x00427540`) Notes

## Matched in Batch 1 (+7, total 16/215 in Pmesh.cpp)
- `0x00425840` (`197` B) `InterpolateInteriorPoints`
- `0x00425f40` (`832` B) `FUN_00425f40` (`plane_t::dist` pinned as `double` at `+0x10`)
- `0x00426420` (`87` B) `FUN_00426420`
- `0x00426780` (`65` B) `FUN_00426780`
- `0x00427160` (`211` B) `FUN_00427160`
- `0x00427410` (`152` B) `nextFace` (assert `#line 1045` pinned)
- `0x00427540` (`83` B) `FillPatch`

## Remaining Near-Misses & Blockers in `0x00425910`..`0x004274b0`
1. **`0x00425910` `Patch_MeshNormals` (1010/1010, 99%)**:
   - Exact match except 1 instruction at `+0x33c`: retail emits `fld [eax]; fmul [edi+4]` (`v0[0] * v1[2]`), whereas `Vec3Cross` emits `fld [edi+4]; fmul [eax]` (`v1[2] * v0[0]`). Expanding `around[(k+1)&7]` directly added 18B; try `float *a = around[(k+1)&7]` or checking Q3 `CrossProduct`.
2. **`0x00427290` `Patch_GetAxisFace` (373/373, 99%)**:
   - Retail `#line` asserts pinned at `1009`, `1011`, `1015`.
   - Exact match except 1 SIB byte at `+0xa5`: retail `mov esi, [eax + ebx + 0xa0]` vs ours `mov esi, [ebx + eax + 0xa0]`.
3. **`0x00425d10` (544/549, 67%)**:
   - Uses `struct { int x, y; } pt[3]` (`tris[8][3]`) and `unsigned int i < 8` (`jb`).
   - Swapped `esi`/`edi` LTCG register assignment (only caller is `0x00437a1e` inside `Pmesh.cpp`).
4. **`0x00426480` `Brush_RebuildBrush` (1010 vs 762)**:
   - Our two `for (i = 0; i < 4; i++)` loops are unrolled under `/O2`, while retail keeps both loops (`mov edx, 4` and `cmp ecx, 4`). Needs investigation why retail suppressed unrolling there.
5. **LTCG-blocked chain (`0x004267d0` -> `mesh.cpp` / `brush.cpp`)**:
   - `0x004267d0` calls `0x00421150` (`esi`), `0x00421830`, `0x00421980`, `0x00422370` (`eax`) in `src/radiant/mesh.cpp` (unwritten).
   - `0x004269a0` (45/46), `0x004269d0` (167/167), `0x00426dc0` (92/94), `0x00427240` (70/72) all depend on `0x004267d0` taking `p` in `eax` + `DAT_01128d94` on stack.
   - `0x00426c90` (302/304) only differs in `0x1000 - (bits & 0xfff)` not being folded into `bits - low + 0x1000`.
   - `0x00426e20` (80/84), `0x00426e80` (192/150), `0x00426f20` (416/369), `0x004270a0` (64/55), `0x004270e0` (128/115), `0x004274b0` (134/131): in retail `0x00426e20` is NOT inlined into `0x00426e80`/`0x00426f20`.
   - `0x00426a80` `AddBrushForPatch` (243/243) calls `0x00457ce0` & `0x00457dd0` in `src/radiant/brush.cpp` (`editor-2`).
