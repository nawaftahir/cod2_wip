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
| dx | gfx_d3d/common.cpp | Device-lost101d492c = dx+2d3c |
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
