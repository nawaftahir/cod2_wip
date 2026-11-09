PINNED: SMC_AllocCachedSurface1002acd0/215 recomputes the indexed freelist
address after the split callback instead of retaining a head pointer in ESI.
Direct cache->freelist[listIndex] accesses reproduce the late ESI save and
unlink operand order. Both byte/binding referees and local regression pass;
evidence:workspace/work/proof/cache_allocator_20261105_warm_bind.json and
nov05_cache_allocator_checkpoint.json. Clean CI is required before landing.

PINNED: copier1002b790/82 reads cached->xsurf/triIndices before baseVertIndex.
Reordering those initializations reproduces the incoming EAX use and all bytes
and bindings. Evidence:workspace/work/proof/cache_indices_20261105_warm_bind.json;
negative guards and local regression are in nov05_cache_indices_checkpoint.json.
Historical TU completeness is not inferred from current emitted-body matching.

# Verified renderer knowledge

PINNED: retail renderer SHA256 is
4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6.
The original compiler/linker hashes and private image recipe are in toolchain/README.md.

PINNED: accepted source and library extents are enforced by
workspace/work/tools/check_checkpoint.py and regression.py. Their historical
proof hashes remain unchanged during migration; do not replace these gates.

PINNED: RB_CalcSunBlindGlare at1003bda0/352 matches bytes AND bindings after
explicit zero/one/fraction branches. Evidence:
workspace/work/proof/sun_blind_glare_20261104_warm_bind.json and
workspace/work/proof/nov04_sun_predicate_checkpoint.json.

PINNED: Set2D's scene viewport reads are1072dde0/dde4/dde8/ddec, corresponding
to sceneViewport at backEnd+3e0..3ec. They are not backEnd.width/height.
The fixture seeds different scene/output dimensions to detect this error.
Set2D remains a draft; see docs/TRIED.md for its unresolved code generation.

PINNED: the lightmap weight image builder1000fe90/605 matches both referees.
Its unchanged I_fround calls expand assembly, so all605 bytes are excluded
from C/C++ coverage. The same full-body exclusion applies to every listed
assembly-bearing function in source_coverage.py.

SUPPORTED: TU link order and source ownership tables are candidate structure,
not recovered historical boundaries. Keep workspace/work/layout alongside
code. A masked byte match does not prove a call or global binding.

Migration preserves all168 commits on the old master line, adds separate
freeze snapshots for the main/Gemini dirty work, and leaves the old repos
and archived research untouched. No build artifacts are imported.

## Transform and diagnostic findings - 2026-11-05

PINNED: R_GetRigidTransform1001ee70/399 passes both byte and binding referees
with definition-level __declspec(noinline), preserving its original arithmetic.
Retail stacks output/scale and uses ECX/ESI/EDX inputs. Evidence:
workspace/work/proof/rigid_transform_20261105_warm_bind.json,
rigid_transform_20261105_negatives.json; clean work CI42036887579 and canonical
CI42038128889. Both retention tools reject removal/unverification of the body.
This is not evidence to add noinline elsewhere; the other boundary probes fail.

PINNED: canonical meter bd80a2ea names source commit db75b7d2. The meter's
119171/253580 C/C++ bytes excludes all40 assembly-bearing bodies in full.
Root source snapshots and current emitted-body-certified TUs are separate
measurements. Two common.obj owners remain ambiguous. Historical TU boundaries
and full-DLL source completion are not established by these counts.

PINNED: the24 tested private vertex signatures all fail. They permute the four
float-vector inputs with bone/output last; they do not cover all720 possible
six-argument signatures. Receipt:proof/vertex_order_20261105.json. No candidate
or coverage was accepted. All three explicit DX7 expression variants also fail;
see TRIED. Do not repeat these batches without new primary evidence.

PINNED: filtering cmp bodies after building the complete sorted symbol table
preserves the next-symbol extent. Filtering that table first would change sizes.
Evidence:tests/test_short_candidates.py exact/missing/plain-name cases and the
real filtered/full row equality recorded in vertex_order_20261105.json.
The --symbol mode is diagnostic only. A passing probe still runs full cmp,
bindcheck, regression and source accounting. It does not certify bindings.

PINNED: the32-bit native fixture can fail with SIGSYS under sandbox seccomp;
the same existing fixture passes outside that restriction. This is not a source
regression. Log:proof/latest/nov05_dx7_explicit_native.log (local diagnostic).
Native tests grant behavioral evidence, not original-compiler byte identity.

PINNED: MP 1.3 gfx_d3d_mp_x86_s.dll (sha 243505f5) differs from MP 1.2 (aed5b8de)
in 24 bytes only: PE timestamp 0x130, 0x10c204 and two .rdata spans near 0x19c92c
and 0x19d4e4. Both have .text 0x10a570 (1.0: 0x10a090). FASTPATH_11-04 "1.3 = 2.9%,
different build" is wrong; that row measured another binary. Order: finish 1.0,
port to 1.2, then 1.3 is a near-trivial patch. Evidence: cmp -l, objdump -h.

PINNED: tools/cmp.py capped raw byte hits at 8. Common SDK bodies (e.g. 33-byte
scalar deleting destructors ??_GCPool/_GCConstant/_GCFragmentInfo) have more
retail copies, so the caller-placed address (AddPool calls 0x100cb926) was absent
and the binder could never place them; 80 KB of chains hung on that. Cap 64:
+96 bound functions/+86990 library bytes, zero previously bound bodies lost
(same DLL, referees rerun). Binder acceptance predicates unchanged.

PINNED: two binder blind spots in LIBCMT x87 code. (1) closed_run: tiny entry
stubs (87ctrigh/87ctran _CItanh, _CIexp) short-jump into neighbours of the same
object, so the 1-byte extent probe fails; the whole contiguous object block is
now compared (masked bytes, identical reloc offsets, closed end). (2)
interior_call: calls to asm entry labels (87disp _rttospop) bind when exactly
one bound owner holds the label on an instruction boundary at the same retail
offset (data refs already used interior_code). Same DLL: +40 fns/+29304 library
bytes, zero lost. memcpy stays blocked by link order (retail: memcpy.obj then a
private _strncnt from a_map/a_cmp; ours: getqloc.obj).

PINNED: __setlocale_lk (4.6 KB chain) fails on ___lc_category (retail 0x101a47c0).
Its 6x12-byte entries hold: name string (binds), locale pointer to an unnamed
setlocal.obj "C" static right after fpinit.obj __FPmtterm (bytes equal, but it
resolves to __FPmtterm+8, another object, so nested_data rejects it), and init
function pointers. ___init_dummy (setlocal) and ___init_collate (initcoll) are
3-byte bodies with no hits and no calls; only this table can place them. Also
fpinit.obj data differs: retail __FPmtinit/__FPmtterm both 0x100f7938, ours
__FPmtterm 0x100f4e49 and FPmtinit 0 (different CRT fp objects linked; HYPOTHESIS).

SUPPORTED (8 worker batches, 2026-11-06): same-size misses fall in three classes
that no C spelling changed in 3 probes each: (a) SIB base/index order
(R_CopyCubemapShot, RB_InsertGridVisLog, Material_CacheShaderText); (b) block
layout of the return/clear paths (RB_GetGlowRadii, RB_EndSurface); (c) store or
x87 operand scheduling (RB_DrawRawSurface, R_WatersEquivalent, R_XModelDebugBoxes).
HYPOTHESIS: a compiler/flag/TU-context difference, not source. Do not hand these
classes to workers; investigate once as a lead task. Type/ABI diffs (16-bit load
vs movzx, Image_BuildWaterMap) DO respond to source and suit workers.

PINNED (Rich header, pefile, 2026-11-06): retail vs ours (prodid,build,count).
(100,3077): retail 121, ours 112 -> retail compiled 9 more LTCG C++ objects with
the same compiler build; our TU set is short by 9 (tus_total 112). (95,3077) 149/148.
Retail also links 12 objects from older tool builds absent in ours: (93,2067)x2,
(93,2179)x6, (95,2179)x1, (105,2067)x3; ours has (93,4035)x11 vs retail x3.
Implication (HYPOTHESIS): merged TUs give wrong /GL context for the register,
scheduling and block-layout miss classes; some SDK/CRT objects come from a different
library version than Summer 2004. Next: split TUs per Mac file list + TU_AUDIT islands
until (100,3077) reaches 121; identify the 2067/2179 objects by their library.
PINNED: retail links libjpeg jctrans.c and jdatadst.c (unmodified IJG 6b): their
bodies sit between jcsample/jdapimin and jdapistd/jdatasrc. Adding both: +11 verified
functions, Rich (100,3077) 112 -> 114 of 121, (95,3077) 148 -> 149 = retail.
PINNED: infoParms lives in its own TU universal/surfaceflags.cpp (Mac STABS path;
retail .rdata has the bark/brick/carpet names). Split from r_utils: Rich (100,3077)
114 -> 115 of 121; whole-file same-offset 249758 -> 249700 (data moved, expected
until data order is fixed). 6 LTCG TUs remain unidentified.
SUPPORTED pattern (2026-11-06): retail stores constant zero to 2-3 globals through one
xor-zeroed register (RB_SaveLightVisHistory 94 B: xor ecx; mov [s_vc_log],ecx;
mov [s_vc_logCount],ecx; RB_Set2D valid[1..3] via cx/cl); ours emits immediate
stores with the same source order. Same compiler build, so a per-TU/per-function
codegen context difference (size-favoring or TU context), not statement order.
Do not spend worker probes on this class; test once TU set reaches Rich (100,3077)=121.
SUPPORTED (s4 R_DownsamplePixelData + lead 2026-11-06): LTCG picks register vs stack
argument passing from the CALLEE body. Callers whose only diff is arg in eax/edx vs
pushed (R_AddRefEntityToScene -> R_CopyRefEntityToScene, R_CullSceneEntities ->
R_CullModelEntity, R_ResampleImage) are fixed by matching the callee first.
PINNED drift (2026-11-06): retail .text starts with r_bsp out-of-line inline copies Vector2Copy 10001000, VectorCopy 10001010, R_WorldVertexSize 10001030, emitted because R_CreateWorldVertexBuffer uses them inline. Using them (DX7 copy: VectorCopy xyz, Vector2Copy lmapCoord, stride helper) puts the first 5 functions at retail offsets; CreateWorldVB slot 0x1e0 = retail (bytes differ in loop pointer bias).
Drift step 2 (2026-11-06): R_GetNormalizedColorFromDvar helper (KisakCOD, 10001290 matched) and r_bsp order CopyParseParamsToDvars, InitWorldDynamicData, LoadWorld, then Shutdown/Release/ReloadWorld: retail offsets through 10001690; same-offset 248390 -> 249193. Tie: D3DX GetSemanticName unbound after the shift. R_LoadWorld is 160/168: retail has dead xor ecx/mov eax,8/mov edi,&shadowCookieGlob before the cookie stores; memset(glob,0,8) is not it.
Drift step 3: r_bsp_load_obj head = header inline copies in declaration order (I_sel, I_min, FloatAsInt, FloatIdentity, I_fround, Vector2Set, VectorClear, VectorSet, VectorScale, Vector4Set, Byte4Copy, LittleShort, LittleLong, FloatFromBits) then a side-bytes plane helper at 10001900. Used I_sel/I_min/Vector2Set/VectorSet/Vector4Set/Byte4Copy and R_SetDpvsPlaneSides: R_GetLumpElemCount at retail 10001940; same-offset 249193 -> 250489. Still missing FloatIdentity/LittleShort/LittleLong/FloatFromBits uses; our extra Com_ParseInternal copy (parse_inline.h) offsets them.
Drift step 4: R_CopyLightmap (KisakCOD name) at 100019c0 restores R_BuildLightmapCoupling to 10001a20; same-offset 250489 -> 251554.
Gemini batch g1-g6 (reviewed 2026-11-07): +15 bound functions (LerpByte, Material_LoadFile, Material_UsesDx7GridLighting, R_CountMatchingSceneEntities, R_DestroyParticleCloudBuffer, R_FinishAttachingToWindow, R_GetSceneEntDObj, R_ReduceWindowSettings, R_ReleaseAndSetNULL, R_ReleaseForShutdownOrReset, R_SetupWindowParms, R_ShutdownHardware, R_ShutdownStreams, R_SkinRigidSurface, R_UpdateGpuSyncType); cpp 119607 -> 120822; no loss; same-offset 251990 -> 251020 (g6 moved global data definitions into r_init, likely cause; to re-check).
Gemini round 2 (g8 r_bsp_load_obj, g9 r_image log-only, g10 r_shadowcookie, g11 r_rendercmds; reviewed 2026-11-07): +13 bound functions incl. R_GetCommandBuffer, R_GrowCommandBuffer, R_AddCmdDraw{Lines,Points,Triangles}, R_EmitShadowCookieSurfs, R_LoadSunSettings, R_SetDpvsPlaneSides; cpp 120822 -> 122262; no loss; same-offset 251020 -> 251538. g7 and g12 left uncommitted edits only (not taken).
PINNED 2026-11-09 TU split from Mac 1.3 Original path headers: r_model_load_obj.cpp (R_LoadXModelSkins, retail 10020400) and r_staticmodel.cpp (R_GetMaxModelSurfaceCount, retail 100296a0). Gate green, no loss, same-offset 251537 -> 251545.
PINNED 2026-11-09 clamp operand order: retail R_CombineLightmapsForDx7 uses I_min(255, x) (r-255 test, literal 0xff store); I_min(x, 255) burns a register and grows the body. Same-offset 250054 -> 252171.
