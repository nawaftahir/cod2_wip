# verified/src handoff — 2026-09-29

## Checkpoint 10-08 (workspace cleaned for Codex)

- Cold rebuild of this tree: **439 game fns, 67,258 B = 26.523%** (equal to build/v).
- Round 4 (owner session, 10-07 15:00) merged +204: R_BuildCellAabbTrees 0x10003810,
  R_InitSinTable 0x10012ee0, R_ResetEntries 0x10023e90 (name unconfirmed; round 3 called it
  R_DefaultVertexFrames). Round 5 stopped with drafts only, no gain.
- Old agent trees, merges and backups moved to gfx/archive/scratch_game_1008/; Codex library
  scratch + tools moved to gfx/archive/library_recon/. Agent build dirs deleted (regenerable).

## Checkpoint 10-07 02:10 (round 3 merged, PAUSED)

- **436 game fns, 67,054 B = 26.443%** (build/v rebuilt, no game fn lost). 30% = 76,074 B,
  so +9,020 B to go. Backup: scratch/verified_src_pre_r3. Round-3 trees: scratch/agent{A..F}_r3.
- Merged:
  - A +692 (r_bsp.cpp, r_bsp_load_obj.cpp): R_GetSunLightParseParamsFromDvars (name unconfirmed),
    R_UpdateLightsFromDvars, R_SetSunLightOverride, R_ResetSunLightOverride, R_ShutdownWorld,
    R_ReleaseWorld, R_AllocStaticVertexBuffer. GLM names at 0x10001430/0x10001460 were wrong.
  - C +524: R_EndView, R_InitModelDObj (name unconfirmed), R_LockSkinnedCache,
    Material_AddToTable (slot-pointer form), Material_Duplicate (rooted).
  - D +172 (r_rendercmds.cpp): R_AddCmdApplyLatePostEffects, R_AddCmdDrawSunPostEffects.
  - E +256 (rb_sky.cpp): RB_SetTessQuadDx7; `union GfxColor` fixed its registers.
  - F +401: Vec3PackUnitVec, SnapFloatToGrid (I_fround, not Q_rint), ProjectPointOnPlane,
    FloatReadSwap.
- Rejected / not merged: F's SinCos (inline asm); B (0 verified); D R_DefaultVertexFrames;
  E rb_state/rb_sunsprite restructures and F's other com_math edits (unverified near-misses).
- **For owner review:**
  - Inline asm already in verified/src from earlier work: universal/com_shared.cpp,
    com_math.h (I_fround fld/fadd/fistp), rb_backend.cpp (`rdtsc`). Decide keep or replace.
  - Debt: r_init.cpp `R_GetMaterialHashTable()` accessor (non-retail).
  - Local `extern "C" DXGetErrorDescription9A` decls in r_bsp_load_obj.cpp and r_model.cpp
    (dxerr9.h clashes with the Mac headers).
- Best near-misses:
  - IntersectPlanes 0x1005cdd0 (399 B): 2 lines, `pop esi` position, with `#pragma intrinsic(fabs)`
    (edit is in scratch/agentF_r3).
  - RB_ProjectionMatrixChanged 0x1003e130: 1 instruction; unlocks RB_SetDepthHackNearClip.
  - Material_ReleaseVertexDecls 0x10017470: one dead `xor esi,esi`; unlocks ReleaseAll+Shutdown
    (275 B).
  - XModelUnoptimize 0x1002dcf0: ebx/edi swap; unlocks R_ReleaseModel.
  - MatrixRotationX (3 lines), VectorRotate (s/c slots), Material_FindCachedShaderText (ebp load).
  - R_SetPicmip 0x1000d680 (510 B, ~49 lines), R_SetFog 0x1000bb30 (store order).
- Next: the ready list is now mostly LTCG register-convention helpers, so port caller chains:
  RB_EndSurface 0x1003a8d0 (callees 0x1003a690/a7b0/a580/a340, 0x10034910, 0x1003a000),
  R_LoadWorld 0x10001690, Material_LoadMaterial 0x1001c4e0, 0x100137f0 (2nd caller of
  R_CreateWorldVertexBuffer). Regenerate the list: `python3 ../tools/ready.py scratch/READY2_game.tsv`
  (264 fns / 60.8 KB at nopen=0).
- Nothing committed.

## Checkpoint 10-07 01:20 (round 2 merged)

- **417 game fns, 65,009 B = 25.636%**. No game fn lost vs the 23.9% tree.
  Pre-merge backup: scratch/verified_src_pre_r2. Round-2 trees: scratch/agent{A..F}_r2.
- Drawgroups (+679): r_splitscreen.cpp in tus.txt; r_rendercmds uses Mac names
  R_BeginDelayedDrawing / R_EndDelayedDrawing / R_IssueDelayedDrawing.
  tools/bindcheck.py: one-past-end member refs moved back to their array (the Swap_Init
  "data shift"; literal guard needed).
- R_InitGlobalStructs 0x10012e70 (KisakCOD name; memset rg/rgp, RB_InitBackendGlobalStructs,
  RB_DecideDefaultSamplerState). `&rgp` escaping makes LTCG reload rgp.world, which unlocked
  R_GetWorldBounds, R_InterpretSunLightParseParams, R_ClearDpvsScene, R_ClearScene.
  backEnd layout now has real fields to 0x4c8 + resolved*Target, with an offsetof check.
- A (+1,072): Material technique/techset/statemap/shader slot finders and setters, hash
  lookup (r_material.cpp, real MaterialGlobals offsets). **Debt:** r_init.cpp
  `R_GetMaterialHashTable()` is a non-retail accessor (r_material.cpp uses its own Material
  view and can't see r_globals_t). Remove it when r_material.cpp moves to gfx.h types.
  Material_ReleaseVertexDecls 0x10017470 misses one dead `xor esi,esi`; fixing it unlocks
  Material_ReleaseAll + Material_Shutdown (275 B).
- B (+292): R_AllocStaticModels, R_ScaleStaticModelLighting, R_ValidateStaticModel.
- C (+706): RB_ChangeTexture/Color/AlphaStageState, RB_SetSamplerConstantDx7,
  RB_CopyViewParmsMatrices.
- D (+992): RB_UpdateColorInternal, RB_UpdateColor (Mac name; GLM said R_ShutdownDebug),
  light-grid corner helpers (names unconfirmed). Every backend cmd handler needs
  RB_EndSurface 0x1003a8d0.
- E (+94): XSurfaceFreeVertexBuffer, XSurfaceFreeBuffers. F (+92): Image_PicmipForSemantic.
- Work list for round 3: scratch/READY2_game.tsv (retail call graph: 279 fns / 62 KB have no
  unported game callee).

## Checkpoint 10-07 (game-source reset)

- New goal: CoD2's own renderer code only. Measure: `python3 ../tools/gamecov.py`.
  Game = 0x10001000-0x10041db0 + 0x10057990-0x10062200 = 253,580 B (GLM sizes, SUPPORTED).
- **374 game fns, 60,622 B = 23.906%** (was 59,396 / 23.423%). Swap_Init still bound.
  Pre-merge tree: scratch/verified_src_pre1007. Agent trees: scratch/agent{A..D}.
- Codex's D3DX/DxErr/parser batches moved to gfx/archive/library_recon/ (frozen, no credit).
- Merged agent round (00:11-00:45):
  - A (+823): Material_AllocVertexDecl, Material_IsDefault, R_GetMaterialSubimageCount,
    Material_ReleaseShaders / Material_ReloadShaders (names unconfirmed), Image_Create2D/3D/
    CubeTexture (retail calls DXGetErrorDescription9, not DXGetErrorString9).
  - B (+124): R_RegisterInlineModel, R_Set/GetIgnorePrecacheErrors, R_AbortRenderCommands.
  - C (+183): RB_OpenLogFile, RB_UpdateLogging. Their time() path unbinds 5 CRT fns (library
    only, ~970 B); accepted.
  - D (+96): R_ClearFogs, R_ArchiveFogState, R_NormalizedTextScale, R_TextHeight,
    FloatReadNoSwap; q_shared float swap helpers renamed to the Mac names.
- Near-misses (diff lines):
  - XModelUnoptimize 0x1002dcf0 (4; one store before the alwaysfails cmp). It unlocks
    R_ReleaseModel and R_ReleaseAllModels.
  - RB_ProjectionMatrixChanged / RB_ChangedWorldMatrix (2 each; the valid[0] store runs before
    the dvar load). RB_ProjectionMatrixChanged unlocks RB_SetDepthHackNearClip (body already
    identical).
  - Material_FindCachedShaderText (2; name loaded late), R_GetFrameBufferExtent (6).
  - FloatReadSwap (12), R_GetWorldBounds / sun override (12; retail adds the field offset into
    the register), R_ClearDpvsScene (loop reloads rgp.world; it unlocks R_ClearScene),
    R_DefaultVertexFrames (15), RotatePointAroundVector (30+, more than the sum order).
- Blocked by LTCG register conventions (need callers first): Image_GetSurface (body
  identical, image in esi), Material_SetTechnique* and their hash helpers, RB_SetSampler,
  the sampler lookups, R_UsedCachedStaticModelSurface.
- Drawgroups (r_splitscreen 217 + r_rendercmds 92): codex15_bindcheck's one-past-array
  exception reviewed, narrow and sound. The Swap_Init data shift is still unsolved.

## Checkpoint 09-30 16:35

- Audit **PASS 177,852 B = 16.321%** (live gain 6,478). verified/src: 359 fns, 59,602 B.
  Swap_Init still bound.
- Merged: agentC R_CreateSmodelCacheVertexBuffer 0x1002b920 (128; the log string needs the spaces
  inside the R_DX_CALL parens), and agentD R_ModelBounds 0x1001d910, R_SetParentAndCell_r
  0x100046e0, R_IsMaterialRefractive 0x10017320, R_SetCullDist 0x1000aac0, R_ChooseAdapter
  0x100127d0. All six bind at the exact retail VA. Of the 414 B added, 262 B are new to the
  audit; the rest was already claimed by another proof set.
- Not merged: agentD r_bsp.cpp (R_SetSunLightOverride / R_ClearSunLightOverride drafts, unbound;
  retail copies through a pointer temp). Their roots were removed from roots.txt.
- Agents A, B, E: no verified results. E's SinCos was rejected (inline asm).

## Checkpoint 09-30 16:15

- Audit **PASS 177,590 B = 16.297%** (Codex's CRT batch + drawgroups packet landed while paused).
  verified/src: 353 fns, 59,188 B; live gain 6,216.
- Merged agentB's pending batch (header-only R_AddCmd*, RB_NeedsSceneCopy, R_AddCmdClearScreen,
  R_GetFrameBufferExtent). r_splitscreen.cpp was NOT merged: in our tree its delayedGroup global
  unbinds Swap_Init 0x10060770 (data shift). B's r_scene.cpp drafts were dropped for the same reason.
  Pre-merge snapshot: scratch/premerge_1001/src (build/pm) = the 348 tree Codex pinned.
- Audit patch: the drawgroups packet is replayed against scratch/premerge_1001/src + build/pm, and
  build/v still supplies the live set. Previous audit: scratch/check_ten_percent.pre1001.py.
- **Parallel builds:** `../tools/pb.sh <srcdir> <builddir>` (docker --pid=host). Plain
  closed.mk builds run concurrently collide on cl's PID-named _CL_* temp files in /w.
- Agent brief for matching agents: scratch/AGENT_BRIEF.md. The old agent trees are in scratch/agent?_old.

## Checkpoint 09-30 (paused on owner request)

- verified/src live: **348 fns, 58,777 B**. Audit **PASS 159,836 B = 14.668%**
  (live verified/src gain 5,876). 15% = 163,452 B, so **3,616 B to go**.
- Audit patch: live rows that overlap any other proof set are dropped (they count once, under that
  set). R_GetFarPlaneDist 0x1000aa60 was already in the leaves packet.
- Merged from sonnet agents (each checked t == retail VA in build/v/bind.json):
  - A: R_GetFarPlaneDist, R_ReleaseLostImages, Image_GetSunHalfAngleForVector, R_MonitorEnumCallback,
    R_ChooseMonitor (new TUs r_dpvs.cpp, r_monitor.cpp).
  - B: 11 rb_state/rb_backend fns + new rb_sky.cpp, rb_sunsprite.cpp, rb_backend.h. Names marked
    unconfirmed by the agent: RB_SetInitialDx7State, RB_SetFrustumConstants, RB_FadeToGoal.
  - C: 15 rendercmds/model/scene fns (r_model.cpp, r_dxbuffers.cpp new). Retail R_BeginDelayedDrawing/
    R_EndDelayedDrawing = Mac R_EndDelayedDrawing/R_IssueDelayedDrawing (names swapped vs Mac).
  - Some bindcheck n exceed GLM sizes (e.g. RB_ChangeGenTexCoords 896 vs 878); not investigated.
- NOT merged, pending review in scratch (stopped mid-batch):
  - scratch/agentB/src: R_AddCmdApplyEarlyPostEffects 0x100220c0, R_AddCmdHeaderOnly1C 0x100221d0,
    R_AddCmdEndOfList 0x10020ec0, R_AddCmdSaveScreen 0x100222a0, RB_NeedsSceneCopy 0x10030a40 all bind
    at retail VA (411 B) — names are the agent's placeholders; may sit in a variants TU. Clean up + merge.
  - scratch/agentA/src: probe-named variants (MB1/TN1/MR1/CD1/AD1) bind at 0x1001d910, 0x100046e0,
    0x10017320, 0x1000aac0, 0x100127d0 (286 B) — rewrite with real names before merging.
- Near misses: XSurfaceGetVerts 0x1002cee0 (gv12, equal length, eax/ecx swap), RotatePointAroundVector
  0x10059530 (20 lines, fstps schedule; unlocks AxisFromForwardYaw 129), R_SetFog (13 lines),
  Material_AllocVertexDecl (1 reg), Material_FindCachedShaderText (2 lines), R_UnlockSkinnedCache (9),
  RB_ProjectionMatrixChanged / RB_ChangedWorldMatrix (store order), R_IssueDrawGroups 0x10029560 (code
  identical; needs the global after delayedGroup at 0x10696cd0 from an unwritten TU).
- Parallel pattern: scratch/agentX/src + build/agentX (`make -f closed.mk SRCDIR=... B=... verify`,
  `fd.sh ... build/agentX`). Builds slow past 120 s with 3 concurrent.

## Checkpoint 09-29

- verified/src = codex_cohort13 superset (pre-merge backup: scratch/claude_verified_src_backup_0929,
  frozen build build/v_base_0928). Live: 316 fns, 52,971 B.
- Audit (gfx/tools/check_ten_percent.py, patched: proof chain on the frozen backup + a "live
  verified/src gain" set from build/v; original at scratch/check_ten_percent.pre0929.py):
  **PASS 154,203 B = 14.151%**. 15% needs +9,249 B.
- New matches: Buf_Read<float> helper 0x1002d400, blend helper 0x1002d420 (123),
  XSurfaceGetTris 0x1002ce40 (120; PC takes `short offset` — retail loads the arg word-sized;
  an int param "matched" at VA+1, a false positive: always check bind t == retail VA).
- XModelReadSurface: best103 (union Buf_Read packs temps into dead param slots, frame 0x14).
- 0x1002cee0 is XSurfaceGetVerts (GLM name R_RegisterXModelSurfs is wrong). Rewritten from the
  decompile: rigid branch first (`boneOffset != -1`), countdown loops, no texcoords on the skinned
  path. Normalized diff 236 lines, mostly eax/ecx swap (surf vs verts). MSVC canonicalizes
  commutative fmul operand order — reordering helper operands changes nothing.
- Parallel sonnet agents A/B/C work in scratch/agent{A,B,C}/src + build/agent{A,B,C}
  (`make -f closed.mk SRCDIR=... B=... verify`, `fd.sh ... <build>`); merge verified results only.

# Previous — 2026-09-28

Build + verify: `cd gfx/target && ../tools/vb.sh [mangled-substr retail-va size]`
(wraps `make -f closed.mk SRCDIR=verified/src B=build/v verify`; optional args run fd.sh).
Per-function diff with stack offsets normalized: `../tools/fdn.sh <substr> <va> <size>`.
Status per fn: `build/v/bind.json` (`why: []` = verified).

## Checkpoint

- verified/src: **280 fns, 42,193 B (3.872%)**. Codex (JPEG+engine+STL) 80,796 B counted
  separately -> combined ~11.3%. Goal 15% needs ~40.5 KB more. No commits made.
- "library" line in the verify output jumps between 90 KB and 163 KB between builds; not counted,
  not investigated.

## Where the remaining bytes are

- `build/v/taken.txt` (tools/addrtaken.py): address-taken fns keep the standard convention.
- Backend command handler table 0x101904f8-0x1019059c: handlers are tiny, but every callee
  (RB_EndSurface 0x1003a8d0, tess, clear...) is unwritten and register-convention. Needs a whole
  backend TU; not worth it one handler at a time.
- Leaf scan (all callees verified, standard convention, renderer+universal): ~20 KB / 121 fns.
  Script: scratchpad leaf.py logic = decomp files with no unverified FUN_ calls and no
  in_E?X/unaff_/in_stack. Top: 1002d4a0 XModelReadSurface (1519, refexport slot 96),
  1002cee0 R_RegisterXModelSurfs (726, slot 98), 1002ce40 (120, slot 99).
- GLM decomp names for 0x100211a0/0x100213f0 etc. are WRONG (off by one refexport slot);
  trust refexport_gfx10.json slots + retail writers.

## In progress: XModelReadSurface (gfx_d3d/r_xsurface_load_obj.cpp, rooted)

- Shape PINNED: IW `Buf_Read<T>` template (Kisak qcommon.h) with a memcpy body reproduces the
  int-register float copy + dead temp store. tileMode and boneWeight are read inline (`**pos;
  *pos += 1`), not via the helper. `int boneOffset`. Branch order `if (boneOffset == -1) {...}
  else {offset}`. Alloc result kept in a local, stored to surface->verts after memUsage.
- Current file = best so far: normalized diff **154 lines** (raw 264; ours 558 vs retail 542 insns).
  Typed `vert`/`blend` pointers (a single byte walker was worse: 331). `int vertBoneOffset` helped
  (240 -> 154).
- Remaining: retail keeps `model` in ebx and packs every Buf_Read temp into dead param slots
  (frame 0x14); ours gives each inline instance its own slot (frame 0x60). A cross-TU LTCG-inlined
  helper did not change this. Also: `size` is spilled across the Alloc call and memUsage is updated
  load/add/store; the 4x-unrolled blend loop advances the pointer early (`add $0x10,%eax`, then
  negative offsets).
- Next: once it matches, R_RegisterXModelSurfs 0x1002cee0 (726) and 0x1002ce40 (120) are its
  refexport neighbours (slots 98/99) and likely belong in the same TU.

## Still failing (from before)

RB_ChangeState_0, RB_LogPrintState_0/1 (LTCG arg registers), R_AddCmdDrawStretchPic / Rotate /
FullScreenColoredQuad (R_ConvertColorToBytes inlined where retail calls it), R_AddCmdDrawTextInSpace
(one misplaced load), FFT/FFT_Init (need callers), Image_BuildSpecularityMap (stack alignment).
