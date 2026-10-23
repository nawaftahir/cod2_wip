# Reconstruction attempts

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
