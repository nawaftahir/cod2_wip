# r_bsp_load_obj.obj chunk sweep and 3 newly bound functions - 2026-11-07 (worker g8)

Matched and bound 3 additional functions in `r_bsp_load_obj.cpp` (`why == []` in `bind.json`, net +3 bound functions: 2703 -> 2706, `same_file_offset_equal_bytes`: 251020 -> 251207, +187 B):
- `R_SetDpvsPlaneSides` (`0x10001900`, 54 B): removed `inline` and matched positive-sign ternary formulation (`FloatAsInt(plane->coeffs[i]) > 0 ? (12 + i * 4) : (i * 4)`), matching all 54 bytes (`why == []`).
- `R_GetDebugGroundLightColor` (`0x10003180`, 38 B): removed `static` and called from `R_LoadMiscModel` while preserving `Vector4Set` (`0x100018a0`) emission, matching all 38 bytes (`why == []`).
- `R_LoadSunSettings` (`0x100037e0`, 45 B): removed `static` and removed `__declspec(noinline)` from `R_ParseSunLight`, matching all 45 bytes (`why == []`).
Also achieved 100% byte match on `R_LoadMiscModel` (`0x100031b0`, 626 B, `hits: ['0x100031b0']`, blocked only on cross-TU `R_CreateStaticModel`).

Remaining `r_bsp_load_obj.obj` chunks in `docs/CHUNKS.md` logged as not source-fixable:
- `0x10001810` (`FloatAsInt`, 16 B) and `0x10001820` (`ByteToDir`, 48 B): `FloatAsInt` is <20B (`cmp.py` threshold); `ByteToDir` differs in `com_math.h` register allocation.
- `0x10001b10` (`R_LoadLayeredMaterials`, 640 B), `0x100022a0` (`R_CopyLightmap`, 240 B), `0x10002390` (`R_BuildLightmapMergability`, 480 B), `0x10002570` (`R_LoadLightmaps`, 784 B): register allocation / instruction scheduling differences.
- `0x10002880`, `0x10002900`, `0x10002960` (`R_ParseEntities`, 2112 B): LTCG custom register convention and loop register allocation differences.
- `0x10003430` (`R_ParseParams`, 496 B), `0x10003990` (`R_LoadPrimaryLights`, 336 B), `0x10003ae0` (`R_LoadLightRegions`, 288 B): register allocation / stack frame layout differences.
- `0x10003c00`, `0x10003c40`, `0x10003cc0`, `0x10003d20`: LTCG custom calling convention (`eax`/`ecx`) on static light helpers.
- `0x10003d40` (`R_FinishLoadingAabbTrees_r`, 403 B) and `0x10003ee0` (`R_LoadAabbTrees`, 164 B): `R_LoadAabbTrees` is 100% byte-matched (`hits: ['0x10003ee0']`), blocked only on `R_FinishLoadingAabbTrees_r` which has a 1-byte register/SIB difference at `+0x106` (`mov ecx, [esi+0x2c]; add ecx, edi` vs `mov eax, [esi+0x2c]; lea ecx, [edi+eax]`).
- `0x10003f90` (`R_LoadBsp`, 240 B), `0x10004170` (`R_LoadPortals`, 400 B), `0x10004300` (`R_LoadCullGroups`, 224 B), `0x10004430` (`R_LoadOccluders`, 480 B), `0x10004610` (`R_LoadWorld`, 144 B), `0x100046a0` (`R_LoadWorldInternal`, 2288 B): register allocation / frame layout differences or blocked on callees.
# r_image.obj chunk sweep - 2026-11-07 (worker g9)

Swept all 26 `r_image.obj` chunks in `docs/CHUNKS.md` (lines 113–138). All remaining chunks in `r_image.cpp` belong to non-source-fixable classes or are blocked by cross-TU callees / slice-based unit tests:
- `0x1000c7b0` (`Vector2Copy`, 16 B), `0x1000ddf0` (`Image_AllocTempMemory`, 16 B), `0x1000de00` (`Image_FreeTempMemory`, 16 B): <20B helpers below `cmp.py` 20-byte indexing threshold (with LTCG `eax` register convention on the temp memory wrappers).
- `0x1000c8e0` (`R_HashAssetName`, 48 B) and `0x1000c970` (`Image_GetMipmapResolution`, 64 B): cross-TU helpers owned by `r_utils.obj` / `r_image_load_obj.obj` placed near `r_image.obj` in retail LTCG layout.
- `0x1000c9d0` (`Image_TrackFullscreenTexture`, 149 B): 160 B slot matches except 3 instructions at `+0x10` (`mov eax, [vidConfig.width]; mov ecx, esi; dec ecx` vs retail `mov eax, esi; dec eax; mov eax, [vidConfig.width]`); calling `Image_GetPlatformScreenWidth`/`Height` causes loop strength reduction (`or ecx, -1`) expanding the function to 224 B. Restored.
- `0x1000cba0` (`Image_SetupFromFile`, 48 B), `0x1000ccb0` (`Image_AllocProg`, 89 B), `0x1000d3f0` (`Image_UpdatePicmip`, 82 B): LTCG custom register calling conventions (`eax`/`edx`/`ecx`) and out-of-line calls to `Image_GetAvailableHashLocation` (`0x1000cb40`), which must remain `static` in `r_image.cpp` per `work/tests/test_image_shutdown.py`.
- `0x1000cd10` (`R_ShutdownImages`, 336 B) and `0x1000d200` (`Image_Register`, 94 B): exact size matches differing only in register allocation (`al` vs `cl` in inlined `R_HashAssetName`; `ebx` vs `edi` in `Image_Register`).
- `0x1000d450` (`Image_Reload`, 42 B) and `0x1000dd70` (`R_LoadWaterSetup`, 122 B): 100% byte-matched (`hits` in `cmp.json`), blocked only on cross-TU callees `Image_LoadFromFile` (`r_image_load_obj.obj`) and `R_WatersEquivalent` (`r_utils.obj`).
- `0x1000d510` (`R_InitRawImage`, 80 B), `0x1000d560` (`R_RegisterBuiltinImages`, 276 B), `0x1000d880` (`R_InitImages`, 124 B): `R_InitRawImage` and `R_InitImages` inline `static int Image_GetAvailableHashLocation` instead of calling it out-of-line (`test_image_shutdown.py` slices `static int Image_GetAvailableHashLocation`); `R_RegisterBuiltinImages` differs only in `mov ebx, 1; push ebx` vs `mov bl, 1; push 1` from LTCG `bl` parameter convention on `Image_Register`.
- `0x1000d680` (`R_SetPicmip`, 510 B): 510 B matches across all branches except 1 instruction at `+0x169` (`mov [imageGlobals.picmip], edi` vs 5-byte `mov [imageGlobals.picmip], eax`); probed chained assignment `imageGlobals.picmip = picmip = minPicmip` and direct `imageGlobals.picmip` use (flips `eax`/`ecx` allocation). Restored.
- `0x1000de10` (`R_DownsampleMipMapBilinear`, 352 B): LTCG custom register convention (`eax`=`dst`, `edx`=`srcWidth`, `ecx`=`texelPitch`).
- `0x1000e140`..`0x1000e550` (`std::sort` template helpers, 8 chunks): <20B template helpers (`_Dist_type`, `_Val_type`, `_Iter_cat`, `_Rotate`) below `cmp.py` indexing threshold or duplicate COMDAT hits (`pair`, `iter_swap`, `swap`).

# Material_ParseSamplerSource match - 2026-11-07

Material_ParseSamplerSource (retail 10019620, 211 B; chunk 10): Com_ParseInternal reproduces inlined first token parsing while preserving out-of-line Com_Parse on material name path. 211 bytes match 100% at retail 10019620. Referees and all 2526 checkpoints passed.

# Material_CodeSamplerSource_r probe - 2026-11-07

Material_CodeSamplerSource_r 100194f0/303 (chunk 9): probed Com_ParseInternal and while(1) loop structures. Compiler duplicates the loop condition and clones exit paths via jump threading, emitting 352 B vs retail 303 B. Non-source-fixable block layout class. Restored.

# Material_LoadPassStateMap match - 2026-11-07

Material_LoadPassStateMap (retail 10018ee0, 161 B; chunk 7): Com_ParseInternal reproduces inlined parse token unget check and call to Com_ParseExt. All 161 bytes match 100% at retail 10018ee0. Referees and all 2526 checkpoints passed. same_file_offset_equal_bytes increased from 251990 to 253184 (+1194 B).

# Material_ParseRuleSet probe - 2026-11-07

Material_ParseRuleSet 100188e0/505 (chunk 6): Com_ParseInternal brings inner parsing loop into byte-level alignment up to call site. Caller argument passing to Material_ParseRuleSetCondition requires pushed 'text' arg decided by unverified callee convention (LTCG callee ABI), and return path block layout differs. Restored per non-source-fixable callee ABI rule.

# Material_ParseRuleSetCondition probe - 2026-11-07

Material_ParseRuleSetCondition 100185b0/346 (chunk 5): Com_ParseInternal inlines token parsing and brings candidate from 192 B to 336 B vs retail 346 B. Remaining differences belong to non-source-fixable classes: retail aligns the do-while loop to 16-byte boundary with 7-byte lea esp,[esp] NOP padding, uses edx/ecx register allocation swap in token unget restoration, and differs in return block layout. Restored.
# r_model.obj chunk sweep and 3 newly bound functions - 2026-11-07 (worker g3)

Matched and bound 3 additional functions in `r_model.cpp` (`why == []` in `bind.json`, net +3 bound functions: 2688 -> 2691):
- `R_SkinRigidSurface` (`0x1001f000`, 37 B): extracted non-static wrapper calling `R_GetRigidTransform((const DObjSkelMat *)((const byte *)bone + xsurf->boneOffset), origin, axis, scale, boneAxis)`.
- `Material_UsesDx7GridLighting` (`0x1001f280`, 24 B): extracted non-static helper returning `byte` (`technique->passArray.dx7[0].gridLighting`) and inlined into `R_PreSkinStaticSurface`.
- `R_GetSceneEntDObj` (`0x1001f6b0`, 34 B): extracted non-static helper selecting `sceneEnt->u.obj` (`reType == 0`) or binding `sceneEnt->u.model` to `rg.modelDObj`, inlined into `R_UpdateXModelBounds`.

Remaining `r_model.obj` chunks in `docs/CHUNKS.md` logged as not source-fixable:
- `0x1001d800`..`0x1001d820`, `0x1001f100`, `0x1001f6e0`, `0x1001fd90`, `0x1001ffb0`, `0x10020370`, `0x100203d0`..`0x100203f0`, `0x10020520`: <20B helpers below `cmp.py` 20-byte indexing threshold.
- `0x1001da80` (`R_XModelDebugBoxes`), `0x1001de60` (`R_XModelDebugAxes`), `0x1001e220` (`R_DebugModelSurfaces`): register allocation differences (ebx vs edi for ent/sceneEnt).
- `0x1001e260`..`0x1001ee00` (`R_TransformRigidVertex*`, `R_BlendSkinPosition`, `R_SkinXSurface*`): previously logged x87 / SSE register scheduling and frame differences.
- `0x1001f030` (`R_SkinXSurfaceSkinned`), `0x1001f480` (`R_SkinXModelSurface`), `0x1001f4d0` (`R_SkinXModelCompoundSurface`), `0x1001f520` (`R_SkinRigidXModelCmd`), `0x1001f5b0` (`R_ConvertSurfaceBones`), `0x1001f610` (`R_SkinXModelCmd`): LTCG custom register convention difference on `R_SkinXSurfaceSkinned` (`ecx, edx` vs retail `eax, edx`) and `R_ConvertSurfaceBones`.
- `0x1001f120` (`R_PreSkinXSurface`), `0x1001f2a0` (`R_PreSkinStaticSurface`), `0x1001f6f0` (`R_SkinXModel`), `0x1001fa70` (`R_SkinSceneDObj`), `0x1001fd70` (`R_SkinSceneEnt`), `0x10020400` (`R_LoadXModelSkins`): register allocation / stack frame layout differences and cross-TU `R_ProcessFrontendCmdInternal` (`r_rendercmds.cpp`) calling convention.
- `0x10020350` (`R_ReleaseAllModels`), `0x100203a0` (`R_FinishLoadingModels`): already 100% byte-matched (`hits` include `0x10020350` and `0x100203a0`), duplicate COMDAT/small-body hits with `r_init.obj`.
# r_scene.obj chunk sweep and LerpByte match - 2026-11-07

LerpByte (retail 10024050, 37 bytes): extracted non-static helper `byte LerpByte(byte from, byte to, float frac)` using `I_fround` and inlined into `R_GetVisLightsMask` / `R_LerpEntityData` in `r_scene.cpp`. Matches retail 0x10024050 byte-for-byte (37 bytes, why == [], net +2 bound functions on gfx/g4 alongside R_CountMatchingSceneEntities).

Remaining r_scene.obj chunks in docs/CHUNKS.md:
- 0x100219c0..0x10021fd0 (`R_UncullAllSceneEntities` .. `R_LinkBModelEntity`): already emitted in `r_dpvs.cpp` / `r_scene.cpp`; chunks in CHUNKS.md are either <20B helpers (`0x10021c10`, `0x10021e30`, `0x10022d20`, `0x100243d0`) below `cmp.py` indexing threshold or cross-TU boundary functions (`r_dpvs.obj` / `r_scene.obj`) where register allocation / inlining differs.
- 0x10022a60 (`R_AddBModelSurfacesCamera`, 528 B) and 0x10022c70 (`R_AddBModelSurfaces`, 176 B): register allocation / loop induction variable differences (esi/edi/ebx) in surface bounds / technique checks; non-source-fixable.
- 0x10022d30..0x100238a0 (`R_UpdateSceneEntBounds`, `R_SkinSceneEntities`, `R_ClearScene`, `R_GetDefaultNearClip`): register allocation / x87 stack scheduling differences or blocked on external callees (`R_UpdateXModelBounds`, `R_SkinGfxEntity`).
- 0x10024080 (`R_UpdateEntityLighting`, 944 B) and 0x100244b0 (`R_RenderScene`, 1968 B): large multi-loop functions with register allocation and frame layout differences (`RB_GetLightingAtPoint` / `R_SetupViewProjection` inlining context); non-source-fixable.

# R_AddRefEntityToScene and R_ShortSortDrawSurfs linkage / ABI matches - 2026-11-07

R_AddRefEntityToScene (retail 10023db0, 209 bytes) and R_ShortSortDrawSurfs (retail 10024460, 70 bytes): removing static from R_CopyRefEntityToScene restored standard 3-stack-argument ABI in caller R_AddRefEntityToScene, achieving 100% byte match (209 bytes at 0x10023db0). Removing static from R_ShortSortDrawSurfs gave it a distinct symbol in the map and verified extent at 0x10024460 (70 bytes, 100% byte-identical, why == []). Passes full gate and checkpoint regression.

# R_AddModelRefEntity / R_DumpSceneEntities register allocation probes - 2026-11-07

R_DumpSceneEntities (retail 10023920, 464 bytes): exactly 464 bytes in both ours and retail. Differs only in prologue register shrink-wrapping across qsort (push ebp before qsort vs after) and register choice (ebx/edi for ent/sceneEnt). Non-source-fixable register allocation class.

R_AddModelRefEntity (retail 10023cc0, 128 bytes): emits 129 bytes (padded to 144) vs retail 128 bytes. The single 1-byte difference is opcode 0x10: retail emits 5-byte A1 mov eax, [scene.def.entities] while ours emits 6-byte 8B 0D mov ecx, [scene.def.entities]. All other instructions through ret match identically. Probed sceneEnt declaration ordering and pointer arithmetic. Restored. Non-source-fixable register allocation class.

# R_CountMatchingSceneEntities out-of-line helper match - 2026-11-07

R_CountMatchingSceneEntities (retail 100238d0, 80 bytes): restored out-of-line helper in r_scene.cpp matching retail 100238d0 exactly (80 bytes, 100% byte-identical, why == []). Passes byte referee, binding referee and checkpoint regression. Net +1 bound function, same_file_offset_equal_bytes 251990 -> 252264 (+274 bytes).
# r_init.obj chunk sweep and 9 newly bound functions - 2026-11-07 (worker g6)

Matched and bound 9 additional functions in `r_init.cpp` (`why == []` in `bind.json`, net +9 bound functions: 2688 -> 2697):
- `R_ReleaseAndSetNULL` (`0x10011420`, 41 B): removed `static` and implemented non-null `alwaysfails` Release loop + `ri.Printf(0, "%s (%s) released\\n", ...)` when `r_logFile->current.integer`.
- `R_DestroyParticleCloudBuffer` (`0x10011e10`, 72 B): matched via `R_ReleaseAndSetNULL`.
- `R_FinishAttachingToWindow` (`0x100120c0`, 60 B): bound once `R_CreateDevice` (`0x100128b0`) called it.
- `R_ReleaseForShutdownOrReset` (`0x10012210`, 269 B): bound once `R_ShutdownHardware` (`0x10012db0`) and `R_ResetDevice` (`0x10013690`) matched.
- `R_UpdateGpuSyncType` (`0x10012880`, 39 B): removed `static` and called from `R_CreateDevice` / `R_UpdateFrontEndDvarOptions`.
- `R_SetupWindowParms` (`0x10012b90`, 133 B): extracted non-static `void R_SetupWindowParms(GfxWindowParms *wndParms)` at `0x10012b90`.
- `R_ReduceWindowSettings` (`0x10012c20`, 91 B): extracted non-static `bool R_ReduceWindowSettings()` at `0x10012c20`.
- `R_ShutdownHardware` (`0x10012db0`, 168 B): extracted `R_DestroyGameWindows` (`0x10012a90`), matched `R_ShutdownHardware` 100% and bound.
- `R_ShutdownStreams` (`0x10013030`, 68 B): removed `static` from `R_ShutdownStreams` (68 B, `why == []`).
Also achieved 100% byte matches (`hits` in `cmp.json`) on `R_SetUpWindow` (`0x10012ac0`, 64 B), `R_InitHardware` (`0x10012c80`, 289 B), and `R_ResetDevice` (`0x10013690`, 319 B).

Remaining `r_init.obj` chunks in `docs/CHUNKS.md` logged as not source-fixable:
- `0x10011640` (`R_StoreDirect3DCaps`, 960 B): 100% byte-matched (`hits: ['0x10011640']`), blocked only on external callee `R_CheckDxCaps` (`0x100114f0`).
- `0x10011f00` (`R_ResetGamma`, 16 B): below `cmp.py` 20-byte indexing threshold; emitting out-of-line shifts downstream `.text` by 16B and unbinds `d3dx9:cassembler.obj` (`GetSemanticName`) extent.
- `0x100123d0` (`R_EnumerateDisplayModes`, 741 B vs retail 738 B): 3-byte register allocation difference (`ebx` vs `edi` induction variable for `resolutions` array after `std::sort`).
- `0x100128b0` (`R_CreateDevice`, 272 B): 100% byte-matched (`hits: ['0x100128b0']`), blocked only on `R_EnumerateDisplayModes` in caller `R_CreateDirect3D`.
- `0x10012a90` (`R_DestroyGameWindows`, 48 B): <20B body (`19 B` before padding), below `cmp.py` 20-byte indexing threshold.
- `0x100137d0` (`R_CanRecoverLostDevice`, 24 B vs retail 20 B): MSVC 7.1 emits `xor edx, edx; cmp eax, 0x88760868; setne dl; mov al, dl; ret` (24 B) instead of `cmp eax, 0x88760868; setne al; ret` (20 B) for both `static bool` and non-static `bool`.
- `0x100137f0` (`R_RecoverLostDevice`, 201 B vs retail 203 B): 2-byte difference at `+0x0ab` where retail has `jmp +3; lea ecx, [ecx]` inside the inlined `R_FinishLoadingModels` tail.
- `0x10013fd0`, `0x10014020`, `0x10014030`, `0x100141e0`, `0x10014370` (`std::sort` template helpers): already emitted at exact sizes (`iter_swap`, `swap`, `_Dist_type`, `_Val_type`, `_Iter_cat`, `_Rotate`); `iter_swap`/`swap` have duplicate COMDAT hits (`0x10013fd0`/`0x100141e0`) and `<20B` helpers are below `cmp.py` threshold.

# RB_SetupPassDx7 jump-table and loop probe - 2026-11-06

RB_SetupPassDx7 (10039b40, retail 1124, ours 1104): probed semantic switch 0/1 cases in inlined RB_ApplyMaterialImageOverride (stays 1104, compiler optimizes out empty cases matching default), early return from case 0/1 (collapses pass loop into 937 bytes by dropping trailing sampler/texcoord setup), and pointer-incremented sampler iterator (stays 1104, strength-reduction arithmetic still generates 4-entry jump table and different loop frame). Restored.

# RB_UpdateViewportConstants deferral - 2026-11-06

RB_UpdateViewportConstants (retail 1003e690, 366 bytes; our size 315 bytes at rb_state.cpp:975): unbound in referee because 1003e690 is cataloged as FUN_1003e690 with NO_SOURCE_OWNER in retail_functions.tsv, leaving the symbol unbound in BLOCKERS.md. Called from RB_BeginViewCmd (100321f0) and RB_SetRenderTarget (1003ea30 in our source, though retail 1003ea30 does not call it). DEFER per instructions until ownership/layout binding is established.

# Material_Register shrink-wrap probe - 2026-11-06

Material_Register (10017100, retail 144): probed if (!found) block structure, __forceinline helper for load path, and forward goto load (all emit 144 bytes by placing found-return at function exit, but push esi remains in prologue at entry rather than deferred/shrink-wrapped into the load block as in retail; byte referee rejected). Restored.

# RB_EndSurface structure probe - 2026-11-06

RB_EndSurface (1003a8d0, retail 202): probed early return with !RB_IsTechniqueDrawable (stays 206, clear block placed after draw requiring 6-byte near jump), forward gotos with clear before draw (emits 150 bytes, tail-calls un-inlined RB_LogPrint instead of inlining), and inverted RB_IsTechniqueBlocked predicate (stays 206, compiler reorders clear block after draw causing 6-byte near jump 0f 84 instead of 2-byte short jump 74). Restored.
# RB_TessXModelSkinnedCached size probe - 2026-11-06

RB_TessXModelSkinnedCached 10041140/276: ours emits 277 bytes vs retail 276.
The single byte difference is instruction 64: retail emits 5-byte A1 opcode
mov eax, [backEndData] while ours emits 6-byte 8B 0D mov ecx, [backEndData].
Probe 1: separate renderer local variable. Emits 277.
Probe 2: explicit intermediate skinnedCacheVb pointer variable. Emits 277.
Probe 3: hoisted buffer declaration at function scope. Emits 277.
All three probes fail byte matching and are restored. Max 3 probes reached.

# DX7 direct-expression follow-up - 2026-11-05

R_TransformRigidVertexDx7 explicit six primary-derived expressions under local
optimize("p",on) stays151 but changes operation scheduling without matching.
Adding local optimize("g",off) destroys the register ABI/frame and fails.
The same explicit expressions under the original fast-FP profile also fail.
All three source variants restored exactly; no coverage credit. Native32-bit
skinning fixture passes the explicit-expression variant (512 scalar/SSE/cache
cases plus XSurface routes). Logs:proof/latest/nov05_dx7_explicit_{precise,
no_global,fast,native}.log. The final local DLL belongs to a rejected probe;
use the canonical clean-CI meter, not that diagnostic build.

# Additional bounded source probes - 2026-11-05

Screenshot downsampler100259a0/363: noinline stays369; three-element accumulator
with blue-first assignments stays369; channel accumulation/quantization loops294.
All fail byte matching and are restored. Resampling native fixture passes.
Moving vector helpers into r_model as forceinline with noinline wrappers leaves
310/151/124/101-byte helpers unmatched; TU list, fixture and layout restored.
Local optimize("a",on) on rigid vertex wrappers fails and is restored.
The two manually tested float-pointer orders (position,tangent,normal,binormal)
and (position,tangent,binormal,normal), followed by bone/output, fail. A finite
search covers the remaining22 orders in that same subset. Read its results at
build/vertex-order/results.jsonl; do not repeat it. This is not all720 possible
six-parameter signatures. Source is restored automatically when none passes.

Standalone VC7.1 optimize("p",on) preserves parenthesized sum grouping without
intermediate stores, but still reverses multiplication evaluation. Listing:
workspace/build/codex_boundsoutside_1016_02/tmp/precision_probe.asm. This is
compiler evidence only, not a renderer match or a production flag change.

Additional rounding probe2026-11-05: original VC7.1 /O2 /QIfist emits
FISTP QWORD for biased int, long, unsigned, short, local-int, volatile-int
and output-pointer conversions. Target I_fround uses FISTP DWORD. No source,
flag or assembly-accounting change retained. Listing:build/tmp/round_probe.asm.
Do not repeat these seven scalar/storage variants.

# Rigid/model boundaries and compiler FP probe - 2026-11-05

GetRigidTransform's arithmetic was correct; definition-level noinline reproduces
retail's stacked output pointer and scale while keeping the real ECX/ESI/EDX
inputs.399 bytes pass both local referees and all retained extents; clean CI
is required before reporting new progress. Frozen row:rigid_transform_20261105_warm_bind.json.
Cached model skinning's16-byte aligned bone plus shared input captures reproduce
the254-byte extent/prologue, but register allocation and child kernels differ.
No credit for that draft. Native skinning and model draw fixtures pass.

Cache caller comparison/positive-block form stays195/193. Skin helper noinline
batch fails; it outlines the135-byte command into59 bytes. Vertex helper
noinline tests fail; noinline removal and early capture in the skinned dispatcher
also fail. Restored all of those probes. Bare noinline on original fullscreen,
cube, shader text and lighting-cache helpers retains every match but adds none;
all four attributes restored. Never repeat this batch as new work.

Original VC7.1 rejects _clearfp as an intrinsic (C4163); a valid standalone
probe tail-jumps to __clearfp. Material_CreateShader needs target FNClEX and
other stack layout work. No assembly added and no compiler-impossibility claim.
Compiler listing/log:build/tmp/clear_probe.asm and proof/latest/nov05_clear_intrinsic_probe.log.

Two complete source snapshots are added from successful byte/binding evidence:
r_dvars and r_splitscreen. R_ClearFlares is not promoted under the snapshot's
unique-raw-hit gate: its empty body is independently binding-certified instead.
TU accounting now retains that existing short-body certificate rather than
silently discarding it. This counting correction is not new code recovery.

# Material and near-match probes - 2026-11-05

Material_Register explicit else scope remains145 versus target144; rejected.
Function-local optimize("s",on) produces124 with a different frame; rejected.
Both restored. Material_CacheShaderText commuted pointer-add operands remains
173 with the wrong SIB operand order. Swapping width/height declarations in
R_PrepareStaticModelLightingCache remains222 with the wrong store register.
Both restored. Logs:nov05_material_scope/size and nov05_nearby_operands under
workspace/work/proof/latest. No bytes accepted from these probes.

Sun settings826: a volatile reference to the existing blind-fadein dvar pointer
keeps its load after the preceding sun stores, matching all bytes.144 native
sun routes pass. Binding remains blocked by Material_Register145/144, then
Material_LoadBinary183/171 and material fixup dependencies. Zero coverage credit.
Do not repeat register selector syntax sweeps; the cache index load-order fix
is independently accepted and retained by both guards.

# Fullscreen default selector replay - 2026-11-05

Explicit default switch emits144 rather than149 bytes and again loses the
protected10022b90/10022c30 bodies. Restored. This duplicates the recorded
November3 selector failure; do not retry it. No source coverage gained.
Log: workspace/work/proof/latest/nov05_tracking_default.log.

# Predicate cohort results - 2026-11-04

Explicit blind/glare zero/one/fraction branches match352 bytes at1003bda0
AND every binding. Source avoids preloading zero before the min-dot test;
no flags, ABI, assembly, helper copies or link-order changes for this body.
The sun-loader base pointer initialized after the clear matches208 bytes at
10029230 but remains blocked by the unmatched SetSunFromDvars826 dependency.
Neither its raw match nor the benchmark201/fill918 raw matches earn coverage.

EndSurface local size optimization outlines helpers (93 bytes). Forcing the
real technique/logging helpers inline under that setting gives173, not202.
Explicit logging expansion plus goto under original flags gives206 again.
All are rejected; restore the original surface source and its native fixture.
Never repeat these branch/size/inline variants without new TU-level evidence.
Point comparator int return/precision probe emits215; contiguous deltas,
canonical dot order and reversed equivalent comparison still215. Restore its
original source. Glow early-return spelling remains212 and is restored too.
Set2D retains its actual scene-viewport correction and float/store structure;
854/847 remains unverified. Native864 matrix/8 overflow/240 quad/109 query,
631 point-light,119 late-post,94 sun-render and144 sun-command cases pass.
RB_IsLogging global forceinline declaration is removed with the failed surface
probe; the fresh regression must retain the new352-byte sun body afterward.

# Backend return widths and viewport structure - 2026-11-04

Same-size draft scan found Benchmark2D201 and TestFill918 differed only in
float/double constant operands. A float Benchmark2D return, with a float-zero
fallback, reproduces both complete byte bodies. Binding still requires the
DrawStretchPic393 -> Set2D -> EndSurface chain; raw matches are not credit.
The single existing RB_Rdtsc assembly definition is byte-for-byte unchanged;
the backend source fingerprint is re-pinned after reviewing only real C++ edits.

PINNED Set2D1002e020 branch at1002e066 loads1072dde0/dde4/dde8/ddec, i.e.
backEnd.sceneViewport x/y/width/height at3e0..3ec. The previous draft and its
native oracle incorrectly used the separate backEnd.width/height fields.
The fixed fixture seeds scene333x199 and output640x480 to distinguish them.
Full viewport uses dxState renderTargetWidth/Height at1076671c/720.
Viewport struct copy plus local precision-on yields the target9c frame and
its complete float setup sequence. Draft801/847 still differs in zero store
and cache/loop scheduling. Grouped-zero memset emits rep stosd, but retail
uses eleven scalar zero stores then five one stores; use that actual order.
Retail also clears projection flags1/2 with one unaligned16-bit store and
flag3 with one byte store. This is an observed PC operation, not a new ABI.
Positive-if/else EndSurface still206/202; restore its original source and
probe local size optimization once. No other functions receive this setting.

# Shared cubemap generator - 2026-11-04

Target10160/786 is pinned by the genuine43-byte light-grid caller's call at
1069f. Public callback targets104a0/465 and106b0/256 already bind. Do not use
101e0 (middle of this function) as its start. Original candidate754 has a98
frame versus target9c and keeps row+0.5 in x87 instead of target float slot.
Local precision-on emits757 with a4 frame, extra conversion rounding and
integer bit-pattern stores for conditional float constants; reject it.
Original flags restored. Next grouped source test makes the three vector
stores/address calculations explicit and spills only the observed row offset;
no ABI/flags/assembly/root changes. That grouped version emits761/786; frame9c
and the prologue register/table initialization now agree, but independent vectors
occupy different stack slots, chained zero assignments emit reverse stores, and
VectorMA consumes its volatile scalar argument once. Next test uses a contiguous
3x3 axis aggregate, ascending zero stores and explicit scalar row expressions,
with row-base calculation inside the observed positive-resolution branch.
Contiguous axis storage gives770/786 with the full frame and axis offsets
correct; remaining differences are row-base x87 retention, two loop-control
slots, callback argument registers and final cube-call scheduling. Early row
initialization aligns its store. An explicit face pointer/count loop also770
but moves the descriptor cursor to its third component; reject that loop and
restore the simple face-index loop. VectorCopy plus scalar += does not restore
retail x87 row-base retention under this LTCG context. Do not repeat these
copy/precision/operand-order forms without new caller or TU evidence.
Existing134 procedural cases cover six
axes, sizes0/1/2/3/16/32/64, callback arguments and output guards.

# Lightmap weight row lifetime - 2026-11-04

Retail Image_LoadLightmapWeights1000fe90/605 retains image in EBP, row index
in memory, pixel cursor in EDI, x in EBX. Original589-byte draft keeps row in
EBP and loads image only after loops. A volatile row plus load-once tail gives
644 bytes and the correct1060 frame/image lifetime, but makes all four array
subscripts reload the volatile row. Native1024 directions/4096 packed bytes
pass. Next use the target-observed sequential pixel cursor and confine volatile
row access to the tail, preserving ordinary row reads in the direction formula.
Scoped volatile tail plus an ordinary row read and explicit sequential pixel
cursor reproduces all605 bytes; binding/regression still required before credit.
R_GetLightmapWeightsForDir279 and Vec2Normalize107
are already independently bound; the builder blocks Image_LoadBuiltin519.

# Fixed-function image expansion - 2026-11-04

Full retail pass10039b40 ends10039fa6 (1127 bytes), not the865-byte
candidate length. Retail expands material-image lookup and BOTH stage-state
wrappers. Forceinline on GetMaterialImage grows candidate865->1104, retaining
the standalone90-byte lookup and all2521 protected extents. Pass remains
unverified. Do not infer boundary from a candidate-length-truncated fdiff.
Retail override10038920 has six switch slots at10038984: return,return,
color,normal,specular,water. Source case order color/specular/normal/water
fixes emitted block ordering; explicit empty0/1 cases still compact to four
slots and retain the subtract2. Current helper116 remains unmatched; its
instruction stream otherwise agrees up to the switch range operation.
Function-local optimize("g",off) changes helper116->172, standalone lookup90->91
and pass1104->942. This is rejected; restore the original optimization flags.
Independent native fixture covers200 real lookup/override routes, pointer-key
misses and empty tables. No credit for tests or partial pass similarity.

# Bounds component/helper structure - 2026-11-04

Component loop using existing int i gives443/441 and passes324 independent
geometry cases. Existing MatrixTransformVector+AddPointToBounds calls give475,
also pass324, and are rejected. Shared helper definitions stay untouched.
Restore the committed443-byte matrix-typed draft and its fixture. No new
coverage. Do not repeat component unrolling or shared-helper source forms.
Next investigate another dependency rather than more floating expression
permutations in this function.

# Gamma ramp publication - 2026-11-04

Moving gamma index increment after the word store changes counter register
to targetEDX but leaves induction updates late. An explicit linearValue ramp
(+257 before store), then index and entry increments, produces exact157-byte
body10011f10. Existing I_fround assembly remains excluded. Its four callers
add475 pure C++ bytes. All2521 extents pass;20 retention negatives and576
capture/35 gamma cases pass. Sun pointer/field volatile views and alpha word
memcpy do not fix pointer scheduling; all sun edits are restored. Water
parameter cursor and delayed log2M initialization fail to resolve FFT data
promotion. Top-level volatile FFT input changes VC7.1 decoration (PAU toRAU),
needs matching declarations, but still emits529; both declarations restored.
Do not repeat these interface/source variants. FFT keeps only its observed
frame-pointer policy. Receipt:nov04_gamma_capture_checkpoint.json.

# Bounds and FFT structural probes - 2026-11-04

Static bounds1002a360/441: local volatile matrix pointer gives433 versus
original406 and matches stack frame size. Scoped matrix/index memory lifetimes
and one surface lookup per iteration give443 with the target stack slots and
retained vertex-buffer base. Matrix-typed axis replaces the flattened pointer
at both declarations and its actual instance-axis caller; code stays443.
Target-order scalar accumulation, including explicit two-step sums, does not
resolve the optimizer's product reassociation. Remaining: matrix increment
register, surface-entry scheduling, x87 product/compare choices, final-free
register.324 independent bounds cases pass (empty/multiple meshes, bones,
NaN/infinite ordered extrema, allocation/free order, guards). No byte credit.

FFT target1005ee60 endsRET1005f073:532 bytes. Frame-pointer-only pragma gives
529 versus original556; this isolated requirement was not covered by the
older aggregate-save plus/Oy-562 trial. Explicit bit-reversal scan pointer
gives545 and is rejected; original scalar source plus frame-pointer policy
retained.168 independent transform/stride cases pass. Caller1002c570/165
passes data on stack and log2 inEDX; current recipe promotes data inESI,
forcing a different water-wrapper register layout. No ABI/signature change is
justified by this alone. Next inspect caller/callee metadata; do not repeat
scan-pointer or scalar-product spelling sweeps. Whole-file/C++ goal unchanged.

# Static-model texel cache - 2026-11-04

Renderer-load reordering leaves356/341 unchanged and is removed. Per-texel
height read stops cached-stride induction and yields341 bytes, differing only
in increment order. Advancing component before column matches341 completely.
Both byte and binding referees accept it; all prior2514 extents survive.
The285-byte quantizer also resolves but contains unchanged I_fround assembly,
so only341 bytes enter C++ accounting. Protected extents now2516. Native
lighting fixture passes; eight retention negatives reject regression. No
compiler flags or assembly source changed. Receipt:nov04_static_lighting_checkpoint.json.

# Per-TU filtering and shutdown policies - 2026-11-04

Non-/GL rb_imagefilter source emits538, still not the543-byte target, and
loses21 protected extents (mostly shared rounding instances) across the DLL.
REJECTED; exact original profile/source restored. No fake roots or gate changes.
SaveLightVisHistory target10037790/94 is established by matching shutdown
callsite100130d7. Original100-byte body differs only in two immediate-zero
stores versus XOR ECX/shared-register stores. Local size policy emits93 with
wrong frame/call shape; memset and shared pointer-zero casts remain100.
All source/policy trials restored. Do not repeat these combinations.
_ReadWriteBarrier is accepted byVC7.1, but in the isolated LTCG cache probe it
retains a single cached pointer and emits94 bytes, not target111. Do not assume
an accepted intrinsic establishes the desired memory-order code generation.
Current grid111-byte draft remains uncredited; full regression now rerunning.

# Filter pass-pointer lifetime - 2026-11-04

GenerateGaussianFilterChain538/543: delayed initial pointer assignment makes
no difference. Reusing curPass at symmetric2D call changes to514 but causes
LTCG to pass filterPass inEAX, unlike the target stack argument. Both source
trials rejected and original restored. The target public-helper ABI motivates
checking this TU without/GL; no conclusion until all existing gates pass.
Draft source snapshot: build/tmp/filter_pass_lifetime_trial.cpp.

# Isolated grid compiler probes - 2026-11-04

Two actual cache routines reproduce the three remaining SIB mismatches in a
small pinned-image LTCG DLL. No renderer relinks or new production roots.
G5/G6/G7, integer-address view and word-pointer view do not change them.
Original source compiled asC, union word/byte view, and alias-policy a/w/aw
all retain the99-byte cached-pointer shape. Disabling global optimization
changes frame/argument ABI and is rejected. Explicit byte serialization emits
six byte stores, not three words. Global volatile declarations alter the
pre-call reads and register assignment and are rejected. No coverage added.
Receipt: proof/nov04_grid_isolated_compiler_trials.json. Probe files are in
build/tmp/grid_*; these exports exist only in isolated diagnostic DLLs.
Stop repeating these policies/source representations. The production111-byte
draft remains three SIB bytes away; next inspect real TU/caller metadata.

# Light-grid insertion memory order - 2026-11-04

RB_InsertGridVisLog target10035bd0/111 versus original99. Target reloads
s_vc_log for each ushort write, then reads/increments s_vc_logCount. Fixed
memcpy stores alone remain99. Function-local volatile pointer reads produce
111 but count load moves before last store. Local volatile count read/update
restores all target instruction ordering. Current111-byte draft differs ONLY
in three SIB encodings: [eax+esi] versus target[esi+eax], likewise EDX/ECX.
Volatile destination stores and integer-address addition did not fix encoding;
original ushort indexing also retains the three differences. No credit and no
referee masking changes. Native135 cache cases,54 boxes and1152 visibility
routes pass. Do not repeat these address/store spelling trials.
Raw matched GridVisLogIndex129 and GetValidGridPoint188 remain blocked by
this leaf. Physical build is diagnostic; last V3 checkpoint is5fcfc0e.

# Viewport vector grouping - 2026-11-04

PINNED matching RB_SetRenderTarget tail jump1003ec0f->1003e690 establishes
viewport target366 bytes. Vector2Set/Vec2Scale/Vector2Add/VectorMA2 form emits
354 versus scalar315. Sequential width reciprocal before height conversion
agrees with target instruction ordering but remains354. Separate origin and
center arrays do not change it; local precision policy emits422. All rejected;
original source restored.240 behavior cases pass for the initial vector form.
Snapshot retained only in build/tmp/viewport_vector_trial.cpp, no coverage.
Do not repeat these helper/precision combinations.

# Screenshot dependency group - 2026-11-04

R_LevelShot159 and R_TakeResampledScreenshot150 are exact raw hits, blocked
by R_ResampleImage. Resampler target10025d10/360 versus draft364 calls
Downsample100259a0 with stride on stack; draft passes stride inEDX.
Downsample target363 versus draft369; blue-first source assignment leaves
369 and the ABI unchanged. Rejected and restored. Original upsampler497
versus target503 at10025b10 also differs. Next inspect the sampling helpers'
argument liveness/arithmetic as a group, not isolated caller formatting.
Native fixture execution hit sandboxSIGSYS; rerun elevated before claiming
behavior verification. No coverage added; physical build is diagnostic.

# Fullscreen tracking dependency - 2026-11-04

Image_TrackFullscreenTexture149 at1000c9d0 blocks the2102-byte raw match
R_InitRenderTargets. Its original draft differs only in the first selector's
register/load order. Existing dimension helper calls and direct ternaries
both emit216; two offset switches198; width-only offset switch146;
width-default branch144. All fail. Restore original149-byte source; no new
coverage. Existing fullscreen and setup fixtures pass1152 allocation cases,
three usage paths and48 wrappers for the helper-call version. Do not repeat
selector-spelling sweeps; investigate original TU/inlining context instead.
Also failed 11-04: vidConfig width/height hoisted into locals before the
platform loop; regression lost checkpoints 0x10022b90/0x10022c30. Restored.

# World vertex copy grouping - 2026-11-04

Vector-copy helpers emit446/472, grouped fixed-size memcpy emits188/472,
and position helper with scalar texture coordinates emits461/472, identical
to the original indexed form. All are rejected; original source restored.
72 actual upload cases pass for grouped copies. No source coverage added.
Do not continue helper/copy spelling sweeps; inspect compiler/TU context.
Physical build is diagnostic;11fee6d remains last full V3 checkpoint.

# World vertex pointer traversal - 2026-11-04

Explicit source/destination pointer iteration emits462 versus retail472
bytes (indexed source461). All72 actual world-upload fixtures pass, but
register assignment and unrolled copy structure differ. Rejected; original
indexed source restored. No coverage added. Physical build is diagnostic.
Next inspect the retail unroll remainder/control flow before more traversal
spellings. Last full passing checkpoint remains11fee6d.

# Recursive parser size-policy probe - 2026-11-04

Function-local optimize("s",on) emits466/540 bytes and changes the frame,
register allocation and instruction forms throughout. Rejected and removed.
This does not justify a global flag change. No coverage added. Next select
another dependency group rather than continuing this compiler-policy sweep.
Physical output is diagnostic; last full passing checkpoint remains11fee6d.

# Recursive parser linkage probe - 2026-11-04

Removing static from Material_ParseCodeConstantSource_r still emits589/540
bytes with the same first discrepancy. Probe rejected; original linkage
restored. No new coverage. Physical build is diagnostic; committed checkpoint
11fee6d remains the last full regression proof. Do not repeat linkage alone.

# Recursive constant-source loop trials - 2026-11-04

Inlining only the evidenced first token read emits589/540. Compiler repeats
the dot-validation failure path on its recursive-tail back edge. Retail
10019b9d jumps10019a85, reusing the original validator/read block. Explicit
goto and scoped-for forms both emit731; both are rejected.136 actual test
paths pass for both. Restored the589-byte recursive draft; it and the358-byte
caller remain uncredited. Do not repeat equivalent loop spelling trials.

# Constant parser dependency cohort - 2026-11-04

Material_ParseConstantSource first-token inline boundary produces the exact
358-byte retail body at10019ca0. The full regression retains2512 extents,
but binding correctly withholds credit: its recursive parser is unmatched.
No source counter increase. Retail calls10019dca->1005fa50 for the second
read; the first expands the parser and calls ParseExt1005f690. Next recover
the recursive parser at10019a80: first token inline, later token public.
Actual136-path constant-parser fixture passes.

## Parser emission trials - 2026-11-04

Rejected /OPT:REF: it drops1140 protected extents. Original NOREF/NOICF
flags restored; no fabricated roots or extra exports. Tiny compiler probes
show that an ordinary cross-TU reader can inline at direct sites while a
constant fastcall pointer preserves the cold ECX call. In the real material
TU this produces534/587 bytes because pushback stays out of line. Forcing
the public pushback definition inline then fails to emit its required public
symbol (LNK2001). Neither trial earns credit. Restored the hash-checked
passing shared-header recipe. No more emission/flag sweeps in this cohort.

The passing recipe emits private helper copies (Com_ParseInternal3,
Com_UngetTokenInternal2); they remain an explicit whole-file layout blocker.
One source implementation is shared; this is not a claim of historical TU
provenance or final DLL structure. Full-body byte/binding gates stay intact.

# Verified material parser and PC parser layout - 2026-11-04

Material_LoadPassVertexDecl587 at100191a0 passes both referees and all prior
2511 extents. C++117113/253580=46.183847307%,722 bodies; new protection2512.
No new assembly. Actual source call is Com_Parse1005fa50, not OnLine1005faa0.
Wrong early callee labels caused unnecessary boundary trials; those labels are
incorrect. Verify target addresses before inferring names from normalized diff.

The active PC type lives in headers/PC/universal/com_types.h, not the inactive
body of common_types.h. Its tokenPos and prevTokenPos order was reversed.
Production offset guards caught the inactive-header mistake; it was reverted.
Both actual declarations now match the target, including line/backup fields.

Caller-local inline_depth0 suppresses required expansions and is removed.
Public noinline Com_Parse plus shared forced-inline core reproduces the audited
mixed sites without duplicating parsing logic. Com_ParseExt must have C++
linkage across TUs; its former static linkage caused a link failure, corrected
without extra DLL exports. Header core uses1 for newline allowance, compatible
with both declaration families; qtrue was unavailable in renderer headers.

The insertion loop uses explicit stop tests and the capacity comparison derives
from sizeof the routing array, producing retail JB/JAE and register warning
argument.97 parser cases (including a newline before the source token),24
actual token/pushback cases, both actual layouts and affected fixture batch
pass. Four retention negatives pass. Counter/retention gates are unchanged
apart from adding the immutable new-body ratchet. Receipt:
nov04_vertex_decl_checkpoint.json. Raw file equality12.903750259%; no V4/V5.

# Small helper source and candidate checkpoint - 2026-11-03

Surface-loader bit-expression probe: explicit reversed-operand assignment
still emits1503 bytes, no full-function hit. Existing blend helper remains
a123-byte raw candidate at1002d420;288 stream fixtures pass. Restored the
clearer compound assignment. This does not prove the selected draft freshly
matched; no coverage added. Avoid further bit-expression spelling sweeps.

XModelReadSurface traversal: move blend-pointer increment after reading the
current record,1548->1503 versus retail1519. All288 native packed-stream cases
pass. First normalized disassembly difference moves to instruction243, inside
unrolled blend records. Separate current-record temporary instead emits1534
and changes early register assignment; rejected. Restored selected1503-byte
trial source. Both probes exit3; ZERO coverage. Physical build is rejected
second trial, not a fresh proof for restored source. See nov03_xsurface_draft.json.

Occluder count-lifetime wave: separate immutable allocation count and mutable
loop countdown changes551->567 versus retail568. Native actual-loader tests
pass. Declaration-only reordering leaves the same567-byte mismatch. Both
byte probes reject; zero new coverage. Keep this connected partial source;
next inspect count/input register lifetimes, not more declaration spellings.

Occluder coefficient wave: explicit stores reload out->planes as retail does.
Candidate542->551/568; byte probe remains unsuccessful. Partial source retained
with zero credit. Added actual-loader fixture for empty/multiple records,
nonzero plane/edge/vertex indices, signed-zero plane-side bits, retail edge
input restart and untouched ignoreStackLevel. No canonical src/ promotion.

Occluder loader cohort: reconstructed retail pointer traversal/countdown.
Candidate587->542 bytes versus retail568; still unverified (probe exit3).
Retained as a partial work/src draft, not promoted or credited. Source removes
outer array indexing, preserving per-occluder input edge restart seen in the
retail decompile. Remaining: allocation/input pointer lifetime and inner plane/
edge address generation. Do not repeat the global parser noinline experiment.

Definition-level noinline on Com_ParseOnLine changes the material parser
599->535 bytes, confirming the caller-only attribute did not propagate through
LTCG. Full protected regression rejected this global boundary change; restored.
Target587 also inlines Com_UngetToken where this candidate calls it. Treat the
two parser boundaries as a coupled problem. No new verified credit. See
latest/nov03_parser_definition_build.log for exact regression losses.

Material cohort: retail100192d1 calls Com_ParseOnLine out of line; a caller-TU
noinline declaration does not reproduce that boundary under the pinned LTCG
build. Parser stays599 versus587 bytes; exact-byte probe failed (exit3).
All96 actual DX9 parser fixtures pass. Restored declaration; zero new credit.
Next inspect the definition and caller/callee compiler group, not pointer
spellings. Sorting differences require a register/value trace before edits.

Bounded probes: cache width/height declaration/publication order and shader
text pointer addition order both failed exact-byte checks (exit3). Restored
both sources. Full verification skipped; zero new coverage. Logs are in
latest/nov03_cache_height_probe.log and nov03_shader_pointer_probe.log.
Physical build is diagnostic;39399f4 remains the verified checkpoint.

Pointer-iterator shadow trial:70 behavior cases pass; exact-byte probe fails
(exit3). Restored source. No full binding/regression run and zero added credit.
The physical build is diagnostic; last verified checkpoint remains39399f4.

C++116526B/721 bodies=45.952362174%;+204B/+7 sincebb21ec4.2511 protected
extents retained. Transparency46 is newly matched source; six shorter-search
candidates add158B from existing C++ source. Six library extents stay separate.
The sole discovery change permits12 fixed bytes instead of16 alongside a4-byte
search run; original binding/byte/data/extent/call gates remain unchanged.
15 newly found candidates yield12 accepted extents. Before/after candidate
receipts prove all prior extents/hits unchanged. New warm files pin all gains.

The direct shadow-plane comparison removes float assignment stores and matches
retail's69-byte length, but its pointer is centered at+8 instead of+4. This
partial source improvement is kept without credit.70 actual shadow cases pass,
including all five planes, three corner offsets and negative/zero/positive/NaN.
Failed model Bool/result-flow variants were restored, as were culling product
spellings. No new assembly. Receipt: nov03_small_helpers_checkpoint.json.

# Verified buffer layout and window settings - 2026-11-03

2026-11-03 helper wave: changing R_CheckTransparencyMsaa's result from bool
to the existing byte type Bool matches all46 bytes at100118d0, including the
AL-only result normalization. Both referees/regression pass; +46 pure C++ bytes.
The actual helper fixture covers30 sample-count/HRESULT pairs, exact COM
arguments, and strict S_OK (positive HRESULTs are false).
Caching fallback values and a shared reduction label produced88/91 bytes;
restored. Culling multiplication spellings/standard dot order produce the
same71-byte mismatch; no gain. Model-name explicit-return and Bool trials
produce56/62 bytes and remain unverified. Shadow receiver one-expression
trial reduces102->88 but still rounds through a float local; no gain yet.

2026-11-03: forcing Image_GetAvailableHashLocation inline lost protected extent
0x1000cc10. Referees ran, regression rejected it; source and fixtures restored.
Width-only platform getter inline lost both protected shadow extents and was
also restored. Neither trial adds coverage.

C/C++116322/253580=45.871914189%,714 bodies; +391B/+9 bodies sincecfe7803.
The neighboring-region rule only narrows existing engine C++ raw hits, requires
both surrounding anchors at one translation, compares the complete intervening
code/padding and HIGHLOW sites, and rejects omitted functions. Independent
certification from a frozen pre-discovery seed and unchanged old-referee replay
reproduce the entire final accepted set.18 removal negatives pass. Dependencies
from the unrestricted81-row preview are NOT canonical progress.

r_buffers now has retail function order and identical offsets0/224/304/336/416/496
in a515-byte span, including padding. All6 bodies pass both referees; the exact
source is in clean src/. Ten complete files/61 emitted functions are verified.

R_StoreWindowSettings now matches208 bytes:190 code +18 table/padding. The
shared case-result labels reproduce retail JE/JGE order and share the forced
aspect stores. The existing I_fround assembly excludes190 from C++ credit;
its18 table/padding bytes are also excluded.36 assembly-bearing bodies/8601 code
bytes are excluded in total. Both ratchets reject deleting this new extent.
R_CreateDevice remains blocked by resource initialization, so adds no credit.

Native126 video cases,1248 picmip policies,1024 lightmap directions and snapshot/
discovery fixtures pass.2498 protected extents survive. The coverage publication
fixture exercises the actual shell fragment: failed producers preserve the prior
JSON; successful producers atomically replace it. No new assembly or workers.

Failed probes: image/G7 leaves fullscreen149 and picmip511 unmatched; restored
profile. Local precise lightmap mode501->581; I_sqrt calls alone unchanged581.
Precise headers break UnGetLeanFraction19; reverted. Volatile normalization
length597; Vec2Normalize593; Vec2Multiply+Vec2Normalize589, still not605. A
channel loop produces472 and is reverted. Existing shared helpers are retained
in the tested589-byte draft. Vec2LengthSq was only declared, not implemented;
its trial link failed and the call was corrected to the real Vec2Multiply.
Fullscreen counter scope and shared shutdown-image local give no match; reverted.
Volatile picmip store, BSP product order and cubemap pointer spellings add zero;
reverted. Do not repeat these exact variants or count size proximity.

Receipt: proof/nov03_buffer_window_checkpoint.json. Whole SHA/GPU smoke unfinished.

# Accepted direct-callee ambiguity resolution - 2026-11-03

Six existing C++ bodies add513 verified bytes: two angle trackers174 each,
Com_ParseFloat74, technique lookup wrappers32 each and DD drastic callback27.
C/C++115931/253580=45.717722218%,705 bodies. Source/library protection now2488
extents. No new assembly. Library/STL gains are accounted separately.

callee_placement only narrows existing raw hits using direct calls to placed
functions and rechecks full masked equality. All original byte, relocation,
binding, data, import, extent and call-closure gates remain. An independent pin
extractor used ONLY previously accepted callees; unchanged old-referee replay
accepts exactly the same set.12 C++ deletion negatives and the discovery fixtures
pass. No compiler rebuild or worker was needed. Whole texture-memory TU passes
all6 emitted bodies; clean src/ now9 complete files/55 functions.

Post-particle trials remain uncredited: fullscreen width-before-height145 and
switch-minus-one146 both lose two protected160-byte cookie initializers; rejected
and reverted. Upload local declaration order keeps282 but misses. BSP cursor
scope/VectorCopy/cross-product trials remain unmatched. Shader _clearfp intrinsic
probe emits C4163 (not available); removed. Moving its entry declaration changes
no bytes. These facts do not prove every C++ matching approach impossible.
Evidence: nov03_post_particle_trials.patch and nov03_clearfp_intrinsic_probe.txt.
Receipt: proof/nov03_callee_checkpoint.json. No pause or goal completion.

# Accepted particle source - 2026-11-03

The final source matches10011bf0/544 fully: UV table declared before the index
table, const ordinary arrays, != loop bounds, three-float xyz local and vertex
increment inside the corner-loop body. All544 bytes and bindings pass. Its real
call site disambiguates R_FinishStaticVertexBuffer10005020/73. Net +617B;
C/C++115418/253580=45.515419197%,699 bodies. Device-resource creation261
remains blocked by R_InitRenderTargets, so it adds zero. Both retention gates
now protect2450 extents and reject deleting either new accepted body. No ASM.

Volatile UVs produce x87 copies absent from retail and were rejected/reverted.
Scalar positions remove a stack slot; UV memcpy makes a countdown loop. Neither
matches. Reversing the two local table declarations alone fixes all remaining
initialization instructions after the position-array and allocator corrections.
No claim is made that the exact historical source spelling has been recovered.

BSP memcpy/side-expression/pointer-cache batch gives portal405 vs389 and
occluder570 vs568; no accepted coverage. All prior protected extents survive.
Fresh coverage snapshot: proof/nov03_particle_cloud_source_coverage.json.
Deletion negatives: proof/nov03_particle_cloud_negatives.json.

# Accepted index allocator and ongoing particle matching - 2026-11-03

Verified C/C++114801/253580=45.272103478%,697 bodies. Added the genuine
R_AllocStaticIndexBuffer10005090/72 in r_buffers, using SDK COM interfaces.
The fresh original compiler, both referees and all2447 prior extents passed.
Both gates now protect2448 extents and reject removing the allocator. No new
assembly. The existing particle fixture passes all3x1024 particles and2 fault
paths using the actual extracted allocator. Frozen coverage and rejection proof:
proof/nov03_index_allocator_source_coverage.json and
proof/nov03_index_allocator_negatives.json.

GetRefAPI ambiguity resolution previously added112 verified bytes, with an
unchanged old-referee replay and four deletion negatives. Old pending-build
entries below are historical; unsigned-byte Material_MatchToken is retained.

Particle trials: != loop exits retain the real4/6 loops instead of unrolling.
UV memcpy introduced a pointer/down-counter loop absent from the target;
restored scalar UV copies. Recovering the allocator corrected its inlined COM
failure flow and index-pointer register lifetime. Const tables + != + scalar
UV copies produce528 vs target544, with nearly identical control/data flow;
remaining stack slots suggest a three-float position local. That lifetime and
vertex-before-corner increment are under test, uncredited. Mutable tables alone,
scoped size optimization, five shader declaration variants and both picmip
assignment-chain directions failed. Failed byte probes stop before slow binding
checks and never refresh accepted coverage.

Lightmap row-cache trial620->601 vs target611 changed global register allocation
and was rejected/reverted. Do not repeat this exact cache form. Existing BSP
source remains unchanged. One build directory, no workers, no token-cost estimate
available. Whole SHA and GPU execution remain unfinished.

# Definition-order follow-up pending build - 2026-11-03

Last accepted C++ meter stays114617/253580=45.199542551%. No net accepted
C++ bytes from these resumed trials. Do not confuse matching own bytes with
call-closure acceptance. The midpoint helper1002a6d0/81 now byte-matches using
ordered volatile Y/Z minimum reads; its callee RB_GetLightingAtPoint remains
unmatched674 vs target784, so BOTH this helper and the626-byte model caller
remain uncredited. A ranking based only on why strings wrongly treated an
unplaced function as a leaf; inspect its actual direct-call graph too.

The image forceinline trial still emitted216 and was reverted. The vector
midpoint trial emitted92 and was replaced by the81-byte source above. The
sun pointer-address read reordered more of the function and was reverted.
The decoder-initialization order made no gain and was reverted.

Material_MatchToken MUST keep its proven unsigned-byte return: changing it to
C++ bool breaks protected18350/17, which the full gate correctly rejected.
Kisak bool is a structural reference, not authority over that PC evidence.
Current bounded follow-up keeps Bool and its original conversion, moves only
its definition below RuleSetCondition (prototype stays at file top), and parses
the token before loading/passing rule. This tests early/late inlining without
extra assembly, exports, roots or gate changes. The state-rule fixture now
includes the same forward declaration, matching the real TU scope.

Two original-build launches were rejected by automatic approval review because
its selected model was at capacity. Neither ran. This is service availability,
not an unsafe-action finding. Current source is pending a fresh original build;
current physical DLL/bind came from the rejected bool trial, not the fixed source.
The committed b26ed3b receipt and root verified-source snapshot remain the
last accepted checkpoint. Do not promote pending drafts or quote stale outputs.

Raw Rich/linker metadata is in proof/nov03_toolchain_header.json. Both images
report linker7.10 and contain build3077 records. Retail product0x64 count121
versus current112 is recorded, not treated as proof of nine missing source TUs.

# Shared-blocker trials - 2026-11-03

Three bounded grouped builds after b26ed3b yielded no accepted new C++ bodies.
Calling the platform-dimension helpers instead of the existing switch changed
fullscreen accounting149->216. Explicit default and intermediate-index forms
changed it144/146 and lost two protected160-byte shadow-target initializers.
Regression rejected both. All image-accounting edits were reverted.
Aspect-ratio comparison reordering retained a208-byte mismatch and was reverted.
Surface early return kept206 bytes; direct goto flow became150 because logging
was no longer inlined. Parser local-bool/arithmetic returns and count snapshots
also failed. Viewport vector intermediates315->362 were closer but not exact366.
These rejected changes are preserved in scratch/nov03_rejected_blocker_trials.patch;
canonical files were restored with the reverse patch, not truncated/overwritten.
Behavior checks passed, but do not turn them or size proximity into byte credit.

Approval review correctly rejected an earlier scripted edit that could have
truncated files; it was never executed. Bounded function patches were used.

Next wave pins actual target midpoint operand order, decoder initialization
order and sun dvar-pointer load timing. Count nothing until the full gate passes.

# Screenshot source wave - 2026-11-03

Recovered actual helper R_ScreenshotFilename10025960/60, full byte/binding pass.
Target has a256-byte level-shot filename buffer: restoring it fixes all159 own
bytes; resampling dependency still blocks acceptance. Restoring the filename
helper, counter while loop, JPEG capture inlining and second switch default
return makes ScreenShotCmd100263a0/567 byte-identical. The default must return,
not fall through into the print guard; the wrong target made a short branch
and shrank the body by4B. Binding gate still rejects the unresolved LevelShot
call chain. No credit for either of these matching-but-blocked own bodies.

Two bounded pixel-filter lifetime/accumulator batches changed code generation
but matched no new filters. Current downsample369, upsample497 and resample364
remain drafts. Do not repeat scalar accumulator, early scaledColor0, early
column initialization or split dst-base forms without new evidence. All1920
independent area/center cases pass, as do63 command cases. Existing I_fround
contains assembly; any future containing matches require separate attribution.

Four screenshot build attempts in the same output; one stale-source receipt
was rejected because source changed during its referee stage. Never compare
a fresh DLL with the prior cmp/map during an in-flight build. Final serialized
build passed all2445 protected extents and source-freshness checks. No new ASM,
exports, roots, link-order changes or compiler-profile switches.

# 2026-11-03 frame pointer ordering regression

Taking a volatile address/view of frontEndDataOut in R_InitFrameBackendData
changes other code under LTCG. The trial lost accepted extents10023af0 and
10020dc0, and the unchanged regression gate rejected it. Reverted that read
immediately; do not reinstate it to force the frame register allocation. The
frame remains unmatched. JPEG callbacks and the complete verified JPEG snapshot
were established independently before this trial; no source promotion depends
on the failed DLL. The fresh recovery build passed all2444 protected extents after the revert.

# JPEG matches and placement follow-up - 2026-11-03

Real source-level wins, separately retained: decoder785/raw image169/raw
material81/API wrapper30, encoder713/screenshot JPEG78. Net1856 C++ bytes.
Additional IJG jpeg_CreateCompress221 is a dependency, never game-meter credit.
All protected extents pass; native actual IJG encode/decode and Pillow agree.

jpeg_memory_src must inline in R_LoadJpg. Inlining alone yielded837B because
repeated cinfo->src reads remained. Capture the manager pointer once, then set
its fields; loader becomes785B and four real callers close. No matching-tool
change was needed. The source manager remains32 bytes, callbacks unchanged.

Compression's prior five-argument API was a reconstruction error. Restored
three-argument constructor and preinitialized cinfo.alloc pair. Scalar callback
preservation matches the standalone constructor221 but not inlined save713;
preserving/restoring struct jpeg_alloc as an aggregate matches BOTH. Real native
encoder and decoder fixtures pass. Do not restore allocator arguments or swap
this aggregate back to two scalar saves to make an instruction diff look small.

Cube facePixels local fixes load timing, but parameter volatile does not fix the
remaining MOV-stride/ADD vs memory-ADD difference. Frame counter/pointer locals
and volatile publication did not fix147 vs143 either. These remain uncredited
working drafts. Do not repeat these exact attempts. Original compiler profile
remains unchanged; no CPU or size pragma survives from rejected experiments.

Whole JPEG TU is NOT yet accepted. Five sparse callbacks lack placements;
root src/ promotion is blocked. A future code-pointer relocation placement pass
must retain existing gates, prove the producer and exact callback extents, reject
ambiguous/invalid pairs and replay the unchanged referee independently. The
specific five callbacks and proposed method are in HANDOFF.md. No such matcher
change was made in this checkpoint. Do not call this already verified source.

# Image/math bounded trials and dependency-ready pivot - 2026-11-02

Eight original builds in one reused output; no workers or new authored assembly.
The first attempted escalation timed out before execution; the simple established
build command succeeded on retry. No build was duplicated concurrently.

Image math trials produced NO newly accepted bodies. All old2432 extents were
retained. Reject/revert all of these; do not burn another matching pass on them:
- Lightmap-only precision mode:501B ->581B; float spills/calls move toward retail,
  but stack locals and register ownership differ.
- Reusing Vec2Normalize/I_sqrt:593B, still different temporary ownership.
- Flat4096B buffer with a sequential pixel pointer fixes the image register/pixel
  base; manual normalization still differs. Retail actually carries normalized
  Y into later columns. Target stores at1000ff06/1000ffbb pin this; the new
  fixture checks all1024 directions/4096 bytes and rejects a per-column Y reset.
- Volatile length/input and explicit sqrt(double), sqrtf and I_sqrt variants:
  best prefix matches retail's1060 stack frame, but conversion temporaries,
  compare order and division operands still differ. No exact605B acceptance.
- Cubemap explicit axis indices, reordered declarations, vector copies, a
  volatile row offset and per-component updates change754 ->761/770B, still
  different array lifetimes/stack ordering and row math. No786B acceptance.
- Fresnel sum operand reversal and size mode do not fix the x87 cleanup;
  size mode also changes frame/constant loading. /G7 on r_utils preserves the
  old accepted set but still gives203 vs target201B. Do not claim impossibility.

The pinned VC7.1 math.h confirms sqrt(float)->sqrtf(float)->(float)sqrt(double).
Extracted declarations are proof/latest/nov02_original_sqrt_declarations.txt.
All image/utility/CPU trial source was reverted before the final build. The
last complete trial patch is scratch/nov02_image_math_trials/final_rejected.patch.
Math regression fixtures remain; they pass the restored source. No guessed
volatile source spelling, CPU flag or extra helper is promoted as retail code.

Pivot: tools/ready.py lists166 zero-open direct GAME-call candidates/47090B.
This ignores imports, indirect/data bindings and calls outside its game ranges.
It is a ranking heuristic, NOT proof that all dependencies verify. For example,
R_InitRenderCmds has zero open calls there but fails binding closure on
R_InitFrameBackendData. Read bind.json reasons before selecting any candidate.
Reused fdiff.py on known source/target pairs; diagnostic ranking is
proof/nov02_nearest_ready_functions.json and scratch/nov02_priority_diffs/.
This ranking was made on the rejected trial DLL, so rerun for fresh proof.
No parser or alternate build pipeline was added. The final source batch tests:
- Material_CacheShaderText: group nameLength+1 before adding the buffer pointer,
  matching the target SIB operand order without changing text ownership.
- R_CullPointAndRadius: reverse only the Y product operands to retail order.
- R_GetModelEntityBounds: keep the existing scene-entity pointer for both reads.
The final build accepted NONE of these three drafts either. All previously
accepted bodies remained. Do not repeat these syntax-only forms expecting gains.
The final referee/coverage receipt decides credit; short instruction diffs are
not evidence of a full match. Existing shader preload and
visibility fixtures pass. Root src/ remains seven verified-only files/39 bodies.

# Verified-only source gate - 2026-11-02

Do not promote r_specularityimage.cpp to root src/ yet. Besides its matched
lookup262B, its real math header emits _logf and ?log@@YAMM@Z (11B), each with
two byte hits at10029300/10029310 and no accepted unique binding. The whole-file
snapshot gate correctly refused it. No file or manifest was changed. Root src/
remains seven fully audited files/39 emitted matches. Do not force a placement
or strip legitimate emitted helpers merely to label the file complete.

# Specular dependency closure - 2026-11-02

PINNED: the lookup needs an explicit double intermediate BEFORE the original
__min(1.0,__max(0.0,normalized)) expression. This reproduces the target x87
comparison direction and order. Both referees accept Image_BuildSpecularityMap
262B, Image_GenerateSpecularity119B, Image_RebuildCosinePowerMap202B and
RB_UpdateBackendDvars207B. The lookup inlines the unchanged header I_fround
assembly: EXCLUDE its entire262B from C/C++ coverage. Net C++528B, mixed790B.
No new assembly was written. Protect all four and preserve the old2432 extents.

The old GLM inventory reports259B for the lookup; direct decoding shows the
real RET at10029425, hence262B. It had omitted the final three-byte add esp.
The referee verifies the full262B, including the RET; do not truncate it.

Rejected: reversing clamp nesting alone277B; adding a double intermediate
with that reversed nesting262B but wrong comparisons. The original nesting
plus explicit double is the winner. Moving cubemap rowBase inside its row
loop and copying rowBase into direction were optimized to the same754B body;
no acceptance gained. Full cubemap precision mode changes integer conversion
and grows other differences: rejected, restore the original source/flags.
Do not repeat these trials. A temporary VectorCopy trial lacked a mock in the
procedural fixture; that draft was removed, and final affected fixtures rerun.

The first trial's final source-accounting check correctly refused source edited
after its DLL was linked. Subsequent trials were serialized through all gates.
The newly matched lookup also correctly tripped the fixed assembly-exclusion
set; its inlined fistp was inspected and added to the EXCLUSION, not C++ credit.
Final accounting35 assembly bodies/8411B; negative attribution tests retained.

# Image and API short-callback pass - 2026-11-02

Final receipt: proof/nov02_image_api_checkpoint.json.10 original builds in the
single existing output, no workers. Net29B verified existing C++ only; no new
algorithm body accepted. Preserve this bounded-failure record to avoid repeats.

PINNED: builtin calls and accepted Image_Alloc show semantic then imageTrack;
Mac r_image.c/r_image_load_obj.c agree on int semantic. Narrowing builtin's
formal semantic parameter to byte added30 MOVZX bytes: rejected. All genuine
callers and native fixture mocks updated together. RGB helper formals restored;
pixel output remains BGRA. Image_LoadBuiltin519B matches instructions at
100108a0 but shared-callee closure fails, so it is deliberately uncredited.
Image_Register91B still differs from retail94B in private ABI/register choices.

PINNED: specular coefficient at1019be08 is abaaaaaa46df713f, float M_PI divided
by720.0, not a full double PI literal. Restored target loop increment/store order.
The lookup at10029320/259 remains unmatched. Macro clamp, std::min/max,
by-value forced-inline min/max helpers and branch boundary variants failed;
all experimental helper/STL additions removed from production. Final source
retains the original simple clamp, corrected coefficient and real loop order.
Retail preserves NaN (target parity branch); the initial claim otherwise was
wrong and corrected. Quantized pixels alone hid the difference; the final
fixture records pow exponents and confirms31*256 NaN exponents for NaN shift.
The wrong NaN-to-upper variant fails. No NaN behavior improvement is claimed.

Water squared-norm operand/assignment-order probes failed. r_water_load_obj.cpp
is restored to HEAD. R_WatersEquivalent240B and R_CreateWaterSetup115B remain
unmatched. Do not narrow their integer fields based on scheduling guesses.

Verification gap found: old placement used direct E8/E9 only. GetRefAPI's real
C7 05 relocated callback stores independently pin six <=12B known functions.
New placement requires both operand relocation pairs, .data destinations,
non-conflicting proposals, exact target inventory start/size and masked equality;
all existing downstream checks remain. No global RET search or gate weakening.
Independent old-referee replay with only those six candidate addresses supplied
accepts exactly the same set as the new checker. Both retention gates reject
removing each of the six (12 negatives). Net29B, not newly written algorithms.

## 2026-10-27 - particle cloud constants and submission

rb_tess now owns the real particle driver and its three shader-constant helpers.
Source uses existing VecNCompareCustomEpsilon and matched Vec3Normalize. PC draw
args4096/2048/0, declaration2,20-byte stream and no DX7 early return are retained.
Axis49/RGBA48 publishing, per-coordinate squared epsilon, signed projection
fallback and Z/Y/X matrix accumulation follow primary. Native494 cases pass.
Original compiler/referees retain2381 extents; new bodies still unmatched.

Primary loads all nine view-matrix coefficients before writes; explicit3x3
snapshot restores alias behavior and moves candidate rotation79 to134 vs158.
GCC native1/255 expression retained excess precision (byte61 gave3e74f4f5 while
retail float factor yields3e74f4f6). Source now spells the exact pinned float
0.003921568859368563f at1019bd54; all256 byte values match. No volatile tricks,
new assembly, source flags, roots, exports or TU. Native epsilon hook checks
actual argument bits3a83126f; a host floating-literal comparison was unreliable.
Full161 fixtures/independent audit pending; zero new byte credit at this entry.

## 2026-10-27 - skinned-model tessellation

rb_tess now has real cached/uncached skinned helpers and public dispatcher.
It reuses matched XSurfaceGetTris1002ce40/120, original backend VB ownership,
buffer binding, flush/overflow/log/copy/draw helpers. Actual empty TessBad is
pinned at1003ef20; no placeholder fills another dispatch role. The shared
r_vb_state_t+8 field is corrected from a function-pointer placeholder to the
real typed Windows vertex buffer, matching r_local and the producer; size12
and field offset8 unchanged. Full original build retains2381 extents.
Native1255 paths pass; no new byte acceptance. Candidates cached274/276,
uncached278/304, dispatcher20/38, bad1 unplaced. No syntax/register sweeps before
restoring the full real tess table/caller context. All160 fixtures and independent2349-code/9387-data union audit pass.
Receipt: proof/skinned_tess_checkpoint.json.

Next entity table1004110c is read directly: type4 sprite1003fb50,5 rail10040c00,
6 particle10040f30,7 quad1003fba0,8 line10041030,9 cylinder DX7=100401a0/other=
1003fdb0. Physical block order differs; do not map by linear disassembly order.
PC particle draw args are4096 vertices/2048 primitives/baseIndex0; reference's
zero counts/baseIndex2048 and DX7 early return are wrong for the PC driver.

## 2026-10-27 - restore rb_tess and shared Windows vertex-buffer ABI

New original rb_tess.cpp TU, located after rb_surface in the current source
order, restores polygon, optimized world-triangle, cached-model and rigid-model
drivers. rb_state owns the original public matrix-stack push. Raw Mac STABS
confirms all names/TU owners. Primary PC confirms world68/DX7world32 vertices,
polygon declaration1/fan indices, separate ordinary/optimized counts, cached
source2/65536 vertices and count publication BEFORE Com_Memcpy (world triangles
publish AFTER). Native2129 surface and386 rigid routes pass. Original byte/binding gates and all159 fixtures pass. RB_PushMatrixStack
adds46 C++ bytes at1003e480; all2380 old extents survive and ratchet2381 rejects
its removal. Independent union audit passes. Explicit matrix stores reduce
rigid512 to417, still unmatched; no further syntax/flag sweeps. Other three
drivers remain unmatched. Receipt: proof/tess_surfaces_checkpoint.json.

First cached build caught Material's actual info.name member. Rigid linking
then exposed an existing union/struct vertex-buffer tag mismatch across TUs.
The real SDK declares a struct COM interface; active reference headers requested
PAT union while RB_ChangeStreamSource supplies PAU struct. Corrected all three
active header declarations together and removed the matrix-shaped Mac fake
payload: usage is opaque pointers only. No casts, ABI wrappers or roots. The
inactive common_types.h #if0 body was not changed. Always read active
cod2_types/cod2_defs/PC headers, not that disabled legacy body.

## 2026-10-27 - PC text command graph

PINNED primary RB_LookupColor10032370/76, cursor10032400/144,
text10032560/743 (inventory740 omits three epilogue bytes), quad10032890/440, space10032a50/442 and commands
10032c10/73,10032c60/51. Two text handlers now have actual source and existing
vertex/surface/matrix helpers. Raw Mac STABS confirms source owner, static
RB_DrawTextWithCursor, one function-local color_table and public glyph lookup.
The PC has one foreground/shadow/cursor pass, BGRA output with original alpha,
signed time/256 cursor blink, count+2 color escapes and no glyph budget cost for
newlines/CR. The reference's extra .25-pixel draws and alpha-low-byte path were
rejected. Space quad uses ushort index cursor even above65535, and reversed
3,0,2 / 2,0,1 winding. First header placement collided with r_init's later gfx
include; command records moved into their backend consumer, Font/Glyph shared
through r_font.h. No root/export/TU or duplicate table added. Original glyph
lookup body unchanged, static linkage corrected to its actual public role.
Native1207 routes and all157 fixtures pass; all2380 extents and independent
coverage audit pass. Zero new verified bytes; emitted bodies remain unmatched,
static2D/handlers await the real command table. Receipt: proof/text_graph_checkpoint.json.

# Reconstruction attempts

## Model/record ordering trials and real backend dvar dependencies

Two bounded debug endpoint trials (explicit per-endpoint sum and then local
precise math) retain2380 extents but fail985/959-byte matching; both reverted.
Moving entity/scene pointer declarations before copy makes both helpers129
bytes, still unmatched; reverted. An early Python native fixture read the DLL
during link and got SIGBUS; discarded that run and serialized its passing rerun.
Evidence in scratch/codex_1026_model_order/result.json and
scratch/codex_1026_entity_order/result.json. No impossibility claim.

Restored real Image_RebuildCosinePowerMap202 and backend dvar-update207 source
in r_image/rb_backend, reusing existing lookup generator/texture/state helpers.
422 native routes and all156 fixtures pass. Incorrect initial activeStateBits
assert0x88 was caught at compile; actual arrays/header and matched DxState base
pin0x2008. Existing assembly-bearing backend file is an unchanged prefix plus
C++ only; source_coverage hash reviewed with exact prefix/no-assembly proof.

Candidate sizes200/202 differ from retail202/207 in stack/call cleanup. One
8-byte lookup-buffer alignment hypothesis makes body187 and loses protected
Image_Create2DTexture; rejected and restored ordinary byte[8192]. Mac STABS
also confirms that byte array and double baseInterpolant/exponent locals.
No filler/padding/extra roots/TUs/exports/assembly are retained. Alignment and
all prior failed trials are saved, not progress credit.

PC backend table has33 nonnull entries; only entry0 is NULL.26 handler source
definitions exist, but seven remain missing. Static handlers mostly disappear
from the official link until a complete real table/driver exists. Reference
NULL placeholders must not be imported. Current inventory is in
scratch/codex_1026_model_order/backend_source_roles.json and backend_primary_heads.json.

## Ref-entity callback and unique short returns

Real source10023db0/209 and two128-byte helpers is in r_scene, reusing the real
allocator/model/draw graph. Native2708 routes pass; full155 fixtures pass.
Candidate sizes201/128/125 remain unmatched. Token2 is four writable bytes
before the existing stride table, not the Mac six-element array. No extra roots.

Existing R_GetMaterialName is exactly the sole retail seven-byte sequence but
fell below the discovery threshold. First global short rule was too broad:
1/3/5-byte ambiguous hit lists truncated at8 prevented old caller placements,
and the2376-extent guard rejected it. Final discovery only adds unique,
unrelocated6/7-byte straight-line returns. All1/3/5-byte, ambiguous, masked and
control-flow short bodies retain caller placement; all old acceptance predicates
remain unchanged. Four new leaves13 C+++13 SDK bytes; all2376 retained and2380
protected. Existing short fixture keeps old assertions and adds negative cases.
Failed/final evidence: scratch/codex_1026_refentity/short_discovery and
proof/ref_entity_discovery_review.json. No failed-trial credit is retained.

## Model publication, frontend dispatch and draw path

Restored real R_SkinSceneDObj and R_SkinXModel, the two original entry wrappers,
R_SkinGfxEntity, all eight frontend cases, R_DrawModel and R_AddXModelSurfaces
in their original source owners. Reused cache/upload commands, DPVS state,
R_AddDrawSurf, debug rendering and colorCyan. The temporary skin buffer cap is
0xa00000; material cap4096 and surface-byte cap0x20000 use PC conditions and
warning strings. No extra root, export, TU, assembly or dispatcher stub.

Mac STABS distinguishes R_ProcessFrontendCmdInternal(type,data,context) from
R_AddFrontendCmd(type,data). The first draft conflated these names; corrected
the dispatcher and its context-zero wrapper, all callers and native fixtures
before sealing evidence. No erroneous name received accepted byte credit.

One source/signature trial restores Mac debug argument order (scene,entity,obj)
and static pre-skin/model helpers; original public skin wrappers keep the static
model body in the real graph. Packed index postincrements give the retail82-byte
size but no byte hit. Debug Box985/Axes959 now differ only in a single normalized
floating-point expression ordering each; bindings still do not close. This is
not a compiler-impossibility conclusion. A bounded caller-local /Op pragma
trial still gives no hit and preserves all2376 extents; reverted its unnecessary
flags. Packet: scratch/codex_1026_cache/debug_precision_trial/result.json.

Target table101a5a30 is eight writable bytes, not const rdata. Corrected owner
s_XModelSurfaceSize in r_scene and added a linked-section/byte check. Target
100246dd calls the existing draw helper, so retain a separate helper with
noinline; this reduces the candidate submission399->293 bytes (retail286).
The helper's body remains unmatched; native polygon and model tests pass.

## DPVS owner and cache publication

PINNED DPVS STABS size 108 and PC fields replace eleven split owners, not a
new padded buffer. First compile collided with reference DpvsGlobals/Debug:
use DpvsState and the existing correct five-byte Debug type. All old extents
survive; actual PDB configuration displacement is +108. New ABI/flags fixture
brings the suite to 149. Receipt: proof/dpvs_state_checkpoint.json.

PINNED cache bodies 1002acd0/215, 1002b790/82, 1002b7f0/193 and 1002b8c0/87
restore actual allocation, packed copies, upload and LRU. No stub dispatcher.
First compiler result accepts only the 87-byte LRU; others are 215,72,200 bytes
versus 215,82,193 retail. Register/prologue and pointer scheduling differences
remain; no compiler-impossibility claim. All 150 fixtures pass; new protected
extent and independent coverage audit pass. Native tests give no byte credit
to the other three bodies. Receipt: proof/cache_publication_checkpoint.json.


## Resumed for full retail identity: raw-image API and decoder group

PINNED raw registration chain10017290/29,100172b0/30,100171f0/81,
1000fc30/169 and10014940/785 restored in r_material/r_image_load_obj/r_jpeg.
Actual PC default predicate returns the raw pointer on equal resources, unlike
Mac source. The JPEG loader preserves original ownership/failure paths and
backward BGR expansion. Original IJG6b decoder modules come from the same
SHA-pinned upstream archive as the encoder; only decoder creation preserves
CoD2's per-object allocator pair. PC memory-source callbacks/32-byte record are
reconstructed, not replaced by a stdio or streaming adapter.

First compile exposed duplicate a1_d3d/r_local types and Windows INT32 vs IJG;
use the shared r_local definition and a TU-local IJG type rename. Missing upstream
jdhuff.h produced C1083; the failing container was stopped and the authenticated
header added before a fresh build. No concurrent compiler-input edits.

The combined codec exposes two symbol-loader defects: C statics with equal
names overwrite one another, and the LTCG map itself can report the wrong owner.
PDB lproc VA owners distinguish jccolor/jdcolor grayscale_convert, and source
ldata now gets module identity like archive data. Empty PDB labels must stay
empty. Predicates still require exact bytes, relocation/import agreement,
one-to-one data binding and closed real callees; no mismatch is accepted.
The first rejected full bind had398 old extents missing; scoping restores the
encoder graph. Empty-label qualification was rejected when it fabricated a
single module-wide anonymous symbol and broke image upload proofs.

A remaining library regression is primary-proved decoder drift in memmove:
linear disassembly enters three HIGHLOW pointer entries and emerges misaligned,
inventing a jump to1255ddb7 outside the image. Shared instruction decoding now
skips data when an instruction starts inside a relocation operand, then resumes
at the next byte after that pointer run. Real relocated instructions and real
external calls remain checked. Retail/candidate memmove and synthetic positives/
negatives cover this. It is an instruction-discovery correction, not a new rule
allowing unmatched code or an external-call bypass.

After those corrections2461 binding rows passed with every1987 prior row's
address/extent preserved; the source meter correctly stopped on an additional
I_fround instance10001810/33. This unchanged allowed header assembly body must
be excluded too: preserve all31 previous exclusions, then add this33-byte body
(32/7820 total), never credit it as C++. Final source accounting remains gated.

Unique placements from every codec TU establish their non-overlapping retail
order. All codec TUs are now in that evidenced order, including inverse DCT
AFTER jerror/forward DCT and quantizers AFTER memory manager. See
proof/jpeg_contributor_order.json. Final build/gates/full fixtures pending;
intermediate counters above are diagnostics, not the accepted final checkpoint.

## Whole-file checkpoint: discovery and private-symbol ownership

PINNED short RET/constructor leaves were omitted by the six-byte discovery
threshold, blocking genuine original-library caller graphs. Including all short
bodies also disturbed24 old library proofs through E9 jump thunks; rejected that
trial (scratch/codex_1026_wholefile/short_all_trial). Kept the original specialized
five-byte E9 route and enabled other nonempty short bodies. All old rows survive.

PINNED PDB module records store actual COFF member first, archive second. Bare
private ldata names conflate distinct memcpy.obj/memmove.obj UnwindUpVec tables.
Qualifying only archive-local ldata by archive/member fixes identity without
changing public/source symbol names or binding predicates. Accepted _memmove829,
___sbh_free_block792, _free113 and connected original SDK graphs now close.
All1496 old rows retained;1987 accepted;152145 added dependency extent bytes.

Read-only retail_coverage.py replays the unchanged referee, freshly rechecks code,
counts only closed roots and bounded initialized data, and derives HIGHLOW entry
credit. Unknown zero-only objects/trailing padding, BSS, headers and authored asm
are excluded. Frozen proof/retail_50_coverage.json gives55.382328540% of the full
1851392-byte retail file; exact same-offset equality remains9.461367447%.
All144 fixtures pass; final freshness guards reject stale DLL/binding proofs and
pass the final focused test plus complete report replay. Independent union/byte
audit agrees. Paused at requested checkpoint; no new compiler source/layout wave.

## 2026-10-23 sun commands and JPEG dependency boundary

PINNED28cd0 ends29009 (826 bytes, not inventory832): sprite material/default,
sprite size, flare material/default, half flare min/max sizes, float degree
factor1019bd8c, six cosines, six float seconds*1000 then biased I_fround values,
forward AngleVectors and hasValidData1. Material track is6. Size factor0.5,
time factor1000, rounding bias2^-30 are primary constants. Existing assembly
helpers are reused with no new definitions; this body is unaccepted. Any later
matching inline expansions MUST be separately attributed, not added as C++.

Load291c0/102 uses sun/%s.sun; missing reads warn/return without free. Zero
length still parses. Parse true populates before free; parse false still frees.
Load command29010 checks argc2, sv_cheats101ce6bc, then rgp.world. Save29080/101
serializes21 named dvars to8192 bytes, then writes strlen bytes; write status
is ignored. Save callback290f0/46 only requires argc2. Both save bodies pass
both referees (+147 C++), all99 fixtures pass, and both new loss controls reject.

JPEG next: active source has no R_SaveJpg14670/713 or JPEG library TU. Existing
R_LevelShot in r_screenshot_capture.cpp must be reused, not rewritten. Primary
R_SaveJpg inlines object/error setup:368 bytes cleared; allocation callback
14610 stored at cinfo+18, free callback14620 at+1c (source14610 forwards RI
Z_MallocInternal;14620 forwards Z_FreeInternal). The plain reference PC/jpeg-6
header reports IJG6b/version62 but lacks those per-object fields and has a
one-argument jpeg_std_error. This is NOT proof of a drop-in ABI. The old verified/
Mac draft's hard-coded offsets are not primary evidence. Recover the actual
small header/allocator/error modifications, then compile/reuse original IJG
members in a bounded batch; do not hand-reverse the whole library or silently
replace it with modern libjpeg-turbo/D3DX JPEG. No files copied/added for JPEG yet.

## 2026-10-23 material/cache command closure

PINNED Material_ReloadTextures17640 ends17702,195 bytes, not the oversized
inventory range. Snapshot ushort textureCount once, then select each unique
non-water/non-null image by unsigned descending address; reload the live
texture-array pointer on each scan. Reuse Image_Reload/Image_Release/file load,
not duplicate memory accounting. ApplyPicmip17730 ends17894,357 bytes; skip
water/null, noPicmip forces two zero bytes, otherwise reuse Image_PicmipForSemantic.
ONLY changed platform0 releases, assigns both bytes, loads and raises ERR_DROP
if necessary. The05290 callback is a separate5-byte tail call, not a dummy.

Reload command178b0/137 requires argc2 and an already registered material.
Missing-name printing uses va's output as the Printf FORMAT, as primary does;
do not quietly fix that behavior during original reconstruction. Bind16 white
samplers first using LIVE state/white pointers (3ec50/33), then sorted reload.
The white binder and existing-cache stats2bb90/84 pass both referees (+117 C++),
all1284 old extents survive and1286 are now protected. Both removal negatives
reject lost bodies. All98 fixtures pass (26 material-command +48 stats routes).
No source/flag spelling sweeps; other new bodies remain unmatched.

## 2026-10-23 higher device and hardware startup

PINNED128b0/271 captures HWND BEFORE presentation setup; calls CreateDeviceInternal
with40h, then _controlfp(20000,30000) and(8001f,8001f) even on failure. Success
clears deviceLost, uses multiGpu101ce6b0/gpuSync101ce6c8, stores window settings
and backEnd.sceneViewport.width/height1072dde8/1072ddec. Do NOT create anonymous
viewport globals or confuse these fields with dxState. Resources must succeed
before Dvar_ClearModified(gamma101ce62c), systems12040 and window publication.
Source changes do not establish historical helper names/TU grouping.

PINNED12c20/91 reduces AA if>1, else refresh index if>0 and live Hz>60,
else mode index if>0 and(width>640 OR height>480). Thresholds are strict.
Hardware12c80/289 checks dx.device only on ENTRY. It calls existing systems
and returns for a cached device, otherwise ignores CreateDirect3D's return,
loops setup/create-window/create-device, lowers settings or prints four exact
messages then Sys_DirectXFatalError. A returning fatal continues the loop.
Success hides splash, sets targetWindowIndex0, ShowWindow(hwnd,5). No added
window/device cleanup, fake success or authored assembly. Native tests cover
48 higher-device +361 hardware cases, plus all1204 retained creation cases.
All96 fixtures and1284 protected extents pass; these source bodies are NOT V2.

Next PINNED registration52c0/151 commands/targets, in exact order:
screenshot052a0, screenshotJpeg052b0, imagelist0d940, r_applyPicmip05290,
reloadmaterialtextures178b0, r_loadsun29010, r_savesun290f0,
r_smc_stats2bb90, r_smc_flush2bbf0 (all addresses have10000000 base).
Do not attach unrelated callbacks merely to retain the table. R_Init12f80
also calls global init12e70, command/backend setup20b50/29430, hardware12c80,
font registration0bce0, sin/FFT tables, actual collision import and timing
benchmark3a9d0. Recover their shared fields/callees before exposing the API.

Reinspection of current source AND bind.json confirms existing accepted
R_InitGlobalStructs12e70/109, R_InitSinTable12ee0/43, R_InitModelDObj12f40/51,
RB_InitBackendGlobalStructs33f80/64. Existing asserts pin rg31a0, rgp10f0 and
backEnd36b60. These are NOT missing reconstruction; reuse rather than re-derive.
ImageList0d940/1070 and actual cache flush2baf0/111 already match too. The
command entry2bbf0 is a separate five-byte jump to that real cache flush.
Stats2bb90 ends2bbe3 (84 bytes), reads existing s_cache.stats allocated/used,
prints allocated*(100/65536) and, if allocated!=0, used*100/allocated. Target
single constants1019bd60/5c are0.00152587890625/100.0; no new stats globals.

## 2026-10-23 material/system startup closure

PINNED Material_Init173e0/124 clears materialGlobals299c, preloads shader text,
registers28 entries1018e988 and optional12 at1018ea68 (r_testFillEnable101ce79c),
then raw helper17190/88 and name-only rebinding into rgp.rawTexdef10e4.
Native32 tests independently compare all40 names/destinations to primary data.
Helper17350 is71 bytes through17396, not the inventory's64. All four new
bodies (three material helpers + systems12040/116) have byte-shaped candidates
but rejected callee bindings. Do not turn those into credited matches.

PINNED systems12040 calls image init, material init, resets real rg water count,
registers light_dynamic, clears five32-byte fogs and84-byte NORMAL debugGlobals,
then fogIndex and five limits, registered=1. It does NOT call reference-added
R_InitFonts. Fog starts146c, fogIndex150c. All94 fixtures/1284 prior extents pass.
Higher device128b0 is next: controlfp(20000,30000), controlfp(8001f,8001f),
gpuSync0 when multiGpu otherwise r_gpuSync, video/target sizes, resources,
clear gamma dvar modified, systems and window publication. Reconfirm ownership
and exact prototypes before implementing; no new anonymous DAT storage.

## 2026-10-23 renderer-owned water setup storage

Following material fixup1c4e0 exposed a real ownership defect: water loading
used standalone sceneWaterMapSetupsCount/sceneWaterMapSetups globals, while
the retail storage is INSIDE rg at+1028/+102c (101d5d28/101d5d2c). Startup12040
clears that rg count. Separate globals therefore disconnect map resets and
material-created water. Remove those two duplicate source allocations; all
load/reuse/shutdown accesses now explicitly use rg's original fields.
Compile assertions pin sizeof(water_t)=68, count1028, array102c, fog146c.
No new buffer, compatibility alias, root/export, TU, flags or assembly.

Native40 actual-source routes cover lookup reuse, capacity16, creation into
the renderer-owned slot, incrementing the LIVE count after creation callbacks,
and count-only shutdown leaving all16 records untouched. Existing water math/
NaN fixtures still pass. A larger .data size gap after removing a duplicate
is correct progress: section-size similarity was never proof of real ownership.

Next material source is now bounded: binary fixup1c4e0/603 -> file loader1c740/
171 -> existing hash/add/duplicate helpers plus register17100/144. Use common
MaterialInfo.name/refImageName offsets0/4, textureCount34/constantCount36,
techniqueSet38/textures3c/constants40. Texture entries stride12; constants20.
Semantic5 relocates MaterialWaterDef, builds water_t and calls the real owner-
repaired R_LoadWaterSetup. The zero store at1c57e [esp+58] occurs AFTER pushing
the water pointer: it initializes water.image(+40), NOT writable.floatTime.
Do not invent a zeroed aggregate. DX7 skips image semantics3/4; other image paths
use the real Image_Register, with track from the material caller. Reuse existing
interning, cached technique loading and Material_ValidateTechnique rather than
creating parallel caches or guessed success paths. No new material loader has
been claimed complete here; these are pinned implementation constraints.

## 2026-10-23 shader-source cache preload

Preload1c930 ends1ca4f:288 bytes, not282. Reuse the EXISTING8-byte mtlLoadGlob
and12-byte GfxCachedShaderText entries in r_material_load_obj.cpp. List hlsl
under materials/shaders/ and materials/shaders/lib/ with behavior0/track20;
publish the combined count/table, load root then lib files, sort, free LIB list
before ROOT list. The output base is captured for each loading loop, reloaded
between loops and before sort, matching primary ownership rather than caching
a whole stale snapshot or making another database.

File helper1c7f0/173 builds a64-byte materials/shaders/%s%s path, opens with
unique1, and allocates ONE align1 block for prefix+name+NUL+text+NUL. Publish
name/text before FS_Read, close before the final NUL/textSize stores. The target
does not check open/read results. Native tests preserve short-read tail bytes
and the negative-open calls instead of silently adding new failure handling.
The table allocation uses Hunk_AllocInternal; entries use Hunk_AllocAlignInternal.

Comparator1c8d0 ends1c922:83 bytes. It is bool(const entry&,const entry&) using
CASE-SENSITIVE strcmp<0. Existing binary lookup10018250 uses _stricmp; mixed-case
sort/search can therefore miss an existing entry. Preserve that original quirk.
1ca80 is VC7.1 std::_Sort, NOT another game algorithm to reverse. Use actual
<algorithm>/std::sort with that function-pointer comparator, just as the existing
display-mode reconstruction reuses compiler-library templates. Any matching
std helper is dependency coverage, never newly authored game credit.
Nine native scenarios include0/1/2/33/80 root files, library prefixes, all text
ownership/termination, lookup, empty lists, short/negative reads and the original
case-sensitive sort mismatch. New source has no flags/TU/global/root/assembly.
The first compile exposed legacy global typedefs named min/max in common_types;
VC7.1 xutility cannot parse its function declarations after those aliases.
Include <algorithm> BEFORE the legacy view. The retry compiles without changing
that reference header, adding macros/flags or implementing a replacement sort.
That retry binds the83-byte comparator plus THIRTEEN std templates /2696 bytes
through both unchanged referees, with all1270 previous extents retained. Only83
is new authored C++ credit. Preload/file helper source remains unaccepted.

## 2026-10-23 image startup publication

R_RegisterBuiltinImages1000d560/276 publishes white/black first. DX7 (renderer2)
registers water color and returns, leaving DX9-only image fields untouched.
Other renderers register identity normal, specularity, light-grid0, light-grid1,
then lightmap weights in that order. All use track0/semantic1. Reuse the real
Image_Register; its known-name lookup/builtin/error paths are the same source
steps inlined by the primary for white/black. No special placeholder allocator.

R_InitImages1000d880/124 calls existing R_SetPicmip then those registrations.
It binds16 samplers using the LIVE dxState.samplerState and LIVE rgp.whiteImage
on every call, NOT backEnd state (10766764 is dxState+20e4). Then reuse existing
Image_AllocProg(12,4) for $raw and publish rgp.rawImage/rawTexdef. Set sampler32h,
semantic0 and union image; preserve rawTexdef's name and padding bytes.
The primary field stores and array bounds are fixture-pinned. New compile
asserts check common-view dxState sampler20e4, rgp white1008/raw1098/water10a4/
rawTexdef10e4, and texture-definition offsets4/5/8. No new global/header/TU.
Native44 routes cover renderer changes during registration, live sampler/image
mutation, error order and untouched branch fields. Existing576 capture/gamma
paths still pass after narrowing that fixture's extraction to its actual source.

Next material initializer173e0/124 clears0x299c bytes at101d7fc8, calls shader
source setup1c930 (lists hlsl in materials/shaders/ and materials/shaders/lib/),
registers28 table entries at1018e988 and optionally12 at1018ea68, then17190.
Its final raw-material texture fixup compares offsets38/3c/40 on raw/default
materials and reuses rgp.rawTexdef; do not guess it is a generic reload loop.
Registration helpers17350/64 and17190/88 both call17100. Those closures need
actual recovery before adding Material_Init or finalization12040 with unresolved
links. This evidence is a next-source map, not newly accepted reconstruction.

## 2026-10-23 builtin/file image and light-definition closure

The519-byte builtin dispatcher selects exactly ten case-sensitive names:
$white,$black,$identitynormalmap,$specularity,$outdoor,$lightmapweights,
$lightgridweights0,$lightgridweights1,$watercolor,$sunhalfangle. The primary
does NOT select a checker/default generator. Reuse the already restored solid,
specularity/lightmap/light-grid/sun creators. Identity-normal BGRA is255/128/
128/128, not alpha255. Water BGRA starts77/64/51/255; callback replaces alpha.
Unknown builtins print through actual Com_Printf10061c80 and returnnull before
allocation. Image_Register1000d200/94 then raises the normal failed-image error.
Cache hits return unchanged; ordinary files allocate category3 and use the real
Image_LoadFromFile. On failure the published allocation is not silently removed.
Builtin category is1. Input track is int, semantic narrows to a byte only for
the builtin call. This is pinned by Image_Alloc stores+0xa semantic/+0xc track;
the earlier note calling light argument5 a semantic was wrong and is corrected.

Water callback107e0/98 normalizes the direction through existing Vec3NormalizeTo,
copies all four packed color bytes, then computes existing FresnelTerm(1.0f,
1.333f,normalZ)*255 and uses the old I_fround for alpha. The float payload is
3faa9fbe. Constructor10850/70 uses a16-resolution cubemap,6144 stack bytes and
passes packed color BY VALUE. No pointer into a transient color stack record.
Native54-route fixture compares the actual float bits: GCC i386's extended-
precision comparison against a decimal float literal was a fixture artifact,
not a production source bug. No production flag/rounding sweep was made.

Outdoor lookup20950/201 writes512x512 bytes into the EXISTING OutdoorGlob.pic.
Rows/columns use the prior texel-center helper, trace height, scaleZ/addZ and
clamp0..255. Candidate reuses I_fround(encoded-.5f); original instruction shape
subtracts double(.5-2^-30) before FISTP. Exact instruction tuning stays deferred.
Eight complete native maps check clamped pixels against that primary conversion
model in four rounding modes, every trace coordinate, guards and ownership.
This bounded behavior evidence is NOT byte equality or all-FP-status proof.
Image creator20a70/136 allocates262144 hunk-temp bytes, uploads L8 withflags3
and frees the CURRENT global pointer afterward. Upload uses the pointer saved
before Image_Setup. Retain the global's dangling value; no extra clear/reset.

The single light registry at101d7eb0 is260 bytes (count and64 pointers). New
r_light.cpp owns it. Shared24-byte GfxLightDef/8-byte GfxLightImage view replaces
the shader's private duplicate; offsets4/12/20 are asserted. Packed loader
150e0/172 allocates the24-byte definition and name separately, reads a leading
type byte and two sampler+NUL-name entries, then copies/lowercases the owned
name and frees the file. No new file-format guard/version check exists in the
primary. Empty file is freed; negative read is not. Image entry15090/68 skips
empty names, otherwise Image_Register(name,track5,semantic1).

Registry14c60 ends14d52:243 bytes, not235. Comparisons call CRT _stricmp at
100f78cf, not strcmp; cache reuse is case-insensitive. A missing name retries
light_dynamic without inserting a missing-name alias. Missing default raises
the actual ERR_DROP. At capacity64 print all loaded names then call R_Error.
PINNED original bug: the capacity format expects name and count but the target
pushes ONLY count after the format/code. Source preserves that call, with an
explicit note; the native error mock verifies the one-argument contract without
dereferencing64 as a string. Do not silently repair retail while reconstructing.
Native21 routes check packed fields, missing/zero files, hunk ownership, case
reuse, repeated fallback and both error branches. The92 image routing cases and
54 water cases pass. Source needed for real startup is restored; only unchanged
referees may turn any of these bodies into accepted coverage.

## 2026-10-23 video configuration and monitor fallback

Monitor dimensions10011560/132 uses adapter monitor bounds only in fullscreen.
Successful GetMonitorInfoA returns its raw width/height without validation.
Failure tries GetSystemMetrics0/1; use them only when both positive, otherwise
fall back to the current video mode. Windowed mode does not query the monitor.
Source belongs to existing r_monitor.cpp; no new imports or globals required.

Video storage100115f0 has190 code bytes through116ad, two padding bytes and a
four-pointer selector table116b0..116bf. Table order is auto,4:3,16:10,16:9.
The auto path computes float16*height/width, NOT16*width/height, then uses the
PREEXISTING I_fround bias9.313225746154785e-10. Rounded values<10 select16:9,
==10 select16:10, >10 select4:3. Invalid selectors preserve prior window aspect.
Pixel aspect is modeHeight*windowAspect/modeWidth. Mode size/frequency/fullscreen
are stored before the monitor query. Existing r_init.cpp owns vidConfig; no
new authored assembly definitions. If this body matches, its old-helper inline
assembly must be excluded and its18 non-code bytes treated separately. Native
tests use a target-biased nearest-round model, not a byte-match claim, and cover
126 finite video/monitor paths. Do not tune FP instructions under structure-first.

Important startup naming correction from primary:10012040 calls1000d880 image
initialization and100173e0 material initialization, NOT generic reload helpers.
Its next asset literal10194250 is light_dynamic;10014c60 registers a GfxLightDef,
stored in rgp.dlightDef+1028. Do not guess Material_Register or defaultMaterial.
The existing full material/image initialization and light-loader closures still
need recovery. The light registry is count101d7eb0 plus64 pointers101d7eb4.
Confirm complete loader150e0 and registration RET boundaries before implementing.
Registration's RET is14d52:243 bytes, not inventory235. Loader150e0/172 reads
lights/%s; negative read returnsnull, zero read frees the buffer then returnsnull.
Two packed image entries each contain a sampler byte and a NUL-terminated name;
15090/68 calls Image_Register(name,track5,semantic1) only for nonempty names.
Image_Register1000d200/94 calls existing lookup, then either builtin108a0/519
or category3 allocation plus real file loading. Builtin failure/file failure
raises the same primary error, not a placeholder fallback. The builtin dispatcher
at that checkpoint still needed outdoor/water creators alongside the restored
solid/specularity/lightmap/light-grid/sun helpers. No default checker is selected
by this PC dispatcher. Do not introduce unresolved light source
or silently skip $ names to make a partial startup graph link.

## 2026-10-23 actual device resources and GPU buffers

Dynamic VB10011a40/129 and IB10011ad0/129 initialize used0/totalBytes, create
DEFAULT-pool buffers with usage208, and use the existing fatal-init warning
path on negative HRESULT. Index format is101(INDEX16); VB FVF0. Both pass the
first incremental build unchanged referees, retaining1267 old extents.
R_CreateDynamicBuffers10011b60/143 allocates one32768-vertex dynamic pool and
two131072-vertex skinned pools, with36-byte DX7 or64-byte DX9 vertices. Reload
the renderer dvar for each allocation, publish existing pool pointers, create
2097152 index bytes, then Z_VirtualReserveInternal(10485760). Do not commit
that arena here or reset tempSkinPos. Native fixtures cover24 routes.

Particle creator10011bf0/544 allocates81920 vertex bytes through the EXISTING
R_AllocStaticVertexBuffer. Static indices12288 bytes use usage8, format101,
pool0. Four20-byte vertices and six ushort indices represent each of1024
particles in8x8x16 order. Three rand calls per particle use exact float
1/32767, XY scale.25, Z scale.125, offset-1. UV order00,01,10,11 and index
order0,1,2,2,1,3 come from primary stack initialization, not a guessed quad.
Finish index then vertex through existing helpers. Native tests check all
vertices/UVs/indices for three RNG streams,3072 calls, guards and ownership.
PINNED original bug: index creation/lock failure still reaches writes through
null; lock failure releases without clearing dx's pointer. The reconstruction
preserves it, not a silent bug fix. Two isolated child tests expect SIGSEGV,
with core dumps disabled; this is not a proposed renderer repair.

Resource initializer10012100 ends12204:261 bytes, not inventory152. It calls
real render targets, cache vertex creation, existing SMC_ClearCache, dynamic
buffers and particles in that order. Clear flushGpuQueryIssued, CreateQuery8;
negative result prints the actual Event query creation failed literal and
returnsfalse. SUCCESS CONTINUES past12198 into4x2 CreateQuery9 sun queries at
107645b4/b8+view*48, with issued flags+44/45 cleared even on failure. Those
failures log but do not abort. Then print Setting initial state and call
RB_SetInitialState1003c2a0 before returningtrue. Never accept a truncated
early-success reconstruction from the152-byte inventory. Sixteen native routes
cover event failure, every occlusion slot, pointer outputs and existing fields.
Shared sun record/header asserts48 bytes/query36/issued44 in both compiled
type views; global storage remains solely r_sky.cpp. No duplicate query arrays.

The initial full resource link failed on the preexisting Mac-union versus SDK-
struct IDirect3DVertexBuffer9 mangling at R_AllocStaticVertexBuffer. Fixed the
single shared source interface to void** (like the existing void* finish helper),
and updated BOTH real callers and their fixtures. Keep actual device-handle
types inside each owning TU. No alias symbol, duplicated allocator or forced
ABI wrapper. This interface repair must retain the existing222-byte allocator
extent as well as all prior matches. Native world/particle fixtures still pass.

## 2026-10-23 D3D device/presentation source

PINNED AA10011460 ends100114c3 (100 bytes, not112 including INT3 padding).
It probes adapter0/DEVTYPE_HAL/format21 regardless of dx.adapterIndex, with
windowed=!fullscreen, decreasing samples until1. A successful HRESULT>=0
publishes qualityLevels-1 as unsigned DWORD; zero levels therefore wraps.
No probe for samples<=1, no reference-only logging/validation/reflection flag.

Presentation100114d0/137 clears56 SDK bytes, uses format21(A8R8G8B8), one
back buffer, discard1, AutoDepthStencilFormat75(D24S8) but disables auto depth.
Primary global101ce7dc is r_swapInterval, pinned by registration string
10192b74 and the matched dvar registration. Do not copy CoD4's r_vsync name.
Any nonzero bool selects interval1; zero selects80000000. Fullscreen preserves
the requested Hz, windowed forces0Hz. Existing dx holds multisample state.

CreateDeviceInternal100126d0 ends12740 (113 bytes; inventory106 truncates RET
and epilogue). Each batch prints once, tries HAL twenty times and sleeps100ms
after EVERY failed call including the twentieth. Success is any HRESULT>=0.
After a failed nonzero adapter batch, publish adapter0 and try one more batch;
after adapter0 fails, return the last HRESULT. No extra resets/cleanup/REF
device fallback. The device output pointer is the real existing dx.device.
Native32 actual-source fixtures cover1204 AA/presentation/retry paths, including
success at1/19/20/21/39/40, total failure, and quality0/1/7. Behavior tests alone
do not establish byte match, real GPU operation or complete startup.
The first normal-profile build accepts all three complete bodies through both
unchanged referees:100+137+113=350 C++ bytes. All1264 prior extents survive.
No register/flag/source spelling sweep or new roots/assembly was needed.

Next higher device caller100128b0 also needs video configuration100115f0,
resource creation10012100 and registration finalization10012040. Resource
creation calls real render targets10022d20, two static-model cache helpers
1002b920/1002b9a0, buffer constructors10011b60/10011bf0 and CreateQuery type8.
Its success tail begins10012198: the inventory152 omits that tail. Video config
has a real selector table at100116b0 after its RET; never decode/count the table
as instructions. Full hardware startup10012c80 and its retry dvar logic remain
missing, not replaced with fake returns merely because these helpers match.

## 2026-10-23 real game-window creation

PINNED100129c0/248 takes the36-byte PC GfxWindowParms record. Fullscreen is
a byte at8, x/y12/16, width/height20/24, aaSamples32. Any nonzero fullscreen
byte selects WS_EX_TOPMOST8 and WS_POPUP80000000; the windowed style is
WS_CAPTION|WS_SYSMENU00c80000, not a generic overlapped/minimizable window.
The target ignores AdjustWindowRectEx's return, obtains GetModuleHandleA(0),
creates class CoD2 with the multiplayer title, then stores the returned HWND
even on failure. No added cleanup/retry or offset compensation belongs here.
Primary IAT1010c1e4/1010c07c/1010c1d8 pins these exact Win32 imports. Source
uses the existing SDK/windows types and original libraries, no compatibility
implementation. Thirty-six native32 routes check both outcomes of rectangle
adjustment and creation, arbitrary nonzero fullscreen, negative/zero/positive
positions, call order, literals and unchanged non-HWND fields. Tests are not
GPU/runtime or byte-match evidence. No local spelling/flag sweep authorized.

The same TU restores refresh choice10012b00/131 and parameter preparation
10012b90/133. Binary search compares width, height, then Hz with signed
differences. A missing exact rate uses the preceding rate only if resolution
matches, otherwise the next insertion-point rate. Preserve the primary's
unguarded preceding/next probes; do not invent a new invalid-mode fallback.
The caller enumerates modes first; tests use that valid startup domain and
model the preceding storage to exercise first-resolution requests below60Hz.
Native tests cover900 refresh selections and27 full parameter setups. The
actual PC setup forces fullscreen1, clears HWND and leaves tileCount alone.
It parses mode/refresh enum strings before reading position and AA dvars.
Do not replace that force with a read of r_fullscreen merely because a
windowed branch exists in the window creator. Source tests are not byte proof.

## 2026-10-23 normal-frame storage and initialization

PINNED normal GfxBackEndData base1042e780, size249d6c, commands219d0c,
debug249d18. This is distinct from s_debugFrameGlob's embedded record.
R_InitFrameBackendData10021040/143 increments the frame before unlock,
uses signed remainder for the double buffer, reloads frontend ownership after
unlock and preserves command counters and all but three debug counts.

R_InitRenderCmds10020b50/126 clears84 debug bytes, sets limits4096/512/4096/
16384/4096, allocates two0x200000-byte buffers through import101d49d4, then
selects the normal frame only if the current frontend is null. Otherwise it
clears only the three current command counters. Storage1072d9b0/b4 belongs
to existing tess106d3200; secondaryIndices is a descriptive field name.
Primary100415b0 and10041636 index that second buffer with a two-byte stride;
do not create duplicate standalone buffer pointers or claim original names.
The pad after that pointer stays opaque. Shared material/count offsets remain
unchanged. The genuine startup caller is10012fab inside10012f80..10013028.
Full R_Init also needs command registration100052c0, hardware init10012c80
and backend init1003a9d0; it is not reconstructed by this smaller source wave.

The restored real frame reduces the .data virtual-size gap2400448 ->768.
No filler/alignment annotation was added. This does not establish final order,
initialized contents or SHA. O2 source compiles both initializers but neither
is credited by the unchanged referees. Stop instruction tuning under the
owner's structure-first direction. Source tests cover ownership changes during
both unlock and allocation; preserved commands/debug fields are checked.

The first concurrent fixture run correctly failed source-coverage freshness
while the build had a newer DLL than cmp/bind. Do not run build-dependent
fixtures against the mutable output during a link/referee cycle. The final
fixture run is serialized after build completion; no freshness gate is relaxed.

## 2026-10-22 structure-first owner direction and outdoor source

The owner explicitly defers new FP assembly and prioritizes whole-file source/
layout structure before individual instruction matching. No new authored ASM.
Do not repeat the local source/flag trials below under that priority.

New r_outdoor.cpp restores the64-byte OutdoorGlob at101da980, actual12-byte
512/512/256 dimension table, bounds/scale/lookup construction and trace height.
Use existing ClearBounds, ExpandBounds and MatrixIdentity44, not duplicate
helpers or a second identity table. Candidate TU is after r_model_lod.cpp;
this placement is not historical link-order proof. Compile assertions pin
world offsets, trace36 bytes and every used OutdoorGlob block.

The ordinary first build accepted R_OutdoorTraceHeight10020590/175. A single
/Os TU trial lost that new match and did not add another accepted outdoor body;
the flag is removed. Ordinary code initially unrolls scale to187 vs82; hand-
written axis loops make bounds569 vs329. Shared original helpers replace those
loops; no further tuning now. Numeric native tests use rational tolerances
for scale intermediates: primary FST retains extended precision before inverse
division; comparing an expression against a reloaded rounded float is not a
valid bitwise oracle. Bounds/guards/trace routing remain exact fixture checks.

Test-only VC7.1 /QIfist probe in tests/fixtures/float_conversion.cpp accepts the
flag and generates FISTP QWORD, with bias3fdfffffff000000. The outdoor target
uses FISTP DWORD. This probe is insufficient, not proof no C++ solution exists;
no production /QIfist flags are kept. Shader FNCLEX remains deferred too.

Primary structure discovery: normal backend starts1042e780; its debug block
starts10678498, commands start1064848c, usedTotal/usedCritical/lastCmd at
1067848c/90/94. Typed GfxBackEndData uses0x249d6c bytes through106784eb;
next scene starts10678500. The20-byte intervening gap does not prove an
alignment annotation or authorize filler. Its frame setup10021040/143 selects
that storage, increments rg.frameCountInternal, unlocks the old skin cache,
cycles the signed frame index modulo2, selects its actual VB, then resets
only the observed draw/entity/poly/view/debug counts. Command counters and
other debug fields are untouched. Frontend ownership is reloaded after unlock.
The debug frame is a separate real object, not an alias for this missing one.

Current import-set inspection: original and candidate have the same d3d9,
DDRAW, GDI32, ADVAPI32 and99 KERNEL32 imports; candidate lacks USER32
AdjustWindowRectEx, IsWindow and ShowWindow. No extra named imports. Their
order differs and still needs genuine startup/window source, not dummy calls.

## 2026-10-22 procedural-image source and material-load dependencies

Accepted solid-color helper100100f0/102 writes input bytes directly in BGRA
order, then creates/uploads1x1 A8R8G8B8. This closes through existing setup and
upload source; not an imported library or authored assembly body. Native32
fixture also decodes all18 local axis stores in primary10010160's prologue.
The reference's uninitialized static axis table is not usable source evidence.

New real source uses cube flags7, per-face source strides,32x256 L8 specularity,
32x32 light-grid cubemaps, and64x64 sun cubemaps. Sun allocates98304 temporary
hunk bytes, uploads all six faces, then frees that same buffer. No stack stand-in.
The direction generator initially builds786 with a different frame allocation;
using existing VectorScale/VectorMA and sequential vector construction builds754
vs primary786, still unaccepted. Keep the reused helpers; no more local spelling
sweeps without the real Image_Load caller/function set. Cube upload84 vs86 and
specularity117 vs119 remain drafts. Light-grid43/sun46 are masked-equal but fail
dependency closure through the generator. One output, no new flags or roots.

Next material path is primary10017100 (registration) ->1001c740/171 (file load)
->1001c4e0/603 (instance fixup). Existing technique validation/cache helpers
are reusable; missing image creators/dispatcher are the current source gap.
Do NOT import the reference's extension aliases, UI fallback or returning a
partially initialized material after fixup failure. Primary returns NULL then.
File open is uniqueFILE=1; negative size warns only for non-$ names; zero size
closes the handle and warns. Positive size uses hunk allocation, read, close,
then fixup, preserving ownership even on failure. Relative pointer fixups and
water/renderer-specific texture handling need exact PC layouts, not raw guesses.

Outdoor primary source facts for that closure: OutdoorGlob base101da980,
bbox[0].z101da988, bbox[1].z101da994, scale.z101da9a0, invScale.x/y9a4/9a8,
add.x/y/z9b0/9b4/9b8, pic9bc. The height trace10020590/175 goes from maxZ+1
to minZ-1 with model0/mask0x2001, zero bounds and36-byte trace initialized
with fraction1. Return is startZ+(endZ-startZ)*fraction, not the reversed
reference interpolation. Image generator10020950 subtracts double
0.4999999990686774 before FISTP then clamps0..255; do not call that plain
floorf without a proof. No outdoor source or new assembly has been fabricated.

## 2026-10-22 real effect and polygon API callbacks

Primary API slots22/23 target10020cb0/10020cc0 are six-byte tail jumps into
ri slots166/165, not the shifted legacy labels178/177. Client cl_main_mp
assigns FX_UpdateBolt/FX_UpdateNonBolt there; FxUtil confirms void/no arguments.
The actual wrappers and import-offset compile assertions are in r_rendercmds.
The unchanged comparator does not search two-byte unmasked anchors, so these
are not accepted matches even though the independent primary-operand fixture
confirms both jumps. Do not loosen the referee or invent retention markers.

Primary API slot25 targets R_AddPolyToScene10023ed0/245. It copies68-byte
GfxWorldVertex records into a2048-polygon/8192-vertex backend pool. The exact
vertex limit is inclusive. A null material uses rgp.defaultMaterial; disabled
registration changes nothing. Full draw-surface storage still consumes the
polygon/vertices. Keep the backend pointer captured across the helper call.
The entity key is scene.polyCount %2048 +2048, NOT &2047: primary preserves
negative signed remainders. Mac reference reloads the backend and uses &2047;
neither reference shortcut is accepted. Compile assertions pin real pool offsets.

Initial ushort/ushort callback builds237 with LTCG's private register ABI.
One genuine interim export retains its external stack ABI (245, still wrong
registers). This is not the final export table: only GetRefAPI may remain at
completion. An int/int spelling with explicit unsigned-short count builds247;
accumulating the surface type inside both sort branches worsens the existing
draw helper108 to119. The latter is reverted; no accepted prior body changed.
Final bounded trial keeps an explicit widened count with ushort formal and
int lightmap index, with explicit narrowing at all uses:244 versus primary245,
still different registers and stack storage, not accepted. Do not repeat these
spelling trials without a genuine caller/TU/function-set change. No new ASM,
compiler flags, checker changes, duplicate outputs or fabricated callbacks.

## 2026-10-22 connected material-pass/technique source

New accepted C++555 bytes: stream index10018f90/89, destination10018ff0/197,
source100190c0/216 and declaration build10016740/53. Keep explicit temporary
created before reloading *declaration: one assignment expression matches MSVC
but GCC may evaluate its destination before a device callback changes the
owner. The native pointer-replacement control detected that real distinction.
Out-of-range stream indices only warn. Cast the index tobyte before adding
the code base, preserving target wrapping without signed-overflow UB.

Restored DX9 pass setup, both technique-file loaders, technique-set loading
and both caches, using the existing Material_TechniqueTypeForName. Do not add
a second label lookup. Primary type mask1018eb34 is34 bytes, zeros27/28/30;
candidate owner r_material.cpp follows the stream source/destination tables.
All other type-mask bytes are1. This is data, not additional code credit.

Primary vertex routes reject exactly16 AFTER its lastsemicolon, not before
parsing it. Route source names use Com_ParseOnLine; destination names use
Com_Parse. Warning-only index bounds and narrowing are not validation errors.
Routing remains sorted by source then destination; equal entries are inserted
before old equals. Reused declarations skip all four device builds.

True technique boundaries: DX9 1001b810..1001ba62 =595, DX7 1001ba70..
1001bcb3 =580. Inventory588/569 truncates instructions. Bothcap four passes
without consuming a fifth; bothfree file data before allocating the result.
DX7 deliberately does NOT write header flags. Technique-set source allocates
its140-byte header+name BEFORE parsing and does not clear omitted pointers.
Entirely unused groups skip loading; mixed groups fill every grouped slot.
EOF with labels pending returns the allocated set, as primary does.

No-inline guards on the real vertex/pixel shader handlers reduce DX9 loader
742 to600 (primary595); actual primarycalls justify retaining them. This does
not prove historical annotations. DX7 loader589 vs580 remains unmatched.
The cached technique's primary has separate branch failure tails; spelling
them separately improves89 to101, fully masked-equal but dependency-blocked.
Cached set79 and shader handlers75 each are also byte-equal but unaccepted.
Vertex routing599 vs587; pass dispatcher71 differs in allocation/convention.

Technique-set source557 vs556 differs in shared colon/semicolon block placement
and one NOP, not its labels/mask/semantics. A targeted explicit shared-separator
goto trial produces565 and is reverted. Do not repeat that trial or declaration
spelling sweeps. No flags, ABI overrides, marker roots or new assembly added.
Native32 source controls:96 stream/pass,50 technique-file and51 techset/cache
routes; original failures, partial writes and cleanup are checked separately
from accepted byte coverage. Source and library counters remain separate.

## 2026-10-22 connected shader creation source

Added real SDK compiler/device creation source in r_material_shader.cpp with
the shared16-byte MaterialShader header. PC request version is NOT clamped.
Actual parser/cache/compiler/cache-insertion caller1001a810 is266 bytes and
has one exact masked placement; its binding remains blocked by creation.
Compiler1001a4c0 source builds708 versus705, with local stack-slot differences
and a5-byte _clearfp call versus2-byte FNCLEX. Do not count either body.
The pass parser expands existing I_fround assembly; account separately if it
later becomes binding-accepted. No new assembly definitions were introduced.

Original VC7.1 /O2 probe with pragma intrinsic(_clearfp) emits C4163 and an
out-of-line jump to __clearfp, not FNCLEX. Retained fixture and local log:
tests/fixtures/clearfp_intrinsic.cpp, build/clearfp_compile.log. Do not repeat.
Replacing a pointer-shaped include object with its explicit4-byte struct
leaves the708-byte body unchanged; keep the clearer typed representation.
Do not sweep declaration/flag spellings without actual source/TU evidence.

Native32 tests cover252 compiler/device paths, including type256 truncation,
negative versions,65540-byte code-size truncation and original failure leaks;
36 parser/cache paths cover hits, failed compiles and insertion. The parser
fixture explicitly stores the scaled version asfloat before rounding, as the
primary does: host x87 excess precision otherwise mis-tests2.05f's boundary.
All1257 protected extents remain. No new library or engine bytes are accepted
in this source wave. This adds source/real linkage, not a claimed counter gain.

## 2026-10-22 shader SDK integration

Material_SetPassShaderArguments is now real compiled source, not a fixture-only
wrapper. It links original Summer2004 D3DX shader members. The217-byte body
still differs in Release/parser register allocation; no game-source credit.
Do not count the SDK bytes as authored game C/C++. The SDK entry itself is
not binding-closed: D3DXGetShaderConstantTable -> operator new remains unverified.

Original nested ownership was NOT relaxed. A proposed equal-string-copy
relaxation was rejected and removed; its test is archived, not active.
The actual failure was a5-byte fabs literal incorrectly owning72 bytes up to
the next symbol. Four unrelated, already-unaccepted CRT refs then poisoned
its target base. Encoded string bounds now reject that attribution. This exposed
two prior false string associations: has_osfxsr_set and RTC_Initialize actually
reference12-byte SEH tables. Linked PDB section contributions and original
VC7.1 LIBCMT COFF symbols independently confirm both spans and their owners.
Anonymous contributions are accepted only where no named symbol occupies the
span; full data/relocation checks remain. Interior filter/handler pointers must
keep an instruction-boundary offset in one uniquely matched enclosing function;
that function is added to the existing verification fixpoint. No gate threshold
or binding ownership exception was introduced. All824 old extents survive.

Next primary source:1001a4c0/705 is the shader compiler/creation routine, not
the reference's combined parse/cache loader. It takes filename/type/version;
PC defines are {"PC", "",0,0}; include vtable is101948ec (Open100182c0,
Close10018310). D3DXCompileShader target10062b59. It restores FP state, reports
compiler messages, checks result/code/constants, allocates16+code+name bytes,
and calls device slot91 or106. Read primary before adopting Mac/web source:
those references include extra HLSL defines, path rewriting and platform fixes
absent here. Unusual failure cleanup/leaks must not be silently fixed.

## 2026-10-21 world/sun/history source gain — paused

Accepted309 new C++ bytes: model maximum-surface helper73, sun reset158 and
grid filename78. Full gate30037 retains all820 protected extents; no assembly
or library credit added. Current99872/253580=39.384809528%;40% needs1560.
Three new actual-source fixtures pass separately. Cold/full-suite replay pending.

The model helper initially had only CMP operand order reversed. Expressing
maxSurfaces < surfaceCount reproduces the primary73. Allocation caller initially
215: naming the actual instance pointer preserves the primary's extra address
calculation and gives217. Early allocation register choices still differ; no
credit for the caller. Its three allocation strides/offsets have compile-time
PC checks;112 native32 source cases verify allocations, LOD maxima and guards.

Four-view sun reset matches158 on its first build. Primary28 stores preserve
query pointers/issued flags, error, cumulative visibility and padding. Native32
fixture checks255 complete byte patterns and repeated resets. Do not memset
the whole state or replace the seven assignments with a broader reset.

Grid filename helper matches78 on its first build. Initialization196 vs194 and
save100 vs94 are drafts; the in-place file-length clamp/shared-global trial
does not improve those lengths. File length is unsigned for divisibility/cap
and final division after rejecting negative reads; invalid-length buffers are
still freed, failed reads are not. A failed save still frees and clears state.
The60-path fixture checks24MiB cap, six-byte records, cleanup and60 name limits.
Save's final two immediate-zero stores differ from retail's shared zero register;
do not add casts, arithmetic, assembly or marker variants to force that tie.

## 2026-10-21 BSP and structural continuation

The earlier BSP/bevel trials added no accepted bytes. R_FilterEntityIntoCells_r
now uses the existing VectorCopy helper for clamped bounds:335 bytes, the
retail length, but still not a byte match. A direct-scalar form also gives335;
the earlier early-return form gives339. Keep the clearer VectorCopy draft.
Do not repeat those forms. R_CellSurfaces' negative-OR comparisons were restored:
the positive ordered decompile changes unordered/NaN behavior. The source
fixture independently checks49 x87 relation pairs plus actual BSP/AABB paths.
The bevel VectorCopy trial gives1081 versus1065; original memcpy restored.
Sessions14130 and43220 both retained all817 protected extents.

Object order: r_bsp.cpp moved alone to first position in session43220, with
all817 protected extents retained and no new game credit. This is retained
as an evidence-backed candidate, not a historical-order claim. The isolated
material_load-after-material trial67761 loses the same protected _cvtdate440
and __isindst_lk391 as the earlier combined trial. The former fails __lpdays
and preceding-symbol attribution, the latter its callee. Restored. Do not
repeat the combined trial or relax the checker. No cosmetic whole-list sort.

Static-model bounds /Op trial14147:459 versus441, no gain, all817 retained.
Original profile restored. This is not evidence of historical per-TU flags.

World-buffer uploader: primary1000120d calls Com_Memcpy, not CRT memcpy.
The actual-source fixture rejects the old copy service and passes72 corrected
uploads. Correcting that call gives461 versus472 and reproduces the real
30-byte reload wrapper, whose binding is still blocked by the uploader.
Using Vector2Copy for both UV pairs gives446, still no match. Both full gates
84894/66590 retain all817 extents and609 game bodies. The final explicit-field
copy trial26915 stays461 and also retains all817 extents. Keep the actual
Com_Memcpy correction, but stop this three-form induction-pointer sweep.
All50 actual-source fixtures plus separate string/accounting checks pass.
Current proof:cpp_checkpoint.json;39.262954492% C/C++, no new accepted bytes.

## 2026-10-21 strict40% C/C++ continuation

Owner milestone is now40% C/C++, then ROADMAP.md. Mixed assembly coverage is
not the milestone. Three memory assembly definitions now request noinline;
the full817-extent gate and bind JSON remain unchanged. This makes their
exclusion auditable without assuming they cannot inline. source_coverage.py
subtracts31 authored-assembly bodies/7787 bytes and records source hashes.
It reports99563/253580=39.262954492%;1869 further C/C++ bytes are needed.
Its scope is authored source, not original compiler/SDK implementation internals.
Current receipt:proof/cpp_checkpoint.json. The source counter pins all reviewed
assembly-bearing files; six negative controls reject altered or unreviewed
assembly. Final build58478 preserves all817 extents and the original cold bind
JSON exactly.48 source fixtures plus separate PDB and counter checks pass.
Eight renderer build trials/restorations in this continuation yielded ZERO
accepted bytes; do not describe this as source-coverage growth. Stop spelling
sweeps; next work needs a different group or real TU/caller structure evidence.

No accepted gains; restored trials:
- Wavelet dimensions/value initialization order, separate zeroing via memset
  then explicit loop:570/553 versus537. Actual-source2048 loader tests pass.
- Viewport /Op alone:399 versus366, all817 extents preserved but no gain.
- Internal code-image argument order:632 unchanged, no gain. All three real
  callers and original signature restored. New actual-source switch test passes.
- Sampler named backward label and in-search missing-name return: still347
  versus303. No gain; original while source restored. Stop loop-spelling trials.
- Direct fullscreen-width ternary:146 versus149, loses both160-byte cookie
  initializers and adds no match. Restored. Stop selector-spelling trials.
- Explicit condition !=0 remains349; conditional final parse returns produce
 143/92 rather than137/87. No gain. Both fixtures pass; original source restored.

## 2026-10-21 roadmap and workspace consolidation

Owner requires45% actual C/C++, then complete source and retail whole-file SHA.
See gfx/ROADMAP.md. All18 obsolete target/agent_* trees and compiler debris
were moved to archive/target_trials_20261021; nothing was deleted. Historical
proof and imported compatibility headers remain required. OpenCoD2 is already
imported, not a source-acquisition task. Use caller/helper cohorts and structure
evidence; do not burn further builds on unchanged single-function hypotheses.

No accepted gains in these bounded trials; all source edits were restored:
- Logical-AND final parser returns produce138/88 instead of137/87 and leave
  branch placement wrong. Actual DX7 wiring fixture passes. Restored.
- Texture-policy global-only assignments produce509 instead of511 and worsen
  allocation. New actual-source test_picmip.py passes1248 threshold/manual cases.
- Fullscreen width default inside switch plus noinline still loses the two
  accepted160-byte cookie initializers, adds no accepted body. Restored.
- State-condition negative guard remains349, not346; fixture and817-extent
  gates pass but gain zero. Restored. No more guard-spelling trials.

## 2026-10-21 DX7 cold checkpoint (active)

609 game bodies /107350 executable bytes MIXED; proper-source upper bound
99563/253580 =39.262954492%, pending full assembly attribution. Seven new C++
bodies add1712 bytes beyond602; unchanged referees and817 protected extents pass.
Frozen pause bind/cmp are in proof/dx7_pause_{bind,cmp}.json. Batch95248 passed
45/45 fixtures. Separate PDB check and cold replay now pass, with all422 frozen
inputs unchanged and bind/cmp identical. See proof/dx7_checkpoint.json.

Accepted: bracketed index73, named index90, DX7 option311, texture argument393,
packed argument list165, operator316 and coordinate generator364. Index-derived
bit shift10+5*index matches165. Named-index helper must return the existing Bool
directly, not renormalize it. Operator lookup uses a found label and a do/while
diagnostic list; a break plus post-loop index test compiled331 instead of316.
Explicit bracket parsing removes the extra Bool conversion from the coordinate
generator369, reproducing364. The option helper's original logical-AND empty-call
wrapper plus !=5 search reproduces311; changing that wrapper to int/bool or
sequential guards worsens its caller. All26 data rows independently match retail.

Cached map: immediate cache-hit return followed by explicit failed-load return
reproduces84 masked bytes, but its unaccepted LoadStateMap dependency still
blocks credit. State condition arithmetic coercion stays349, not346; restored
the clearer ternary. Token-helper TU move gives no gain and is restored.
Display initialization/countdown gives no accepted gain and is restored.
FFT aggregate saves plus /Oy- give562, not532; all source/profile edits restored.
The532-byte true FFT extent ends at1005f073, not the inventory's529. Native168
cases test existing FFT semantics, not a byte match. Option-table TU move also
gives no gain; restored local offsetof-based table and original material TU.

Sampler/stage/pass drafts are genuine source with native wiring/partial-write
tests, but are unaccepted. Never count their approximate sizes or diagnostic
bytes. No raw-code arrays, new assembly, compiler excuses or weakened gates.

## 2026-10-21 clean image-list checkpoint

Proof:image_body_checkpoint.json;601/105263 executable game bytes MIXED.
Adds1775 C++ bytes over592, including1064 in this resumed image wave. All809
protected extents,40 tests,415 input hashes and9 removal negatives pass.
Warm and forced-rebuild cmp/bind are byte-identical. Readable source snapshot:
proof/image_body_20261021_source.tar.gz. Proper-source upper bound38.439940058%;
complete assembly attribution remains pending. No whole-file/GPU claim.

R_ImageList_f is1070 full/1015 code; data55 is independently audited. Reusing
the real SDK cube GetLevelDesc case fixes frame/register placement. Format
case order must match the primary's physical literals AND pointer table:
RGB32,RGBA32,A8,L8,RGB16,AL16,DXT1,R32F,DXT3,DXT5. Bare masked equality
incorrectly hid exchanged case literals; source-order fixes clear the original
binder without a checker change. std::sort uses original compiler headers;
new library helpers are excluded, only comparator49/list1015 count as game.

After this checkpoint, forced-inline platform helpers still give216 rather
than149 and alter the frame/induction structure. All809 extents survive but
there is no gain. Hint/call changes and native macro are restored. Do not
repeat this trial or claim the original used forceinline.

## 2026-10-21 shader and image continuation (active)

Protected shader cohort:596 game bodies /104115 executable bytes, including
627 new C++ bytes beyond the frozen592 checkpoint. Default shader dispatch
receives the name separately, not routing.name. Its128-byte extent contains
24 non-code bytes; only104 count. Accepted lookup188/default50/array285 bodies
are protected by shader_warm_bind.json. Full shader cold replay is pending.

New PC image enumeration47, callback17 and signed track predicate20 match both
referees. Protected image_warm_bind.json retains797 total address-extents;
game meter599/104199 is MIXED, not proper-source coverage. The memory reporter
and list wrapper remain uncounted. List wrapper23 matches diagnostic
instructions, but lacks the unchanged discovery referee's minimum literal
anchor; do not relax that gate just to count it.

TU-local recursive table pointers and typed SDK record pointers preserve all
matches but do not change nested parser347/589 code generation. Inverting the
sampler leaf/recursive branches and moving the leaf outside an explicit loop
also leave347 bytes, not the primary303. Retain the readable source; do not
repeat these trials. Argument-list sampler switch spelling produces849 rather
than retail856; original if/else comparisons are restored.

One structural order trial moved material_load immediately after material and
staticmodel_load before staticmodelcache, supported by primary body ranges.
Game bytes stayed104199, but protected library extents100fc71e/440 and
100fc8d6/391 failed binding. Rejected; original tus.txt order restored. No
verifier change, new build tree or retained order hypothesis.

## 2026-10-21 hash/string/constant-array cohort

Forced rebuild:591 game functions /103338 executable bytes. Adds554 proper
C++ bytes: string registry10016440/246, folded hash1002bfe0/37, constant-array
parser10019970/271. All789 accepted game/library extents are protected;
warm/cold cmp AND bind JSONs are identical. Proof:proof/sampler_checkpoint.json.
Proper-source coverage is AT MOST95551/253580 =37.680810789%; not40% proper C++.

Registry inline draft230 did not match. Restoring the reference-supported
R_HashString boundary in existing r_utils.cpp reproduces the complete246 and
real37-byte outlined helper. The239-byte inventory extent cuts the return
path; final RET is10016535. No new object, root or compiler flag.
Constant-array271 matches on its first build.112 native cases preserve partial
writes on later syntax/range failures and token unget behavior.

Sampler tables:29 actual source rows independently match every primary name,
enum, child binding, count and stride. Tables are not code credit. Caller207
versus211 and nested parser344 versus303 remain UNACCEPTED. Search uses the
reference's found-label form; do not repeat the old353-byte break/null-test
form or502-byte iterative draft blindly.

Referee correction is separate. The old next-symbol extent for the2-byte CRT
underscore string included12 bytes of neighboring unnamed data. Exact compiler-
encoded sizes now check ALL literal bytes and terminators, including wide and
embedded-NUL strings. Pseudo-symbol+offset statics retain the old nonliteral
rules.9660 actual literal objects pass changed-byte/truncation negatives.
Legacy and corrected checks accept IDENTICAL game extent sets. Five library
extents gain acceptance, none counted as game code; no accepted extent is lost.
Legacy report:proof/sampler_legacy_bind.json.

Literal registry10016390/150: first direct copy152 mismatches four x87 operand
orders and pointer address generation. Reversed comparisons plus indexed global
stores159 fix comparisons but worsen stores. Third bounded form keeps a local
destination and indexed return. No credit until its full bind row is clear.
Native tests cover153 table cases, signed zero, four NaN lanes, exact limit and
the observed NO count increment. No new assembly, wrapper or retention root.

Final third form MATCHES150 bytes: keep reversed comparisons, local destination
stores and return materialGlobals.literals[index]. Final forced rebuild retains
all790 extents,592/103488 game bytes;704 new C++ bytes over588. Both referee
JSONs equal the warm versions.31 fixtures and four removal negatives pass.
Current proof:literal_checkpoint.json. Proper-source upper bound37.739963720%.

Baseline: proof/baseline,579 game bodies /101478 executable bytes. Mixed40.018%,
assembly-free AT MOST36.947%. Build only with tools/build.sh from gfx.
Earlier failures: target/scratch/codex_1020_model_attempts.md and the frozen
model/state packets. Do not repeat their rejected forms.

## 2026-10-20 continuation

- Model TU /Op:578 /101008; loses accepted bone-bounds expansion1001fdd0/470.
  No debug pair gained. The checkpoint gate rejected it; flag removed.
- Recompute only endpoint X after MatrixTransformVector, X+Z+Y: behavioral
  model fixture passes, but instruction scheduling worsens on both endpoints
  and later stores.579 /101478; no accepted gain. Removed, baseline restored.
- Fog setter: end-before-start assignments alone do not match. Swapping the
  green/blue store order likewise fails, changing the byte argument loads.
- Fog setter with the Mac reference's local GfxFog pointer, B/G/R ordering
  and branch-local clearScreen stores fails: introduces an extra global-base
  ADD and changes load scheduling. No accepted gain; original source restored.
- These are ordinary source/compiler trials, not progress. Referees and object
  order remain unchanged; a diagnostic instruction diff is never acceptance.
- Fog /G5: no gain; removed. Scoped for-loop/plume-local elapsed: no change to
  the rejected debug-transfer body; restored the preceding source form.

## Fresnel source recovery

New readable function in existing gfx_d3d/r_utils.cpp, supported by the named
Mac r_utils.c reference and PINNED PC1002c370 through RET1002c438 (201 bytes).
PC clamps sinRefracted to+1 before asin; the reference's self-assignment in
that branch is wrong for this target. Final comparisons are float, while the
angle math is double. No handwritten assembly or new TU/order changes.

The double-coefficient/float-result form reproduces all instructions except
one x87 cleanup: candidate FXCH ST(1); FSTP ST(0), target FSTP ST(1). This is
NOT a match or a compiler-impossibility claim. Top-declared locals and /G7 do
not fix it. Local size optimization adds a frame pointer and more differences;
removed. The all-double result form also spills and uses incorrect FCOML
instead of the retail FCOMS. Do not repeat these forms blindly.

Float reflection coefficients and an isolated genuine C compilation both
retain the SAME cleanup mismatch. C mode is not an escape hatch here; the
temporary C TU was folded back into r_utils.cpp and its profile rule removed.
Only one source implementation remains. Original tus.txt/profile.mk restored.
No evidence proves source matching impossible; new caller/compiler evidence is
needed before spending another sweep on this one instruction.

test_fresnel.py runs96 independent optical-formula cases, sign symmetry and
edge cases. Preserve the retail formula's NaNs at exact normal incidence and
its zero at grazing total reflection; this is reconstruction, not a physics
bug fix. Native numerical tests are not byte-match or GPU proof.

test_debug_plumes.py adds1,458 actual-source cases for expiry/removal/transfer,
plus exact swapped-last order, null source and allocation behavior. This is
regression protection, not additional reconstructed bytes.

## Bounds callback and matrix continuation

- Recovered the genuine API bounds callback at10020cd0/12 and its internal
  worker10023d40/47 in r_scene.cpp. The callback calls the worker out of line;
  noinline preserves that observed call rather than inventing a register ABI.
  The worker body matches, but its R_UpdateXModelBounds binding is pending.
  The12-byte callback has too few literal bytes for the unchanged discovery
  anchors. Neither body adds accepted coverage yet. Actual-source tests pass96
  callback/worker routes, nonzero entity bases and untouched-record checks.
- RB_ChangedWorldMatrix: moving the renderer local does not change scheduling.
  Existing validation/renderer helpers worsen registers and prologue. Restored
  rb_state.cpp. Actual-source matrix tests now cover this function as well.
- PINNED RB_ProjectionMatrixChanged1003e130 ends at RET1003e212:227 bytes,
  not the old inventory's220. Do not claim a partial-prefix match.
- Viewport early constant43 publication still mismatches. Adding /Op and
  double-width expressions produces an unwanted double spill; integer-width
  form adds FILD/reloads and another spill. Restored rb_viewport.cpp and profile.
- A subsequent fresh build retained all774 checkpoint extents and579 game
  bodies /101478 bytes. These trials add ZERO accepted bytes.
- Endpoint helper sweep tested all six X-component term orders, leaving the
  start transform and Y/Z math unchanged. Every actual-source test and full
  gate passed, but all six retained579 /101478: ZERO accepted gain. Removed
  the helper, restored r_model_bounds.cpp and passed the full gate again.
  Expression permutation alone does not resolve this LTCG scheduling residue.
- Fullscreen image accounting: moving the width default into the switch loses
  two160-byte shadow-cookie initializer matches; rejected. Calling the existing
  platform-dimension helpers preserves the checkpoint but worsens this body's
  frame/loop and adds no accepted bytes. Restored r_image.cpp. Copied the two
  existing image/render-target actual-source fixtures into work/tests and fixed
  their source roots;256-track and1152-allocation fixtures pass.
- Water equivalence1002ca50/240: reversed norm assignments plus product order,
  then original assignments with reversed product, both failed to match. The
  first preserves all774 checkpoint extents; actual water fixture passes.
  Restored the original source and passed the complete gate. No accepted gain.
- PINNED static model bounds1002a360 ends at RET1002a518:441 bytes, not
  the inventory's438 (which cuts the final stack adjustment). Its isolated-TU
  comment mentions /Op, but the active profile does not set it. No compiler
  provenance claim follows from that comment; target retains x87 values.
- Explicit platform-minus-one local in fullscreen accounting compiles146 bytes
  rather than retail149, with a different loop/prologue. No body match. Removed
  it and passed the restored full checkpoint gate. Stop this spelling sweep;
  future work needs new caller/compiler structure evidence.
- Separate endpoint temporaries in both model debug functions: actual-source
  model fixture and774-extent gate pass, but accepted coverage stays579/101478.
  Boxes frame grows from0x3a8 to0x3b4 and many stack operands change. Rejected;
  restored the original shared point temporary. Do not repeat this lifetime form.

## Accepted source expansion after resume

Nine new game extents add1306 genuine C/C++ bytes over579/101478:
polygon197, box240, string131, scaled string145, literal-vector170,
array-offset103, scalar-sampler123, serialized-constant123 and existing
Com_ParseInt74 newly disambiguated by the real array-parser caller.
Fresh gate:588/102784, all783 game/library extents. Warm/cold bind and cmp are
identical; see proof/material_checkpoint.json and its nine negative controls.

- Box: signed edge loop emits237 bytes; unsigned indexing reproduces the
  byte-offset/JB loop and complete240-byte target. The inventory's231 cuts
  the loop branch/epilogue. One shared line writer was moved, not duplicated.
- Literal dispatch: memcmp form differs only in count-register scheduling;
  strcmp generates the complete170-byte match. Preserve recognized-type
  success even when Material_ParseVector returns failure.
- Serialized constants: primary call10019464 targets CRT printf100f620f,
  NOT engine Com_Printf10061c80. The strict binding checker rejected the
  wrong first declaration; the corrected123-byte source is accepted.
- Vertex writers: local-pointer versions149/191/206 versus target217/255/270.
  Direct indexed globals produce217/259/274. Store scheduling and the x87
  final product still mismatch. Three real source bodies and2016 native cases
  are retained, UNACCEPTED. No emitted bytes, assembly, root or checker change.
- Image lookup: direct branch154 versus181; typed range predicate plus I_sel
  gives173, with the first54 diagnostic instructions matching. Last predicate
  normalization/selection differs. Native hash/collision/wrap/program-range
  fixture passes; source remains UNACCEPTED.
- Nested sampler: recursive draft353 versus303; explicit iterative walk502.
  Both additionally lose the old library underscore-literal bindings at
  100f7b8e/220 and100f7c6a/78. Neither is accepted. The353-byte draft is saved
  in target/scratch/codex_20261020_sampler_source_deferred.cpp, outside active
  src. Its99-case test is explicitly DEFERRED and tests no active function.
  Remove/reinsert inside the material TU when retrying; a new TU is not the
  recorded experiment. Original passing material source is restored.

## API graph wave - 2026-10-22

- BeginDebugFrame10021ff0/73 accepts first build. Use the actual
  dx.skinnedCacheLockAddr, not the reference's dynamicBufferFrame guess.
  GfxDebugFrameGlob owns saved pointers, byte flag and embedded backend data.
  Compile-time checks pin data+12 and commands+219d0c; full historical global
  extent still requires independent layout proof.
- View setup10025570/286 accepts with output-first private signature and three
  explicit VectorCopy axis rows. Initial memcpy/AxisCopy forms produce247/286
  bytes but different register/base use. This is not historical signature proof.
- LodOrigin100256c0 remains UNACCEPTED. Three bounded forms:215,203,212 bytes.
  Latest212 differs by FMUL qword rather than dword at the degree/radian factor;
  no byte-match credit. A double promotion after the half-FOV preserves two
  multiplies but changes literal width. Do not repeat syntax sweeps without new
  compiler/TU/caller evidence.192 actual-source view/LOD routes pass, including
  lock transitions and NaN near planes. The reference's baseline tangent
  constant is wrong: retail double1019bf08 is0.6981317400932312, promoted from
  float arithmetic, not0.69813170079773179.
- Four empty API callbacks are real primary RETs, not placeholders:1000bad0,
  1000ce60,1000ce70,10020cf0. Sun reset10001280 jumps100013d0. Sources are
  restored for eventual GetRefAPI closure, without credit from address-only
  attribution. noinline on UpdateLights preserves the real outlined helper.
- Retail CodeView: RSDS GUID142974c2-5a6c-48f5-b39a-25c1649e5e89, age1,
  path c:\\builds\\crc6_v1\\pc\\cod2\\pc\\gfx_d3d_mp_x86_s.pdb.
  Reused candidate PDB has a different GUID and increasing age; repeat links
  alone cannot prove deterministic whole-file output. No metadata patch used.

## Cubemap API closure - 2026-10-22

- New accepted bodies: BGRA vertical flip100266f0/97 and hardware gamma
  upload100307e0/91. All822 earlier extents retained. Byte-offset locals
  calculated BEFORE either swap store avoid a redundant dimension reload;
  unsigned-word pointer/index forms produced111/96 bytes and wrong registers.
  Hardware ramp copies one256-ushort GfxGammaRamp into all three SDK channels,
  then SetGammaRamp(targetWindowIndex,0,&ramp). No retry/logging belongs here.
- Cubemap begin10026a50/28 and clear100269c0/115 have exact bytes. Binding
  remains blocked by RB_SetRenderTarget -> RB_UpdateViewportConstants.
  Early constant43 publication plus /Op still399 vs366. Both changes reverted;
  no new viewport gain. Do not repeat this profile/publication combination.
- Added the real end/capture chain. Capture100268b0/99 has exact bytes but
  waits for software gamma. End10026a70/20 has no unique discovery anchor.
  Capture ignores readback failure, flips, then applies gamma only when
  overbrightBits>0 and deviceSupportsGamma. Native tests cover576 routes.
- GfxGammaRamp is the real512-byte one-channel type (common_types.h6594), not
  D3DGAMMARAMP's1536-byte three-channel type. Restoring the actual second
  caller R_SetColorMappings10011fb0 and the typed producer input fixes the
  producer argument to ECX, and makes mappings38 and software gamma82 byte
  equal. Their bindings still wait for the157-byte producer10011f10.
  The producer differs in its index register/update scheduling at the loop
  tail. Pointer/array forms, typed structs, both callers and indexed/countdown
  loops were tested. Indexed common-store139 loses those two caller matches;
  restored typed countdown157. Stop register/loop spelling sweeps pending
  different original-TU/function-set evidence. Current size-first software
  gamma signature is a matching candidate, not historical prototype proof.
- Restored full save/copy/Fresnel-alpha source from primary265e0..26aae.
  Writer154 and public wrapper30 have exact bytes. Copy89 differs in one
  SIB base/index encoding for its zero-channel store; source-first argument
  order fixes all other register allocations. Pointer-local and direct-index
  versions retain that one mismatch. Alpha262 vs266 changes x87 spills and
  also depends on the unaccepted FresnelTerm. No save-chain coverage credit.
- TGA resolution is cached AFTER allocation and BEFORE header zeroing. This
  matches the target's single ushort load and shared high/low bytes, unlike
  four global byte loads. Saved face pointers remain dangling after both
  frees; failed writes still free both buffers. Native tests cover144 saves,
  including257-pixel dimensions, six faces, both write outcomes and alpha rays.
- Gamma producer and alpha reuse the PREEXISTING I_fround inline assembly.
  Neither is accepted, so the strict31/7787 exclusion set remains unchanged.
  If either later passes both referees, separately audit and exclude its
  assembly expansion before reporting C/C++ credit. Do not just relax counts.
  Backend source hash changed only for the new ordinary C++ gamma uploader;
  existing assembly definitions were not edited. Six counter negatives pass.
- build.sh now invokes the existing source counter on EVERY successful link;
  assembly attribution is a mandatory gate, not an optional reporting step.
- PINNED material closure2026-10-23: fixup1001c4e0 ends at1c73a (603 bytes).
  All serialized pointers relocate from the material base, including zero.
  Texture interning has no null branch; constant interning does. DX7 semantic
  3/4 clears the image and succeeds. Water width reads ushort, gravity800,
  image=0; other unassigned water fields remain untouched. Techniques iterate34.
  Loader1c740/171 closes zero/positive handles, ignores read return, retains
  permanent allocation on failed fixup; only missing '$' paths are silent.
  Registration17100/144 reuses hash/add/duplicate. Its byte-shaped body still
  fails loader binding and is NOT accepted coverage. Do not tune spelling now.
  Actual Material_Init173e0 clears0x299c, preloads, registers28 entries plus12
  when r_testFillEnable101ce79c is enabled, then raw setup17190. Helper17350
  ends17396 (71 bytes, not inventory64). Raw setup compares textures/constants/
  techniqueSet, rejects non-default raw with textureCount!=1 via Printf3,
  then init redirects only the texture-name pointer into rgp.rawTexdef.

### JPEG command closure - 2026-10-23

Reuse authenticated IJG6b; do not repeat archived broad compiler sweeps. Restore
the actual allocator pair at cinfo+18/+1c and error callbacks at+84/+88, Windows
boolean and BGR order. Compression368/decompression440/error140 bytes, dest28.
Pinned-compiler integration failures fixed before final successful build: use
minimal ri.h to avoid Windows INT32 conflict, declare existing vidConfig in the
common-view screenshot TU, and expose existing unsigned Com_sprintf signature.
Native fixtures require -malign-double to model MSVC double alignment. Original
exhausted-destination and screenshot numbering quirks are intentionally retained.
Final build/referees/full103 fixtures pass; four engine bodies252 bytes and136
IJG bodies38859 bytes accepted, all old1288 retained. Registration linked audit
also rejects wrong callback/RI slot. Source spelling sweeps were not pursued.

### Common PC backend view - 2026-10-23

The live common include is headers/cod2_defs.h plus PC/gfx_d3d/rb_backend.h.
common_types.h contains an inactive historical copy after its initial include;
do not edit or use that copy as proof of the compiled type. Existing actual
SDK backend view already has twelve matrices and explicit MSVC alignment.
The common view had an extra OGL matrix and COD2_ALIGNED is empty under MSVC.
Remove the OGL field in the live definition and explicitly align only this
matrix type under MSVC. The first preflight (only field removal) failed the
layout assertion; after alignment, the pinned compiler verifies all six pins:
matrix110, framecd0, stack4e0, level2b50, debugFont36b58, backend36b60.
Primary R_Init writes10764558 and RB_InitBackendGlobalStructs clears0xdad8
dwords at1072da00 and sets resolved targets10730554/58. Native fixture checks
both actual matrix declarations and rejects restoring the extra OGL matrix.
No extra global/backend wrapper or code-coverage credit.

### Surface setup structure - 2026-10-23

Primary BeginSurface1003a5f0 stores zeros to tess offsets5a7cc,5a7b8,5a7d0,
5a7d4,5a7d8,5a7dc, then publishes material/type/lmap. It does NOT clear
materialTime or optimizedIndexCount. Restore the actual remaining fields in
the shared header so later calibration/draw work never accesses beyond the
sole tess allocation. Diagnostic callee10037930 constructs35 pointers on stack;
all strings recovered independently from its immediate operands, no guessed
technique aliases. Existing Mac/open-source BeginSurface omits logging. PC calls
va then existing RB_LogPrint before mutating tess, conditionally on r_logFile.
Preflight passes. Do not add guards for invalid type/material absent from retail.

### Dynamic upload source - 2026-10-23

Primary index upload100386b0/282 and vertex upload100387d0/282 use actual SDK
buffers and existing Com_Memcpy/RI fatal callback. Ref vertex draft is wrong:
PC has no null-buffer guard, no color conversion and NO gpuSync dependency in
vertex lock flags (nonzero offset means NOOVERWRITE). Index rollover clears the
current slot and redirects to the pool if used is zero. Both functions reload
the live state after unlock/bind callbacks before publishing used. Error prints
two exact messages and calls RI+54; if that void callback returns, retail proceeds.
Native2064 normal routes plus4 failures pass, including callback pointer changes.
First preflight mounted test/sdk instead of dev/sdk and reported missing d3d9.h;
only that failed preflight container was stopped. Correct SDK is dev/sdk/sum2004,
matching build.sh. Do not interpret that mount failure as a compiler limitation.

Upload preflight rejected an incorrect RI+5c assertion: the locally pinned
refapi_pinned.json and primary GetRefAPI establish import base101d49c8, not
101d49c0. Absolute fatal address101d4a1c is therefore RI+54. Correct the pin,
not the table order; production callback member and behavior were already right.

Original compiler and both referees accept RB_SetIndexData282 bytes and the
shared lock-failure sequence as a genuine49-byte out-of-line primary function
100113e0 (retail uploads inline that same sequence). Both new extents are protected.
Vertex source compiles to282 bytes like retail; fdiff records changed registers
and alignment NOPs, with the same control flow. No source spelling/flag sweep,
new assembly or manual credit: restore genuine caller groups first. Shared
error source stays descriptive; a matching helper is not proof of its old name.

### Light-grid helper batch - 2026-10-23

GLM data/decomp contains useful primary decompiler output; src/f contains broken
assembly wrappers/_emit and is NOT source reconstruction. Use data/decomp plus
retail instructions, not naked wrappers. Restore141-byte lookup10035fb0 with
packed high/low coordinate keys, signed comparison after wrapped subtraction,
sun bit ignored and predecessor-on-miss. Its callers10036320 deliberately consume
that predecessor without checking found or lower bounds. Test with a guarded
prefix record to observe the original below-first behavior without hiding it.
The old Mac draft says insertion point and has a different nearest-lookup gate;
PC gate is (world && r_showMissingLightGrid) OR empty grid -> no fallback.
Packed colors are3x8 coefficients accumulated into24 floats; not per-direction
RGB. Default24 stores are recovered directly from primary100362d0. The other
three helpers are10036100/100361e0/10036320. No flag/spelling sweep; only search
gets V2 credit so far. No new assembly. Coordinate interpolation and visibility
helpers remain real work before SetupEntityLighting/DrawTechnique can link.

### Light-grid visibility/cache source - 2026-10-23

Primary source inputs: GLM data/decomp35bd0/35c40/35ac0/36040 plus instructions.
Use the existing s_vc_log/s_vc_logCount owners in rb_light_derive.cpp. Entries are
three unsigned shorts (6 bytes), capacity0x400000. Existing keys are returned
without insertion; misses may memmove/insert at the lexicographic lower bound.
Debug boxes use actual backEndData.debugGlobals+249d18 and existing shared colors.
Grid cells are32x32x64; sample boxes have radius0.5. Visibility skips tracing
when corner's needsTrace bit is clear (green radius0.9 when shown). Otherwise
normalize(sample-point), trace from sample to point+0.01*direction with zero
extents/model, oldHit0, brushmask2001 through RI.CM_BoxSightTrace+168. Clear
trace draws yellow radius1; blocked draws red1.1. Read showLightGrid AFTER trace
callback. Native135 cache,54 box,1152 actual visibility cases pass.
First test used an x87 extended temporary as expected box bound; corrected the
fixture to compare stored float32 arrays byte-for-byte, without tolerance.

Keep RB_GridVisLogIndex insertion control as int: primary35c40 tests a full
dword. Native0/1/-1/256 cases exercise that ABI. Do not narrow it to bool.
RB_DrawGridSampleBox must directly construct its blue0.5 box: the primary118-byte
body calls AddDebugBox, not the generic106-byte point-box helper. A19-byte
wrapper introduces a foreign call edge and needs correction before checkpoint.

The blue sample helper now directly computes its bounds and calls AddDebugBox,
preserving primary call structure. All1433 previous extents survive the final
source build, but no new body is V2 accepted. No manual credit or flag sweep.
Native trace mutation also changes grid.points: GetValidGridPoint reloads it
after visibility, as primary360ef-360f3 does. No snapshot pointer publication.

### Interpolation/entity/lighting/draw caller group - 2026-10-23

Primary363a0 uses bias DOUBLE0x3fdfffffff000000 =0.4999999990686774,
not exact0.5 (Ghidra rounds its printout). The existing I_fround adds2^-30.
Use the existing helper after subtracting0.5 for source interpolation; no new
authored assembly definitions or /QIfist flag. Native65536 interpolation routes
compare cells with the primary biased rounding expression across all256 occupancy
masks, four rounding modes and x8724/64-bit precision on bounded in-world inputs.
That is NOT proof for every IEEE input or instruction identity. Exact FP
spelling stays unresolved; if this body ever matches, audit/exclude its inlined
existing assembly from C++ credit, never merely relax the source gate.

Restored actual entity sampling366b0, lighting3a340 and draw dispatch3a580 using
existing shared world/backend/entity layouts. Original compiler confirms world
lightGrid11c, entity origin3c, lighting104, backend viewCount3b4. Entity publishes
viewCount before sampling and updates returned sun visibility afterward. PC
lighting writes code constants5/18/24/25 (Mac's0x85 alias is wrong). Reload
currentEntityLighting after callbacks. DX7 cached-tech15..17 returns untouched.
Draw dispatch updates viewport, runs lighting for6..17 and fog for3..26, reloading
the technique between phases. DX7 lightprobe9..14 uses actual16-byte override
10190690 [-1,-1,40000000,0]. No invented fallback/guard/default callback.
Native7 entity,2240 lighting and420 dispatch cases pass, including callback
changes to current lighting, technique and renderer and exact constant guards.

### Surface,2D,calibration,font and R_Init source - 2026-10-23

Shared GfxDrawPrimArgs is now one20-byte header for device/pass/surface callers.
Ordinary3a7b0 snapshots draw args before index upload, samples capacity afterward,
keeps its pre-upload stride, then reloads declaration for draw. Optimized3a690
chooses world VB+30 via rgp.world109c or smodelCacheVb; strides32/68 and24/64.
EndSurface3a8d0 captures the technique before viewport callback, clears only three
counts on skip and reloads ordinary count after optimized draw. Native1168 routes.

Set2D2e020 preserves unused cache slots/worldScale, builds orthographic transform,
and copies the primary normalized-world-view-projection slot from WORLD, not
projection. Normalized cache behavior is pinned, not a mathematical repair.
Use the existing identityMatrix44 global, shared colors and real D3D methods.
Packed PC stretch-pic has8 floats and unsigned color, not Mac stats parameter.
Overflow preserves declaration and may flush again if Begin leaves optimized
work. Native864 matrix/8 overflow/240 quad/109 query cases pass. Blue query
calibration3a9d0 captures sunFlareState[0].sunQuery[0], whiteMaterial at rgp1038,
begins/clears/issues/draws16x16/ends, polls S_FALSE with Sleep0 and returns256
on other failure. No CPU benchmark, no query status injection, no inScene write.

Font loaderc6a0 uses real FOpenRead unique1, handles -2 separately, closes short
files, allocates fileLen+4, reads16 header bytes then tail at runtime+20, closes
before pointer fixups/material lookup. Read return counts are ignored. Serialized
name/material offsets gain4; glyph pointer is runtime+20. Existing font registry
owner is reused for RegisterFontbce0, max16/case-insensitive cache. Errors that
return leave original publication behavior. Native60 file/registry routes pass.

R_Init12f80 now calls the actual13 retail steps with fonts/smalldevfont track1,
FFT arrays and final calibration publication. Native32 order/exception routes.
First FFT offset pin used the wrong rg base and was rejected by preflight.
Primary12e70 clears rg at101d4d00 (NOT101d4e70), so trig2510/bitswap2d10.
All final original-compiler pins pass, including FS imports13c/154/158, default
material102c, debugFont36b58 and dx.sunSpriteSamples2c2c. Never fix a failed pin
by adding padding or weakening it; read the primary base/field evidence.

### Shutdown source - 2026-10-23

Primary10012210..1001231c does NOT write alwaysfails at1076a830. GLM's
decompile fabricates that store and a repeated particle-index-buffer store;
raw instructions at100122a1..100122d7 only read the flag and clear owned
resource pointers. Keep the original retry loops, including their null-pointer
second iteration if that diagnostic flag is nonzero; do not invent recovery.
Native resource checks cover normal flag0, not that crashing diagnostic path.

Primary10023560 clears13 target records/260 bytes, then zeros the cached
single-sample depth pointer WITHOUT another Release. Surface releases happen
before reading each live image pointer. Primary1000cd10 retains the complete
programmable-image address range and rehashes retained entries in table order;
texture-null ordinary images still lose tracked memory but retain cardMemory.

Primary10013080 gates stream cleanup on device present AND deviceLost false,
clears the light/font counts without clearing their arrays, clears the complete
299c-byte material owner after Material_Shutdown, and clears world AGAIN after
image callbacks. Hardware teardown precedes RI+88 UnregisterSystem(2000h).
Primary10005360 removes ten names, including r_vc_stats not registered by the
nine-command startup. Do not repair that original asymmetry.

Primary10012dd0..10012e11 reloads windowCount/hwnd after IsWindow and
DestroyWindow. No cached stale index/handle, extra validity guard or separate
depth-alias release is equivalent. Shutdown uses the existing pools, sun query
records, normal debug frame and registries; no replacement state is allocated.

### Console API source - 2026-10-23

Primary API59 slots78/79 are ConsoleTextWidthc390 and DrawConsoleTextc4b0,
not GLM's shifted DrawTextInSpace/ConsoleTextWidth labels. The actual client
refexport declaration uses int width/void draw. PC code has no Mac ResolveFont
or null-font guard. Width adds unscaled fractional icon width, then converts
the final float to int. Draw copies the input color before testing the string;
it preserves alpha, carries RGB edits between runs/icons and still emits an
incomplete icon with null material. Do not invent fallback/validation guards.

String helperc0f0 starts color7; types13/16/17/18 start icons,10/11/12 update
RGB, other changes emit caret/color then the low character. It caps input
entries at1023, NOT expanded output bytes. Trailing-space trim is suppressed
at an icon boundary. Native cases stay within output capacity; these tests
are not a memory-safety claim for malformed packed text. Icon helperc250
uses13..15 RGB,16 width,17 height,19 flipped width and18 material; only18
consumes the input limit. RI slot168 returns a name; nonempty registers track7,
empty reloads the existing default material after the name callback.

Primary width function ends atRET1000c44f:192 bytes. GLM inventory186 cuts off
its ADD ESP,414h/RET footer. Icon helper's code ends1000c367 before its seven
switch pointers; future code-credit accounting must not count that table.
No instruction spelling/flag sweeps attempted; source structure remains first.

### Frame start - 2026-10-23

Primary16890 compares unsigned byte Material+13 first, then subtracts the
TechniqueSet pointers and divides by140 with signed magicEA0EA0EB/shift7.
The Mac reference's corrupt-pointer guard and raw address difference are NOT
in the target. Material_Sort16e70 calls the original VC7.1 std::_Sort and then
writes sortedIndex+10 for every live material. Both referees accept87 bytes
through RET10016ec6; inventory80 cuts off its tail. Using the original std::sort
also matches ten dependency extents/1830 bytes, not authored game credit.

Primary21db0 selects0.0 for the forced LOD and0.001f for OTHER levels, the
opposite of the Mac source. Default branch reads each of four distance dvars
immediately before RI+184.21e50 clears zFeather before checking DX7/current
enable and target6.colorSurface; GPU modified flags are captured before both
clear calls, then current multiGpu/gpuSync values are reloaded. Internal names
R_UpdateLodDistances/R_UpdateFrameDvars are role labels, not historical claims.

21f40 clears materialLoaded before sorting, then settings, client flush RI+12c
and a fresh skinCache test/lock0. No extra command-list reset from the Mac wrapper.
Primary registrationaaf0 identifies the dvar globals used by all these branches.
Native4105 routes include callbacks rearming materialLoaded, changing cleared
values, replacing world, updating subsequent LODs and flipping skinCache during
client flush. Matching these source bodies is deferred until structural closure;
no source-spelling/flag probes were run. All existing matches remain required.

### Device recovery - 2026-10-23

Primary13690 snapshots window0 hwnd/size, video hz/fullscreen and current AA
before114d0 present setup and12210 release. x/y are zero; unused tileCount is
not initialized or consumed. Reset reloads the current device afterward, then
calls _controlfp(20000h,30000h) and(8001fh,8001fh) BEFORE failure handling.
If fatal returns, it still clears deviceLost and calls resource initialization;
a second failure can call fatal again. R_ResetDevice is a role name.

Primary137f0 only defers for HRESULT88760868; every other result enters recovery.
It releases models/images/vertex declarations/shaders, conditionally releases
world, resets, conditionally reloads the LIVE world, rebuilds declarations/shaders/
lost images, conditionally optimizes models and publishes sun samples last.
Do not use Material_ReleaseAll: it clears the routing information needed by
Material_ReloadAll. Existing R_FinishLoadingModels has the exact optimization
guard/enumeration and is reused. Recovery is206 bytes through RET100138bd;
inventory203 omits MOV AL,1 / POP ECX / RET. No new byte credit is claimed.

Primaryd0f0 only rebuilds category5: width/height are unsigned shorts; dynamic
usage200h/pool0, DX7 mip1/format16h, DX9 mip0/format32h. d2e0 visits categories
>=5 with null textures outside the13-image program range; categories>5 remain
untouched by d0f0. This is not Image_LoadFromFile. Native checks cover both ends
of the program array, all category bytes and live table/renderer changes.

SDK permanent-state views now share r_permanent.h; one rgp allocation remains.
Cold build and all123 fixtures pass. Native reset tests mock COM/controlfp calls
to check args/order; they do not establish real Direct3D execution or FP state.
No byte tuning, new flags, duplicate storage or authored assembly was introduced.

### Backend commands/presentation - 2026-10-24

Primary table10190518 has34 slots: zero stop plus33 non-null handlers. Only
ClearScreen had source before this wave. New roles1/2/3 are Goto/Call/Return at
2eb60/70/90;4 material color31f10;13 viewport32310;14 target320e0. The three
state handlers capture command pointers BEFORE EndSurface, read payload afterward
and reload live execState->cmd for advancement. Mac reads the command after flush
in several wrappers; do not copy that ownership timing. State size16/return slots2.

Rejected split-TU, externally linked control helpers emitted EAX workers matching
interiors2eb64/8B,2eb74/26B,2eb94/14B. These are not the actual table entries;
no ledger/ratchet credit was taken. The six functions now stay static in the
original backend TU until the real table references them. Never add fake marker
arrays, temporary exports or partial retail tables just to force an ABI match.

Backend presentation33b20 calls Present once with five zeros. DEVICELOST skips
the error callback; other negative results report ERR_FATAL before setting lost/
flushing cache. Returning errors still continue. Reset the LIVE index pointer,
projection2D4bd, then logging. If either gamma flag is modified, clear BOTH and
read current ignore/support flags afterward. Existing color mappings are reused.

Command structs move verbatim to rb_commands.h; the smaller backend tess view is
replaced by the existing full schema. Reversing only include/declaration moves
restores the entire prior backend source exactly. Old pin61f816fe... becomes
c2d33a39...; no existing function/assembly instruction changes and no new authored
assembly. Source accounting still requires the same exclusions and fail-closed
negative controls. No TU/order edit remains. A test filename collision was fixed
by restoring test_backend_frame.py verbatim and adding test_backend_presentation.py;
the entire final suite is rerun, not accepted from the overwritten-fixture run.

### Backend 2D command records - 2026-10-24

PINNED primary2ebb0/2ec00/2ee80/2f0c0: stretch, rotate, arbitrary quad and
fullscreen wrappers. Quad/rotation publish counts before vertex setters and use
ushort base indices with3,0,2,2,0,1 ordering. Capture material after Set2D but
before EndSurface; advance from live exec cursor after callbacks. Fullscreen
uses signed dxState target dimensions, without Mac viewport or clamp additions.
Rotation uses the existing FastSinCos helper, not newly authored assembly.

New2D section removal reconstructs the entire prior backend source exactly;
reviewed pin c2d33a39... ->17082ec5..., unchanged31 exclusions/7787 bytes.
The host x87 fixture's literal UV comparison rejected correct serialized floats;
exact memcmp against the input UV bytes fixes the test without production edits
or compiler flags. Original build retains1447 extents and all126 fixtures pass.
No V2 gain: genuine command-table reachability is still absent.

### Backend light/stencil/shadow/clip payloads - 2026-10-24

PINNED primary31f60/371B captures light payload BEFORE EndSurface. Ambient,
color, specular, definition and position publish in that order; constants use
position3+i, ambient7+i, color5+i and specular9+i, preserving raw bits. PC2fa50/156B captures stencil payload before flush, reloads its value on
each R_DX_CALL retry and publishes cache from payload only after the call.

Primary2f990/185B instead takes the live shadow packet AFTER EndSurface. Copy
matrix to backEnd.shadowLookupMatrix, invalidate stack ZERO shadow.valid[0..3]
regardless of active level. Shadow-cookie target4 signed width feeds44=(w,w,
1/w,1/w),45=(0,0,0,fade); no zero-width or negative-width guard exists.

Primary2fd60/271B never flushes tess. Plane count is live across SetRenderState
and SetClipPlane callbacks/retries; enable mask uses x86 low-five-bit shift.
Cache publication reloads the packet count after SetRenderState. Matrix/plane
records live in rb_commands.h; four original functions are static in backend TU.
No new state allocation, source assembly, roots or TU/order change.

Focused test oracle initially expected retry-mutated clip count2 even when the
final callback changed it to1; correcting the expected publication order leaves
production source unchanged. Native424 routes pass. An initial full suite was
started before fresh cmp/bind reports: dependency-origin freshness guard rejected
it correctly. Repeat the entire suite only AFTER the original build completes;
never weaken freshness or accept that initial failed run.

### Backend begin-view and 3D setup - 2026-10-24

PINNED primary321f0/274B:48-byte packet, sceneDef4/16B, viewParms14h,
lodParms18h/20B and viewCount2ch. Packet captured BEFORE flush; copy view count,
scene, view pointer, LOD, viewport and viewProjection. Publish tile0/1 and live
vidConfig dimensions, update viewport constants only for behavior0, then actual
32120 frustum helper and2e380 Set3D. No Mac nextPow2/pixel-dimension scaling.

PINNED2e380/230B: flush pending work, clear projection2D, identity world matrix
at the current codeMatrixStack level, call existing ChangedWorldMatrix(1.0f),
then existing SetMatricesForView using live viewParms. Reload viewParms AFTER
that callback for origin/axis constants11..14 with w=1/0/0/0. Do not cache the
view pointer before matrix callbacks or restore a different stack's identity.
The prior code and assembly source restore exactly by removing the new view
section; no new assembly, roots, globals, flags or TU entries are introduced.
Native checks cover240 begin-view and240 direct3D setups; COM/matrix side effects
are mocked, so this is not complete GPU or game execution proof.

### Typed scene/LOD and image-residency chain - 2026-10-24

PINNED scene/LOD packet extents and offsets at321f0; shader399d0 reads scene's
float time at+4. Field names/types agree with active common/Mac GfxSceneDef and
GfxLodParms (SUPPORTED); consumed offsets are compile-pinned. r_scene_records.h
now shares16/20-byte SDK records; backend and command use them directly. Replace
the shader's raw scene+4 load with sceneDef.floatTime. Reverse only the two
struct-copy spellings to reconstruct all prior backend source after removing
the new image command; existing assembly is unchanged. Common/SDK ABI fixture
now checks both records and rejects a double-width floatTime.

Primary35850/56B comparison prioritizes SECOND image semantic==0, returning-1
including when BOTH semantics are zero. Do not normalize it into a conventional
reflexive comparator. Then first-zero returns+1; otherwise signed platform0
memory descending, semantic ascending. Pointer-array entries are real GfxImage*.

Primary35890/171B reuses registry iteration (excluding13 program images) and
original CRT qsort. Stop at semantic0; draw only mapType3 through LIVE
rgp.feedbackReplaceMaterial with(0,0,8,8,0,0,1,1,ffffffff), EndSurface per image,
then clear backEnd.currentFeedbackImage. Do not add an initial flush, restore a
prior feedback pointer or clear it on an interrupted draw. Primary31ef0/20B
calls traversal then advances the LIVE command cursor.

ImageList actual shared size is0x2004 (count4 +2048 pointers8192);
retail35890 stack probe0x2008 includes an extra local/alignment slot. Never
inflate the struct to the stack allocation. Registry sole storage is unchanged.
New rb_imagetouch.cpp TU follows backend in CANDIDATE order, supported by Mac
ownership; this placement is not proof of original object/link order.
Native196608 comparison cases,144 registry/command traversals and60 interrupted
draws pass, reusing actual registry iterator source. These mock drawing; no GPU
texture-residency result is claimed.

### Raw-frame command: primary evidence - 2026-10-24

PINNED command17=2f260/53B forwards x4/y8/wc/h10/cols14/rows18/data1c
from a32-byte packet, then advances live execution cursor. Actual2f110/331B
helper calls IDirect3DDevice9::CreateOffscreenPlainSurface(cols,rows,
X8R8G8B8=22,DEFAULT=0,&surface,0), NOT Mac's CreateTexture/GetSurfaceLevel
substitute. Creation failure returns immediately. LockRect(&locked,0,DISCARD=
2000h) is retried via the existing logging/alwaysfails path; HRESULT ignored.
Copy rows of RGBA to BGRA (swap R/B, preserve G/A), destination stride=Pitch,
source tightly packed. UnlockRect is NOT a logged/retried call. StretchRect
uses current dx.renderTargets[0].colorSurface, no source rect, destination
(x,y,x+w,y+h), LINEAR=2. Release the one surface once. No command-start surface
flush, extra texture object, invented clamp or error-reporting callback exists.
Helper original name remains unconfirmed; use a role name when reconstructed.
Raw-copy target keeps one advancing destination pointer and adds Pitch-4*cols
after each row. With cols<=0 the inner loop is skipped but that signed skip is
still applied; do not replace it with row*Pitch if testing artificial successful
creation for invalid widths. Creation uses HRESULT>=0 as success; no separate
null-surface guard is present. Device/target are read live for final StretchRect.

Raw-frame source now lives in rb_backend.cpp: private role helper RB_DrawRawSurface
and actual RB_StretchRawCmd. Pixel reads capture G/A/B/R before stores R/G/B/A;
this preserves target ordering even when a source pixel aliases its destination.
R_DX_CALL stringization reproduces the pinned rawSurf/lockedRect/DISCARD log.
The32-byte command schema is shared in rb_commands.h. Removing only the new raw
section reconstructs all prior backend executable/assembly source exactly.
Native4320 direct/command routes pass with actual R_DX_CALL macro: positive and
failed creation, zero dimensions, pitches, canaries, lock retries, failed lock/
unlock/stretch results, changing COM device/target and live command packets.
The tests mock COM and do not prove GPU execution or arbitrary input overlap.

### Typed frontend/API follow-up - 2026-10-24

PINNED existing matched writer22220/118B is currently named R_BlendSavedScreen
in this tree, but emits command0xb/28B. The primary handler table maps0xb to
ClearScreen2ff50; its fields match mask/stencil/depth/color, not a screen blend
rectangle. Current raw-bit int/pointer prototype is NOT proof of a genuine API
name/type. Before wiring API59 slot55, confirm client call sites and recover the
actual clear-command signature; do not propagate the legacy label into a typed
public table. Likewise21890/108B DrawSurfs writer's three opaque int payloads
need pointer/count/tech typing from primary consumers before genuine render-scene
source calls it. Existing byte matches stay protected while types are corrected.

### Genuine PC frontend types and names - 2026-10-24

PINNED client anchor SHA8caf434c9509020b9c94720d0407a31d61411312996dab9964f46865f070900e.
40f147 copies108 words to re=60f080. Client41332a/413351 calls clear at60f15c
(slot55);402238 calls viewport60f160(slot56);402261 calls blend60f158(slot54).
Those pair with renderer22220/118B,21bf0/98B and222f0/93B respectively. Client
source prototypes agree (SUPPORTED): clear(int,const float*,float,int), viewport
four ints, blend(int). Caller table positions are primary proof, not Mac labels.

R_ClearScreen(int4) was actually the viewport writer; rename R_AddCmdSetViewport.
R_SaveScreen(int) was actually blend; rename R_AddCmdBlendSavedScreen. Existing
R_BlendSavedScreen(byte,int*,int,byte) was the matched clear writer, while the
same TU also contained an UNMATCHED typed R_AddCmdClearScreen draft with an
extra allocation-null guard. Consolidate into one typed clear writer, preserving
the primary's unguarded allocation and raw float payload bits; remove the duplicate
root. Do not introduce a casted API callback or keep two implementations.

21890's actual20-byte DrawSurfs packet is order4/pointer8/countc/tech10. Use the
existing common GfxCmdDrawSurfs and enum/pointer types; PC has a fourth order
argument beyond the Mac reference's three-argument declaration. Allocator failure
still returns early. Blend12-byte packet writes only fadeMsec4; extra word8 stays
untouched. Viewport20-byte packet and clear28-byte packet remain unguarded.

The old no-argument R_RenderScene draft merely appended a null-target Goto, had
NO referee hits (candidate81B), and had no source caller, only a temporary root.
It is removed from the active source/root, recoverable in git. It must not stand
in for actual API36 RenderScene257a0, which remains missing. No verified extent
or completion credit is discarded by retiring that draft.

Native typed-writer fixture passes840 clear/81 viewport/10 blend/120 draw-surface
cases with actual common records; masks/stencil truncate, float bits survive,
allocator mutation changes live colors, padding/unused words stay untouched and
only the original checked allocations accept null. Primary client copy/calls
calibrate the API slots; this is not end-to-end client/renderer execution.

The first typed-clear probe used one16-byte memcpy for color and a4-byte depth
copy. Native cases passed, but original compiler produced120B vs protected118B
and changed source/base registers and copy scheduling; regression rejected ONLY
22220. New viewport, blend and draw-surface types survived. This was NOT accepted.
Failed source SHA79657186e7934765489508787214f900fa925bdffc323d3a263a59be420d4136.
Next bounded structural probe uses four explicit4-byte color copies, preserving
the primary word-copy shape and raw float bits. Do not relax the118-byte gate or
claim the prototype change matched before both unchanged referees pass.

The second typed-clear probe (four4-byte color copies) passes BOTH referees at
the original22220/118B. Correctly typed viewport21bf0/98B, blend222f0/93B and
DrawSurfs21890/108B also pass. The full1448 accepted address/extent set is
identical to the frozen image-residency baseline. No old match was waived.
Temporary exports drop159->157 by consolidating the unmatched typed clear and
removing the unmatched null-jump RenderScene draft. This is not GetRefAPI closure.

### Screen copy/save/blur/blend group - 2026-10-24

PINNED2eaa0/186B: Image_GetSurface followed by retried/logged StretchRect from
LIVE dxState.renderTargetSurface, LINEAR, no rectangles; release of the captured
surface is also retried/logged. Reuse the existing Image_GetSurface; no second
buffer, texture allocation, device cache or COM ownership rule is introduced.
Save command10=30c90/58B flushes pending work, copies target7 image, THEN publishes
live backEnd.sceneDef.time to rgp.savedScreenTime10e0 and advances the live cursor.

Blur is command28=309a0/113B, NOT table7. Its30920/122B pass captures signed
width/height and target5 image BEFORE copy; after callbacks, assigns that captured
image as feedback and reads LIVE shadowCookieBlurMaterial1054. Draw(1,1,w-2,h-2)
with white, EndSurface. Pair UVs are3/256..255/256 then1/256..253/256. Outer
loop reloads sc_blur pointer/integer AFTER BOTH passes; do not snapshot Mac's
blurCount or stop after only one pass when a callback changes it to zero.

Blend command29=30cd0/257B captures original packet before EndSurface and Set2D.
32-bit wrapped sceneTime-savedTime must be nonnegative and strictly below the
original packet's fadeMsec. Pow base is(double)0.01f, exact bits3f847ae140000000,
not double literal0.01. Clamp only >float0.99, multiply255 and store float BEFORE
existing I_fround. Primary bias3e10000000000000 is2^-30, agreeing with the existing
helper, not a new half-bias. Pack low24 white/high8 alpha, use target7 image and
shellShockMaterial10d0; signed target dimensions, UV0..1. No Mac power-of-two
ratios, low-byte alpha, post-draw flush or feedback clear. Existing inline ASM
reuse stays uncredited and requires attribution audit on any future V2 match.

New code is in original backend TU with shared12-byte fade packet. Removing
only the screen-command section restores every prior backend source byte; no new
assembly definitions. Native fixture uses ACTUAL Image_GetSurface and R_DX_CALL,
COM mocks and a native rounding model. It checks48 copies/48 saves/240 blur/
1536 blend routes; not GPU residency or exact MSVC x87 instruction identity.
Fixture setup initially sliced Image_GetSurface to an EARLIER R_SetPicmip
prototype; start-relative end lookup and body assertion fix the empty slice.
A fixed image1 expectation was wrong after a callback changed target7; the oracle
now checks the live target7 resource, matching primary. Production code unchanged.

### Next geometry group: stencil-plane evidence - 2026-10-24

PINNED command7=2faf0..2fd5a is StencilPlanes, not shadow blur. Header4, nearDist4,
planeCount8, float distances atc. Use existing stencilPlaneMaterial1034, technique3,
lightmap31, standard strict4/6 overflow and existing RB_TessOverflow. Read plane
geometry AFTER overflow callbacks; each RB_SetVertex4D call uses live vertexCount.
Vertices(-d,-d,d-near,d),(-d,d,d-near,d),(d,d,d-near,d),(d,-d,d-near,d), UV0,0,
white. Indices0,1,2,2,3,0 relative live base; counts publish AFTER writes. Count is
reloaded after each plane. EndSurface even for no planes, then live cursor advance.
No Set2D or Set3D call occurs. New source is still required; this is input evidence.

### Stencil planes and packed triangles - 2026-10-24

PINNED command7=2faf0/619B, command32=31e90/93B and its actual31d20/361B helper.
Do not use the earlier unverified assumption that31cc0 is triangles: PC31cc0
is line dispatch (count4/width6, vertices8; 2D31470(count,verts), 3D31780 with
count,width,verts,1). PC31420 is point dispatch (2D30de0,3D31070), command30.
The Mac command table leaves several of these primary slots empty.

Stencil packet is header4/nearDist4/planeCount8/float distancesc. Capture packet
and rgp.stencilPlaneMaterial before the initial material/technique flush. No Set2D/
Set3D. Reuse strict4/6 capacity and actual RB_TessOverflow; geometry is read AFTER
that callback. Four RB_SetVertex4D calls reload live vertexCount each time while
keeping distance/depth fixed within the quad. White/UV0,0, winding0,1,2,2,3,0.
Counts publish only afterward, vertex before index. Reload planeCount per loop;
EndSurface even for zero planes and advance the live cursor after the final flush.

Triangle prefix16 bytes: material4,tech8,signed short indexCountc/vertexCounte.
Payload arrays: xyzw16*n, normal12*n, color4*n, UV8*n, then u16 indices. Wrapper
computes these from the original count before calling31d20. The helper captures
scalar counts/material/tech by value across callbacks; only the array contents
remain live. Flush pending, switch to3D IF projection2D is true (Mac draft's
condition was reversed), then original material/tech handling and capacity.
Copy base-shifted indices BEFORE vertex calls; each RB_SetLitVertex4D uses live
vertexCount+i and the original packet color pointer. Add signed counts AFTER all
writes, index then vertex, and EndSurface unconditionally before live advancement.

New source reuses the actual overflow helper and existing verified vertex writers.
SDK header now pins stencil/triangle and future point/line packet records; the
latter two are structure evidence, not restored handler credit. No new state,
flags, roots, TU/order or assembly. Native2160 stencil and8640 direct/packed
triangle cases pass, including changing packet payloads/counts, pointer/counter
changes during vertex calls, original packed offsets, late publication, index
wrap/guards and nested overflow declaration restore. GPU submission and full
vertex encoding are covered by separate existing helpers, not claimed here as
new hardware evidence. All1448 old address/extents survive the original build.

### Point command closure - 2026-10-24

PINNED primary command30=10031420..10031465 dispatches projection2D true to
10030de0/655B and false to10031070/931B. Both consume the original signed-short
packet (count4,size6,16-byte vertices8), then the wrapper advances the LIVE cursor.
The two helpers capture whiteMaterial/pointMaterial before a mismatch flush and
BeginSurface(technique3,lightmap31). Size is captured AFTER surface setup. Count
is reloaded each iteration; vertex counts remain live per setter. Original
RB_SetVertex4D receives the packet color address, not a packed-color copy.

2D computes half-size once, overflows BEFORE reading current point geometry,
writes indices1,0,2,2,0,3 and publishes indexCount+6 BEFORE the four setters.
Each setter rereads current XYZ; vertexCount+4 publishes afterward. No final
EndSurface, even for empty/negative counts. Do not copy Mac's extra final flush.

3D writes identity projection at the current matrix-stack level, calls existing
RB_ProjectionMatrixChanged and RB_SetViewMatrix(identity), then captures the
current viewProjection pointer and signed size/render-target scales. Transform
four components with z*m2+y*m1+x*m0+m3; store clip coordinates/offsets and
clipZ-=clipW*0.001f BEFORE overflow. The current quad retains this math across
callbacks, while subsequent points use the captured matrix's live contents.
Winding3,0,2,2,0,1; index count early, vertex count late. Always EndSurface and
restore the FRESH backEnd.viewParms, including empty/negative counts. No world
matrix reset, W guards, clipping or new assembly. Existing r_init owns rgp,
rb_state owns matrices/state and r_sky owns tess; no new allocation or TU.

Actual-source native fixture covers7776 routes:2D/3D, negative/zero/positive
count/size, signed target widths, exact/overflow limits, material/technique
mismatch, pending optimized indices, setup/overflow/setter/final-flush callbacks,
size/geometry/count/matrix/view/cursor mutations, original overflow declaration
restore, early indices and late vertices. Surface/matrix/vertex calls are mocked;
this is structural behavior evidence, not x87 instruction, GPU or byte acceptance.
Test corrections retained conceptually: capacity is cumulative across points,
and an overflow on any point freezes that point's expected clip math; the first
fixture incorrectly assumed overflow could only occur before the first point.

PINNED next line chain:2D10031470/760B takes(count,verts), NOT a width argument;
3D10031780/1332B takes(count,width,verts,bool depthTest). Command31=10031cc0/91B
sign-extends count4/width6, passes vertices8 and depthTest1 for3D, then advances
LIVE cursor. Direct calls into3D also exist at34034,340da,3449f,3456e,345bd;
retain the real depthTest parameter for later debug closures.

Both helpers normalize a stored float squared length via original sqrt and
TEST AH,44/JNP after comparison to zero. Equal has masked40 (odd parity), skips;
ordered unequal has00 (even parity), normalizes; unordered has44 (even parity),
normalizes. Thus the source predicate is length!=0 (including NaN), not length>0
or an ordered/non-NaN guard. Existing Vec2Normalize has this predicate and sqrt.
2D then scales by0.5. Geometry offsets are calculated BEFORE overflow but actual
XYZ/color are read afterward and per setter.3D retains transformed endpoint
coordinates across overflow, scales normalized perpendicular by width/target
size and endpoint W, and has NO point-style Z bias.

PINNED2D vertex writer1002e550..1002e634/229B is XYZ/UV/color-pointer, distinct
from existing packed-color2D and homogeneous4D writers. DX7 stride36/raw XYZ;
DX9 stride64/XYZW1. Normal+Z,binormal+Y,tangent+X. Three independent call groups
at3169c..3173f,32989..32a3c and33398..33488. Do not route through a differently
shaped helper just because the output is usually equal.

3D line startup captures lineMaterial before mismatch flush/Begin; after Begin
reloads rgp.lineMaterial for depth edits. If depthTest0, clear bitsE at+30 and
store, then OR2 and store. On exit EndSurface then restore LIVE view, reload
LIVE lineMaterial, clear bitsE/store then OR4/store. Do not restore saved bits or
saved material. Preserve the two target writes explicitly; no claim that volatile
was present in historical source. All this is pinned research, not source credit.

### Line source closure - 2026-10-24

Restored the preceding pinned2D/3D helpers and command31, plus the actual XYZ
vertex writer1002e550/229B. All are in existing rb_backend.cpp;3D remains public
for the real debug callers, with no artificial root/export. Existing Vec2Normalize
supplies the target's sqrt/zero predicate; no new authored FP-status assembly.
Shared GfxPointVertex remains16 bytes. A named material-state VIEW pins stateBits
at2c/30 over the sole existing material, not a duplicate Material allocation.
Volatile on the two local write sites preserves the two PC stores; historical
volatile source provenance is not claimed. Direct3D depthTest consumes a byte,
as target317ce and31c87 show; the inactive reference header's int is not authority.

Initial VC7.1 build rejected offsetof(View,stateBits[1]) as nonconstant (C2057/
C2466). Replaced only the assertion with offsetof(View,stateBits)+sizeof(uint),
which pins the same30h field and changes no executable source. No flag trial.

Native17280 actual-source line routes cover direct/command dispatch, signed
count/width, zero/negative counts and widths, material/tech mismatch, exact and
exceeded capacity, original normalize/overflow source, NaN/infinite/degenerate
endpoints, setup/overflow/setter/restore mutations, fixed scalar arguments, live
color/XYZ/cursor, retained clip math/offsets, fresh line-material depth restoration
and early index/late vertex publication. Existing vertex writer fixture expands
to2688 full-buffer DX7/DX9 cases including the XYZ writer; no GPU/x87 byte proof.

Next connected target PINNED: command25 early-post10030c10/126B already calls
our actual CopyBackBufferToSurface1002eaa0. Flush pending ordinary/optimized
indices first, then set backEnd.resolvedPostSunTarget=14. Copy target1 image
(dx target image101d4834) if r_distortion enabled OR (renderer!=2 AND
hasSeparateAlphaBlend AND r_glow enabled AND !r_fullbright). Only after copy
returns set resolvedPostSunTarget=1; always advance LIVE cursor afterward.
The OR short circuit bypasses every glow/capability test when distortion is on.
Primary registration pins r_distortion101ce650 (literal10192818,call1000b751,
store1000b763), r_glow101ce71c (literal10192810,call1000b768,store1000b787),
r_fullbright101ce6d0 (literal10192ed4,call1000abb2,store1000abc9). Existing typed
hasSeparateAlphaBlend offset2d7d is101d496d; loader already asserts that offset.
No new helper body or state allocation needed for this next handler.
Remaining table entries after point/line source:19=2eff0 sprite,21=32c10 text,
22=32c60 text-space,23=2f900 surfaces,24=2f970 sun,25=30c10 early-post,
26=30ba0 late-post,27=30b60 sun-post. Table10190518 is primary, not Mac holes.

### Early post-effects source - 2026-10-24

Command25 now uses the primary126-byte behavior pinned above. Existing enum
NONE14/RESOLVED_POST_SUN1 and existing RG/dvars/device state are reused. Current
source adds only a private handler and r_distortion declaration, not a new table,
allocation, root or flag. Native3076 routes extend the existing screen fixture,
which still executes real Image_GetSurface and R_DX_CALL retry/logging code.
All16 flag combinations and four renderer values exercise ordinary/optimized
flushes, three retry counts and callback mutations. Tests check NONE throughout
the surface calls, final target1 after copy even if Release mutates the field,
live target after initial flush and live cursor after COM. Null skipped dvar
pointers prove distortion/capability short circuit rather than eager evaluation.
Prior48 copies/48 saves/240 blurs/1536 blends remain in the same fixture.

Next sun closure primary: draw command24=2f970/27B calls3bff0(viewIndex); sun-post
command27=30b60/60B flushes then calls3c050(viewIndex), both live cursor afterward.
3bff0/87B gates on r_sun101ce684 and world.sun.hasValidData at+160; sets3D only
if projection2D, then3b550(state) and3bf00(state). State=existing10764590+48*index.
3c050/96B reads scene time1072ddb8 and state.lastTime+12 BEFORE gating; delta10
if lastTime0 or lastTime>now, otherwise wrapped int subtraction; always stores
now first. Then same sun/world gate and calls3bce0(state,delta),3bf60(state).
Do not copy Mac's return type into PC void wrappers or omit disabled timestamp
updates. Helpers3b550/3bf00/3bce0/3bf60 and their actual geometry/query/filter
callees still need source; wrappers alone do not close these command chains.

Late-post helper10030a40/111B is AL-only RB_NeedsSceneCopy(float), ALREADY
accepted by both current referees. Preserve existing source: primary TEST AH,41
accepts only ordered >0 for either blur value; NaN does not independently request
a copy. GLM's relational reconstruction obscures this. Existing >0 predicates
are correct; no rewrite/FP-status assembly is needed. Late command26's other
helpers30ab0/308c0 and their glow/blur/debug chains still need source.

### API-first sequencing audit - 2026-10-24

Owner challenged the time spent on small backend waves. Stop using individual
command coverage as the execution priority for stages1-3. Real API/startup/world/
scene ownership and dependency closure are the priority; keep already verified
commands and helpers, and batch further implementation before the next full pass.
No text source/header changes were made during the research preceding this audit.

Fresh bind identifies SIX API callbacks with matching bodies but open callee
bindings: slot0 R_Shutdown -> RB_SaveLightVisHistory;1 R_BeginRegistration ->
R_Init;47 R_BeginFrame -> R_UpdateFrameDvars;61 R_RegisterFont -> R_LoadFont;
64 R_BeginCubemapShot -> R_ClearForCubemapShot;66 R_SaveCubemapShot ->
R_WriteCubemapShot. api_callbacks.tsv now records these actual candidate symbols,
source TUs and exact referee reasons. These are NOT six missing callback bodies
and are NOT binding-accepted credit. The other38 unverified callback slots still
need source/ABI classification; never call all44 missing implementations.

Verified source gaps directly relevant to GetRefAPI: current compiled source has
no R_LoadWorld10001690 or actual R_RenderScene100257a0. Material_Register10017100
already exists in r_material.cpp, but API wrapper R_RegisterMaterial10017290 does
not. Raw-image API100172b0 also needs its actual171f0 helper, which calls image
loader1000fc30; this is NOT existing IWI Image_LoadFromFile1000fa40. Raw loader
fc30 calls14940, image setup ee30 and format-dependent ec00/ea20 before freeing
both temporary allocations. Do not hook it to the IWI loader by a similar name.
These primary traces explain connected missing-source work; do not fabricate a
complete GetRefAPI table to bypass it. Preserve ABI inputs (both API material
wrappers have three args; baseImageFlags is unused on PC). No function flag/
spelling sweeps are authorized by this audit.

### Codex 2026-10-24 command-file move

The original build and both referees retain all1448 protected extents with
R_RegisterCmds/R_UnregisterCmds in r_cmds.cpp. The first fixture replay
stopped in test_begin_registration.py: its slice ended at the old moved
10005360 marker. Repointed the boundary to R_UnregisterCmds's declaration
in r_init; test registration/shutdown sources read r_cmds directly through
the fragment map. No compiler-input or referee change was needed. The old
fixture is preserved under scratch/codex_1024_structure/before_cmds/tests.

The second replay reached test_renderer_systems.py and found one more old
end marker (R_ScreenShot_f's moved declaration). Repointed it to the new
R_RegisterCmds declaration and checked all moved callback names in tests.
Both failures were fixture slicing, not source or extent regressions.

### PINNED static-model chain boundaries, 2026-10-24

Primary RETs: entity loader10003880..10003d3d is1214 bytes, not the GLM
inventory's1206; it omits the last POP, stack adjustment and RET. Lighting
cache writer1002a570..1002a6c4 is341 bytes, not335. Float lookup10002e80/72,
vec3 lookup10002ed0/115, hex lookup10002f50/192, validation10003030/328,
misc-model loader100031b0/626, grid sample1002a6d0/81, ground sample
1002a730/79, cache prepare1002a780/223 and cache finish1002a860/214. These
are primary boundaries, not new V2 credit. Caller100032b2 reads RI+198
(101d4b60), which is XModelGetFlags; GLM incorrectly labels it GetName.
At10003296 the caller loads modelscale_vec[2]; scalar modelscale fills all
three entries only when modelscale_vec is absent. Evidence: scratch/
codex_1024_structure/static_model_primary.asm plus the retail tail at3d2d.

### Static-model caller group, bounded trials1-4 (Codex 2026-10-24)

All four original builds retain all1448 protected extents. Vec3 lookup
10002ed0/115 and hex lookup10002f50/192 pass BOTH byte and binding referees:
307 provisional new C++ bytes. Native spawn, entity and lighting fixtures
pass on trial3; final full-suite replay is pending the settled batch.

- R_RegisterModel expanded into validation, growing it to488 vs328. A
  noinline declaration in the caller TU did not prevent this under VC7.1
  LTCG. The primary-justified annotation on its actual r_model definition
  reduces validation to349 and preserves all protected matches. No historical
  annotation provenance is claimed. Moving vars to the final parameter alone
  still produces349. Trial5 changes the model-name lookup join shape.
- Float lookup double/early-return and float/early-return both produce65,
  vs retail72. An explicit guarded scan with float return produces81.
  Trial5 tests that guarded scan with double return; caller ABI and every
  accepted extent remain guarded. Do not infer /GL impossibility.
- Grid midpoint: scalar fields produce81 with Y/Z add operands reversed
  from retail; reversing source operands does not fix it. Vec3Add followed
  by Vec3Scale grows to92, rejected; restored scalar form in trial4.
- Ground lighting: inherited cached-value loop unrolls to97 vs79. Two
  Vector4Set calls with an ordinary for loop unroll to145. Explicit eight
  assignments with do/while(++index !=3) produce a rolled73-byte body;
  trial5 uses Vector4Set with that retained-loop form.
- A real local rounded-color copy belongs at10029780 (same retail bytes
  as1000f180). First local signature produces285 bytes with no byte hit,
  vs the shared helper's already accepted285. Trial5 reverses only the
  local helper's argument order and its caller. Existing I_fround is reused;
  no authored assembly definition or accounting guard has changed.

Source snapshots and referee JSONs: scratch/codex_1024_structure/static_trial*;
validation side-by-side: proof/latest/static_validation_trial3.diff. The new
source lives in the existing retail files; no TU/root/export/flag was added.

### Static-model trials5-6 and settled source

Both builds retain all1448 protected extents and the two new accepted leaves.
The full139-fixture suite passes on trial6; two accepted-leaf binding checks
now have ten target/length/owner/closure/removal negatives. No referee or
assembly accounting gate changed, and no authored assembly was added.

- Guarded float scan stays81 with either float or double return. Restored
  the simpler double-return scan65; the retail72-byte double-exit layout
  remains DEFER. No compiler/TU impossibility claim.
- Index/value join lookup reduces validation349->336; original parameter
  order plus explicit found-label reduces it to332 vs328. Misc-model
  caller becomes625 vs626; loader stays1232 vs1214. These remain drafts.
- do/while(++index !=3) retains the ground loop; Vector4Set yields78 vs79.
  Post-incrementing the output pointer also yields78. Remaining difference
  is index/pointer scheduling around the first four captured channel loads.
- Grid array loop stays81 vs81 but does not match normalized bytes. Color
  helper with reversed parameters stays285 without a byte hit. Cache
  writer stays356 vs341. All remain uncredited drafts. The new private
  color copy reuses existing I_fround and receives no C++ credit.

The bounds1002a360 helper also moved into r_staticmodel_load_obj before
1002a520, with unchanged flags/signature. Its old /Op comment was stale.
Original build/referees retain all1448 extents and307 new C++ bytes; bounds
remains406 vs441. Final fixture replay: codex_static_bounds_merge_fixtures.log.


### Codex recovery and image caller group - 2026-10-25

Claude stopped at bdacf3c (Image_Reload artificial root removed), leaving two
r_image.cpp edits: a direct lookup ternary and an unsigned lost-image index.
The old handoff was not updated. Fresh original build, both referees,1448
protected extents and all139 fixtures pass before further changes. Recovered
C/C++107742/253580 (42.488366590%),638 bodies; same-offset9.483296892%.
The frozen starting accepted set has1479 source/library address-extents.
Claude added world-loader/source and matching BSP/static-model/light helpers;
these are preserved. No commits or staging by Codex.

Trial1: native C++ bool for private Image_IsCodeImage matches1000cc80/23 and
unlocks Image_FindExisting1000d140/181. The previous unsigned-char Bool emits
MOV AL,1 and XOR AL,AL; retail uses EAX for both constants. The lookup's rest
already agrees. Both unchanged referees accept204 new C/C++ bytes, no starting
accepted extent lost. Three actual-source fixture slice markers follow the
private type change. The lookup fixture now covers all13 program images and
checks both exact binding rows/owners, not only a masked byte hit.

The same trial splits Image_BuildWaterMap1000d0f0 into the primary's separate
DX9/DX7 Create2DTexture calls. It grows68->74, the exact retail extent, but two
MOVZX word loads differ from retail MOV AX/CX. This is a source-restored draft,
not credited bytes; no type/ABI change or compiler-impossibility claim.

Trial2 reads the just-stored image width/height in CreateTexture instead of
casting the input dimensions. The113-byte creator remains matched, but the two
caller loads are unchanged. Reverted this unproductive callee edit. No flags,
TU/order, roots, globals, SDK or referee/accounting changes. Snapshots and cmp/
bind rows are in scratch/codex_1025_resume; logs proof/latest/codex_image_resume_*.
The final source keeps trial1 plus the primary citation and fixture guards.


### Completing the five placement exceptions - 2026-10-25

DPVS trial1 moves the2317-byte corner helper and117-byte brush culler into
r_dpvs.cpp, bracketing only these definitions with VC7.1 pragma optimize("p",
on/off). The compiler accepts the pragma without warnings. The corner helper
still passes both referees; all1481 starting accepted address-extents survive.
The culler's existing R_FilterEntityIntoCells_r binding is still open, so no
new credit. Final source places the section after the cell filter, before
portal helpers, and updates the affected BSP fixture boundary.

Light-grid trial1 merges the465-byte callback into r_image_load_obj with the
same local precise region. It matches both referees in its proper owner and
retains the9 old floating-point extents that a whole-TU /Op move lost. However,
the unchanged gate rejects two CRT rows: _cvtdate440 and __isindst_lk391.
This is a real layout dependency to resolve, not accepted placement yet.

PINNED: _cvtdate indexes month tables from __lpdays-4 and __days-4. Retail
FloatFormat is101a54a8, the original five code-page records start101a54c8,
__lpdays is101a55bc. The trial puts code-page records10189538 before the CRT
float-format contribution10189628/48 (FloatFormat at10189640), then __lpdays
10189660. The negative table base now resolves to FloatFormat+1c and fails
binding. Testing the original intrncvt.obj from the pinned LIBCMT before
archive extraction restores the evidenced contribution order, without filler,
byte patching or referee edits. The original linker /lib mode extracts it;
lib.exe is not installed. The first make attempt used an uppercase Linux file
prerequisite; corrected to actual libcmt.lib. No candidate release proof from
that failed build. Snapshots: scratch/codex_1025_placement/lightgrid_trial1.


The CRT single-object trial still fails: the month-table negative base is then
unresolved padding beside the code-page contribution. Primary bytes identify
9876 immediately before __lpdays as the original matherr flag. Linking all four
original objects in retail data order (intrncvt48,mbctype248,matherr4,days104)
produces an exact404-byte block at candidate10182040 vs retail101a5490 and
restores both CRT bindings. No original object contents were edited. Four
vendor objects are build artifacts, not authored source/credit. The first group
extraction used the wrong archive prefix for matherr; link /lib /list confirms
it shares the '..\build' prefix with intrncvt. Retried with an output-existence
check. placement_lightgrid_crt_group_retry_build.log passes every gate and all
1481 starting accepted extents. Original archive SHA:
6e2b3742e58245de52149137f64281b73db1487a07a31e165fff269fbf9b2ee8.

Math trial1 moves the existing anim wrapper to com_math and locally disables p
for the two inline definitions via a private source macro. Under global /Op,
ConvertQuatToMat still grows181->253, and both accepted quaternion bindings
are lost. Rejected; the shared header is restored byte-for-byte and no macro
is kept. Trial2 parses com_math headers without /Op, enables p for its source
math definitions, and disables it for the anim wrapper. Both181/105-byte shared
instances match in com_math.obj, and all1481 starting extents survive. The old
xanim_matrix TU is retired. Generated ownership map has zero disagreements.
No historical pragma spelling is claimed. Snapshots: math_trial1/five_accepted.

The next cell-filter trial enables p over its335-byte definition; no byte gain.
Reverted this change, retaining the five accepted placements. An overbroad
cleanup removed rgp's declaration from r_surfbounds although its cached-model
bounds callback still uses it; compile caught this and the declaration was
restored before retry. No failed build is a release proof. Three focused native
checks pass (3072 brush routes,404-byte CRT block and512 model corner oracles).
Added exact owner/binding guards for the accepted quaternion and brush helpers.

Next source trial follows the primary wavelet loop's shift-before-count update,
replacing the earlier count-before-shift for loop. The existing2048-route native
wavelet fixture covers the same mip allocations/uploads/free order. No type or
ABI change and no invented callback. The final full-suite replay follows the
settled source trial. Source before trial: image_load_before_wavelet.cpp.


Wavelet loop-shift trial and independent-field initialization-order trial both
remain539 bytes, without a byte hit; all old extents survive. Reusing the actual
Image_CountMipmapsForFile helper instead of spelling out the count produces553
bytes, also unaccepted, while retaining the helper's own47-byte match. All three
image experiments are reverted. No signature/ABI or assembly change. The original
539-byte draft remains, with no new byte credit or impossibility claim. Snapshot
folders wavelet_loop_trial, wavelet_init_trial, wavelet_shared_count_trial retain
cmp/bind evidence. The final forced rebuild and141-fixture pass certify only
the settled five placement fixes and original CRT data order.


The forced final rebuild also accepts six existing C/C++ header instances:
I_fsel10023630/27, I_fmax10023650/31, VectorLength10005bb0/33,
I_fclamp10058220/59, Vec2Length1003edf0/22 and Vec4LengthSq100582e0/42.
Total214 new authored C/C++ bytes, independent of the source moves. Nine original
CRT bodies add1519 library bytes separately. All1481 starting extents survive;
C/C++108160/253580=42.653206089%,646 bodies. The full141-fixture suite passes.
An EOF-only whitespace cleanup then receives a fresh build/referee pass and
focused brush/BSP/model/CRT/layout/source-attribution rechecks; no logic changes
or additional source trials are included. No tests or referee policy relaxed.


Next API source lead, pinned directly during this wave: slot4 callback
10017290 is29 bytes; slot5 callback100172b0 is30 bytes. Both dereference name
at stack arg1, return the current pointer at101d1b2c for an empty string, and
ignore stack arg2. Slot4 forwards arg3 to Material_Register10017100; slot5
forwards name/arg3 to the missing raw-material helper100171f0. Do not implement
these as unconditional tail forwards or confuse the raw loader with IWI.
No API callback source was added in this placement wave.

### Next connected API group: scene entity submission (primary notes)

PINNED API20 at10023db0/209 dispatches signed reType<2 to10023cc0/128.
Higher types first check StatMon at101ce624 and entityCount>7364, warning with
(type5,duration3000,"gfx/2d/warning@models.jpg"); invalid signed type<0 or>9
uses ERR_DROP. Full backend buffer (>8183) warns once per frame using a separate
warnCount1076a878 and returnsNULL. Otherwise it calls existing allocator23af0,
then23780(index,refEnt,model) and returns scene.def.entities[index].

23780 copies116 bytes, changes exactly-zero scale to1 (NaNs unchanged), clears
52-byte scene record, then either emits the real SF_ENTITY surface101a5a2c for
reType>3 or stores the GfxModel union for types2/3. Model helper23cc0 performs
same copy/scale/clear, stores model+cent pointers and calls DPVS8330 on type1.
Current shared headers already describe these116/52-byte records; existing
R_AllocSceneEntity is the allocator, not a substitute copied allocation policy.

The remaining blocker for implementing this as a linked connected group is
real R_DrawModel8330 and its bounds/skin/surface dependency graph. Its byte flag
101ce5ef belongs to DPVS state, which current active source only partly owns;
do not invent a new independent draw flag or omit the call. It invokes1ffc0,
then1f6f0(sceneEnt,ent,-1) for type1 or1fa70(sceneEnt,ent), sets cullState5 and
calls24680(index). Primary assembly is in scratch/codex_1026_api/
scene_entity_primary.asm. Restore real owners/helpers before wiring API20.
Mac's large combined AddRefEntity source and warning texts differ from this PC
split; no wholesale reference import. Full API/RenderScene/frame closure stays
open. This research added no source, filler, roots or byte credit.

### Raw-image batch final acceptance - 2026-10-26

Final original build after codec-order correction retains every previous1987
accepted row's target/extent and passes the1448 historical gate. Current2461
rows/2375 unique extents are frozen as api_raw_warm_bind.json and added to the
ratchet, so future builds must retain them all. Negative removal/size controls
fail. Raw/JPEG/procedural/encoder tests pass; all148 full fixtures pass. Two
fixture slices were narrowed around the new raw registration block, and CRT
FloatFormat lookup now respects its qualified private name/actual intrncvt
owner; their original behavioral/404-byte block checks remain intact.

Fresh complete coverage replay and independent byte/relocation/interval audit
agree on1,268,945/1,851,392=68.540049865% address-normalized file spans. Audit
rechecks2424 code regions and9388 data regions with symmetric relocation and
branch masks, all32 assembly exclusions and HIGHLOW record credit. Authored C++
remains108160/253580=42.653206089%; same-offset8.812450308%. This is not100%,
V4 or V5. Exact source bodies still pending: R_LoadJpg724 vs785 bytes and the
API wrappers' final address-taken context. No speculative spelling/flag sweep.
Receipt proof/api_raw_checkpoint.json seals artifacts, tools, fixtures and logs.
The full-retail objective remains active; next connected API research is above.

The corrected private-symbol reader also exposes23 retail extents with86 extra
candidate procedure rows (proof/api_raw_duplicate_extents.json). The coverage
union counts each retail byte once; these are not86 extra recovered functions.
Many are TU_STATIC static-inline math copies. Inspect actual candidate addresses
and real caller targets before consolidating shared helpers. Preserve all2375
retail extents, not every redundant candidate instance. Test bounded source/
linkage groups and log failures; final single-instance ownership is required for
whole-file identity, regardless of current binding acceptance.

## Shared math helper ownership trials - 2026-10-26

The completed raw-image packet exposed13 physical VectorCopy copies. Changing
only its linkage from TU_STATIC (static inline) to C++ inline leaves one copy
and retains all2375 protected retail extents. A second group does the same for
Vector2Copy, VectorCopy4, Vector4Set and integer I_min/I_max/I_sel: all seven
now have one physical definition (46 original instances ->7), and all2375
extents still pass. Both runs correctly stop at source_coverage's whole-header
hash because com_math.h also contains reviewed assembly. No checker bypass or
hash acceptance has occurred; exact diffs contain no body/assembly changes.
Evidence: scratch/codex_1026_helpers/{vectorcopy_trial,copy_integer_trial}.
The broader same-macro shared-math linkage trial is running next; if its strict
callee/byte gates fail, retain the verified seven-helper group and record why.

Next API research confirms current R_UpdateXModelBounds already represents
1ffc0. Missing skinning builders1f120/1f2a0 and main1fa70/1f6f0 connect through
frontend dispatch20be0 and model-cache upload2b690; don't duplicate the existing
bounds/rigid/SSE kernels or replace the real dispatcher with direct calls for
only two kinds. Call inventory: scratch/codex_1026_helpers/
model_skin_call_inventory.json. Reference DObj atomic claim arguments are
reversed; primary1fa70 uses InterlockedCompareExchange(state,3,2).

### Shared helper final result

The broad macro trial loses exactly Vec2Length1003edf0/22,
VectorLength10005bb0/33 and UnGetLeanFraction100615e0/19. Candidate lengths
become56/73/30 and all call CRT sqrt. r_shadowcookie's whole-TU /Op parsed
shared inline definitions in precise mode. Parsing gfx.h before enabling local
precise math restores the intrinsic header instances and every2375 extent;
no source body/assembly spelling or ABI was changed to bypass a mismatch.

All remaining matched alias groups also consolidate under the2375 gate.
Vec3Add/Scale, WindingDot3 and HullDot2 use the actual shared math definitions;
RotateVec2, TransformBounds/extra GetRotatedBounds and the three axis-transform
variants collapse to the supported original owners. Source prototypes/callers
and affected native slices are updated. Final clean build/gates, all148 fixtures
and independent coverage audit pass. Macro/prototype-only header review pins
unchanged assembly bodies at the new hash; source-meter mutation negatives stay.
Record: proof/shared_helpers_checkpoint.json.110 physical copies/2695 extent
bytes removed; C++ no gain; all2375 unique extents retained. File spans68.539509731%
(-10 data bytes); exact offsets8.828870385% (+304 bytes). This is not V4/V5.

Next primary/type discovery: original Mac dpvsGlob is108 bytes, debug at100,
not the port's224-byte padded representation. Raw typed records and13 PC
initializer-field instructions are in scratch/codex_1026_helpers/dpvs_*. The
existing queue/free-list/view/fog/near/far/occluder/projection globals already
cover100 bytes of the real record. Fold them into one owner and supply the
five real flags, not a duplicate108-byte allocation. Actual natural alignment
accounts for the remaining three bytes; no arbitrary tail. The4-byte cullDist
configuration remains separate. This research has not changed DPVS owner source.

## Sprite/oriented-quad dispatch dependencies - 2026-11-01

Owner authorized obsolete build-output cleanup and step3. Cleanup receipt is
proof/nov01_old_build_cleanup.json:32966 generated files/2481555665 bytes removed
only from inactive target/build dirs and archive/old_renderer_builds_20261020.
Objects/debug/link artifacts and generated gfx.dll/gfx.lib only; no sources,
maps/logs/proofs/symlinks or active output removed. Active DLL hash preserved.

PINNED sprite family source now appended in existing rb_tess.cpp: quad stamps
3f120(DX9)/3f410(DX7), atlas3f620, builder3f6c0, screen-to-world3f930,
world-to-screen3f9b0, minimum-size wrapper3fae0 and sprite3fb50. Oriented quad
3fba0 reuses the same stamps/atlas and existing accepted MakeNormalVectors597d0.
Old source restores exactly by removing the appended section and separator;
particle fixture only narrows its source slice. No old assertions removed.

Primary stamps: strict4/6 capacity then original overflow before geometry reads;
indices0,1,3,3,1,2. Vertex base truncates to ushort. Corners are sum+origin,
origin-difference,origin-sum,difference+origin where sum=left+up,difference=left-up.
Normal is negative LIVE view.axis0. DX9 W1/binormal=up/tangent=-left; DX7 has no
W/tangent/binormal. UVs(s0,t0),(s1,t0),(s1,t1),(s0,t1). Counts publish vertex+4
then index+6 after writes. No invented normal normalization or vertex helper.

Atlas uses material bytes e(rows)/f(columns), frame signed division by columns,
no new zero-dimension guard. Product1 returns full UVs. Color is BGRA, alpha
HIGH, unlike the modified Mac draft. Sprite lifts originZ by radiusY for flag1000.
Rotation uses stored single-precision radians(rotation*0.017453292f), cosine and
sine through C++ calls; no authored fsincos assembly. World sprite minimum-size
path enters only for ordered-positive minScreenRadius: NaN SKIPS it. Projection
helpers reject ordered W<=0 but ACCEPT unordered W (TEST AH,41/JP). Screen flag
2000 yields one world radius for both axes. Oriented quad ignores sprite flags
and minimum-screen-radius, uses entity.axis0 with real MakeNormalVectors, then
same material atlas/BGRA and renderer selection. Existing rgp/tess/state owners
unchanged; no new TU, export, root, compiler setting or partial dispatch table.

Focused native evidence:72 complete quad buffers +10800 sprite routes +54
oriented quads, both formats, all vertex/index guards, positive/negative atlas
frames, rotations, lift/screen/minimum sizing, zero/negative/NaN W and mutation
on overflow. MakeNormalVectors is mocked only for oriented-quad call routing;
its production148-byte body is an existing independent accepted dependency.
No GPU or byte-match claim from native tests. New source remains a dependency
batch toward genuine dispatch; the full tess/command/API tables are still open.

Original MSVC link caught MakeNormalVectors's declaration shape: raw pointers
produced ?MakeNormalVectors@@YAXPBMPAM1@Z, but the existing accepted definition
uses const vec3_t/vec3_t parameters and symbol ?MakeNormalVectors@@YAXQBMQAM1@Z.
Corrected the declaration in rb_tess to the exact existing definition. No ABI
adapter, alternate body, symbol alias, old-source change or compiler flag trial.
This is an observed cross-TU declaration requirement in13.10.3077; GCC's native
compatibility did not catch it. Keep actual array declarators on this boundary.

## Line, rail, cylinder and complete surface dispatch - 2026-11-01

PINNED RB_AddLine10040580/DX710040920, rail10040c00 and line10041030:
normalize cross(start-view,end-view) for tangent, normalize end-start for
binormal, normal=cross(tangent,binormal). Compute frame before overflow, read
positions after overflow. Both formats use the full integer vertex base;
DX9 writes W1/T/B/N and DX7 only N. UVs(s0,t0),(s1,t0),(s0,t1),(s1,t1),
indices0,1,2,2,1,3; publish counts late. Rail uses r_railCoreWidth and
length/256, line uses radius0 and the genuine material atlas. BGRA high alpha.
Native3888 routes check geometry/guards/NaNs/negative widths/overflow mutation.

PINNED cylinder1003fdb0/DX7100401a0: choose8..32 segments from midpoint
LOD before overflow using the existing I_fround; then normalize origin-endpos
and call existing MakeNormalVectors after overflow. Radius1 belongs to start,
radius0 to end. Existing FastSinCos supplies ring recurrence, no new assembly.
Only position/W,color,UV are written; normal/T/B remain untouched. Seam copies
position fields only. Two triangles per segment, late vertex count publication.
Native468 cylinder/entity routes exercise both formats, clamp/degeneracy,
post-overflow mutation, guards/seam, all selector cases and live currentEntity.
Host lrintl/sin/cos validate structure, not retail x87 bit identity.

PINNED entity selector100410b0 routes4 sprite,5 rail,6 particles,7 oriented
quad,8 line,9 renderer-specific cylinder; all other types return untouched.
Backend entity10041130 ignores surface input and reads backEnd.currentEntity.
All real targets now have source. rb_backend owns the complete8-slot surface
table, unique retail sequence at file offset1904f8: Bad,Poly,BackEndEntity,
Skinned,Rigid,StaticCached,Triangles,NULL. No placeholder function/root/export.
Shared r_tess_dispatch.h preserves the existing enum values and typed calls.
Removing ONLY the table and its include restores the exact prior backend hash,
so the reviewed rdtsc body is unchanged; source-meter hash updated accordingly.
This table is not the34-slot command table or a completed GetRefAPI.

## Genuine sprite command caller - 2026-11-01

PINNED command19 table slot10190564 points1002eff0 (204 bytes). Primary
instructions, unlike the Mac draft, call RB_Set3D when projection2D IS set.
Capture packet before callback; capture material after Set3D. Change surface
on material/technique3 mismatch; EndSurface only for index/optimized counts,
BeginSurface(material,3,31). Zero the real116-byte entity and fill reType4,
flags+4,origin+60,material+84,RGBA+88,radii+100/+104,minRadius+112.
All fields are read from the captured packet after surface callbacks. Call
the real RB_TessEntity, then advance LIVE state->cmd by its own ushort length.
Do not copy the Mac reference's inverse projection predicate or byte-array
entity draft. r_entity.h exposes the exact existing SDK-compatible record,
with shared layout assertions also compiled against the common-type version.

Native120 sprite command routes pass: full116-byte zero/field comparison,
projection/material/technique and both count kinds, mutation at Set3D/End/
Begin/Tess callbacks, captured packet versus live cursor and preserved stack.
The existing text fixture narrows its end to exclude the appended sprite block;
its assertions and production text code remain unchanged. All17 affected
backend/entity fixtures pass. No full-suite/GPU claim from these native checks.

First original build found GfxCmdDrawSprite redefinition in the Mac PC backend
header when gfx.h follows the SDK headers in r_init. Applied exactly the
existing COD2_SDK_TYPES guard pattern to that one real declaration in
headers/PC/gfx_d3d/rb_backend.h. Non-SDK declaration tokens unchanged; no ABI,
compiler flags or function implementations altered. Rebuild is mandatory.

## Sorted drawing driver and real lighting storage - 2026-11-01

PINNED text_graph_drawsurf_primary.asm:1002f330 selects technique,1002f430
walks8-byte records in either direction,1002f900 advances the packet BEFORE
callbacks. Both sort layouts, 2046/2047 sentinels, >=2048 fallback, same-sort
skip runs, stateBits[1]&30 decal filtering, missing techniques and ordered/NaN
material-time comparisons follow the target. Existing fog/matrix/depth/overflow
helpers are reused. The real backend entityLighting[2046] occupies exactly the
old33f30-byte opaque block,104-byte stride at backend+2be8. SDK view parms now
include the real near-clip float at148; other field offsets remain unchanged.

Original build caught the duplicate local GfxEntityLighting definition in
rb_shade. Removed only that identical definition; rb_backend.h owns it, with
COD2_SDK_TYPES guard on the original Mac header declaration. No shader body
was edited. Saved failed-build log nov01_drawsurfs_failed_build.log. Original
compiler/both referees then passed all2381 protected extents, unchanged C++
credit.750 native driver cases and full lighting-chain fixtures pass. No new
root/temporary export/TU/flag. Private command/driver source remains unretained
until the complete command table is restored; no claim of a working game path.

## Full sun drawing dependencies and two command handlers - 2026-11-01

Primary: nov01_sun_driver_primary.asm and nov01_sun_quad_dx7_primary.asm.
New code in existing rb_sky.cpp: two billboard formats, collision fallback,
query visibility, two directional sprite formats, flare draw/update, blind/glare
calculation, per-view sprite, fullscreen blend and the two public sun drivers.
RB_DrawSunCmd24 and RB_DrawSunPostEffectsCmd27 live in rb_backend.cpp. No
new TU, roots, exports, global-state copy, compiler flags or authored assembly.
Only existing I_fround/FastSinCos assembly helpers are reused where applicable.

PINNED sun params96B at world+160; direction+1b4. DX7 billboards project using
viewParms->viewProjectionMatrix, divide by W, and subtract .001 from Z. DX9
uses backEnd.viewProjectionMatrix, keeps W and adds -.001*W to Z. Both install
identity projection/view and use the existing real quad helpers. Directional
sprites use technique1, scale0.001311093*spriteSize, Z^2>.99 polar fallback,
normalized cross product and a second unnormalized cross. DX9 W0; DX7 switches
view W0 then W1 around flush. No invented geometry bounds or direction guards.

Query slot=tileIndex*2+signed(frameCount%2). Missing query uses the existing
screen fraction then import90 CM_BoxSightTrace (old hit, point sweep, model0,
mask2003, sun direction*262144). Zero fraction skips trace; NaN enters. Existing
query result uses GetData flags1, Sleep0 while S_FALSE, sticky status/sample
errors; accumulate tile visibility, clamp only ordered >1 and publish only
when the final tile is error-free. Issue2, flush, Issue1, issued flag, pop.
No logging wrappers on the direct query methods: none occur in target bytes.

The Mac draft gets several critical details wrong: flare intensity fades toward
LAST VISIBILITY, then multiplies angular alpha; it does not fade angular alpha.
Flare packed color uses RGB intensity/opaque FF alpha. Fullscreen effect uses
RGB glare and alpha blind, with integer truncation. Post-effect time publishes
even when sun is disabled. DrawSun only switches to3D when projection2D is set.
Sun post command captures the packet before flushing and advances LIVE cursor
later; draw-surfs advances cursor before rendering.24 native sun-command cases
and94 full sun geometry/query/post-effect cases pass, with target-pinned fields.
Original-build result is recorded in the next checkpoint, not inferred here.

## Late-post dependency chain and complete command table - 2026-11-02

PINNED primary files: nov01_late_post_primary.asm (backend) and
nov01_filter_apply_primary.asm (filter drivers). Restored17 real routines in
existing rb_backend.cpp/rb_imagefilter.cpp and all34 command-table entries at
retail10190518: NULL terminator plus33 genuine handlers. No partial slots,
marker callbacks, new root/export, TU/order/flag or authored assembly.

Filter application: passCount0,16x98-byte passes at4,sourceImage984,final988,
ping-pong98c/990. Existing identical GfxImageFilter in Mac/mac_types.h is used;
removed an accidental duplicate declaration after original compiler caught it.
Added missing existing backEnd/dx/vidConfig externs, no new storage. Prior
failed original-build log retained as nov02_late_post_failed_build.log.

PINNED constants are uploaded to codeConsts33+i, not35+i. Source feedback
comes from the previous ping-pong target; final output uses finalTarget. No
vertical-swap branch or fabricated global pass counters from the port. Blur
radii scale with unsigned viewport height/480 and pixel aspect; source is
resolved-scene. A zero/empty glow chain returns SOURCE, not destination. The
resolved-scene glow setup uses full0..1 UVs; radii compose by variance. Existing
Gaussian generation is reused unchanged, no library/dependency additions.

Glow state replaces the exact20 opaque bytes after fog/color with real fog,
first-index/count and two image pointers; offsets4cc/4d0/4d4 remain pinned.
Active radii sort ascending; return index tracks the associated intensity.
Images remain in filter order while intensity index alternates. Sky bleed is
zero when no sky image exists; material choice tests exact zero, not positivity.
Bloom desaturation is a float. No global pass counters occur in target.

Import145 at101d4c0c is now the typed float(float) service called with3 by
10030719 (reference name GetVirtualWidthFromRealWidth). Pointer size and table
ordering unchanged. Retail blur uses a MINIMUM filter radius: smaller blur
uses high-byte alpha I_fround(radius/minimum*255), then filters at minimum.
Large/equal/unordered values keep full alpha and the original radius. Port's
opposite clamp and low-byte-alpha behavior were rejected by primary bytes.

Post debug paths are exclusive: framebuffer channels1 even inDX7; thenDX9
resolved channels2, float-Z, shadow in priority order. Float-Z gates on its
colorSurface, not image. Mixer constant27 is saved/restored bit-exact; shadow
mix is3eaa7efa/3eab020c/3eaa7efa. GCC's native x87 excess-precision comparison
against decimal .334f/.001f failed despite correct stored floats; fixture now
asserts retail bit patterns instead. Source wasn't changed to accommodate the
fixture. Diagnostic saved in nov01_late_post_failed_test.log.

Command26 captures packet before the flush, captures restore target after it,
resolves if needed, glows before blur, restores target before debug, and advances
LIVE cursor. Native34 real filter cases and119 real late-post cases pass,
including zero radii, ping-pong/constants guards, ordering, alpha, debug priority,
constant restoration and callback mutation. Complete command source-order test
passes. Fresh link/referees and linked-pointer results belong to the checkpoint,
not to these native-test claims. Step3 still needs executor and RenderScene/API.

## Executor dependencies: original debug TU - 2026-11-02

PINNED nov02_debug_render_primary.asm: eight actual bodies34010/340f0/341d0/
343d0/34500/345e0/34700/34840. Added rb_debug.cpp after rb_backend.cpp in tus.txt,
matching the original file identity from Mac STABS and the contiguous retail
body interval, before rb_fog/imagefilter.112 TUs now; no existing TU moved.
No new shim/table framework. Reuse real frame/debug/vertex types and existing
line/text/surface drawing; no new global state or authored assembly in this TU.

Target differs from the Mac combined draft: debug BGRA color conversion
TRUNCATES color*255 (no rounding/clamp), null line color is white, polygon
outlines are white rather than fill color, fan order first/current/previous.
Live counts/frame pointers reload after callback groups.2725-vertex line batches
flush on capacity or depth-test changes. Signed nonzero string/line counts
still perform setup/teardown even if negative, as the primary branches do.
Plume endpoints are inclusive, with original float012566371/064 and4 constants;
second-half alpha fade, sideways sine, vertical drift. Debug strings use live
backend camera/font, distinct from the plume helper's camera argument.

Native57 cases pass: full vertex fields/guards, fans, null/color packing,
capacity/depth groups, negative/zero counts, strings, plume lifetime/position and
frame-owner replacement. Original build and both referees retain2385 extents.
The next batch then adds the actual executor/benchmarks; not yet a V4/V5 claim.

## Actual command executor and genuine benchmarks - 2026-11-02

PINNED nov01_executor_primary.asm (33d20/608) and nov02_benchmark_primary.asm.
The zero-initialized flag word at101d0a8c is read only by this target instruction;
reference name g_disableRendering is SUPPORTED, not recovered PC debug naming.
It is outside the currently modelled image-registry fields (registrybase101cea68,
modelled end101d0a7c), rg/rgp/dx/material allocations. Candidate source owner is
rb_backend.cpp; original object ownership is unproved, not a historical claim.
No zero-constant substitution, copied byte padding or duplicate known state.

Executor clears backEndData before any early return, tests cooperative level
only if not already lost, captures the touch-images flag before recovery,
publishes the frame only after success, then updates dvars/begins scene/touches
images before dispatch. Uses genuine34-slot table and producer-owned two-level
call stack. Command array starts frame+219d0c, checked in r_rendercmds.
CLEAR is in the SKIP-BACKEND branch only: normal drawing is not cleared after
execution. The Mac combined draft places that clear incorrectly. Flush/debug,
index/stream release, retried EndScene, live benchmark counts then fence follow.
Sync2 finishes/inserts,3 inserts only. All actual runtime paths have source.

Four benchmark routines restored using existing matrix/timer/fence/vertex
helpers.2D default-material alias returns zero, captures count/dimensions before
timing, and returns double count/(ticks/frequency).3D returns float iterations/
seconds/60. It writes all four initial setup corners to vertex ZERO in retail,
then sets count4 and repeats winding3,0,2,2,0,1: confirmed from four xorEAX0
instructions before1002e550 calls, not a mistake to fix during reconstruction.
No fabricated geometry fix or reallocation. Four static/skinned transform
report values really are constant double0 in the target; dynamic values use
the white-material1362-quad benchmark and x4/x2. Exact target report strings
retained, optional two-sided stencil path preserved, settings reloaded live.

Native84 executor cases and28 actual benchmark cases pass, including disabled,
lost/reset/other failures, failed/successful recovery, real goto/call/return,
callback frame replacement, conditional clear/retry/debug/cleanup, changing
benchmark pointer, timer/count capture, geometry/index guards and print ordering.
No GPU proof from mocks. Fresh original build/referees are recorded in the next
checkpoint; do not infer byte credit merely because this source now exists.

## 2026-11-02 frame submission after the actual executor

PINNED nov02_frame_submission_primary.asm:10020d50/111 appends the existing
terminator, resets the live frame counters before execution, presents then
selects the normal frame.10021f90/86 is API59 EndFrame: adaptive sync, unlock,
import74 CL_UpdateDebugData, transfer live debug globals, submit, then decommit
live temporary skin storage. Compile-time import74 check added.10022040/114
ends the debug frame: execute/present before saved-pointer restoration, clear
the relock flag before Lock(1), clear saved pointers after that callback.
Reuse original helpers and owners; no new globals/TUs/flags/exports/assembly.
22 native routes exercise real allocator/end-marker bodies, full-buffer failure,
reset timing, callback pointer replacement and cleanup. Existing frame-start
fixture ended at AbortRenderCommands and accidentally included new EndFrame;
narrowed only that extraction to its actual previous end. No gate weakened.

RenderScene follow-up evidence: nov02_scene_dependencies_primary.asm records
10007d60/93 (point-to-BSP-cell traversal),1000a8d0/399 (DPVS gather driver),
100244b0/301 (draw-surface quicksort) and10025300/126 (render-mode dispatch).
The parent10025380 reads imports142/167 at101d4c00/101d4c64, not guessed
engine routines.167 has a SUPPORTED FX_UpdateAndDraw name;142 is still unknown.
No source/callback identity claim for either until the client import assignment
and target calling convention are confirmed. These direct records prevent
reusing the unrelated Mac scene driver as if it were PC1.0 source.

## 2026-11-02 scene sorting, BSP lookup and missing scene producers

PINNED nov02_scene_sort_primary.asm: shortsort10024460/70 selects the maximum
unsigned key and swaps the entire8B surface. Main sort100244b0/301 uses two
30-pointer stacks and repeats division by8 after pointer subtraction; preserve
that retail partition/cutoff quirk. Stable sorting is not promised. First build
accepts the genuine70B shortsort in both referees. Main sort remains unmatched
at301B; cell traversal98B versus retail93B. No byte credit for either.

Point traversal10007d60 follows the existing world nodes/planes; dot sum is
Z+Y thenX, equality/unordered take child1, and a returning bad-world error
reloads rgp.world.86 native cases cover sort sizes through8192, signed trivial
counts, unsigned keys, duplicate payload identity, buffer guards, cell boundary,
NaN, cancellation, leaf return and callback world replacement.

Four scene producers restored in r_rendercmds using the actual allocator:
light properties10021770/195, target10021840/79, sun10021920/87,
begin-view10021b50/146. No invented allocation failure guard; primary code
assumes allocation succeeded before writes. Exact existing76B/8B/8B/48B records
and reservation classes reused. Scalar light scale101ce638 is pinned by the
registration call at1000aeae, preceding literal r_specularColorScale; primary
nov02_light_scale_primary.asm. Native32 tests33 payload/accounting/copy routes.
Frontend dispatcher fixture previously extracted toEOF, accidentally absorbing
the new producers; extraction now ends at the producer section. No gate changed.

Render mode drivers10024c80/261,10024d90/451,10024f60/217,10025040/694 have
primary instructions preserved in nov02_scene_modes_primary.asm. They are still
missing source; the Mac scene draft's simplified groups are not substituted.

Bounded second source forms after exact instruction diffs: quicksort301B body
otherwise identical; moving the stack-pointer initialization after the count<2
return restores retail's save/restore order. Cell98B body's sole mismatch was
conditional array-index selection; spelling child0/child1 as branches removes
index materialization, matching the target's direct loads. Logs preserve both
first residuals. No compiler settings, ABI, assembly or referee change.
Existing model-draw/ref-entity native fixtures also extracted toEOF; narrow
only those extraction ends to the new independent sort/cell sections.

Second-form diff now has no instruction differences for either quicksort301B
or point-to-cell93B (fdiff's trailing padding/next-function context excluded).
Acceptance still waits for BOTH final referees, never inferred from that diff.
Unmatched light-producer192B residual also saved for later, not endlessly swept.

Final scene dependency build passes original compiler and BOTH referees: six
accepted C++ bodies/776B, including both second-form corrections. Light producer
remains unmatched192B vs195B (x87-copy/scheduling/alpha-multiply residual saved).
All2385 previous protected extents retained. New hash-pinned warm binding packet
strengthens both gates to2391;12 independent deletion negatives reject removal
of each of the six additions.23 affected native/layout/dispatch/PDB fixtures pass.
No authored assembly, compiler/ABI change, fake API, new export/root, or new TU.

## 2026-11-02 clear color and three scene rendering modes

Primary records: nov02_scene_modes_primary.asm, nov02_clear_color_primary.asm,
nov02_frame_clear_primary.asm and nov02_scene_clear_settings_primary.asm.
PINNED: dvar101ce694 is r_zFeather,101ce798 is r_clearColor. MSAA quality
is dx+2c28; renderTargets[6].colorSurface is dx+2cac. Initial build's explicit
layout assertion rejected interpreting rg+14c8 as clearScreen: it is the fog
REGISTERED byte; clearScreen is two bytes later. Corrected the source and made
native fixtures set those two flags oppositely. Failed original build retained
at proof/latest/nov02_scene_modes_build.log. No shared ABI/header changes.

Restored GetClearColor10024920/156, AddClearCommandsForFrameBuffer100249c0/97,
DX7 mode10024c80/261, fullbright10024d90/451, debug shader10024f60/217. Reuse
actual group/packet functions. Clear color reverses fog BGR, preserves dvar RGB,
forces alpha1. Clear flags1 only with nonzero MSAA quality and either shadow
kind1 or DX9+zFeather+floatZ surface; otherwise7. DX7 repeats ordinary clear
selection with shadow0; fullbright opens group4 without closing it here. Native
1152 cases cover independent fog flags, bytes, all clear gates, group branches,
signed draw counts and a callback replacing the world before light emission.

First corrected build passes original compiler/both referees and2391 extents.
R_GetClearColor receives156B of real new byte/binding acceptance. Other four
bodies remain unmatched. Bounded residual correction: select flags in explicit
if/else, then evaluate R_GetClearColor into a local before calling the clear
producer. Target evaluates it before pushing the other clear arguments; the
original nested-call spelling let the compiler push those arguments first.
First residuals saved in nov02_frame_clear_residual.log/nov02_debug_mode_residual.log.
No flag/ABI/assembly/export/root change. Second original build pending.

Second ordered build retains2391 extents; GetClearColor remains the sole new
accepted body156B. Other four scene-mode/clear drivers remain genuine source
with bounded saved residuals, not new byte credit.20 affected fixtures pass.
Both gates strengthened to2392 with immutable scene_modes_warm_bind; independent
clear-color deletion rejected by each. No ABI/flag/assembly/export changes.

Owner requested only verified files in root src/, committed. Exported seven
complete candidate source files after auditing every definition/emitted body:
r_caps,r_cmds,r_surfbounds,r_image_wavelet,rb_logfile,r_image_load_common and
com_convexhull.39 emitted bodies all accepted; source hashes equal pinned build
inputs, no authored assembly or mixed file admitted. Their immutable snapshot
and proof/checker committed as be356f3; unrelated staged index preserved exactly.
These are per-body byte/binding verified files, not standalone DLL/object SHA
proof or a claim of complete historical TU recovery. Mixed r_scene stays out.

## 2026-11-02 connected normal/depth/light/shadow generation

Restored six connected real functions: point-light draw296B, floatZ clear53B,
depth/group setup456B, normal scene694B, mode dispatch126B in r_scene.cpp;
shadow-cookie draw839B in r_shadowcookie.cpp. All four mode branches now have
source and genuine helpers. Shared command9's existing64B matrix word record
moved unchanged into r_scene_commands.h for the real shadow caller; no new
producer, ABI, marker, assembly or root. Tuple matrix/fade copied with memcpy
so arbitrary float payload bits survive without aliasing assumptions.

Static source layout assertion caught material slot104c: it is the existing
shadowClearMaterial, not depthOnlyFillMaterial. Corrected before acceptance;
first failed build retained. Primary10191488 is white1111, not black or zero;
both depth and receiver clears preserve it. Actual shadow records108B/count at
a20 pinned. Scaled producer/table/group helpers reused. Point partitions captured
before callbacks, scene draw buffer reloaded each iteration; group1 empty new
shadow list still selects/clears receiver target. Group4 remains open for later
UI; early post only on newly created group2 end and full-screen, late post per
full-screen view; technique24 only when live zFeather+floatZ surface allows.
120 actual native chain cases pass, including mode precedence, depth fallback,
new/existing groups, eligible/empty/capped shadow lists, matrix/fade bits,
blur/caster/receiver gates, signed counts and callback-mutated point partitions.
These mock engine boundaries, not GPU/byte proof. Original full build pending.

Point-light outer-driver closure: added four real light gathering/selection
routines in r_light.cpp and scene-light culling129B in r_dpvs.cpp. Read primary
nov02_point_light_gather_primary.asm, rather than importing GLM's byte wrappers.
The independent GLM decompile confirms this call graph. Existing matched
R_BoundsForDrawSurf and PointToBoxDistSq reused. Unculled32-light pool, limit
clamping and prefix partitioning, reverse surface walk, inclusive radius test,
nonempty partition compaction and both scene/frame counters retained. Light
comparator stages float distance/radius products, ordered ties true, NaN false.
Culling sums X+Z thenY, tangencies and unordered distances stay visible. Native
631 real cases pass, including all selection counts0..32 and empty partitions.
Light-definition fixture narrowed to exclude the new independent gather section.
Original compile/bind/referee batch pending; no new byte credit yet.

One bounded second source test, then owner requested pause at a checkpoint:
retail light comparator stages float products/distances, so tested precise-FP
pragma only for the new r_light section (candidate, not historical proof).
Restored the reference-supported inlined point/radius classifier returning2/0;
that removes compiler's initial four-plane loop unrolling (328 ->129B). Light
comparator159 ->212B, light partition193B now has its unique retail byte
placement after ordered comparison spelling. Sizes/placements alone are not
accepted coverage; selector/callee bindings still need final referees. Saved
first residuals rather than continuing a tuning sweep after pause request.

Planning/cost lesson: step3 was repeatedly described as a small structural
closure while its actual contract still includes missing visibility, shadow
selection and complete API callback implementations. Repeated small builds,
assertion corrections and reports consumed time before closing that graph.
Resume with larger connected source batches, one build per prepared wave and
one checkpoint receipt. Do not promise step3 completion from just mode/source
presence; do not rename an unclosed graph as a completed step.

Final pause checkpoint: three successful original build/referee passes and one
failed layout assertion in this continuation.27 affected fixtures and the
committed verified-source checker pass. Eleven retail roles now have genuine
source; only R_ClearFloatZ10024a40/53 gains byte/binding credit. Light partition
body has a unique193B placement but is blocked by unmatched selection callees.
Culling129B has one remaining multiply-operand load-order difference; exact
residual saved for a later bounded batch. Comparator212B and selector124B still
have genuine stack/register/branch residuals, no credit. No further tuning after
owner pause. Ratchet2393 in both gates, independent53B-removal negatives pass.
C++109537/253580=43.196229987%,662 bodies;32/7820 authored asm still excluded.
The outer scene visibility/shadow-selection pipeline and actual RenderScene/
GetRefAPI callback graph remain open. Step3 is not complete and is not claimed.

Owner resumed step3 after the pause checkpoint. Visibility closure now uses
original GLM data/decomp C plus pinned instructions, not src/f byte wrappers.
New PC import facts: slots140/141 take centity pointers (CG_CullIn /
CG_UsedDObjCalcPose),142 CG_AddMarks no args. GLM's RI_DObjCalcSkel/Anim labels
at these slots are WRONG; target sceneEnt+8 is cent, not u.obj+4. Client
CL_InitRef assignment and cg_ents prototypes agree. Hi imports18/19/20 are
LargeLocalBegin(int)->int, End(int), GetBuf(int)->void*, confirmed in client.
Canonical import size/slot order unchanged. Existing slot139 pose typing retained.

New visibility code includes stack-stamped box/occluder culling, near-corner
recursion classification, world surface/direct/cull, static-model direct/cull
publication, AABB traversal, cull-group output, broad model bounds/routing,
per-cell model/brush drawing, visible-cell gathering, sky and near/far appends.
Existing shared R_AddDrawSurf made external (same body/noinline) for the real
cross-TU world callers; verify existing117B protection, no duplicate helper.
New routines are NOT accepted by source presence. Original build pending.

## 2026-11-02: genuine API59 graph and temporary-export removal

The initializer now has readable typed source in r_init/r_refapi.h. All98
callbacks are real source, ten reserved slots zero; copy imports before API
check and preserve retail store order. R_SkinGfxEntityCmd12 and model-skin
loader278 added from primary instructions. First linked initializer passes
both referees1051B; retained all2393 old extents, C++110731/253580.

Single-export link built cleanly but strict regression rejected it.179
previous accepted extents lose bindings (83 in game regression): two newly
placed masked shapes cause contradictory shared-data bindings. Primary
diagnosis, not a compiler excuse: R_CreateDevice uses ClearModified slot37
but target calls SetModified slot38 at101d4a60. Corrected actual call and
fixture now explicitly asserts the primary operand. RB_DrawGlowImage's two
zero stores appear in reverse field order from chained assignment; both
values are zero, behavior was equal, but relocation binding must preserve
actual fields. Split into field1 thenfield2 statements, no volatile/asm.
No gate relaxed. Failed receipts nov02_api59_single_export_{bind,cmp}.json and
latest/nov02_single_export_losses.json retained. Rebuild required.

Single-export correction retained all2393 old extents. No assembly was added
or altered: inverse substitution of the two glow statements reproduces the
previous reviewed backend SHA exactly. Water160 and FFT_Init169 now match
with their existing inlined I_fround/FastSinCos assembly; BOTH containing
bodies are excluded.34 exclusions/8149B, never added to C++ credit.
C++111616/253580=44.016089597%,670 bodies.26 new code/library extents, ratchet
2419; both gates reject an independently removed GetRefAPI1051 body.

Full-suite repair1: dependency-origin fixture removed now-protected41850;
it now keeps every real row and chooses an unoccupied inventoried address
for synthetic dependency-accounting input. Repair2: light history fixture's
EOF slice included newly appended visibility debug code; narrowed at its
explicit section boundary. Repair3: strict assembly fixture now expects the
two newly retained existing asm-bearing bodies, still tests all six rejection
cases. Linked API fixture reads loaded BSS rather than nonexistent raw bytes.
Earlier passing fixtures are retained and execution resumes at failures to
avoid repeated native builds. No production requirement weakened.

## 2026-11-02: callback matching batch1

Bounded /Os source pragmas on fog, light-history save, material fixup/load
retain all2419 extents but NONE reproduce target bodies (139/93/335/156B).
Removed all four probes, not adopted as historical flags. Frame dvar branch
requires boolean bitwise OR (target OR AL,BL);232B now placed, blocked on sun.
LOD numerator uses the existing float pi/180 factor; denominator must use
existing DEG2RAD macro's float evaluation, target double0.6981317400932312, not previous0.6981316804885864. Full macro on variable
numerator produces an extra multiply; keep folded factor, macro on constant.

A prior Image_Register comment inferred never-inline from12 direct calls;
primary Material_FixupBinary603 contains the image registration path inline.
Remove the unsupported noinline restriction and test the actual caller group.
Sun826 has two opposite material-name branch layouts; reverse conditional
arms to match retail empty-name fallthrough. Other sun schedule difference
remains unclaimed until original referees accept. No roots/assembly added.

Callback batch final: FOV212 accepted by both referees after folding the
variable factor M_PI/180 and preserving DEG2RAD constant evaluation. All2419
old extents retained; ratchet now2420 with independent removal negatives.
Frame232 is byte-placed but still blocked on sun826. Branch-arm reversal
removes both sun branch differences; one pointer-load scheduling difference
remains. Do not spend a rebuild only on it.

Image_Register's unsupported noinline restriction removed; actual registration
path now inlines into material fixup as retail does. Explicit error return0
preserves the returning-error path. Material fixup now holds texture/constant
cursors across callbacks and uses one shared load-result check, matching
primary control flow.78 native cases pass, including replacement of BOTH
table owners during callbacks; the previous indexed implementation fails that
new case. Candidate600 vs retail603 still differs substantially in register
allocation/control flow; size proximity is not acceptance. Material loader183
vs171, image-register93 vs94 remain unmatched. Save these real source fixes
without fake credit; avoid repeating the rejected /Os probes.

## 2026-11-02: small clear-log checkpoint

PINNED push at1002fefb references10197f40: retail log uses
"dx.device->Clear( 0, 0, clearFlags, nativeColor.packed, depth, stencil )\n".
Restore a four-byte local color union instead of array+separate DWORD. Both
instructions and diagnostic data now match: Clear211 and command44 accepted.
All2420 previous extents pass, ratchet2422, four removal negatives pass.
Backend source hash re-reviewed for this function-only delta; existing asm
unchanged. An early attribution run correctly rejected pending build timestamps;
only the post-build passing attribution is checkpoint evidence. One build, no
full-suite repeat, no GPU/whole-SHA claim. Total C++112083B/44.200252386%.

# Unlocker probes - 2026-11-05 (session 2)

Material_Register145/144: the residue is shrink-wrap. Retail pushes esi only
after the found early return; ours pushes it at entry. A static helper for the
load path (name, imageTrack, hashIndex) is not inlined: 73 bytes; rejected.
RB_EndSurface206/202 (unblocks 11 bodies/1441 B): same instructions, the clear
block is placed last (long je) instead of after the drawable checks. Positive
if/else, early-return form and a single return expression for the flags&2 test
all stay 206; rejected and restored.
Image_TrackFullscreenTexture149/149 (worker w1, gfx/w1 ac04d6d8): retail tests
platform into eax before loading vidConfig.width; ours loads first. Ternary and
switch(platform-1) lose push edi; height-first order gets closest (load still
precedes dec, eax/edx swapped). Next idea: width read after the test via an
inlined helper.

# Image_TrackFullscreenTexture, w1 - 2026-11-05

First diff: retail loads vid width AFTER "mov eax,esi; dec eax" (flags temp in eax,
then eax overwritten by the load); ours loads width first (mov eax,[w]; mov ecx,esi; dec ecx).
Height block already matches in shape. Probes (all fail, source restored):
1) width as ternary "platform - 1 ? width : 640" (height switch kept): lea eax,[esi-1]/test
   form, loses edi push; no match.
2) height switch emitted before width switch: first selector becomes load edx; mov eax,esi;
   dec eax (flag temp now matches, load still precedes dec); no match, closest shape.
3) "switch (platform - 1) case 0" on width: same lea/test form as probe 1; no match.
## R_CopyCubemapShot 100267e0 (w3)
Only diff: 3rd store is [eax+ecx+0x12] in retail, ours [ecx+eax+0x12] (operand order; everything else identical, 89/89). Tried, all still ecx+eax: (targa+18)[offset]; (offset+targa)[18]; *(targa+18+offset)=*(source+offset). MSVC canonicalizes these; try other structure (pointer/stride form) next.
# RB_InsertGridVisLog SIB order (w4) - 2026-11-06

Still 111 bytes, only the three 16-bit stores differ. Retail esi = index*6
(byte offset, kept across the call) and eax/edx/ecx = reloaded log pointer, so
retail is [offset+ptr]; ours is [ptr+offset]. Three more spellings, all
unchanged (still [ptr+esi]): (1) struct {ushort x,y,z} through a volatile
pointer, log[index].x; (2) byte* rec = (byte*)(index*6), then
*(ushort*)(rec + (int)log [+2/+4]); (3) unsigned off = (unsigned)index*6 with
*(ushort*)(log + off [+2/+4]). Not repeated: other address spellings.
## R_XModelDebugBoxes (w5)
Diff: retail +0x292 start-transform sums p0*m0 + p2*m2 + p1*m1. Probes: (1) static inline helper for both transforms: 894 bytes; (2) __forceinline helper: 894; (3) helper for start only, original MatrixTransformVector for end: 985 bytes, bytes still differ (remaining diff not inspected). Reverted.
R_WatersEquivalent240B (w6): retail squares mag0 (ecx pair) before mag1 (edx pair) and keeps dot on the FP stack; ours squares mag1 first. 3 probes, all 240B same bytes as before: (1) mag0/mag1 computed before dot, (2) I_sqrt(mag1Sq*mag0Sq), (3) inline Vec2Multiply(w0)*Vec2Multiply(w1), locals removed. Compiler picks the order regardless of source order.
## RB_GetGlowRadii (100305d0), w7
Tail differs: retail je X; return 0; X: swap; return 1. Ours jne X; swap; return 1; X: return 0 (size 212 both). Tried, codegen unchanged each time (return-0 stays last): (1) if(!(cond)) return 0; swap; return 1; (2) if(r1==0 || (r0!=0 && r0<=r1)) return 0; swap; return 1; (3) two early-return ifs. Untried: int result var, ternary.
### RB_DrawRawSurface channel swizzle (w8, 1002f110) - 2026-11-06
Retail: loads [1],[3],[2] (spill [1]), then [0] at store; stores out2,out1,out0,out3. Same size 331 in every probe.
1. g,a,b temps, out[2]=data[0] direct: loads 2,1,3, stores 1,2,0,3. No match.
2. r,g,b,a temps in order, stores 2,1,0,3: loads 3,1,2, stores 1,2,0,3. No match.
3. g,a,b,r temps, stores 1,2,0,3: loads 0,3,2 then [1] late, stores 1,2,0,3. No match.
Next idea: not decl/store order; try pointer-offset or struct/uint32 channel form.
RB_SetVertexData282/282 (worker g1, unblocks 199 B): retail loads offset into ecx (dxVb->lpVtbl into edx), computes flags in eax, and uses ecx/edx for Com_Memcpy; ours loads offset into eax (vtable into ecx), computes flags in edx, and uses eax/ecx for Com_Memcpy. Probe 1 (inline flags ternary directly into Lock call) stayed 282 bytes with identical register choice. Probe 2 (load offset before dxVb) stayed 282 bytes but reordered dynamicVertexBuffer load before imul and kept eax. Probe 3 (r_vb_state_t *vb local pointer) grew to 296 bytes due to extra register preservation. Baseline 282 B restored.
# RB_SunSpriteScreenFraction probe attempts - 2026-11-06

Target RB_SunSpriteScreenFraction (1003b310, 407 B). Retail uses `sub esp, 0x2c`,
evaluates clipX first (st(0)), clipY second (stores to [esp+0x2c]), then computes
1.0f/clipW and multiplies with clipX on x87 stack before evaluating left and top.
- Probe 1 (407 B): Reordered clipW (_24+_34+_14), clipX, clipY and inverted bounds
  check `if (right <= left || bottom <= top) return 0.0f`. Bounds check and tail
  fidivl matched retail, but prologue stayed `sub esp, 0x24` and compiler evaluated
  clipY before clipX, spilling clipY to [esp+0x20].
- Probe 2 (407 B): Reordered to _1k+_2k+_3k terms for clipW/X/Y. Still produced
  `sub esp, 0x24` with clipY evaluated before clipX and clipW evaluated across
  prologue as _24 then _34.
- Probe 3 (407 B): Replaced explicit invW with `clipX / clipW` and `clipY / clipW`
  (matching KisakCOD). Produced identical 407 B assembly with `sub esp, 0x24`.
All 3 probes failed byte matching and were restored.
# R_CellSurfaces matching probes - 2026-11-06 (worker g3)

R_CellSurfaces (retail 0x100155a0, 412 bytes, unblocks 146 bytes): retail allocates
cell to edi across the whole function and pushes edi at entry before early return,
holding rgp.world in edx across cull group bounds checks to load world->surfaces
directly into edx at +0b7. Ours placed cell in edx and hoisted rgp.world into edi.
1. Removing surfNodes and using direct pointer traversal (`surf = &rgp.world->surfaces[...]`,
   `++surf`): stays 412 bytes, same 46 differing instructions (edx/edi swapped).
2. Explicit markCount caching (`markCount = rg.markCount`) and reversed bounds test
   (`surfListSize <= *surfCount`): stays 412 bytes, 47 differing instructions (inverted jle).
3. Local `world = rgp.world` and `tree = cell->aabbTree` at function scope: emits 412 bytes
   but changes stack layout and outer loop preamble (127 differing instructions).
All probes restored to original clean source.

# RotatePointAroundVector probe trials - 2026-11-06 (worker g4)

RotatePointAroundVector (retail 0x10059530, 525 B; ours 525 B).
Difference was instruction scheduling between +0ce and +14b: retail schedules fstp [esp+0x7c] at +13b (between zrot[2][2] and zrot[1][1]) and lea edx, [esp+0x34] at +14b, whereas our build spilled ST(0) at +0ce right after rep movsd.
- Probe 1: Direct assignment of im from vr, vup, vf (KisakCOD/cod2map). Stays 525 B; fstp remains at +0ce. Exit code 3.
- Probe 2: Separate zrot[2][2] = 1.0f; zrot[1][1] = 1.0f; zrot[0][0] = 1.0f;. Stays 525 B; fstp remains at +0ce. Exit code 3.
- Probe 3: Adopted client-1.0 structure (float rad; declared at top, rad = (degrees * 0.017453292519943295f); FastSinCos(rad, ...); with im from m). This eliminated the +0ce..+14b scheduling diff completely! Stays 525 B. Residual diff at +1b2..+202: DotProduct inlined function evaluates terms in reverse order vs expanded rot[i][0] * point[0] + rot[i][1] * point[1] + rot[i][2] * point[2]. Max 3 probes reached; com_math.cpp restored.
# R_FilterEntityIntoCells_r bounded probes - 2026-11-06 (worker g5)

R_FilterEntityIntoCells_r (10008600, target 335 bytes) bounded probes on gfx/g5:
- Probe 1: Replacing VectorCopy with intrinsic memcpy(localMins, mins, sizeof(localMins))
  and memcpy(localMaxs, maxs, sizeof(localMaxs)) emits extra pointer staging moves
  (mov edx, ebx and mov eax, edi), producing 339 bytes (rejected).
- Probe 2: Introducing cplane_t *plane = node->u.node.plane local variable inside while
  causes MSVC LTCG to cache plane across loop iterations in callee-saved ebx,
  collapsing the body to 329 bytes and scrambling all register assignments (rejected).
  Declaring plane inside if (side == 3) similarly allocates callee-saved ebp.
- Probe 3: Baseline VectorCopy with direct member accesses gives exactly 335 bytes and
  matches retail 1-to-1 in instruction count (129 insns) and control flow, differing only
  in register choice between ecx and edx for plane at +0x6e and rgp at +0x43. Swapping
  declaration order of local variables (localMaxs/localMins, back/front) and tail-recursive
  vs while forms do not change the register allocation. Source restored to clean baseline.
# RB_DrawTextWithCursor probe - 2026-11-06 (worker g6)

Target `RB_DrawTextWithCursor` (retail `0x10032560`, 740 bytes):
- Baseline ours: 740 bytes (matches size, but differs in prologue scheduling, color packing, and register allocation).
- Probe 1: Applied `black = (color >> 24) << 24`, inline `ColorIndex` helper, direct byte stores into `newColor`, `(float)((style != 3) + 1)` int cast, and `x += glyph->dx * xScale` before char counters. Size: 742 bytes. `ColorIndex` returning `int` emitted 3-byte `cmp eax, 7` instead of 2-byte `cmp al, 7`. `color` remained pinned in `esi` while retail held `material` in `esi`.
- Probe 2: Changed `ColorIndex` return type to `byte` (matched `cmp al, 7`) and attempted `black = ((color >> 24) & 0xff) << 24`. Size: 741 bytes. MSVC still folded `black` shift into `and ebx, 0xff000000` because `color` is `unsigned int`.
- Probe 3: Split `black = color >> 24; ... black <<= 24;` around `newColor = color;` to disrupt shift-fold pattern. Size: 741 bytes. MSVC scheduled prologue differently, keeping `color` in `esi` across the loop rather than dedicating `esi` to `material`.
All 3 probes failed byte verification. `rb_backend.cpp` restored to baseline.
TU move (2026-11-06): rb_surface.cpp body appended to rb_shade.cpp right after
RB_BeginSurface (retail order Begin, DrawOptimizedTess, DrawTess, End; Mac has no
rb_surface.c) and rb_surface removed from tus.txt: RB_EndSurface stays 206/202.
TU membership alone does not fix the block-layout class; restored.

# Image_LoadWavelet probe - 2026-11-06 (worker s2)

Target `Image_LoadWavelet` (retail `0x1000f380`, 537 bytes, ours 539 bytes):
- Probe 1: Replaced open-coded mip calculation loop with `Image_CountMipmapsForFile(fileHeader) - 1`. Size increased to 553 bytes due to extra `lea ecx, [eax - 1]` and compiler splitting branch epilogue rather than sharing `--levels` / `dec edi`.
- Probe 2: Restructured mip counting loop with `while (dimension < decode.width || ...)` and `--levels`. Size: 539 bytes. Instruction sequence matches retail closely but emits a 2-byte loop alignment NOP (`mov edi, edi`) before final hunk deallocation loop.
- Probe 3: Changed outer mip loop from `for` to `while (decode.mipLevel >= ...)` with `--decode.mipLevel` at loop bottom. Size: 539 bytes; alignment NOP persisted.
Failed byte verification (539 vs 537 bytes); source restored to baseline.

# R_StaticModelBounds probe - 2026-11-06 (worker s2)

Target `R_StaticModelBounds` (retail `0x1002a360`, 438 bytes, baseline ours 443 bytes):
- Probe 1: Replaced volatile variables and manual break loop with natural `for (int surfIndex = 0; surfIndex < surfaceCount; ++surfIndex)` and non-volatile `mat`. Size dropped to 406 bytes; MSVC allocated 0x14 stack frame instead of retail's 0x18 and pinned `surfIndex` in callee-saved `ebp` instead of stack slot `[esp + 8]`.
- Probe 2: Retained `volatile int surfIndex` in standard for loop header. Size was 447 bytes due to duplicated reload and test on `surfIndex`.
- Probe 3: Pinned `verts` via `const float * const v = verts;` to encourage MSVC to dedicate `ebp` to `verts`. Size: 433 bytes; stack layout still differed from retail's 0x18 frame.
Failed byte verification (retail 438 bytes); source restored to baseline.
# RB_GetLightingAtPoint probe - 2026-11-06 (worker s3)

Target `RB_GetLightingAtPoint` (retail `0x100363a0`, 784 bytes, ours baseline 674 bytes):
Diff showed retail unrolls 3 coordinate axes (X, Y, Z) instead of looping over axes, and inlines default colors.
- Probe 1: Unrolled 3 axes with I_fround(f - 0.5f) and updated RB_DefaultGridColors to float array layout. Size grew from 674 to 792 bytes.
- Probe 2: Marked RB_GetNearestGridColors static to test internal calling convention propagation. Size stayed 792 bytes; separate fsub 0.5f before I_fround vs retail fsub [0.4999999990686774] prevented byte identity.
- Probe 3: Tested (int)floor(f) for axes calculation. Emitted CRT floor calls, resulting in 740 bytes.
All 3 probes failed byte verification. rb_light.cpp restored to baseline.

# XSurfaceOptimizeRigid probe - 2026-11-06 (worker s3)

Target `XSurfaceOptimizeRigid` (retail `0x1002da90`, 186 bytes, ours baseline 182 bytes):
Diff showed retail receives 2 parameters (surface, surfVerts) without model, preserving surfVerts in ebp across COM calls.
- Probe 1: Removed unused XModel *model parameter from declaration, definition and call site. Size: 182 bytes; ebp was still reused as scratch during CreateVertexBuffer.
- Probe 2: Added register keyword to surfVerts. Size: 182 bytes.
- Probe 3: Extracted vertexStride computation prior to CreateVertexBuffer call to free up scratch registers before loading dx.device. Size reached 185 bytes (1 byte off retail 186).
All 3 probes failed byte verification. r_xsurface_optimize.cpp restored to baseline.
# R_FinishLoadingAabbTrees_r probe trials - 2026-11-06 (worker s4)

Target `R_FinishLoadingAabbTrees_r` (retail `0x10003d40`, 403 bytes + padding to 410; ours baseline 400 bytes, unblocks 164 bytes).
Diff: retail updates `totalTreesUsed += tree->childCount` in-place and directly loads `[esi + 0x2c]` (`tree->children`) into `eax` after recursion, using `fcomp [edi + eax]` and `lea ecx, [edi + eax]`.
- Probe 1: Replaced `int nextTree` with in-place `totalTreesUsed += tree->childCount` and reuse of `totalTreesUsed`. Preamble matched retail perfectly, eliminating alignment nop and reducing size to 402 bytes (1 byte shy of retail 403 due to `add ecx, edi` vs `lea ecx, [edi + eax]`). Exit code 3.
- Probe 2: Replaced `child` local variable with `tree->children[childIndex]` in bounds expansion loops. Grew to 450 bytes due to repeated index evaluations. Exit code 3.
- Probe 3: Declared `GfxAabbTree *child = &tree->children[childIndex]` before the recursive call and passed `child`. Emitted 405 bytes. Exit code 3.
All 3 probes failed byte verification. `r_bsp_load_obj.cpp` restored to clean baseline.

# R_ResampleImage probe trials - 2026-11-06 (worker s4)

Target `R_ResampleImage` (retail `0x10025d10`, 360 bytes; ours baseline 364 bytes, unblocks 150 bytes).
Root cause of 364 vs 360 size diff was `R_DownsamplePixelData` calling convention: retail LTCG passed `stride` on stack (`push 1` / `push edi`), whereas ours passed `stride` in `edx` (`mov edx, 1` / `mov edx, edi`).
- Probe 1: Re-structured `R_DownsamplePixelData` to align with Mac 1.3 / retail x86 register pressure (`accB/accR/accG` initial assignments, `residual += newSize - oldSize; while (residual <= 0)`). This matched the retail stack ABI for `R_DownsamplePixelData` completely, reducing `R_ResampleImage` from 364 to 360 bytes (exact size match!). Diff was narrowed to only the 4th branch (`oldHeight < newHeight`) register choice (`ebp` vs `ebx` for `data`). Exit code 3.
- Probe 2: Reordered `dst` arithmetic to `data + bytesPerPixel * (newWidth - 1)` and loop decrements to `dst -= bytesPerPixel; src -= bytesPerPixel;`. Size stayed 360 bytes. Exit code 3.
- Probe 3: Computed `src = data + bytesPerPixel * (newWidth - 1); dst = src;` and loop decrements `src -= bytesPerPixel; dst -= bytesPerPixel;`. Size stayed 360 bytes; only 5 instructions in the 4th branch prologue differed in `ebx` vs `ebp` staging. Exit code 3.
All 3 probes reached; `r_screenshot.cpp` restored to clean baseline.

# R_GenerateOutdoorLookup probe trials - 2026-11-06 (worker s4)

Target `R_GenerateOutdoorLookup` (retail `0x10020950`, 201 bytes; ours baseline 211 bytes, unblocks 136 bytes).
Diff: retail sets up double bias 0.4999999990686774 in prologue, then performs inlined truncation via `fsub qword ptr [esp+0x1c]; fistp dword ptr [esp+0x18]`, whereas our build without /QIfist emits either helper calls or inline asm `I_fround`.
- Probe 1: Used `(int)floor(encoded)`. Emitted 194 bytes; MSVC generated stack alignment prologue (`and esp, -8`) and called CRT `floor`. Exit code 3.
- Probe 2: Used `(int)encoded`. Emitted 186 bytes; called runtime helper `_ftol2`. Exit code 3.
- Probe 3: Used `I_clamp(I_fround(encoded), 0, 255)`. Emitted 215 bytes with inline-asm scheduling differences. Exit code 3.
All 3 probes reached; `r_outdoor.cpp` restored to clean baseline.

# R_InitFrameBackendData deferral - 2026-11-06 (worker s4)

Target `R_InitFrameBackendData` (candidate `0x10021040`, 143 bytes; ours baseline 147 bytes, unbound `?` in BLOCKERS.md):
DEFERRED per worker brief instructions.
Reason: Function is unbound (zero byte hits across retail text). The candidate extent at `0x10021040` is 143 bytes vs our 147 bytes. Preamble/double-buffer scheduling differs by 4 bytes (`lea ecx, [eax+1]` vs `inc eax` and register scheduling of `s_cmdList = &data->commands`). Previous attempts to alter register allocation via volatile references caused regressions in accepted extents `10023af0` and `10020dc0` under LTCG. Not easy to bind safely without deeper whole-TU register allocation analysis across `r_rendercmds.cpp`.
# Material_LoadTechniqueDx7 probe - 2026-11-06 (worker s5)

Target `Material_LoadTechniqueDx7` (retail `0x1001ba70`, target 580 B vs draft 610 B):
- Probe 1: Added `__declspec(noinline)` to `Material_LoadPassStateMap` to prevent inlining into technique loader; emits 510 B with `call Com_Parse` out of line. Exit code 3.
- Probe 2: `while (count < 4)` with `Com_ParseInternal(&text)`; changes prologue frame to 0x1bc with ebp hoist; emits 589 B. Exit code 3.
- Probe 3: `do ... while (count < 4)` with `Com_ParseInternal(&text)`; preserves 0x1b8 frame; emits 589 B vs target 580 B due to pass-loop register scheduling. Exit code 3.
Source restored to baseline.

# R_CubemapShotAlpha probe - 2026-11-06 (worker s5)

Target `R_CubemapShotAlpha` (retail `0x100265e0`, target 266 B vs draft 262 B):
- Baseline ours: 262 B (differs in x87 register scheduling for direction[0] accumulator across u/v blocks).
- Probe 1: Component accumulation with scoped `u` and `v` blocks (`direction[0] += axis[1][0]*u`); size: 262 B. Spills direction[0] to stack early. Exit code 3.
- Probe 2: Three single-expression formulas with `u` and `v` declared ahead of direction; size: 222 B. Exit code 3.
- Probe 3: Separate `dir0` scalar accumulator kept in ST(0) across `u` and `v` blocks; size: 242 B. Exit code 3.
Source restored to baseline.

# FresnelTerm probe - 2026-11-06 (worker s5)

Target `FresnelTerm` (retail `0x1002c370`, target 201 B vs draft 203 B):
- Differs in one x87 cleanup instruction after `(rp*rp + rs*rs)*0.5`: candidate emits `FXCH ST(2); FXCH ST(1); FSTP ST(0); FSTP ST(0)` (8 B) vs target `FXCH ST(2); FSTP ST(1); FSTP ST(0)` (6 B).
- Probe 1: Direct `result = (float)((rs * rs + rp * rp) * 0.5)` without reflectance intermediate variable; stays 203 B. Exit code 3.
- Probe 2: `result = (float)((rp * rp + rs * rs) * 0.5)` term ordering; stays 203 B. Exit code 3.
- Probe 3: Explicit early returns on clamp (`return 0.0f; return 1.0f;`); stays 203 B. Exit code 3.
Source restored to baseline.
# RB_DrawFrameColorDebug probe - 2026-11-06 (worker s6)

Target `RB_DrawFrameColorDebug` (retail `0x10030190`, 286 bytes):
- Baseline ours: 235 bytes (used literal dword hex colors 0xffff0000, 0xff00ff00, etc., while retail constructs colors via byte array stores).
- Probe 1: Applied byte color[4] array with color[0..3] byte assignments. Size: 286 bytes (exact match). Instruction count 92 vs 92. Differed only in register allocation (ours used eax for 0 and cl for 0xff; retail used ecx for 0 and al for 0xff).
- Probe 2: Reordered byte stores to write 255 values first (color[2]/color[1]/color[0] then color[3] then zeros). Size: 286 bytes. Kept eax/ecx inversion across initial float setup.
- Probe 3: Deferred quarterWidth/quarterHeight calculation to after initial color setup to match retail FPU stack schedule. Size: 286 bytes. Register allocation unchanged.
All 3 probes failed byte verification. `rb_backend.cpp` restored to baseline.

# VectorRotate probe - 2026-11-06 (worker s6)

Target `VectorRotate` (retail `0x1005df90`, 273 bytes):
- Baseline ours: 255 bytes. Retail inlines an x87 double `fsincos` sequence (`push eax; push ecx; fld ...; fsincos; ...; fstp qword ptr [ecx]; fstp qword ptr [eax]; pop ecx; pop eax;`) in `SinCos(dAngle, &s, &c)`, whereas our pure C baseline calls CRT `sin`/`cos`, resulting in 255 bytes (missing 18 bytes).
- Probe 1: Baseline verified; calls CRT `sin`/`cos` via `com_math.h` `SinCos(double, double*, double*)`. Result: 255 bytes.
- Probe 2: Attempted float arguments with `FastSinCos`; rejected by signature.
Matching retail requires double inline assembly `__asm { fsincos }` in `SinCos`, which is forbidden by repository rules ("no inline asm/_emit/byte arrays/pragma hacks" and C/C++ game coverage excludes assembly-bearing functions). Source restored to clean baseline.
RB_EndSurface MATCHED (2026-11-06): the technique null test lives inside the inlined
drawable helper, so every false exit merges and the clear block falls through.
RB_DrawOptimizedTessSurface MATCHED: stream set and RB_DrawTechnique(1|3) are written
per branch, stride computed before buffer. Both still wait on RB_DrawTechnique binding.
RB_GetLightingAtPoint 784/784 (2026-11-06, lead): retail = 3 unrolled axes using an
inlined asm floor helper (fld x; fsub (0.5-2^-30); fistp), origin - (-131072.0f), and
scalar cellX/Y/Z (frame 0x40 now matches). Kept in workspace src as closer source.
Residual: retail keeps sampleOrigin in ebp and loads r_showLightGrid enabled into bl;
ours uses ebx and cmp mem. Non-const bias and a local bool for the dvar: no change.
RB_TessSunBillboard 544/544 (lead): retail frame 0x64 vs ours 0x50, retail saves only
esi/edi and spills offsets; sum term order is canonicalized by the compiler (swapping
the first two source terms emits the same code). Restored.
RB_GetLightingAtPoint closer source (I_ffloor asm helper, unrolled axes, scalar cells)
was reverted: the gate only accepts __asm in hash-reviewed files. Re-apply it with an
owner-reviewed allow-list entry once the register residual is solved.
RB_DrawSunBlindGlare MATCHED bytes (lead, 2026-11-06): color built as GfxColor byte
array (3x light, dark), same fix as RB_DrawSunFlare; waits on RB_DrawStretchPic/RB_Set2D.
RB_TestTransform 214/214: x4 printf multiply is float (fmul dword), /60.0f; only an
add esp/fmul scheduling swap remains. Kept closer source.
rb_tess entity color (6 fns): retail builds GfxColor bytes [2]=RGBA0,[1]=RGBA1,[0]=RGBA2,
[3]=RGBA3 on the stack; applied to all six (RB_TessRailCore 59 -> 42 diffs). RailCore
residual: retail keeps endpos/origin pointers in ebx/esi; VectorSubtract form is worse (176 B).
RB_BlendSavedScreenCmd MATCHED (lead): alpha is float (float)pow(...); R_CullSceneEntities uses type <= 1 (callee convention residual).
RB_Set2D 864/847: memset(&valid[1],0,3) adds a lea pointer temp (864); chained valid[1]=valid[2]=valid[3]=0 gives 880. Both rejected; zero-register class stays open.
R_SkinGfxEntityCmd 10020ce0/12: ours inlines R_SkinGfxEntity (80 B) cross-TU; moving the wrapper to r_scene and __declspec(noinline) on the callee both keep 80 B. Retail calls it with the entity in edi. Inlining-decision class; restored.
Image_ExpandBgr 1000f350/37 MATCHED (new source): retail keeps the BGR->BGRA loop as its own helper (KisakCOD name); Image_LoadBitmap calls it.
RB_BenchmarkSeconds 10033090/48 MATCHED: parameter order is (start, end).
Image_Load 10010ab0/43 MATCHED (new source, Mac name): $-builtin or alloc+load-from-file; Image_Register inlines the same logic in retail too.
Material_ValidatePassArguments 1001c2f0 (208/196) + Material_ValidateTechniqueDx7 1001c3c0 (64/63): retail passes material in edi, ours ebx (callee register context).
OLDNAMES spelling (stricmp/strnicmp/strlwr for the underscore forms, 22 sites): same-offset 248932 -> 248968 (+36), library binding unchanged; renderer CRT order is not driven by these. Reverted.
RB_UpdateViewportConstants (retail 1003e690, 320 B; blocks RB_SetRenderTarget chain 1.3 KB): float pairs are arrays in memory (renderTargetSize/invRenderTargetSize/halfViewportSize/viewportCenter): 62 -> 41 diffs, same size. Residual: retail frame 0x34 (viewport at +0x24, height float at +8) vs ours 0x28, and the center/half arithmetic order at the end. /Op on rb_state is worse (82). Declaration order of viewport has no effect.
R_FindSpawnVar 10002e40 MATCHED (Mac name): non-static, inlined into R_FloatForKey; Vec3ForKey/Vec4ForKeyHex keep their own inline loop (using the helper there loses them). Its out-of-line copy is emitted at its source position.
R_LoadLightGridColors 100025d0 + R_LoadMaterials 10002690 MATCHED (KisakCOD names): restored from R_LoadWorldInternal inline code as non-static functions at their source positions, reading through a lump_t pointer.
R_LoadLightmaps 1520/1568 (retail frame 0x218 vs 0x210, 418 diffs): retail calls Com_Memcpy directly (R_CopyLightmap inlined there); making R_CopyLightmap non-static does not get it inlined. Needs a dedicated pass.
r_dpvs head helpers: R_DpvsPlaneDistToPoint (10005cb0) MATCHED, used at the portal vertex test. R_DpvsPlaneBoundsTest (10005cd0, Mac name; retail order b[s1]c1+b[s0]c0+b[s2]c2+c3) loses R_IsBoundsOutsideViewNoStack wherever it is used there; dropped for now.
RB_CheckOverflow 1002dfa0/38 MATCHED (Chunk 01, Quake III/coduomp name): non-static helper emitted after RB_TessOverflow; RB_DrawStretchPic calls it inline; same-offset 251990 -> 252150 (+160 B).
RB_SetCurrentFeedbackImage 1002dfd0/6 (Chunk 02): 6-byte body (mov [backEnd.currentFeedbackImage], eax; ret) has only 2 unmasked bytes (a3 ... c3); cmp.py requires >= 4 unmasked bytes for non-return functions to avoid false hits. Non-source-fixable binder threshold.
RB_SetIndices 1002dfe0/18 (Chunk 03): 18-byte body (push esi; mov esi, eax; cmp [dxState.indexBuffer], esi; je; call RB_ChangeIndices; pop esi; ret) has 8 masked bytes (4 data reloc + 4 call disp), leaving 10 unmasked bytes (longest run 5 B); below cmp.py search threshold (len(lit) >= 8 or unmasked >= 12). Non-source-fixable binder threshold.
GfxCmdHeader::Next 1002e000 / GfxRenderCommandExecState::Advance 1002e010 (Chunks 04, 05): 7-byte and 11-byte __thiscall member helpers in ecx (movzx eax, [ecx+2]; add eax, ecx; ret and mov eax, [ecx]; movzx edx, [eax+2]; add edx, eax; mov [ecx], edx; ret); inlined into callers across backend. Shared header methods; cross-TU risk. Logged.

# r_material front-to-back pass - 2026-11-07 (worker g5)
Material_LoadFile 10017940/50 MATCHED: unreferenced out-of-line helper (Mac 1.3 decompile name) to load material via FS_FOpenFileRead. Restored before std::sort templates in r_material.cpp; byte referee and regression pass, bound at 10017940 (why: []).
Material_ClearLiterals (chunk 0x10016430, 16 B slot, 11 B code): probed out-of-line helper; compiler emits 11 bytes with relocation, which has only 7 unmasked bytes; fails cmp.py minimum leaf search threshold (>=8 unmasked bytes or >=12 unmasked for relocated leaves), so referee rejects. Restored.
Material_Init (chunk 0x100173e0, 124 B): probed 3 variants (direct texture/constant/techniqueSet comparisons, non-static builtins). All 124 bytes of logic, constants, rep stosd, and calls match 100%; diff is compiler-generated push ecx / pop ecx 4-byte frame allocation. Non-source-fixable callee frame allocation. Restored.
Material_Register (chunk 0x10017100, 240 B): confirmed push esi shrink-wrapping into if (!found) path is an LTCG non-source-fixable register/block scheduling residual.
Material_ReloadTextures 10017640 (195 B) & Material_ReloadTextures_f 100178b0 (144 B): 100% byte matches; unbound solely because callee Image_LoadFromFile in r_image_load_obj.cpp is unbound.
R_ApplyPicmip (chunk 0x10017730, 347 B): inlines cross-TU Image_UpdatePicmip from r_image.cpp; codegen depends on cross-TU /GL context.
Remaining r_material chunks in CHUNKS.md (0x10016560, 0x10016590, 0x100169b0, 0x100169c0, 0x10016a80, 0x10016a90, 0x10016ba0, 0x10016bd0, 0x10016d40, 0x10016d60, 0x10016fe0, 0x100172d0, 0x100173a0, 0x10017460, 0x10017550, 0x100175f0, 0x10017620, 0x10017630, 0x10017d30, 0x10017f50, 0x10017f60, 0x10017f70, 0x10018070, 0x10018120, 0x10018130): either alignment padding, inlined helpers whose callers are already 100% matched/bound, or std::sort templates already bound.

# r_shadowcookie front-to-back pass - 2026-11-07 (worker g10)
R_EmitShadowCookieSurfs 10027190/27, R_ClearShadowReceiverTarget 100278f0/53, R_DrawShadowCookieOverlay 10027c80/116 MATCHED (+3 bound, 2703 -> 2706; same-offset 251020 -> 251652): restored out-of-line helpers R_EmitShadowCookieSurfs and R_ClearShadowReceiverTarget called by R_DrawShadowCookies, and hoisted size computation before MatrixIdentity44/R_AddCmdId9 in R_DrawShadowCookieOverlay.
Remaining r_shadowcookie chunks in CHUNKS.md:
- 0x100271b0 (R_SetShadowViewParms), 0x10027590 (R_AddShadowReceivers), 0x100276d0 (R_CreateShadowCookie), 0x10027930 (R_DrawShadowCookies), 0x10027f40 (R_BuildShadowCookieList): depend on shared GfxViewParms matrix field order in rb_backend.h / cross-TU R_GenerateShadowCookies caller in r_scene.cpp / register allocation.
- 0x10027540 (R_IsShadowReceiverOutside, 69 B): base-pointer offset scheduling (`add ecx, 8` vs `add ecx, 4`).
- 0x100278d0 (19 B): <20 B clear-screen helper below referee 20 B minimum.
- 0x100280e0 (59 B, R_GenerateShadowCookies): calls R_BuildShadowCookieList with static register convention (`shadows` in `edi`), requiring cross-TU caller update in r_scene.cpp.
- 0x10028120 (R_ResetShadowCookies, 35 B): dead array-init register setup (`mov edi, 0x10696bd0; xor ecx, ecx; mov eax, 8`) before constant stores.
- 0x10028460, 0x10028480, 0x10028560, 0x10028650, 0x10028710, 0x10028780, 0x10028860, 0x10028920, 0x100289e0: <20 B std::sort iterator/pair/tag helpers or alignment tails.

# r_rendercmds front-to-back pass - 2026-11-07 (worker g11)
R_AllocViewParms 100210d0/35, R_GetCommandBuffer 10020e10/107, R_GrowCommandBuffer 10020e80/58, R_ClearModifiedGpuSyncDvars 10021d70/63, R_AddCmdDrawPoints 10022350/245, R_AddCmdDrawLines 10022450/245, R_AddCmdDrawTriangles 10022550/354 MATCHED (+7 newly bound functions, 2703 -> 2710).
R_InitFrameBackendData 10021040/143: removing volatile from dx.dynamicBufferFrame matches size (143 B) and preamble, but hoists lea edx, [eax+219d0c] (s_cmdList = &frontEndDataOut->commands) before drawSurfCount..viewParmCount zero stores; restored.
R_ProcessFrontendCmdInternal 10020be0/144 & R_AddFrontendCmd 10020ca0/16: making R_ProcessFrontendCmdInternal non-static emits custom LTCG register args (ecx, edx, eax) instead of retail stack args + 4-byte push ecx frame; restored.
R_ShutdownBackendData 10020bd0/13, R_UpdateEffectsBolt 10020cb0/6, R_UpdateEffectsNonBolt 10020cc0/6, R_AddCmdTouchAllImages 100226c0/79: already 100% byte-matched to retail; unbound only due to leaf binder threshold / duplicate body at 100131b0.
0x10021900 (16 B), 0x10021910 (16 B), 0x10021980 (80 B), 0x100219d0 (144 B), 0x10021a60 (128 B): unreferenced command helpers with custom LTCG register conventions (edx/ecx/eax, esi, ecx, ebx) that cannot be produced for uncalled C++ functions under /GL.
R_AddCmdLightProperties 10021770/192: x87 float copy and specular alpha multiply scheduling residual (previously logged).
2026-11-09 R_DpvsPlaneSetDist: DotProduct(coeffs, point) and (point, coeffs) emit the same code; retail loads point first. Not source-order fixable, reverted.
2026-11-09 RB_ScreenRadiusToWorld: up[3] temps fit the 120 B slot (kept); y+z+x and z+y+x orders both leave x87 scheduling diff. 3 probes used.
2026-11-09 RB_TessEntity: retail case order kept; code identical, only jump table targets differ; not bound yet, 2401 bound before and after.
2026-11-09 TU hunt: Mac binary not available (main symlink dangling), so no STABS list; all Mac gfx_d3d files covered, no unbound code near com_*/q_*: last 4 LTCG objects (117/121) likely data-only. HYPOTHESIS.
2026-11-09 Image_TrackFullscreenTexture: KisakCOD two-arg helpers (platform, size) with if (platform == 1) merge both tests into one cmp/jne, far from retail (dec form, two tests). Reverted.
2026-11-09 r_init globals: round 1 moved only source position; relative definition order (ri,rg,rgp,dx,vidConfig,r_mode,r_displayRefresh,re) is unchanged, nothing to revert; 970 B same-offset loss has another cause.
2026-11-09 r_bsp_load_obj head: LittleShort/LittleLong/FloatFromBits/FloatIdentity uses and macro-expanded parse token restore retail helper order, no loss. Com_Memset in R_ResetShadowCookies fits R_LoadWorld 176 B slot (offsets at retail through 1740+) but bytes differ. Same-offset 251545 -> 250054 until later size gaps close; NOT merged.
2026-11-09 R_LoadLightmaps: 2 probes. Retail writes widths/heights 512 pairs, 4s, 1, then 1024s; images[] via saved (wide<<20)*high. Explicit stores gave 1504 B (same-offset 250410); saved-count form 1520 B (252161, was 252171). Retail is 1568 with frame 0x218 vs 0x210; 48 B gap unexplained. Reverted. Next attempt needs the retail body read in full, not more spellings.
2026-11-09 R_LoadLightmaps probe 3: rewrite from Ghidra (for-guarded group loop, per-group scaleX/scaleY, row before col, retail store order, (high<<20)*wide): still 1520/1568, same-offset 252146, frame still 0x210. Reverted; 3 probes used. Untried lead: retail inlines an image upload dispatch (image type == 4 selects 1000ec00 else 1000ea20) at both upload sites; R_CopyLightmap inline shape also differs.
2026-11-09 R_LoadLightmaps past limit: inlined upload dispatch alone 408 diffs, 1520 B; plus Ghidra structure 1536/1568 (same-offset 249778); plus inlined copy loop still 1536, frame 0x210 vs 0x218. Saved on local branch gfx/lightmaps-wip, not on recon. 32 B and 8 B of frame still unexplained.
2026-11-09 RB_Set2D: removing #pragma optimize(p) gives 896 B/199 diffs vs 864/153 with it; pragma p is established here (used across matched TUs). Keep. Remaining diff: zeros via xor cx after matrix copy (zero-register class).
2026-11-09 zero-register class, RB_SaveLightVisHistory: inline helper taking the zero as a parameter and chained s_vc_log=(byte*)(s_vc_logCount=0) both still emit two immediate stores. With earlier /G5-/G7 and /Os trials, source spelling and tuning flags are exhausted for this class; do not retry without new evidence.
2026-11-09 RB_UpdateViewportConstants: explicit viewportOffset pair reaches retail slot 368 (was 352); frame 0x28 vs 0x34 and x87 temps still differ, 41 diffs. Declaration reorder has no effect.
   That fit lowers same-offset 252172 -> 250877 (later code leaves accidental alignment); source change backed out. Apply only with the neighbouring drift work.
2026-11-09 r_bsp_load_obj sizes: R_SetSkyImage 128/128 (for-loop with return inside, no post-loop recheck; bytes match). R_CalculateWorldBounds 256/256 and 0 diffs (seed is a 12-byte struct assignment *(Vec3Bits*)mins = *(const Vec3Bits*)bounds, not VectorCopy/ExpandBounds which fold to scalar moves). R_SetSurfaceBoundsAndLmapCoords 256/256 (vert < bounds[0] / vert > bounds[1] compare order; disk lmapCoord read via FloatFromBits(*(int*)&f)); 11 scheduling diffs remain (push ebx placement). R_LoadSurfaces 1008/1008: index lump (9) checks are inline in retail, not a R_GetLumpElemCount call; indices read as fileBase+ofs+firstIndex*2 per surface.
2026-11-09 r_bsp_load_obj order/size pass: source order now retail (Interpret last, SetParentAndCell_r before Nodes, Occluders before OccluderIndices, AabbTrees after Entities). R_IsMissingOrBadModel 10003010 MATCHED (extern Bool, unreferenced, 0 diffs): fills the 32 B gap before R_IsValidStaticModel. R_LoadEntities 1216/1216: Com_Parse expanded inline via R_PARSE_TOKEN and the spawn-var loop as a macro (a static __forceinline function leaves a stray 304-448 B copy). R_LoadCullGroups 208/208 and 0 diffs (Kisak form: firstSurface local, startSurfIndex stored before surfaceCount). R_LoadPortals 400/400 (-plane[3] direct, no FloatFromBits). R_LoadNodesAndLeafs 320/320 (out local then s_world.nodes = out); 33 diffs left.
2026-11-09 R_LoadWorldInternal 1312 vs retail 1264 + 64 B helper at 10004d80 (the if(sunLight) copy of 3 vec3 into GfxLight, regs eax/ecx/esi/edx, no callers): helper added as inline R_SetSunLightVectors but ours takes a stack arg (80 B, retail 64); non-static, static, __forceinline and inline all gave 80 B. LoadWorld excess 48 B is Image_Register inlined into the inlined R_RegisterOutdoorImage (retail calls 1000d200); __declspec(noinline) declaration here plus an explicit copy of the body did not stop it (3 probes, stuck). Skip name scan now starts from s_world.name as retail.
2026-11-11 R_LoadLightmaps: second wideCount read (tile/wide, tile%wide from a separate copy of groupInfo[g].wideCount) + reorder[32]: 1552/1568, frame 0x218 matches, same-offset 253888 (was 251538). Explicit store order, wide0/high0 locals, array declaration order: no codegen change. Local struct {bpp,heights,widths,sunColor} reproduces retail slot layout but CSEs the wide copy: 1536 B. Retail keeps param in ebp and wide0 in ebx; still 16 B short.
2026-11-11 binder blind-spot scan (gfx/main fd5dd1e9): largest blocked library chains trace to two known roots only: __setlocale_lk (data ___lc_category, see KNOWLEDGE) blocks _setlocale -> CPreProcessor ctor -> 15 D3DX compile entry points (3.4 KB); _memcpy extent blocks realloc -> crtsetenv -> wtomb_environ -> getenv_lk -> tzset -> strftime chain (about 5 KB). Retail bytes after memcpy are the private a_map _strncnt (8b4c2404 85c9 740b 49 803800), placed elsewhere in our link: a CRT layout difference, not a binder rule gap. No cheap tool fix left in these two.

# Retail definition order batch - 2026-11-11
retail_order.py moved ~260 definitions in 22 game TUs to retail address order (prototypes added, bodies unchanged): gate green, same-offset 253888 -> 253921, merged (da552d25). Stacking on it R_SetSunLightVectors param order + Image_Register noinline (gfx/w-bsp e7c61e05) and Image_Generate2D/3D/SetupFromFile (gfx/w-imgload 65a41186): gate green, same-offset 250997, not landed. Sizes upstream (R_LoadLightmaps 16 B short) still shift everything after them.

# r_flares/r_fog unnamed helpers - 2026-11-11
Retail 1000bae0 (32 B slot: dst[2]=cl, dst[1]=dl, dst[0]=arg, dst[3]=arg; inlined in R_SetFog colour) and 1000bb00 (16 B: archiveProc thunk, inlined twice in R_ArchiveFogState) are out-of-line header inline copies with no name in opencod2, KisakCOD, Mac generated_syms or Mac r_fog.c. DEFERRED (no invented names): they are the 48 B r_fog drift.
2026-11-11 r_image_load_obj reorder to retail order (w-imgload, moves only + Image_Generate2D/3D + Image_SetupFromFile out-of-line, SmoothStep inline, Transform macro): gate 1 (reorder + Generate2D/3D) same-offset 253706 (main 253888); gate 2 (+SetupFromFile, SmoothStep, macro) 251467. Both gates green, no function lost. Generate2D/3D/SetupFromFile bind to retail 1000fb30/1000fb80/1000f2f0 by bytes. SmoothStep (inline, retail 10010480) is not emitted by the compiler. The reorder alone does not pay while TUs before it are off-offset; reordering is now done by gfx/w-order (retail_order.py). Reordered file kept outside git, not committed.
2026-11-11 r_image_load_obj retail-order rewrite (w-imgload2): full retail order, SmoothStep (10010480/21) and Image_IdentityFloat (1000fd60/5, name UNCONFIRMED) out-of-line, Image_TransformLightGridVector as macro with file-scope basis. Gate green. Internal drift -0x5d0 for every function through GenerateSolidColor, -0x5e0 after: Image_GenerateCubemapFunction is 16 B short (ours 770, retail 1000/10160..10472 = 786). r_image_load_common internal drift 0 after adding FormatMinSize (1000eda0/31), GetPicmip (1000ee10/21), CubemapFace (1000ef30/1). Open: retail 10010ae0 water helper (no category check) vs our Image_BuildWaterMap (retail 1000d0f0 in r_image TU).
2026-11-11 r_dpvs head (w-dpvshead): same-offset 253962 (gfx/main) -> 252451 (w-debug2 base 972e0975) -> 254368 -> 268601 -> 269504. PINNED: retail head copies are sqrtf/sqrt/I_sqrt (3 x 16 B), VectorNegate, VectorMA, VectorLengthSquared, VectorLength, VectorScale4, DotProduct4, then file inlines SetDist (c30), SetDist+sides (c50), DistToPoint, near-corner dist 1,0,2 (cd0), far-corner dist (d00), view-origin dot plane (d40, order 1,2,3,0), then R_CreateOccluderEdgePlane (d70), R_GetSidePlaneNormals, three bool corner tests (61d0 <=0, 6210 far >=0, 6260 near >0), R_AppendNearFarPlanes... Uses that emit them: FrustumClipPlanes = VectorScale4(c, 1/VectorLength(c)); PortalClipPlanes VectorLengthSquared(normal) != 0; SetupDpvsForPoint SetDistAndSides; occluder setup view dot; AabbNeedsChildClipping far-corner; IsBoundsOutsideView/IsAabb occluder loops near-corner tests. The four cull helpers and R_Furthest/NearestPointOnWinding (10006660/10006900, callers 10009770 and PortalClipPlanes) must be non-static noinline to stay out of line. Using R_DpvsPlaneNearCornerInFront inside R_IsBoundsOutsideViewNoStack loses 0x100063e0 (gate: checkpoint loss), keep it explicit there (as TRIED 4280). Open: R_IsBoundsOutsideView is 16 B bigger than retail (NoStack lands at 100063f0 not 100063e0).
