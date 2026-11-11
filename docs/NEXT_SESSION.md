# Renderer next session (written 2026-11-12)

## Measured state (CI meter, gfx/main b0b6bfd3)
- same-offset 273,475 / 1,851,392 = 14.77% (was 253,888 at the start of 2026-11-11)
- .text matched 81.80%, game C/C++ 48.65%, matched functions 2726
- LTCG TUs 117 of retail 121. SHA identical: no.

## Method that pays now: offset first, one object at a time
1. `retail_order.py <build> <cpp> --across --write` puts definitions in retail address order
   (bind.json + pinned addresses from layout/file_layout.tsv). Data keeps its relative order.
2. `drift_tu.py <build>` per object: drift must become ONE constant value per object.
3. For each drift step, disassemble the retail gap (pefile + capstone; never name a script dis.py)
   and restore what is missing: header inline copies, out-of-line helpers retail keeps, functions
   retail calls out of line. Retail links NOREF, so every extern function has a body in retail;
   refexport stores in R_GetAPI pin API function addresses; `ri` slot = (addr - 0x101d49c8) / 4.
4. Same-offset only rises when everything before an object is aligned. Land region stacks when the
   whole stack beats gfx/main; judge single steps by internal drift.
5. Private helpers with no reference name: "Name unconfirmed" + PINNED address/size (established,
   64+ in tree), only when the body reproduces retail and real callers use it.

## Objects at constant internal drift
r_bsp, r_bsp_load_obj (except below), r_buffers, r_caps, r_cmds, r_debug, r_dvars,
r_image_load_common, r_image_wavelet, r_jpeg, r_specularityimage, r_init*, r_marks*, r_material*
(* on branch gfx/w-imgload2, not landed).

## Branches waiting (each gate green; none beats 273,475 alone yet)
- gfx/w-dpvshead 70ba96a3 (257,275): r_dpvs through R_AddAabbTreeSurfaces_r restructured. Open:
  R_FrustumClipPlanes 400/448 B (unread axisPlanes stores already added), R_ProjectPortal 0x10
  short, R_PortalClipPlanes missing its far-plane struct copy, R_SetupOccludersForCell 0x10 short,
  R_AddAabbTreeSurfaces_r 0x40 short. That branch's docs/NEXT_SESSION.md has the drift table.
- gfx/w-imgload2 3aae0dee (272,899; 273,009 at 462eb057): r_init (R_ResetGamma slot 10011f00,
  name unconfirmed), r_marks (R_BoxSurfaces), r_material constant drift (-0x370, ~20 helper slots),
  Image_UpdatePicmip, retail_order fix for __declspec(noinline), r_material_load_obj reordered.
  Next: r_material_load_obj wrong-size functions (ParseRuleSetCondition 198 vs 111 insns,
  ParseRuleSet, ParseShaderArguments, LoadPass*Dx7, LoadTechniqueDx9, ...; table in TRIED.md),
  ~15 ret stubs (10018320/30/40, 100193f0, 1001a790/7a0, 1001ab40/50) and 32 B at 10019780.
- gfx/w-cmds: r_outdoor, r_rendercmds, r_rendertarget, r_scene in progress.
- Older parked: gfx/w-bsp e7c61e05 (R_LoadLightmaps 16 B short is register allocation),
  gfx/w-backend 67723f4d.

## Deferred, no name evidence
r_flares/r_fog 1000bae0 (BGRA pack) and 1000bb00 (archiveProc thunk) = the 48 B r_fog drift;
r_image 1000c8e0 (hash & 0x7ff), 1000ccb0, 1000ccf0.

## Gotchas
- Never run a /tmp script you did not write; other sessions use /tmp too (gate.sh is client 1.3's).
- `gh run view -q .conclusion` exits 0 on failure; check the text (use /tmp/gfx_land.sh pattern).
- CI behavioral tests that slice source by comments break on reorders; parse by function instead.
- Pushing a NEW branch name from a subagent can be refused by the permission check.
- build.sh can print PASS lines after a compile error and leave a stale DLL: check build.log.
- In wsl.exe bash -lc '...', $vars and quotes get mangled; put logic in a script file.
- Some sources are CRLF; match line endings in scripted edits.

## 2026-11-12 morning: land the stack first
- BEST: commit 1f0a31a3 on local branch gfx/w-sky (worktree .worktrees/gfx-wmodel) = gfx/w-logfog +
  rb_sky (RB_SunSpriteScreenFraction moved in from rb_sunsprite.cpp, which is deleted from tus.txt) +
  RB_TessSunBillboard per-component copy + two rb_imagefilter retail copies. Gate green, same-offset
  279,684. Do NOT take the branch tip (daaa4b05 RB_TouchImage drops it to 277,923). To land: create a
  branch at 1f0a31a3, push it, then `wsl.exe bash -l /tmp/gfx_land.sh <branch> 1f0a31a3`.
- Previous best: local branch gfx/w-logfog (58b9db0e, worktree .worktrees/gfx-wstate) = gfx/w-combo6 +
  rb_state c6622abb + rb_logfile/rb_fog/rb_shade/rb_state work. Gate green, same-offset 277,946.
  To land: `git push origin gfx/w-logfog` from .worktrees/gfx-wstate, then
  `wsl.exe bash -l /tmp/gfx_land.sh gfx/w-logfog 58b9db0e`. Its rb_state copies use Mac names but
  plain calling conventions (retail esi/ecx), so they size-match without byte-matching.
- Previous best stack: local branch gfx/w-combo6 (a61d9dc0, worktree .worktrees/gfx-recon):
  gfx/main + gfx/w-front2 4becf89a (r_fog/r_font/r_image helpers) + gfx/w-cmds 121e4559 (r_scene
  copies) + rb_light b45d08a0. Gate green, same-offset 277,281 vs gfx/main 275,244 (local byte
  compare). Not pushed: subagent pushes were refused by the permission check, so the coordinator did
  not push their work either. To land: `git push origin gfx/w-combo6` from .worktrees/gfx-recon, then
  `wsl.exe bash -l /tmp/gfx_land.sh gfx/w-combo6 a61d9dc0`.
- Tried on top of that stack, all lower: + r_staticmodel (275,833), + r_screenshot (276,949),
  + r_xsurface (276,783), + rb_state c6622abb (277,270).
- Local-only branches (gate green): gfx/w-front2 275,431; gfx/w-cmds 275,000; gfx/w-rblight
  b45d08a0 275,037; gfx/w-state c6622abb 275,255; gfx/w-smodel 274,104; gfx/w-xsurf2 274,649;
  gfx/w-shot2 274,250; gfx/w-cookie 60f6cfb3 (R_AddShadowReceivers 309/303; origin/gfx/w-cookie has
  other history, use a new name); gfx/w-model2 e5d2ecfa (pragma g off: NOT for landing, functions
  grow further from retail).
- Biggest structural lever: .text is ~9.8 KB short of retail (vsize 0x1079xx vs 0x10a090), so with
  0x1000 file alignment .rdata starts at file 0x109000 instead of 0x10c000; .rdata is also 8 KB too
  large (0x94000 vs 0x92000). Section-relative equality across all sections is ~306,375 B vs ~273,700
  whole-file now: about +32 KB available from section placement alone.
- Deferred this round: R_AddDrawSurf register convention (3 probes, no source form);
  R_FrustumClipPlanes 400/448; R_WaterFFT (callee FFT in universal/fft.cpp takes data on the stack in
  retail); r_xsurface_optimize merge needs gfx.h / r_local.h types unified first.
