# Renderer next session (updated 2026-11-15 late)

## State: gfx/main = 1,237,224 / 1,851,392 = 66.83% whole-file same-offset (clean build, gate
green). .text exactly retail size (0x10a090). Game C/C++ reconstructed (CI meter before the
rdata17 landing): 128,305 / 253,580 B = 50.6%, 888 functions. Session path: 279,707 -> 400,234
-> 461,164 -> 960,175 -> 1,237,224.

## How the big steps came (do these first on any binary; memory feedback_measure_byte_distribution_first)
- .text total size exact -> d3dx9 + DxErr9 (600 KB) aligned.
- .rdata: retail r_texturemem.cpp includes <initguid.h> (48 d3d9/ddraw GUIDs in that obj);
  RB_DrawDebugPlumes float math (no double 4.0 COMDAT).

## .rdata leftovers (gfx/w-rdata18 analysis, no commit)
- LIBCMT object order (tidtable, output, crt0msg) ~0x1017c5a0: link order, no source fix found.
- Strings/statics emitted in a different order inside the same objects (r_dvars enum tables,
  sampler names, assert strings, q_parse tokens): LTCG emission order.
- jpeg-6b static Huffman table: retail right after r_bsp_load_obj ($sunhalfangle, ~0x101825b4),
  ours between rb_backend and jerror. Link/TU order question: OWNER DECISION (structure change).
- Missing strings (0x19d .rdata short): "$temp" (r_image 0x1000ccb0 helper, needs paired .text
  shrink), "NULL device", "Viewport is NULL" (not traced); PDB path differs (build path).

## RULE: keep .text exactly 0x10a090; pair growth with shrink inside the same object/region.
Parked parts: w-mid16 +48, w-dpvs17 +48, w-ffloor14 -48, w-midB (r_rendercmds net 0, 956,315),
w-frontA (950,887). R_AddCmdTouchAllImages EXISTS in retail at 100226c0 (end of r_rendercmds).

## Next
1. Game code: 50.6% of game C/C++ bytes still not proven identical: that is the real remaining
   reconstruction. Work unmatched functions in place, size-neutral.
2. Per-object drift zero, front to back, size-neutral pairs.
3. Owner decisions: jpeg/LIBCMT link order.


## State: gfx/main 3affad6a = 960,175 / 1,851,392 = 51.86% whole-file same-offset (clean local
build, gate green). .text is EXACTLY retail size (0x10a090): d3dx9 (435 KB) + DxErr9 (169 KB)
sit at retail offsets. Session path: 279,707 -> 400,234 (threshold) -> 461,164 -> 960,175.

## RULE NOW: keep .text exactly 0x10a090. Every growth must be paired with a shrink, and pairs
must be close together (shrink at A then grow at B shifts everything between A and B).
Ready parts (all real retail-matching, parked, pushed):
- grow: gfx/w-mid16 +48 (r_rendercmds wrappers + LightProperties), gfx/w-dpvs17 +48
  (R_VisitPortalsForCell retail size)
- shrink: gfx/w-ffloor14 -48 (r_outdoor I_ffloor; needs com_math.h/rb_light lock entries),
  gfx/w-bsp e7c61e05 -64 (r_bsp_load_obj), R_AddCmdTouchAllImages 80 B retail lacks (r_rendercmds,
  owner decision: delete?)
- tested: main+ffloor14+mid16 = 956,324 (< main): r_outdoor/r_rendercmds need per-function
  alignment, not a blind pair.
Next: per object front to back, make internal drift zero with in-object pairs (each object
balanced on its own keeps everything after it aligned). LIBCMT tail order still differs.


## Start here
- Helper scripts: copy ~/gfx_tools/* to /tmp (brief = gfx_brief.md; rebase its "Base:" line on gfx/main).
- gfx/main 916b187b: .text 0x10a010 (retail 0x10a090), crossed the 0x10a000 threshold, so .rdata,
  .data and .reloc start at retail raw offsets and the file is retail size. Clean local build:
  whole-file same-offset 400,234 / 1,851,392 = 21.62% (CI meter publishes on gfx/main).
- Session path: 279,707 -> 303,624 -> 305,817 -> 310,944 -> 311,937 -> 318,963 -> 400,234.

## What paid (method)
- Missing uncalled retail copies (NOREF keeps them): int3-slot pairing scripts /tmp/gfx_b8_rf.py,
  /tmp/gfx_b9_pair.py, /tmp/gfx_s12/*.py (copy them into ~/gfx_tools if still present).
- Biggest single find: 76 ri-forward functions after Com_Error in common.obj (+1280 B).
- CRT: let LIBCMT pull intrncvt/mbctype/matherr/days (no hand-extracted objects).
- Retail store order: reread tess.indexCount/vertexCount per index store (rb_backend, rb_tess).
- Keep new helpers as uncalled non-static copies; never reroute an already-matched caller
  (w-light7 lost two protected extents that way; fixed).
- Register-argument uncalled helpers are not producible from source (TRIED/KNOWLEDGE).

## Owner rules learned this session
- asm-hash locks in source_coverage.py: refresh without asking when the __asm blocks diff
  identical vs gfx/main (memory feedback_gfx_asm_hash_refresh). New/moved asm asks the owner.
- Owner approved (11-14) moving I_ffloor unchanged into a shared header for r_outdoor:
  branch gfx/w-ffloor14 82ac4034 DONE but PARKED: the r_outdoor helpers were 96 B vs retail 80 (too
  big); now retail size and form, so .text SHRINKS by 0x30 and would drop main below 0x10a000.
  Land only after other objects add >= 0x30 B. Needs lock entries for com_math.h + rb_light.cpp
  and a protected-extent check on RB_GetLightingAtPoint (stack slots moved).
- Never add a Co-Authored-By trailer (one agent did; amended out).
- Run at most 4 parallel builds; 10 agents overloaded the machine (load 15-19).

## Next
1. .text is 0x80 short of retail size: remaining gaps are 16 B codegen residues
   (RB_UpdateViewportConstants 352/368, RB_BuildSprite 480/488, r_model skinners x4 (register
   convention from use), R_DrawShadowCookies 720/848 (LTCG inline choice), r_outdoor rounding
   (w-ffloor14)). Now every object's internal drift matters: run drift_tu.py on main and make each
   object one constant drift, front to back.
2. Then .rdata (secrel-eq 239,187 of 0x914a1) and .data layout.
3. Parked, unlanded: none of value (w-mid10/w-cookie11/w-skin11 are TRIED-only).
4. Disputed/flagged for owner: uncalled helpers with "Name unconfirmed" names (many, PINNED);
   RB_Benchmark3D uses #pragma optimize("p", on); cubemap functions may be a non-/GL object.

## Previous handoff (2026-11-14 evening)

## Start here
- Helper scripts: copy ~/gfx_tools/* to /tmp (brief = gfx_brief.md, bar there is ac7f5c0a / 301,447).
- gfx/main fe4fa81f = w-stack4 (ac7f5c0a) + w-font5. Local same-offset 303,624; CI meter green.
- Threshold: .rdata reaches retail file 0x10c000 only when .text vsize > 0x10a000.

## Stack waiting: gfx/w-stack8 (local, not pushed)
gfx/main + w-backend5 0d6c3db9 + w-skyfilt5 bd64cec0 + w-matwav5 bf4ff455 + w-water5 5b0fcf38
+ w-state5 7bba254b + w-outdoor5 7bb7f340 + w-image5 13ee4f32 + w-guid cb2d8bf1.
.text 0x109040 (needs > 0x10a000: 0x1050 B more). Whole-file 293,459, section-relative 324,759.
w-specpos is superseded by w-skyfilt5 (same r_specularityimage move): do not stack it.
build.sh returns rc=1 on stacks containing w-backend5 although the link succeeds: find the failing
post-link step before pushing (source_coverage asm hash lock on rb_backend.cpp is the suspect).
Owner check: several branches add uncalled retail bodies with "Name unconfirmed" + PINNED names
(r_outdoor x3, r_image x2, r_init x2, r_font R_DrawConsoleIcon). Precedent: R_PointInLeaf.

## Leads, biggest first (details in TRIED.md 2026-11-14 blocks)
- rb_backend: ~1424 B still missing; disassemble the -17136..-14624 and -14608..-12752 steps.
- rb_tess (w-state5): AddQuadStampDx7 376/528, AddLine +84 (TessOverflow inlined; retail start in
  eax), BuildSprite fsincos helper, TessCylinder(+Dx7) too big, head inlines 1003ee60/70/80.
- r_outdoor: -448 net; 0.5-2^-30 rounding form without asm, tail stubs 10020b00/10/40.
- r_xsurface: drop the out-of-line XSurfaceTransformPosWeighted copy; Buf_Read copies order.
- rb_backend head 1002dda0..df37 helpers before RB_TessOverflow.
- rb_imagefilter: GaussianFilterChain 538/543, ~100 B elsewhere.
- r_image 1000ccb0 (64 B, "$temp" image alloc), r_material two ret bodies, r_dpvs, r_staticmodel.

## Previous handoff (2026-11-11)

## Start here
- Helper scripts were in /tmp and get wiped on WSL restart. Copies: ~/gfx_tools (gfx_land.sh,
  gfx_build.sh, gfx_stack.sh, gfx_push.sh, gfx_so.py, gfx_brief.md). Copy them to /tmp first.
- gfx/main 4cc07a48 (= w-best + test fix + w-imgobj2). CI meter was 279,684 at 4b7b29b1;
  4cc07a48 measured 279,707 locally.
- The threshold: whole-file same-offset stays flat or drops until .text reaches retail size, so
  .rdata starts at retail file 0x10c000 (ours 0x109000). Single-region branches score lower alone.
  Judge by .text bytes restored. Target objects by drift_tu.py "net size delta" (missing bytes).

## Stack waiting: gfx/w-stack3 566f1bd6 (pushed)
gfx/main + w-scene3 4c4ec1bf + w-mat3 35fe6ba6 + w-shot3 a19a3ca3 + w-model4 c793e82f.
.text 0x107f70 vs retail 0x10a090: 0x2120 B short (threshold ~0x2090). Whole-file 276,202 alone.
Do not land until .text crosses; then also stack w-guid + w-specpos (parked, pushed).
Each branch's report and next steps are in docs/TRIED.md (2026-11-12 sections).

## Largest missing bytes (net size delta on w-stack2)
r_utils -2080, rb_logfile -1344, r_material -1008 (w-mat3 restores 304), com_convexhull -816,
r_outdoor -688, rb_state -496, r_marks -384, r_font -336, r_sky -304, rb_imagefilter -304.
Agents were running on r_utils, rb_logfile, com_convexhull, r_marks, r_material_load_obj at the
end of the session: check branches gfx/w-utils, w-logfile, w-hull, w-marks3, w-matload.

## Per-object leftovers
- r_scene: RenderSceneDepth -32 (inlining of R_BeginDrawGroupLoop, lives in r_splitscreen),
  AddClear 96/97 and its Fullbright copy, R_AddDrawSurf deferred.
- r_material: two 1 B ret bodies (likely LittleShort/LittleLong, no evidence where used); tail
  ~192 B larger than retail (R_ApplyPicmip_f belongs at 10005290 in another object; sort templates).
- r_screenshot: R_DownsamplePixelData ~350 vs 363 (try the two-variable residual loop);
  CubemapLighting 336/384 and ForDir 784/816 (retail keeps faceIndex as int index, stack args).
- r_model: 1001d800 (4 B) and 1001e640 (31 B) bodies with no name; Blended/Rigid skinners 16 B
  short each (loop alignment); R_SkinSceneDObj +80.
- r_image_load_obj: 1000f160 32 B uncalled byte setter, no name.

## Previous handoff


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
- .rdata lever found: dxguid.lib (one object in sum2004) adds 520 GUIDs, 8,320 B; retail has 4.
  gfx/w-guid cb2d8bf1 (local) defines only IID_IDirectDraw7: .rdata raw size equals retail, .rdata
  section-relative +10.7 KB, but whole-file drops to 260,953 until .text grows ~0x26f0 B. Stack it
  with the .text work; see TRIED.md.
- .text shortfall by drift step on the best stack (drift_tu.py): r_image_load_obj -464, r_material
  -384, r_material_load_obj ~-340, r_model ~-1100 (largest), r_scene/r_screenshot ~-300 each.
  r_specularityimage reports -101136: placed far from retail, check its link position first.
- gfx/w-specpos cb9338d9 (local, off the best stack): r_specularityimage moved to its retail link
  slot after r_sky_load_obj; 279,531 alone. Stack it with gfx/w-guid once upstream drift is fixed.
