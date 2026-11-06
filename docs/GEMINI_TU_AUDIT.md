# Gemini task: TU assignment audit (analysis only, no builds)

Why: under /GL + /LTCG retail lays functions out roughly in TU order. Several same-size
misses sit in retail between functions of a DIFFERENT TU than ours (Image_BuildWaterMap
between r_image functions, ours r_image_load_obj; R_WatersEquivalent next to R_WaterHeightMap,
ours r_water_load_obj; RB_EndSurface right after RB_BeginSurface, ours a different TU).
A wrong TU changes inlining/register context, which matches our miss classes.

Inputs (read only):
- Retail placement: `workspace/work/proof/latest/bind.json` (`t` = retail address, `obj` = OUR TU).
- Our layout: `workspace/build/codex_boundsoutside_1016_02/gfx.map`.
- Name -> source file oracle: `~/cod2/test/dev/refrences/cod2-mp-macho/PC/gfx_d3d/*.c` (Mac 1.3;
  grep the function name to find its file). SUPPORTED evidence only, PC 1.0 can differ.
- Existing layout work: `workspace/work/tools/file_layout.py`, `workspace/work/layout/file_layout.tsv`,
  `workspace/work/src/tus.txt`. Read `docs/KNOWLEDGE.md` lines on TU/common.obj first.

Do (one worker, or split the address range 0x10001000-0x10041db0 into 4 parts for 4 Flash agents):
1. Sort game functions (`t` in 0x10001000-0x10041db0) by retail address.
2. Find "islands": a function whose our-TU differs from BOTH retail neighbours while those two
   neighbours share a TU (e.g. A:r_image, B:r_image_load_obj, C:r_image).
3. For each island, grep the Mac source for the function and its neighbours; record which file holds it.
4. Write `docs/TU_AUDIT.md`: one table row per island: function, retail addr, size, our TU,
   neighbours' TU, Mac file, verdict (MOVE if Mac agrees with the neighbours, CHECK otherwise).
   Then a summary: count, bytes, and the 10 biggest MOVE rows.

Rules: no source edits, no builds, no commits outside your own branch gfx/tu-audit (worktree
.worktrees/gfx-tu-audit from gfx/recon). Never invent a file assignment; if Mac has no copy, say so.
Edit files with your file tools, not shell heredocs. Report: number of islands, MOVE count/bytes,
path of TU_AUDIT.md, commit hash.
