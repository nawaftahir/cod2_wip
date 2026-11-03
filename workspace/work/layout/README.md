## Current worker-ready structure - 2026-11-03

112 candidate TUs remain in src/tus.txt link order. The generated
retail_functions.tsv maps every inventory entry plus verified extra starts;
tu_work_queue.tsv preserves link slots and records candidate ownership,
pending emitted symbols, source hashes, ownership locks and estimated difficulty.
section_work_queue.tsv keeps non-code work explicit. Unknown owners remain
unknown; no complete historical PC TU-boundary or final-offset claim is made.
work_queue.json pins the inputs. Queue counts/bytes are NOT progress meters.

Gemini's isolated checkout is ../../../worktrees/gemini from this directory;
read the primary WORKERS.md and that checkout's GEMINI_START_HERE.md.
SCENE_01 owns r_scene.cpp's five scene-command bodies. Shared headers/data,
link order, compiler rules and the single whole-DLL build stay coordinator-owned.
Older layout notes below describe their dated snapshots, not today's TU count.

## Skinned-model source and resource field - 2026-10-27

## Current layout validation - 2026-11-01

The existing layout is the working baseline; do not recreate it.111 compiled
files exist with unique full object paths:58 renderer,44 IJG6b,7 universal,
1 qcommon and1 win32. All29 preserved source fragments resolve; the12 shared
globals listed below each have one definition. src/tus.txt, src/profile.mk and
closed.mk remain the compile/order/flag authorities and were NOT changed.

Refreshed file_layout.tsv from the current map/PDB. Its basename-only lookup
had assigned I_strlen to qcommon/common.cpp because both that file and
renderer common.cpp produce common.obj. The existing generator now uses full
PDB procedure object paths for collisions and rejects unresolved owners.
I_strlen belongs to gfx_d3d/common.cpp; Com_Printf/Com_Error to qcommon/common.cpp.
The real-PDB regression fixture checks both. No engine inputs/order/build changed.
Receipt: proof/nov01_layout_review.json. Original PC TU boundaries and exact
final placement are still unproven; interval/Mac-name rows are discovery only.
Historical slot lists and counts later in this document describe older snapshots;
use tus.txt and the refreshed report for today's candidate, including rb_tess.


Both skinned helpers/selector and the actual empty TessBad belong to the same
rb_tess TU. Existing backend VB ownership, copy/flush/bind/draw and matched
XSurfaceGetTris are reused. No data owner, TU, root/export or assembly added.
r_vb_state_t+8 now names the real IDirect3DVertexBuffer9 pointer, matching the
SDK/r_local; size12 and all field offsets stay fixed. Native tests check live
resource selection and captured stride/args across the index-bind boundary.

All2381 extents,160 fixtures and independent union audit pass. New bodies remain
unmatched/unplaced. C++42.710781607%; normalized spans68.549286159%; exact
same offsets8.810235758%. Receipt: proof/skinned_tess_checkpoint.json.
Entity primitives/table, command graph and final layout/metadata remain open.

## Original tessellation TU and shared buffer type - 2026-10-27

rb_tess.cpp now owns the four restored surface/model drivers, in its real Mac
source home; its current link-order slot follows rb_surface. rb_state owns the
matched46-byte matrix-stack push. No extra roots/exports, assembly, padding,
data owner or partial dispatch table. Final contributor order remains open.

The three active reference headers now agree with the SDK/state code's struct
IDirect3DVertexBuffer9. The old union tag prevented a real cross-TU bind; the
matrix-shaped Mac placeholder payload was unused and removed. No ABI wrappers
or casts. Correct PC matrix strides/field offsets are compiler-checked and the
native matrix fixture now retains align16. Full rebuild retains all2380 old
extents plus the new push;159 fixtures pass. New tess drivers remain unmatched.
C++42.710781607%; normalized file spans68.549286159%; exact offsets8.809533583%.
Receipt: proof/tess_surfaces_checkpoint.json. No V4/V5 claim.

## PC text ownership - 2026-10-27

Text/cursor/world-quad kernels and both text handlers live in rb_backend. The
8x4 RGBA color_table is one function-local owner in RB_LookupColor (Mac STABS).
Glyph lookup stays in r_font; only its linkage changes, preserving its accepted
103 bytes. Shared Font/Glyph layouts use r_font.h. No root/export/TU, duplicate
storage, padding or assembly added. Commands remain local backend records with
producer-compatible offsets44/48; first placement in rb_commands.h conflicted
with r_init's later gfx include and was corrected before the accepted build.

All2380 extents and157 fixtures pass. New text bodies remain unmatched, and
both handlers/static2D await the actual table/executor before emission.
C++42.692641376%; normalized file spans68.546261408%; exact offsets8.729215639%.
Receipt: proof/text_graph_checkpoint.json. Final placement remains unfinished.

## Backend dvar and image ownership - 2026-10-27

Image_RebuildCosinePowerMap belongs to r_image; backend dvar updates belong to
rb_backend. Existing sampler table, image globals and code-constant/AA state
owners are reused. No TU, root, export, duplicate storage or padding added.
The appended backend C++ leaves every prior assembly definition unchanged.
All2380 extents and156 fixtures pass; both new bodies remain unmatched.
C++42.692641376%; normalized file spans68.546261408%; exact offsets8.779772193%.
Receipt: proof/backend_dvars_checkpoint.json. Final placement remains unfinished.

## Ref-entity token and source owner - 2026-10-26

The ref-entity callback/helpers live in r_scene. One writable four-byte entity
surface token2 now immediately precedes the existing eight-byte stride table;
both map to r_scene.obj in .data. Native fixture checks exact12 bytes and+4
adjacency. No padding array, duplicate owner, root/export/TU or assembly added.
All2380 extents and155 fixtures pass. Ref-entity bodies still lack byte matches.
C++42.692641376%; file spans68.546261408%; same offsets8.705449737%.
Receipt: proof/ref_entity_checkpoint.json. Final positions remain unfinished.

## Model graph ownership and writable stride table - 2026-10-26

Model callers stay in r_model, the scene worker/submission in r_scene,
R_ProcessFrontendCmdInternal and its two-argument wrapper in r_rendercmds, and
R_DrawModel in r_dpvs using the real state owner. No new TU/root/export/assembly.
Existing draw-key/debug/cache/GPU helpers and colorCyan are reused. The stride
table is one eight-byte writable .data contributor in r_scene, verified from
the current linked map and bytes. Entity-surface token2 belongs just before
this table when the next callback draft is integrated; do not add a second
stride array or import the six-element Mac stand-in.

All 2376 extents and 154 fixtures pass. New graph source is still unmatched:
no C++ credit. Verified file spans68.544857059%; same offsets8.717656769%.
Final positions remain unfinished. Receipt: proof/model_publication_checkpoint.json.

## DPVS state and cache publication - 2026-10-26

The 108-byte DPVS owner replaces eleven split globals. Its real debug record
occupies bytes 100..104 and separate cull configuration follows at +108 in the
linked PDB. Type evidence and all thirteen PC initializer operands are frozen
in proof/dpvs_state_type_evidence.json. The reference 224-byte record is wrong.

Cache publication stays in r_staticmodelcache.cpp with its existing tree pool,
index allocation and upload command. No new TU, root, export or filler. Only
R_UsedCachedStaticModelSurface adds accepted byte credit (87 bytes). Current
PDB-aware file/evidence tables reflect actual owners. All 2376 extents survive;
150 fixtures pass. Whole-file spans 68.544857059%; same offsets 8.831517042%.
Receipt: proof/cache_publication_checkpoint.json. Placement remains unfinished.

## Shared helper instances consolidated - 2026-10-26

The shared math TU_STATIC macro is now C++ inline. r_shadowcookie parses shared
headers without /Op, then enables precise math on its function definitions.
This retains all2375 extents including the three fsqrt-dependent bodies lost
in the first broad trial. All seven matched alias groups are gone; canonical
original names come from Mac STABS and PC bodies. No helper definition body,
assembly instruction, export/root or source TU was added.

110 physical functions/2695 extent bytes and3520 .text virtual bytes disappear.
The remaining2375 accepted rows are all unique retail extents. This prevents
extra copies from being mistaken for final placement. C++42.653206089%; retail
spans68.539509731%; exact same offsets8.828870385%. Final source layout and
metadata remain unfinished. Receipt: proof/shared_helpers_checkpoint.json.

Next owner correction: Mac dpvsGlob type is108 bytes, not the reference's224.
Its five-byte debug record starts100; cullDist is separate. Existing split
queue/hull/plane/occluder/projection owners already cover most of it. Fold the
actual fields; do not add a new padded buffer or duplicate those globals.
Primary PC/type evidence: scratch/codex_1026_helpers/dpvs_*.


The corrected private-symbol reader also exposes23 retail extents with86 extra
candidate procedure rows (proof/api_raw_duplicate_extents.json). The coverage
union counts each retail byte once; these are not86 extra recovered functions.
Many are TU_STATIC static-inline math copies. Inspect actual candidate addresses
and real caller targets before consolidating shared helpers. Preserve all2375
retail extents, not every redundant candidate instance. Test bounded source/
linkage groups and log failures; final single-instance ownership is required for
whole-file identity, regardless of current binding acceptance.

## Raw-image/codec contributor checkpoint - 2026-10-26

Raw material API lives in r_material; Image_LoadRaw in r_image_load_obj; real
JPEG wrapper and allocator callbacks stay in r_jpeg. Codec TUs come from pinned
IJG6b and now follow retail-constrained order across all44 modules, with inverse
DCT after forward DCT and quantizers after memory manager. Evidence:
proof/jpeg_contributor_order.json and jpeg_decoder_origin.json. Ordering these
contributors is current layout work; their exact output offsets remain open.

The source-level decoder is functional under native fixtures; byte matches and
original library closures add193362 dependency code bytes without new authored
C++ credit. All2375 accepted unique extents are ratcheted. The file-span union
is68.540049865%, while exact same-offset equality8.812450308% and API/metadata
closure remain unfinished. No filler, extra root/export, post-link patching or
assembly definition was introduced. Source-private map labels can have wrong
owners; PDB procedure records at the actual VA are authoritative.
Proof/current status: proof/api_raw_checkpoint.json and PROGRESS.md. Earlier
layout notes, including the five resolved source-home issues, are historical.

## Retail file coverage checkpoint; paused

The five source-home moves below remain finished. The latest whole-file ledger
is proof/retail_50_checkpoint.json:55.382328540% address-normalized file spans,
9.461367447% same-file-offset equality. Candidate source/link inputs are unchanged
in this wave; corrected tiny-leaf discovery and library-private PDB identities
close original dependency/data graphs. Archive/member qualification prevents
memcpy.obj and memmove.obj static UnwindUpVec labels from sharing false identity.
All1987 binding rows survive, including the1496 earlier checkpoint rows.
Code553553, initialized data419275 and relocation entries52516 bytes form the
non-overlapping file union. Headers/BSS/unowned padding/authored assembly are
excluded. Exact positions, full ownership/order, API/scene and SHA remain open.
No layout filler, source replacement or post-link byte copying was introduced.

## Five placement exceptions resolved - 2026-10-25

All five known source-home disagreements are resolved, with every one of1481
starting accepted address-extents retained. r_surfbounds's corner transform and
brush culler moved into r_dpvs under local precise math; the light-grid callback
moved into r_image_load_obj; shared quaternion instances now come from com_math.
Retired r_lightgrid_weights.cpp and xanim_matrix.cpp; no replacement split TUs.
The shared xanim header is restored unchanged. The culler's older cell-filter
callee mismatch remains an uncredited code issue, not an owner exception.

The light-grid move required correcting real CRT contributor order. profile.mk
extracts four original members from the pinned VC7.1 LIBCMT and links their
float formats/code pages/matherr/month records in retail order. The entire404
bytes match retail101a5490..101a5623, including the flag before the month table.
No vendor object is edited or credited as authored source. All checker and
assembly-attribution policies are unchanged;31 exclusions/7787 bytes remain.
Original archive/member hashes belong in the final checkpoint receipt.

New native checks cover3072 brush routes and the404-byte CRT block; the existing
512 model corner oracles now enforce both quaternion bindings/owners. Focused
checks pass. The full141-fixture replay passes, followed by fresh build/referee and focused
checks after EOF whitespace cleanup. Six newly matched shared C/C++ helpers add
214 bytes:108160/253580=42.653206089%,646 bodies. Nine original library matches
add1519 dependency bytes separately. All1496 current accepted bindings are frozen
in proof/placement_five_bind.json; preserve them in future waves.
Exact DLL offsets, unclassified helper/constant ownership, data/library ordering
outside this block, API/scene closure and whole-file SHA are still open. These
source settings are matching reconstruction choices, not proof of original
pragma spelling. The earlier exception lists below are historical.

## Retail-position audit - 2026-10-25

Source homes and final DLL addresses are different checkpoints. New image
and world-loader source is being written in its supported retail file homes;
whole-file link order, anonymous constants and data contributions remain open.
Source definitions also contain inherited address-order reversals. Under LTCG,
source line order does not establish final machine-code order; do not promise
fixed offsets or cosmetically resort protected source without a gated trial.

The current map has820 known-owner rows and673 unknown-owner rows (including
library/templates/shared helper copies). Unknown rows are not proof of correct
placement. Five mapped-owner exceptions remain: R_TransformBoundsCorners and
R_CullBrushEntity in r_surfbounds (/Op-sensitive); Image_GetLightGridWeightsForVector
in its separate /Op TU (first-fabs constraint); ConvertQuatToMat and
MatrixTransformVectorQuatTrans in non-/Op xanim_matrix (shared inline ownership).
These are explicit continuing layout work, not a claim that all structure is done.
The old r_model_lod split is already resolved; its earlier DEFER below is history.

Corrected file_layout.py: r_loadworld_new is a modern reference rewrite, not
an original retail TU. Original Mac STABS assigns R_LoadWorldInternal to
PC/gfx_d3d/r_bsp_load_obj.cpp, where the candidate already lives. No code move
is warranted. The correction and all five exceptions are pinned in
proof/retail_position_audit.json. Game compiler inputs and the DLL are unchanged:
C/C++42.568814575%, same-offset9.483404919%, prior139-fixture checkpoint retained.
No rebuild was needed for this mapping/documentation correction. Continue
ownership/flags/data/link work alongside each code wave; whole-file SHA remains
required. Mac1.3 paths support grouping but do not independently prove PC1.0 TUs.

Image recovery,2026-10-25: native C++ bool for TU-private Image_IsCodeImage
keeps the predicate and lookup in r_image.cpp and matches1000cc80/23 plus
1000d140/181. Image_BuildWaterMap stays in its mapped retail owner,
r_image_load_obj.cpp; separate DX9/DX7 calls restore the primary branch shape
but its two dimension loads still differ. No TU/order, globals, flag, root,
SDK or assembly change. The unproductive stored-dimension creator trial was
reverted. All1479 recovered accepted source/library extents survive; the
immutable1448 protected set is unchanged. Same-offset remains diagnostic.

# Layout is part of every reconstruction wave

Sun commands,2026-10-23: population/load/save and the original21-name pointer
table stay with the registered sun dvars in r_sky.cpp. The pointer table is
writable initialized data, as primary101a5a38, not dumped retail bytes. It
adds96 aligned candidate data bytes without filler. Existing rgp/world owns
the96-byte sun at world+160; no second sun allocation or flag/TU change.
Compile checks pin consumed fields and the table length.

Material/cache commands,2026-10-23: material reload/picmip stays beside the
existing hash/registration functions in r_material.cpp. White binding stays in
rb_state.cpp, reusing actual dxState samplers and rgp.whiteImage. Stats/flush
callbacks stay with the sole s_cache allocation in r_staticmodelcache.cpp.
No new image/hash/stats allocation, TU/order, flag or root/export. Callback
source is being restored before installing the complete registration graph.

Hardware startup,2026-10-23: higher device/create/retry stays in r_device.cpp,
calling the existing window, adapter/display, resource and systems owners.
The two primary writes1072dde8/1072ddec are backEnd.sceneViewport.width/height
(base1072da00 +3e8/+3ec), NOT dxState or backEnd.width/height. Static checks pin
the shared viewport and dx window/GPU fields. No new global, TU, flags or root.
ShowWindow is retained through genuine startup, not a dummy import reference.

Material/systems startup,2026-10-23: r_material.cpp owns the40 typed builtin
registration entries and initializes its existing0x299c materialGlobals. The
SDK-side rgp prefix now reaches rawTexdef10e4 with compile assertions matching
the common view; there is still only one actual rgp in r_init.cpp. R_InitSystems
stays in r_init.cpp and resets rg's water count/five fogs plus the existing
normal debugGlobals from r_debug.cpp. Do not use the backend frame debug block
instead. No new state allocations, candidate TU/order changes or flags.

Material loading,2026-10-23: binary fixup and file loading stay in the existing
r_material_load_obj.cpp; registration stays with hash/add/duplicate in
r_material.cpp. Layout assertions pin68-byte Material,12-byte textures,
20-byte constants,32-byte water definitions and68-byte water setups. Shared
image/string/water/technique owners are reused. No new state, TU, root or flag.

Water owner repair,2026-10-23: the setup count/array are rg.sceneWaterMapSetupsCount
and rg.sceneWaterMapSetups, pinned at1028/102c with68-byte stride. r_init.cpp
remains the sole rg allocation. Remove the two incorrect standalone definitions
from r_water_load_obj.cpp; loader and shutdown use the same state startup clears.
The16 original records are preserved on shutdown; only the count resets. Do not
replace removed duplicate storage with padding to keep a section-size metric.

Shader preload wave,2026-10-23: file caching, case-sensitive comparator and
preload remain beside the existing mtlLoadGlob/find/include implementation in
r_material_load_obj.cpp. No second cache or ownership split. Count/table/entry
layout is unchanged and asserted. The original VC7.1 <algorithm> supplies sort
templates; do not count them as authored game source. No TU, SDK, root/export,
compiler flag or new assembly definition. Existing candidate order stays intact.

Image startup wave,2026-10-23: R_InitImages and builtin publication stay in the
existing rgp owner r_init.cpp. They reuse R_SetPicmip, Image_Register,
Image_AllocProg and RB_SetSampler, with no duplicate image/hash/state tables.
The common DxState view is used only for its pinned sampler offset20e4;
the single complete SDK cache allocation remains rb_state.cpp. Compile asserts
pin all newly consumed rgp/rawTexdef fields. No new TU/global/root/flag or final
link-order claim. Whole common/SDK type consolidation is not claimed complete.

Image/light closure wave,2026-10-23: outdoor image storage remains in the real
OutdoorGlob in r_outdoor.cpp; water creators and all ten builtin branches live
with existing procedural helpers in r_image_load_obj.cpp. Image_Register stays
with the real cache/allocator in r_image.cpp. No alternate dispatcher, shader
fallback or duplicate registry. r_light.cpp follows image_load_obj in candidate
tus.txt and owns the actual260-byte light registry (count plus64 pointers).
Shared r_light.h preserves the24-byte definition/8-byte image layout used by
rb_shader_matrices.cpp; the shader's duplicate declaration is removed. No SDK,
TU flags, root/export, authored assembly definitions or padding changes. Initial
whole-file ordering is still candidate, not historical proof. The old rounding
helper is reused only with separate authored-assembly attribution if matched.

Video source wave,2026-10-23: monitor bounds/fallback stays in r_monitor.cpp;
window settings/aspect selection stays with the existing vidConfig owner in
r_init.cpp. No new TU, global, root/export, flags or dependencies. The existing
rounding helper is reused; any accepted containing body is authored-assembly
attribution, not C++ credit. Primary selector table has18 non-code bytes after
190 code bytes. No final link-order/historical-source claim follows this grouping.

Resource source wave,2026-10-23: dynamic VB/IB pool constructors and particle
cloud geometry stay in the existing r_dxbuffers.cpp, using existing dx pools,
virtual skin reservation and BSP static-buffer helpers. No duplicated buffers.
The existing matched SMC_ClearCache is now callable from resource startup;
only its static visibility changes, not its body or s_cache ownership.
R_CreateDeviceResources belongs to candidate r_device.cpp, linking real target,
cache and buffer constructors. Shared r_sun_state.h pins SunFlareDynamic size48,
queries+36/issued+44 in both SDK and common-type views. r_sky.cpp remains its
single global owner. No new TU, root/export, flags or authored assembly. This
ownership is not historical TU provenance or final address placement proof.

The shared static VB allocator now takes void** in the owning BSP source and
both world/particle callers. The two previous handle views (Mac union vs SDK
struct) otherwise produce incompatible C++ linker names. This is one existing
allocator, no alias/wrapper/duplicate. The existing opaque finish interface is
unchanged. Its accepted primary extent must survive the ordinary gates.

Device source wave,2026-10-23: r_device.cpp follows r_window.cpp in candidate
tus.txt, sharing the existing36-byte GfxWindowParms and SDK D3D types. It owns
AA probing, presentation setup and the retrying CreateDevice caller. dx, the
existing r_swapInterval dvar, USER32/KERNEL32 and d3d9 library ownership remain
unchanged. No new data globals, retention exports, flags or SDK replacements.
This groups the actual connected presentation -> AA calls, not historical
TU provenance. Higher device initialization/startup is still missing.

Window source wave,2026-10-23: new r_window.cpp follows r_monitor.cpp in the
candidate TU list. Shared r_window.h pins the36-byte PC parameter record;
R_CreateGameWindow100129c0 owns the actual Win32 creation path and uses the
original USER32/KERNEL32 libraries. It restores real AdjustWindowRectEx use,
not an import-retention dummy. No new export or storage global. Its hardware
caller10012c80 and additional-window caller10012ac0 still need genuine device
creation source; no historical TU or original spelling is claimed here.
Refresh selection and parameter preparation now share that TU and the same
36-byte header. They reuse dx.displayModes and the existing enum/position/AA
dvar owners; no copied display table, duplicate dvar or global window record.

Normal-frame/outdoor wave,2026-10-23: r_rendercmds.cpp owns the real normal
GfxBackEndData as well as the separate debug frame. Primary1042e780 and the
used offsets establish2399596 bytes, commands+219d0c and debug+249d18. No
alignment annotation is inferred from the gap before the next retail global.
R_InitRenderCmds zeroes that84-byte debug block and allocates two2MB index
buffers into the EXISTING tess owner in rb_sky.cpp. rb_tess.h exposes the
second ushort pointer at+5a7b4 without moving material/count fields. The name
secondaryIndices describes pinned element use, not recovered source spelling.
No duplicate buffer globals, initialization fillers or new retention exports.
The startup caller10012fab is pinned; full R_Init source is still missing, so
this initialization chain is not yet reachable from a genuine DLL front door.

OutdoorGlob's64 bytes belong to new r_outdoor.cpp, after r_model_lod.cpp in
candidate tus.txt. Its dimensions are the primary512,512,256 table. Shared
ClearBounds, ExpandBounds and MatrixIdentity44 helpers are reused, not copied.
The /Os trial is rejected; normal flags remain. Candidate grouping/order is
not historical proof. FP instruction matching is explicitly deferred while
startup/API/ownership and whole-file contributor accounting remain open.

Procedural-image wave,2026-10-22: all six new helpers stay in the existing
r_image_load_obj.cpp, beside the real image loading/upload callers. Cubemap
axis descriptors are local, as the primary stack stores establish. No new
TU, export, library or padding. The constructor helpers call existing typed
setup/upload and lookup/pixel helpers. GenCube84/86, specularity117/119 and
direction generator754/786 are not matched; actual Image_Load caller context
still needs recovery. Do not claim historical function order from this draft.

API scene wave,2026-10-22: polygon submission belongs to r_scene.cpp and calls
the existing R_AddDrawSurf there. Effect forwarding belongs to r_rendercmds.cpp;
ri fields165/166 are now named for the actual client imports with unchanged
layout. One real polygon callback joins the interim export list to preserve
its external stack ABI. Candidate now has159 temporary exports, NOT the retail
single GetRefAPI export. This root must be replaced by genuine API-table
reachability, not retained in a release. No new TU/library/data padding added.

Material-pass wave,2026-10-22: stream parsing, DX9 pass setup, both technique
file formats and technique-set/cache source remain in r_material_load_obj.cpp.
The actual34-byte use mask is owned by r_material.cpp directly after its stream
tables. The four-layout declaration builder is beside its real device helper
in that same TU. No additional TU, root/export or library was introduced.
Candidate ownership is evidence-backed grouping, not historical file-order proof.

Shader creation source wave,2026-10-22: candidate r_material_shader.cpp follows
r_material_load_obj.cpp in tus.txt, using real SDK interfaces without importing
the Mac type universe. This split is not claimed as historical TU provenance.
The shader header is shared with r_material.cpp (16 bytes on PC); the include
vtable belongs to r_material_shader.cpp. No padding or root/export was added.
All1257 protected extents survive. The compiler body and include-vtable binding
are still unverified; its parser caller is byte-equal but dependency-blocked.

Authoritative current object order: `../src/tus.txt`. The linker receives those
objects in precisely that order, with `/GL` inputs and `/LTCG` linking. Never
sort the list or regroup TUs as a cosmetic cleanup. The clean-tree migration
preserves it along with roots and per-TU profiles; later gated structural
changes are recorded below. The current order is not claimed to be retail's.

Explicit library order from the existing closed.mk:

    d3d9.lib d3dx9.lib DxErr9.lib user32.lib gdi32.lib advapi32.lib

VC7.1 runtime libraries also come from compiler object directives. The pinned
Summer2004 SDK supplies renderer dependencies; library bytes are not game-source
coverage. No replacement library or SDK version without a full matching check.

Per wave, inspect `current.map` and `current.json`. The latter records section
RVAs, raw offsets/sizes, whole-file hash and raw same-offset equality. That meter
includes headers/data/debug bytes, is NOT source recovery, and is NOT a checksum
match. The build runs it every time rather than postponing layout to the end.

Known current data ownership (these are candidate TU owners, not historical
source-file claims):

| Data | Candidate owner | Target evidence |
| --- | --- | --- |
| rg | gfx_d3d/r_init.cpp | Retail101d4d00; accepted uses and initialization |
| rgp | gfx_d3d/r_init.cpp | Retail101d0b00; accepted uses |
| ri import table | gfx_d3d/r_init.cpp | Retail101d49c8; program-wide bindings |
| dx | gfx_d3d/r_init.cpp | Device-lost101d492c = dx+2d3c; sits between rgp and ri, ri = dx+2dd8 in both |
| dxState | gfx_d3d/rb_state.cpp | Initializer clears0x2170; fields independently pinned |
| image registry/counters | gfx_d3d/r_image.cpp | imageHashTable101cea68; platform counters101d0a74/78 |
| image track/platform labels | gfx_d3d/r_image.cpp | ten pointers101a59fc and two pointers101a5a24; primary strings independently read |
| backEnd | gfx_d3d/rb_state.cpp | Accepted backend cache/constant uses |
| scene | gfx_d3d/r_scene.cpp | Accepted scene-array uses |
| frontEndDataOut | gfx_d3d/r_rendercmds.cpp | Retail101da9c8 |
| backEndData | gfx_d3d/rb_backend.cpp | Retail106d3194; NOT frontEndDataOut |
| sampler filter table | gfx_d3d/rb_state.cpp | Four DWORDs at10190714 |
| viewport policies | gfx_d3d/rb_state.cpp | Thirteen values at1019087c; caller still pending |
| model box endpoints | gfx_d3d/r_model_bounds.cpp | 288 bytes at10190278; model debug bodies still pending |
| debug box edge pairs | gfx_d3d/r_debug.cpp | 96 bytes at101924c8; complete240-byte consumer accepted |
| code sampler hierarchy | gfx_d3d/r_material_load_obj.cpp via r_material_state_tables.h | 29 rows at1018eb58/eb80/ec0c/ec38; independently checked names, sources, child bindings and strides |
| shader string identifiers | gfx_d3d/r_material.cpp, materialGlobals | count101da45c and64 pointers101da460; folded hash but case-sensitive identity |
| constant source hierarchy and aliases | gfx_d3d/r_material_load_obj.cpp via r_material_state_tables.h | 93 hierarchy rows at1018eed0..1018f61b;22 default rows at1018f620 |
| sampler aliases | gfx_d3d/r_material_load_obj.cpp via r_material_state_tables.h |15 rows at1018eda0; separate from the code-source root |
| DX7 texture operators | gfx_d3d/r_material_load_obj.cpp |21 rows/336 bytes at10190100, compact operators1,3..22; not SDK enum values |
| DX7 pass options | gfx_d3d/r_material_load_obj.cpp |5 rows/40 bytes at10190250; offsets4..8, original TU ownership unconfirmed |
| four-view sun state | gfx_d3d/r_sky.cpp | 10764590, four48-byte records; accepted158-byte reset, untouched query/visibility fields retained |
| light-visibility log pointer/count | gfx_d3d/rb_light_derive.cpp | 10764578/7c; accepted filename helper78, load/save callers remain drafts |

All23 state-name tables start8-byte aligned in the primary binary. The first
array now requests that alignment; this removes a4-byte inferred-table overrun
after the56-byte blend-op table when the real constant hierarchy is included.
No historical claim is made for the original alignment spelling.

Shared quaternion helper: the actual xanim_matrix.cpp wrapper provides the
non-/Op ConvertQuatToMat instance. Do not create new ABI wrappers or consolidate
static helper instances blindly; match the target's actual copies and callees.
Gamma uses the shared512-byte GfxGammaRamp type in r_init.cpp and rb_backend.cpp.
The uploader's1536-byte D3DGAMMARAMP is stack-local; no gamma global was added.
Existing cubeShotGlob retains its six face pointers in r_screenshot.cpp; save
does not clear them after freeing. Candidate ownership is not historical proof.

Debug frame is owned by r_rendercmds.cpp: saved command/data pointers at+0/+4,
restore-lock byte+8, embedded GfxBackEndData+12, its commands+219d0c. These used
offsets are PINNED; the full historical allocation extent is not independently
proved. The LOD camera at10696a68 belongs to the r_scene.cpp candidate, supported
by the accepted view helper and primary callback references. No final TU/order
claim follows. Its private output-first helper signature is a matching candidate,
not recovered historical source spelling.

Anonymous float-pool ownership and full .rdata/.data contributor order remain
unrecovered. Mark them unknown; never invent a TU owner to move a meter.

FresnelTerm's candidate owner is the existing r_utils.cpp (Mac source path
agrees). Its PC extent is1002c370..1002c438. Source is still under matching;
the explicit retention root is temporary until a genuine caller is present.
It adds no TU or global data. Existing object order is unchanged.

The bounds API callback10020cd0 and internal worker10023d40 both belong to the
current r_scene.cpp candidate. Only the API callback is now a retention root;
its real out-of-line call retains the worker. No TU or data contributor was
added. Acceptance still depends on the unresolved model-debug callee chain.

The accepted polygon append stays in existing r_debug.cpp. Its complete
retail extent is10005440..10005504, with no new TU, global data or artificial
export. The real portal-traversal caller1000a020 is still missing. The119-byte
shared line writer is now owned by this same debug TU, with model forward
declaration/callers updated and no duplicate body. Box/string/scaled-string
bodies also live here; no extra object or library was added.

Matched primary-body ranges show the original work-tree order was not retail order:
r_bsp bodies start10001230, r_debug10005820, r_image1000c910,
r_material100165c0 and r_material_load10018250. The earlier tus.txt started
with material_load/staticmodel_load. This is evidence for a bounded structural
link-order trial, NOT proof of the complete original order. Helpers and cold
splits interleave ranges; do not sort objects mechanically or ship a hypothesis.

Every ownership/order/compiler-profile change must retain all baseline bindings
and be measured with the current map. Exact final placement needs the remaining
code/data first, but structure and evidence are maintained now.

## 2026-10-21 bounded order audit

Moving r_bsp.cpp alone to the first object position retains all817 protected
extents (session43220), without new game-code credit. Its world queries bind
at10001230..100017ab; the preceding buffer uploader is10001050..10001227.
This candidate step is retained. It does not establish the missing prefix's
complete source/helper ownership or the final historical link order.

Moving material_load immediately after material in isolation still fails
two protected CRT extents: _cvtdate100fc71e/440 (data attribution) and its
__isindst_lk100fc8d6/391 caller. Session67761 is rejected. The material object's
earlier position is restored until its data/library interactions are resolved.
Do not repeat the earlier combined material/staticmodel reorder as a new idea.

Do not sort files by their lowest accepted target address: com_convexhull's
Vector2Copy copy binds at10001000 while its actual hull routines occur near
10057a10. Several other shared vector copies likewise precede their owning
callers. Classify helper copies separately from each file's main body range.
The retained map plus the unchanged binder supplies that ownership evidence;
the binary alone does not prove historical source-file boundaries.

### JPEG encoder and command ownership - 2026-10-23

r_jpeg.cpp owns hackSize and real memory-destination callbacks. r_screenshot_capture.cpp
owns the one shared JPEG/TGA lastScreenShotNumber. r_init.cpp registers nine actual
command callbacks through the existing RI. jpeg-6b supplies22 encoder C TUs after
the engine units in tus.txt; candidate order, not historical proof. The supplied
Windows boolean ABI and target-backed allocator/error additions are shared through
one IJG header set. profile.mk compiles codec C directly with /O2 /GL /MT /TC and
NO_GETENV; this is a tested configuration, not proof of original command lines.
Library credit is separate even for IJG addresses inside the legacy game interval.
No dummy callbacks, duplicate globals, filler or new export roots.

### Common backend ABI - 2026-10-23

The live common PC type now has exactly twelve 16-byte-aligned GfxCodeMatrix
entries per0xcd0-byte GfxCodeMatrices frame. The SDK and common views refer
to the SAME backend allocation; no alias storage. gfx.h asserts stack4e0,
level2b50, debugFont36b58 and complete size36b60 in every common-view TU.
The old OGL field is absent from the live cod2_defs.h; common_types.h's inactive
historical copy is not a compiler input. Original MSVC needs explicit alignment
on this type because COD2_ALIGNED is empty on its platform branch. The six
layout assertions pass with original MSVC and all1428 accepted extents survive.

### Tessellated surface setup - 2026-10-23

rb_sky.cpp remains the sole tess allocation. rb_tess.h now models the primary
field span through5a7e8 (firstOptimizedVertex), size5a7ec, retaining the existing
opaque vertex storage. optimizedVertexSource replaces the prior four-byte pad;
all older offsets stay fixed. New rb_shade.cpp owns genuine RB_BeginSurface and
its35-entry stack-local diagnostic-name helper. Candidate TU order follows
rb_shade_lights.cpp; historical grouping/order remains unproved. Logging reuses
the existing r_logFile, va and RB_LogPrint. No new export root or duplicate state.
Both functions match retail304+153 bytes and all1428 older extents survive.

### Dynamic-buffer upload ownership - 2026-10-23

Candidate rb_buffer_upload.cpp uses the same dx dynamicIndexBufferPool / current
index slot and dynamicVertexBuffer set by existing R_CreateDynamicBuffers. There
are no new buffers, counters, stream caches or allocator globals. The SDK-view
TU is candidate organization, not proof of the historical file boundary. Original
MSVC asserts both state records12 bytes and dx offsets2d80/2d8c/2db4. RI fatal
callback is+54 from the pinned101d49c8 import base. Existing RB_ChangeIndices and
RB_ChangeStreamSource own cache publication; existing log helpers own logging.

### Light-grid lookup helpers - 2026-10-23

Candidate rb_light_grid.cpp uses existing GfxLightGrid/Point/Colors definitions:
16/8/24 bytes, point flags+4 and color index+6. Existing rgp.world and
r_showMissingLightGrid control fallback; no extra owners or lookup buffers.
Five genuine helpers precede future interpolation/trace closures in this TU.
Candidate grouping follows rb_light_derive.cpp, not a historical-order claim.

### Light-grid visibility and history - 2026-10-23

Seven more helpers in rb_light_grid.cpp use the existing six-byte history record
allocation/count from rb_light_derive.cpp. No new log/cache/global state. Existing
backEndData.debugGlobals at249d18 owns debug lines; universal/q_shared.cpp owns
the shared colors. Existing RI.CM_BoxSightTrace at168 supplies actual collision
queries, with existing Vec3Normalize. The sample-box helper directly calls
AddDebugBox as primary does; it is not a generic-point-box wrapper. The query
reloads grid.points after visibility before returning a point. Candidate grouping
is not proof of historical TU ownership. No new roots, flags or authored assembly.

### Connected interpolation/lighting/draw callers - 2026-10-23

rb_light_grid.cpp consumes the existing world lightGrid+11c and backend viewCount
+3b4, with compile-time entity origin3c/lighting104-byte pins. No new world/entity
state. Existing I_fround is reused in currently unaccepted interpolation; audit
its containing body for assembly accounting if it becomes byte-accepted.
rb_shade.cpp owns actual SetupLighting and DrawTechnique callers. The genuine
DX7 renormalization override is one typed16-byte const instance [-1,-1,40000000,0]
pinned at primary10190690; candidate location/order is not historical proof.
Constants and cached entity lighting remain in the sole shared backEnd. These
callers reuse existing hardware lights, pass setup, viewport and iterator fog.

### Surface/calibration/font/startup closure - 2026-10-23

GfxDrawPrimArgs has one shared20-byte definition in rb_drawargs.h; device/pass
TUs no longer duplicate it. rb_surface.cpp owns actual ordinary/optimized drivers
and EndSurface, using read-only views of existing Material techniqueSet38,
technique.flags4, rgp.world109c and world.vertexBuffer30. These views allocate no
state. Actual tess remains owned in rb_sky.cpp and DX buffers/caches keep their
existing owners. Candidate surface/2D TU placement after buffer upload is not
historical file/order proof. rb_2d.cpp owns2D/quad/overflow and calibration using
existing identityMatrix44, colors, sun queries and rgp.whiteMaterial1038.

r_font.cpp retains the ONE registeredFontCount and16-entry registry for both
duplication and new registration. Its16-byte disk header expands to20-byte
runtime Font_s without a second font store; glyphs are24 bytes. R_Init in
r_init.cpp uses existing rg/rgp/backend/dx, font/sine/FFT/DObj and calibration.
Primary rg base101d4d00 pins trig2510 and bitswap2d10; dx.sunSpriteSamples2c2c.
No added root exports, new mutable globals, artificial layout fillers or assembly.
The actual startup sequence now links through source, while GetRefAPI and
remaining callback closures still need reconstruction and exact code/layout proof.

R_BeginRegistration also lives in r_init.cpp and publishes the existing44-byte
vidConfig after unconditional R_Init. No new storage/root/export; genuine API
slot1 reachability remains open until GetRefAPI is restored.

### Shutdown ownership - 2026-10-23

r_material_globals.h shares the existing299c-byte MaterialGlobals schema;
r_material.cpp remains its sole allocator. R_Shutdown clears that entire owner,
rg's material hash and rgp's count rather than fabricating replacement tables.
Font/light counts stay private to their original files; normal-frame debug
cleanup stays beside the sole s_backEndData in r_rendercmds.cpp.

r_image.cpp retains program images in the existing allocation and rehashes the
survivors; no allocation/free ownership is invented. r_rendertarget.cpp releases
13 records before clearing them and only zeros the cached depth alias. Buffer
and device cleanup reuse dx pools, skin reservation and shared sun query state.
r_device.cpp owns the existing SDK-facing device helpers; this split is candidate
organization, not proof of original TU boundaries or final link order. Genuine
IsWindow now completes the named import set; layout/hints/order still differ.

Console API59 slots78/79 now have genuine source in the existing r_font.cpp.
Both helpers use stack scratch only, the original font/glyph schema, existing
Material_Register(name,7), the sole rgp.defaultMaterial and RI slot168 name
lookup. No second font registry or interface table is allocated. The legacy
Mac refexport_t in PC/universal/com_math.h omits PC callback fields and has
wrong prototypes such as no-argument Shutdown; do not adopt it unchanged for
the actual108-slot API59 entrypoint.

Frame start/API59 slot47 now lives with the existing command/frontend state in
r_rendercmds.cpp. It reuses original light-flag clearing, world.sun160, gpuSync,
float-Z target6.colorSurface, client flush RI+12c and LOD setter RI+184. Dvar
reset is pinned at10h; live values are reloaded after callbacks. Internal21db0/
21e50 helper names describe roles; original names are unconfirmed.

r_material.cpp owns sorting of the existing rgp.sortedMaterials table. Byte13
is now named sortKey in the unchanged68-byte Material view. TechniqueSet remains
140 bytes; comparison subtracts typed pointers, not raw address ordering. Original
VC7.1 std::sort is reused; ten matched library bodies remain dependency credit.
No new mutable storage or TU/order claim is introduced by this wave.

Device recovery now shares r_permanent.h with material/state code. The SDK-side
MaterialTextureDef and full10f0-byte permanent view have one declaration; the
common allocation remains r_init.cpp. The former image gap and head-only state
view are replaced by fields matching the common schema; white/default/world/
raw offsets1008/102c/109c/10e4 and total size are asserted. No second rgp exists.

r_device.cpp owns actual Reset13690/Recover137f0 using existing release/create,
world/model and material helpers. Material_ReleaseVertexDecls becomes shared
without clearing its routing/count; Material_ReleaseAll would destroy rebuild
inputs. r_image.cpp owns dynamic water rebuild and retained-image filtering.
No original TU-boundary or final placement claim follows from this organization.

### Backend command records and frame presentation - 2026-10-24

The six recovered control/state handlers and RB_EndFrame remain in the existing
rb_backend.cpp, preserving the known backend compiler context. New handlers use
the private linkage supported by the Mac source. No separate TU or fabricated
partial command table remains. The actual table has33 non-null entries; only
seven handler bodies currently exist here. Its completion/reachability is open.

rb_commands.h shares the prior header/clear/execution records unchanged and adds
the primary-pinned8/20-byte state-command records. The backend's partial tess
definition is removed in favor of rb_tess.h, preserving all prior used offsets
and the sole r_sky.cpp allocation. Existing executable/assembly text is unchanged;
source accounting keeps the same31 exclusions/7787 bytes after pin re-review.
Gamma presentation reuses R_SetColorMappings; no second ramp/global is owned here.

Four additional private2D handlers remain in rb_backend.cpp, sharing44/48/44/28-
byte records in rb_commands.h. No TU, root, allocation or link-order change.
There are now11 of33 handler source bodies; the actual table is still absent.
Existing FastSinCos is reused by rotation; containing future V2 bodies require
assembly attribution. No new assembly is authored or accepted in this wave.

The next four private command bodies (light/stencil/shadow/clip) stay in the
same backend TU. Shared records are76/8/72 bytes and variable plane tail at8.
Existing light[2], DxState cache and shared shadow matrices retain sole owners.
PC shadow command invalidates stack zero even at a nonzero active stack level;
clip commands do not flush surfaces. No TU/order or state allocation change.

Backend begin-view uses a48-byte shared packet with existing16-byte scene and
20-byte LOD records, unchanged backend state ownership. RB_Set3D uses existing
matrix-stack/global state and existing rb_state.cpp invalidation and matrix
installation helpers; no duplicate implementation or allocation is added.
The scene/LOD byte views remain an explicitly incomplete type recovery task.

### Typed frame records and image residency - 2026-10-24

r_scene_records.h owns the SDK16-byte GfxSceneDef and20-byte GfxLodParms views,
matching the existing common schema. BackEnd and BeginView share typed records;
shader objective time reads the named floatTime field. Ownership/storage and all
PC offsets remain unchanged. Field names agree with common/Mac; original lost
header wording is not claimed. This replaces the earlier scene/LOD opaque views.

r_image_registry.h owns the sole ImageList schema (0x2004 on PC) shared by
r_image.cpp and the new rb_imagetouch.cpp. Registry allocation/iteration remains
in r_image.cpp; no second image table or feedback field is allocated. The new
TU uses r_permanent.h's existing feedbackReplaceMaterial10a8 and backend's sole
currentFeedbackImage2b5c. Candidate TU order places it after rb_backend.cpp,
without claiming original final placement. New command33 remains private until
the actual complete table is restored; no fake marker array/export is added.

Raw-frame command17 and its surface helper remain in rb_backend.cpp. The32-byte
packet is shared in rb_commands.h; target system supplies its pixel pointer.
PC uses one temporary IDirect3DSurface9, stack D3DLOCKED_RECT/RECT and existing
DxGlobals device/target. No engine globals, image registry entry, texture object,
TU, root or export is added. Command reachability awaits the genuine full table.

### Frontend/API command types - 2026-10-24

r_rendercmds.cpp now uses the existing common GfxCmdClearScreen, SetViewport and
DrawSurfs schemas. RcCmdBlendSavedScreen is the actual12-byte fade packet;
its unused trailing word is preserved. Pointer/count/technique/order inputs
replace opaque integers in DrawSurfs. Clear uses raw4-byte float copies so its
118-byte protected body stays exact; one16-byte color copy was rejected.

Correct public roles:22220 R_AddCmdClearScreen,21bf0 R_AddCmdSetViewport,
222f0 R_AddCmdBlendSavedScreen. Primary client re=60f080 and108-word copy pins
slots55/56/54. Function names agree with semantic reference roles, without a
claim about lost source spelling. The three API inventory symbol rows are
refreshed; old UNVERIFIED legacy labels remain explicitly historical.

The duplicate unmatched typed clear and false no-argument RenderScene null-jump
are removed, reducing temporary roots/exports159->157. Real RenderScene257a0
remains missing. No actual API body is substituted by the old draft, and no
retail table is partially advertised. No TU or state/data owner changes.

### Screen commands - 2026-10-24

rb_backend.cpp reuses the sole r_permanent.h definition for savedScreenTime10e0,
shadowCookieBlurMaterial1054 and shellShockMaterial10d0. Targets7/5 and the live
DxState source surface remain owned by existing device/image state. Copy captures
one Image_GetSurface reference and releases it on the original retry path.
No new mutable state, allocation or TU/order change is introduced.

Shared GfxCmdBlendSavedScreen is12 bytes, fade at4 and an untouched trailing word,
matching the common frontend writer's packet. Copy/pass helpers and handlers
10/28/29 remain private in backend pending the genuine complete command table.
Blend calls the existing biased I_fround; no authored assembly definition changes,
and future containing-body matches must retain separate assembly accounting.

### Geometry command records - 2026-10-24

rb_commands.h now owns PC stencil16-byte prefix, triangle16-byte prefix and the
16-byte GfxPointVertex (XYZ plus four color bytes). Point/line records have signed
short counts/size at4/6 and vertex tails at8. These latter layouts do not count
as implemented handlers. Triangle packed arrays start at16 with40 bytes per
vertex across five separate arrays; indices are u16 after the UV array.

Stencil command7 and triangle command32/helper stay private in rb_backend.cpp.
They reuse sole tess storage, r_permanent.stencilPlaneMaterial, existing Begin/
EndSurface, RB_TessOverflow and 4D/lit vertex writers. No new allocation or TU is
introduced. No partial dispatch table is created to force code retention.

Point commands,2026-10-24: both projection paths and command30 stay in the
existing rb_backend.cpp with genuine shared packets. The existing r_init rgp
allocation supplies whiteMaterial1038/pointMaterial1040; rb_state owns matrix
changes and r_sky owns tess. No TU/order/flag/global/root/export change. Real
command-table reachability remains pending; do not retain these private bodies
through artificial exports or count source restoration as a new byte match.

Line commands,2026-10-24: XYZ writer,2D helper, public3D/debug helper and command31
stay in rb_backend.cpp. Public3D is justified by five primary debug call sites,
not by an extra export. Shared packet/color and sole tess/rgp owners are reused.
Material-state view reads the existing object's words2c/30; it allocates nothing.
No new TU/order/flag/root/export. Actual command table and debug caller source
still determine final retention; this wave does not certify their closure.

Early post-effects,2026-10-24: private command25 remains beside actual screen
copy in rb_backend.cpp. Existing backEnd.resolvedPostSunTarget+2b54, dx target1
and hasSeparateAlphaBlend+2d7d retain their owners; no new allocation, header,
TU/order/flag/root/export. Whole command/API graph is still incomplete.

API candidate ownership,2026-10-24: api_callbacks.tsv now records the actual
source TU for all54 byte-and-binding-accepted callback slots. Each owner is
resolved through the fresh bind object's unique src/tus.txt entry and an existing
source file. UNVERIFIED entries do not claim missing source; UNUSED_ZERO marks
the ten unwritten slots. This pins
current candidate ownership, NOT the original historical TU grouping/order or
completion of the108-slot API59 implementation. Existing raw addresses, legacy
UNVERIFIED labels and accepted symbols remain unchanged.

API dependency frontier,2026-10-24: six additional current candidates have exact
body matches but rejected callee bindings. api_callbacks.tsv records their real
symbols/TUs and exact current referee reasons separately from the54 accepted
owners.38 other callback sources remain unclassified, not asserted missing.
This is current candidate/call-edge evidence, not original TU grouping proof.

## Retail file layout checkpoint - 2026-10-24

This is the structure Codex fills with source. Put new code INTO these files;
do not add, split or reorder TUs without updating this section.

Tools: `python3 work/tools/file_layout.py <build>` writes layout/file_layout.tsv,
one row per linked function: retail address (bind > unique byte hit > PINNED
comment), Mac 1.3 file (refrences/cod2-mp-macho/PC, the source-path oracle)
and the retail file it belongs to. Use it to pick the file for new code.

### Link order (src/tus.txt)

Observed body groups broadly follow source path order: gfx_d3d/r_*, gfx_d3d/rb_*,
jpeg-6b/*, universal/*, then d3dx9, DxErr9, LIBCMT. tus.txt follows this candidate
sequence; this is not proof of the final original link order.

- OBSERVED: TU slots come from the median address of accepted bodies
  (proof/image_residency_warm_bind.json, bodies >= 48 B).
- GUESSED (alphabetical slot, no accepted body yet): r_dpvs_winding, r_flares,
  r_light, r_screenshot_capture, r_skin_transform,
  r_staticmodel_bounds, r_water, r_xsurface_optimize, rb_2d,
  rb_buffer_upload, rb_sunsprite, rb_surface, com_plane,
  fft, xanim_matrix.
- RESOLVED: light-grid weights now live in r_image_load_obj with a local
  precise region. This preserves the9 shared fabs matches without a late TU.
  The original intrncvt/mbctype/matherr/days data order is explicit in profile.mk;
  its404-byte block is retail-identical and retains the time-function bindings.
- RESOLVED: quaternion header instances now come from com_math, parsed without
  /Op before enabling precise math for its main definitions. No xanim_matrix TU.
- Conflicts kept as listed: rb_surface's RB_DrawTessSurface is at 1003a7b0
  (before rb_sky); common.cpp's bodies sit after q_shared (10061c80).

### Files merged into their retail file (2026-10-24)

| Retail file | Now contains (former candidate TUs) |
| --- | --- |
| rb_light.cpp | rb_light_grid, rb_light_derive |
| rb_state.cpp | rb_viewport |
| r_dpvs.cpp | r_dpvs_clipplanes, r_dpvs_occluders |
| com_math.cpp | com_rotate, axis_transform |
| rb_shade.cpp | rb_shade_lights, rb_shader_matrices (r_matrix_scale dropped: duplicate of RB_ScaleCodeMatrix at 10038c60) |
| r_material_load_obj.cpp | r_material_shader (real ID3DXConstantTable, no SDK shim) |
| rb_imagefilter.cpp | renamed from rb_filter_generate |
| r_shadowcookie.cpp | renamed from r_shadowcookie_candidates |
| r_init.cpp | r_fatal_init, r_device, r_caps_device, r_monitor, r_window, r_display_modes |
| r_model.cpp | r_model_bounds, r_skin_rigid |
| r_screenshot.cpp | r_screenshot_capture |
| rb_backend.cpp | rb_2d (RB_Set2D, RB_TessOverflow, RB_DrawStretchPic) |
| rb_sky.cpp | rb_2d RB_CalcSunSpriteSamples |

Fixtures that tested a former file read it with tests/fragment.py, which
slices the host by the section comment kept above each former file's code
(layout/fragments.json). Keep those comments when editing.

### One type view

A file can now hold both r_local.h code (real d3d9.h) and gfx.h code (Mac
types): include r_local.h first, then gfx.h. gfx.h then pulls in the PC
headers and defines COD2_SDK_TYPES, which skips every Mac declaration those
headers already own. The guards in src/opencod2/headers are generated by
tools/sdk_guard.py from `cl /EP` of r_local.h + the PC header list in gfx.h;
rerun it on pristine headers (git checkout) whenever that list changes.
TUs that include only gfx.h see the headers unchanged.

### File placement checkpoint - 2026-10-24 (Codex)

All handoff moves and the later-confirmed bounds move pass the original
build, both referees, all1448 protected extents and the final139-fixture
suite. No move was reverted. Placement alone held C++104380 bytes; the
subsequent vec3/hex leaves raise it to104687/253580=41.283618582%,620 bodies.
Final same-offset9.185953056% is diagnostic. The starting runner had135
fixtures, not the handoff's139. Cache allocation and three load-chain
fixtures raise it to139; ten negatives protect the accepted leaves.

| Retail file | Moved source | Result or remaining blocker |
| --- | --- | --- |
| r_init.cpp | 5 r_dxbuffers initialization/release bodies | gated |
| rb_shade.cpp | 2 rb_buffer_upload functions | gated |
| r_buffers.cpp | 3 r_bsp_load_obj helpers, index unlock and index free | gated |
| r_cmds.cpp | registration and unregistration from r_init | gated |
| r_staticmodelcache.cpp | R_CreateSmodelCacheVertexBuffer1002b920 | gated; placement support below |
| r_staticmodel_load_obj.cpp | bounds1002a360 from isolated research TU | gated; same flags and ABI |
| r_dpvs.cpp | both winding extrema, now C++ | gated; C TU and /TC rule removed |
| r_model.cpp | r_model_lod | merged in the earlier Claude wave |
| r_image_load_obj.cpp | r_lightgrid_weights | merged with local precise math and original CRT contributor order |

r_local.h and gfx.h can coexist through the generated SDK guards; the earlier
blocked material, initialization, screenshot and shading merges are done.
Candidate file placement is not proof of original PC TU boundaries. Other
unclassified/scattered bodies remain in file_layout.tsv for future evidence
work; do not move shared inline helpers by address alone. Retail files with
no compiled candidate yet include r_model_load_obj, r_staticmodel, rb_debug and
rb_tess. r_font_load_obj, r_light_load_obj and r_sky_load_obj now have TU slots.
r_loadworld_new is a modern reference rewrite, not an original source file.

### Flags (src/profile.mk, plus the /Op column in tus.txt for universal)

/Op: r_surfbounds and r_shadowcookie (profile.mk), com_plane (tus.txt).
com_math parses headers without /Op, then enables precise math locally for its
definitions and disables it for the existing anim wrapper. The two DPVS brush
helpers and light-grid callback use local precise regions. Winding helpers
compile in r_dpvs.cpp. The global quaternion header is unchanged.
jpeg-6b: /O2 /GL /MT /TC /DNO_GETENV. Moving the universal /Op flags into
profile.mk was tried and backed out with the order bisect; it is equivalent
but untested alone. Libraries: d3d9 d3dx9 DxErr9 user32 gdi32 advapi32
(+ LIBCMT, dxguid, uuid by directive), Summer 2004 SDK.

### Shared globals - one definition each (checked 2026-10-24)

ri, rg, rgp, vidConfig, dx: r_init.cpp. dxState, backEnd:
rb_state.cpp. tess: rb_sky.cpp. scene: r_scene.cpp. sunFlareState[4]:
r_sky.cpp. frontEndDataOut: r_rendercmds.cpp. backEndData: rb_backend.cpp.

### Whole-file contributors (retail vs candidate, current.json)

| Contributor | Retail | Candidate | Open |
| --- | --- | --- | --- |
| Entry | __DllMainCRTStartup (LIBCMT dllcrt0) rva f774e | same symbol | moves when .text fills |
| Exports | GetRefAPI only, rva 13270 | 157 temporary roots | real GetRefAPI + table, then empty roots.txt |
| API table | 108 slots, 98 callbacks | 54 accepted | 44 unclassified; 6 open edges (ATTEMPTS.md) |
| Imports | 6 DLLs, 120 names | same name set | IAT/thunk order not compared |
| .text | 1089680 | ~955.9K | ~134 KB code missing |
| .rdata | 595105 | ~602.8K | temp-export .edata; pool order unknown |
| .data (+bss) | 6086100 | 6084628 | 1472 B; anonymous pool owners unknown |
| .reloc | 95704 | 88404 | follows missing code |
| CodeView | 74 B record | 71 B | PDB path/GUID/age; never patched |
| JPEG | gaps after jcsample (10049500..10051f90), jfdctint..jmemmgr, jmemnobs..jutils | encoder only | SUPPORTED: Mac tree has jd*, jidct*, jquant* which sort exactly there; verify bodies before adding |
| d3dx9 / DxErr9 / LIBCMT | after universal | SDK/CRT libs | library members, not authored credit |

## Source evidence classes - 2026-10-24

`python3 tools/evidence.py <build>` (after file_layout.py) writes
`layout/evidence.tsv`, one row per linked function:

| Class | Count | Meaning |
|---|---|---|
| accepted | 730 | byte + binding referee placed it at its retail address |
| draft-addressed | 267 | compiles, cites a retail function start, not yet bound |
| draft-mac-name | 89 | name found in the Mac 1.3 tree, no retail address yet |
| library-compiler | 114 | VC7.1 `std::` sort/heap instantiations and CRT float overloads |
| library-jpeg | 160 | upstream IJG 6b (jpeg-6b/COD2.md), a dependency |
| unverified | 93 | no retail address and no Mac name |

The coverage meter (tools/source_coverage.py) counts only bound bodies in the
game ranges, minus `std::` and dependency objects, so library code and drafts
add nothing to the 41.1%. Addresses in layout/current.map are OUR build, never
evidence.

Unverified rows are of two kinds. Header inlines (FloatAsInt, I_fabs, I_sqrt,
I_fclamp, SinCos, Vec2Length, Vec4LengthSq, VectorLength) are real helpers
that retail inlines; our out-of-line copies have no retail body. The rest
(Dx7 material pass loaders, R_SkinXSurface*/R_TransformRigidVertex*,
R_Cubemap*, R_EnumerateDisplayModes, occluder/portal helpers in r_dpvs,
Swap_Init*, Little*/Big* swappers, R_DumpSceneEntities, RB_SunSprite*, etc.)
have names from CoD4 refs (KisakCOD) or no source at all. Some sit under
a section comment that pins an address range (r_model rigid skinning
1001e260/1001e3a0/1001ed70/1001ee00); evidence.py only reads the comment
directly above a body, so move such addresses onto the body when you touch it. Before building on any of them,
find its retail address (glm/data/decomp start) and cite it above the body,
or leave it out of new work. Do not delete them in bulk: adding or removing
bodies re-rolls LTCG placement of accepted code; each removal needs a gated build.

### Cache-buffer owner correction

SUPPORTED: R_CreateSmodelCacheVertexBuffer1002b920 is between the PC cached
skinning chain and SMC_ClearCache1002b9a0, not the r_buffers interval at
10004f40..10005143. It now lives in r_staticmodelcache, using its existing
Mac-type COM view and the primary CreateVertexBuffer slot/flags/log string.
The handoff's instruction to put both remaining r_dxbuffers helpers in
r_buffers was inconsistent with these addresses. Historical TU ownership
of this unnamed PC-only helper is still unconfirmed; this is candidate
placement, not original-source proof. Both referees, all1448 extents and 136/136 fixtures pass.

### Static-model bounds owner

PINNED: retail caller1002a9c0 calls bounds1002a360..1002a518, immediately
before the static-model lighting family. The old r_staticmodel_bounds TU
used the same flags as r_staticmodel_load_obj (its /Op comment was stale).
The helper is now in the load file before lighting scale1002a520; its name
remains descriptive. No ABI/type/flag/root change. Both referees, all1448 extents and139 fixtures pass.

Retail-file moves,2026-10-24: R_FatalBufferLockError -> r_init; R_RegisterBuiltinImages,
R_InitImages, R_LoadWaterSetup -> r_image; R_HashAssetName, R_ValidXModelName -> r_utils;
R_AbortRenderCommands -> r_rendercmds; R_GetFrameBufferExtent (+ its desktop helper) ->
r_rendertarget; Image_BuildWaterMap -> r_image_load_obj; XModelUnoptimize ->
r_xsurface_optimize; RB_Change{Vertex,Pixel}ShaderConstants -> rb_shade. Dead duplicate
corner helpers removed from rb_backend (rb_light owns 10036720/100367b0). No flag/TU change.

New retail files,2026-10-24: r_light_load_obj (R_LoadLightImage, R_LoadLightDef), r_sky_load_obj
(R_LoadSunThroughDvars; sunDvarNames stays in r_sky as in Mac), r_font_load_obj (R_LoadFont),
qcommon/common (Com_Printf, Com_Error), win32/win_threads (Sys_GetValue). R_Error and dx -> r_init,
R_SyncRenderThread -> r_rendercmds. gfx_d3d/common.cpp keeps only I_strlen (home unknown).
qcommon/win32 use the renderer flags via a static pattern rule in profile.mk; they include
../gfx_d3d/r_local.h because src/opencod2/gfx_d3d shadows gfx_d3d/ on the include path.
- 2026-10-24: Image_GetSunHalfAngleForVector moved to r_image_load_obj; its local GfxImageFileHeader
  copy was dropped for the common one (tag char vs byte, equality-only). DEFERRED:
  R_TransformBoundsCorners/R_CullBrushEntity -> r_dpvs loses 0x100088c0 (needs
  /Op); Image_GetSunHalfAngleForVector -> r_image_load_obj needs gfx.h there, which clashes with the
  file's own GfxImageFileHeader (tag byte vs char). Both wait for type/flag consolidation.
- 2026-10-24: file_layout.py reads Mac names only from gfx_d3d/universal/qcommon/win32; the
  Mac binary is the whole game, so header inlines were credited to game_mp/g_missile_mp.
  AxisCopy now uses the com_math body (gfx.h inline dropped), R_TransformCachedVector lives
  in com_math, r_model_lod merged into r_model (its /Op line removed). No extent lost.
- DEFERRED: ConvertQuatToMat/MatrixTransformVectorQuatTrans are xanim_public.h inlines whose
  retail copy is the non-/Op form; Image_GetLightGridWeightsForVector costs 9 extents (above).

Sprite dispatch dependency batch,2026-11-01: stamps, material atlas/projection,
sprite and oriented quad remain in the existing rb_tess.cpp slot. They write the
sole rb_sky tess, read the existing rb_state backEnd and reuse the real com_math
MakeNormalVectors. No new allocation, shared helper copy, TU/order, root/export
or compiler setting. Complete table retention waits for remaining real entity
handlers; do not add dummy entries or extra ABI roots to force these matches.

November1 step3 continuation: line/rail/cylinder/entity primitives stay in the
existing rb_tess.cpp slot. Complete eight-pointer rb_tessTable and genuine
sprite-command caller stay in rb_backend.cpp, their supported original owner.
The shared r_entity.h and r_tess_dispatch.h add types/declarations only; no new
TU/order, shared-state copies, roots/exports or compiler flags. SDK sprite packet
uses the existing PC header guard convention. Table linked in the first original
build at candidate10182e94; exact offset is not historical layout proof.

November1 continuation: draw-surface loop/material-time helper and sun command
handlers stay in rb_backend.cpp. Sun geometry/query/sprite/flare/effects stay
in rb_sky.cpp. Existing rb_sunsprite.cpp owns the screen-fraction helper. Shared
backend lighting[2046] replaces the exact33f30-byte opaque field at2be8; no
allocation or offsets changed. SDK viewParms now includes real nearclip at148.
No TU/order/flags/root/export changes.19 source routines added, no new byte
credit. See proof/nov01_drawsurfs_sun_checkpoint.json for current evidence.

November2 late-post batch: backend owns the complete retail34-pointer command
table and late-post/glow presentation/debug routines; rb_imagefilter owns the
existing generators plus filter application/glow/blur image generation. Reused
existing GfxImageFilter type; no duplicate allocation. Backend glow fields
replace the exact20-byte opaque region, no offset/sizeof change. Import145
keeps its slot and pointer width with the target-proven float(float) prototype.
No new TU, link-order/flags/roots/exports or assembly. Original build and gate
results are recorded in proof/nov02_late_post_checkpoint.json when verified.

November2 executor batch: restore original rb_debug.cpp as its own TU between
rb_backend and rb_fog;111 existing TUs keep relative order (112 total). Mac
STABS original path PC/gfx_d3d/rb_debug.cpp plus retail34010..348e9 interval
support this file boundary. Backend owns executor and benchmark code in the
existing body interval. The4-byte rendering-disable word101d0a8c has a supported
reference name; exact original TU ownership is unproved, candidate owner backend.
No new worker/build tree, flags, artificial roots/exports or authored assembly.

2026-11-02 frame submission: R_IssueRenderCommands10020d50,
R_EndFrame10021f90 and R_EndDebugFrame10022040 live with their allocator,
frame storage and debug-frame state in r_rendercmds.cpp. Existing relative
TU order unchanged; no new data owner. API59 slots48/50 pinned, genuine
GetRefAPI publication still pending. Their executor/presentation calls use
real rb_backend source, not substitutes.

2026-11-02 scene dependencies: real point-to-cell BSP traversal lives in
r_dpvs.cpp alongside existing node/cell operations (reference original TU).
Shortsort/quicksort remain in r_scene.cpp. Four scene packet producers remain
with the sole allocator and command storage in r_rendercmds.cpp. No new global,
TU, flag, export, assembly or source ownership duplication; link order unchanged.

2026-11-02 scene modes/clear functions remain in r_scene.cpp, beside the
original scene and LOD owners. Shared packet/group functions are reused;
no new TU/storage/flags/export/root. Scene mode names describe pinned roles,
not proof of the lost PC identifier spelling. The sole source remains work/src.

Source browsing: gfx/SOURCE.md links the actual active files and proof status.
No second clean-source copy was created; incomplete files are explicitly mixed
verified/draft source, distinct from target/src/opencod2 reference inputs.

2026-11-02 normal pipeline: R_DrawPointLightSurfs/R_ClearFloatZ/depth, normal
mode and mode dispatcher stay in r_scene.cpp; real cookie command drawing in
r_shadowcookie.cpp. Point-light gather/selection stays with r_light.cpp;
scene light culling in r_dpvs.cpp. The command9 matrix record moved unchanged
into r_scene_commands.h, shared by its existing allocator and genuine caller.
No new TU/data allocation/export/root. r_light's new float section tests precise
FP locally; candidate source pragma, not proof of the lost compiler settings.
Root src/ remains unchanged, verified snapshots only; no mixed files promoted.

## API59 and connected scene ownership - 2026-11-02

The genuine GetRefAPI and its432-byte zero-initialized export table belong to
r_init.cpp. r_refapi.h shares explicit callback signatures; it owns no storage.
All98 nonzero slots now reference actual compiled source; ten slots86..95 stay
zero. api_callbacks.tsv lists source owner, linked address and separate byte
acceptance for every slot. Legacy shifted names are no longer used as identity.
The only export is GetRefAPI. No synthetic retention array or /INCLUDE roots.

r_dpvs owns world/frustum/portal visibility; r_scene owns the outer scene driver
and real RenderScene callback. r_shadowcookie owns generation and the original
VC7.1 STL sort instantiation; r_utils owns the shared sphere classifier. The
model-skin loader reuses Material_Register and existing model imports. Existing
112-TU link order and flags remain; no new object or source-level assembly.
Gamma initialization calls imported SetModified slot38, not ClearModified37.
Glow zero stores follow field1 thenfield2; original assignment's final values
were equal, but its reversed store order caused contradictory binding evidence.

This closes the source callback/dispatch structure, not original TU-boundary
proof, every body match, final contributor offsets, whole SHA or GPU execution.
Refreshed file_layout/evidence reports distinguish accepted, addressed drafts,
Mac naming evidence and unverified functions; inferred intervals are not proof.
