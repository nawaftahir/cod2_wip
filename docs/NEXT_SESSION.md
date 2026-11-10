# Renderer next session (written 2026-11-11)

## Measured state (CI meter, gfx/main fd5dd1e9)
- .text matched 894,039 / 1,093,632 = 81.75%
- same-offset 253,888 / 1,851,392 = 13.71%
- game C/C++ 48.44%, 774 fns; all matched functions 2715
- LTCG TUs 117 of retail 121. SHA identical: no.

## Branches
- gfx/main: confirmed line. gfx/recon on origin = gfx/main.
- gfx/w-backend 67723f4d: 5 byte matches in rb_backend (RB_DrawFullScreenColoredQuad 1002e9e0,
  RB_FullScreenFilter 1002ea60, RB_NeedsBlur 10030840, RB_GetBlurRadius 10030a20,
  RB_DrawTrianglesCmd 10031e90) held back: same-offset 252168 -> 250443. Land as a region batch
  once rb_backend sizes close (RB_FullScreenColoredFilter, RB_NeedsGlow are size-only). Refresh the
  rb_backend.cpp hash in work/tools/source_coverage.py after confirming no __asm line changed.
- gfx/s1b: material work, Material_ParseRuleSet byte-identical but unbound
  (chain root Material_ParseRuleSetCondition 352/346, retail double bool conversion).
- Worktrees with a built tree: gfx-recon, gfx-s1b, gfx-s2m, gfx-mat2. First build elsewhere ~10 min.
  Old gfx-g*, gfx-s1, gfx-s2 belong to earlier runs; do not reset them.

## What pays (in order)
1. Tool blind spots: one fix credits many bodies. Example: bindcheck extent rule (KNOWLEDGE 2026-11-11).
   It still needs a self-test in workspace/work/tests (CI rule: every metric tool has one).
2. Region batches: close a whole TU's sizes on a branch, land when same-offset beats gfx/main.
   Single size fixes usually lower same-offset because later code loses accidental alignment.
3. Restoring missing structure: header helper copies in declaration order, Com_ParseInternal
   instead of Com_Parse in parsers, I_min(constant, x) operand order, retail statement order.

## What does not pay (logged, skip)
Register choice, x87 scheduling, zeros stored via a register (inline helpers, chained
assignment, /G5-/G7, /Os all tried), #pragma optimize removal (it is established practice here).

## Next targets
- r_bsp_load_obj: R_LoadLightmaps 1552/1568 (frame now 0x218), R_LoadWorldInternal 1312/1264,
  R_SetSunLightVectors 80/64. Closing them moves the rest of the region onto retail offsets.
- R_CopyRefEntityToScene 144/128: fix R_AddDrawSurf argument registers (callee rule).
- Material_ParseRuleSetCondition: unlocks ParseRuleSet + ParseStateMap.
- Library roots: ___lc_category data and the memcpy/_strncnt CRT layout (see TRIED 2026-11-11).

## Gotchas
- build.sh can print PASS lines after a compile error and leave a stale DLL: check build.log.
- In wsl.exe bash -lc '...', single quotes inside heredocs are lost; use the Edit tool.
- Some sources are CRLF; match line endings in scripted edits.
