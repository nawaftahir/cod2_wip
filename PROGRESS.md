# Renderer progress

## Structure-first JPEG and command checkpoint - 2026-10-23

Work only in gfx; actual source is `target/work/src/`. This is the sole current
status log. WHOLEFILE.md remains the roadmap. Stages1-3 are NOT complete.

### Verified dynamic-buffer upload checkpoint

After6ca5aa7, rb_buffer_upload.cpp restores actual index and vertex uploads
through existing dx/dxState buffers and binding caches. No duplicate globals,
new buffers/export roots or assembly. Primary-backed SDK layout assertions pass.
Index rollover, distinct vertex/index lock flags, memcpy, unlock retries, error
prints and RI fatal handling preserve the primary behavior. Late callback-driven
state changes are reloaded before used-count publication. The reference's extra
vertex guard/color conversion/gpuSync behavior is NOT imported.

Both referees accept RB_SetIndexData100386b0/282 and the genuine shared error
sequence100113e0/49: +331 C++ bytes. Engine C++103509/253580=40.819070905%,
611 bodies. Same frozen legacy comparison denominator; IJG and assembly remain
separate. All1430 previous extents survive; ratchet protects1432, and both new
removal negatives reject regressions. All106 fixtures pass, including768 index,
1296 vertex and4 lock-failure routes. One output, no workers; billing unavailable.
Vertex source compiles to282 bytes like retail but differs in registers/NOPs:
NO vertex byte credit, no spelling/flag sweeps. Diagnostic is frozen with receipt.

Candidate SHA51d5748ca76356cf9d0ebe5b6b9f32bd224e032f7db929b896b780d83cd6db67;
same-offset8.177846723%, NOT source coverage. Receipt: buffer_upload_checkpoint.json.
Build/preflight/full fixtures are terminal and passed. Next: genuine lighting,
DrawTechnique/EndSurface/2D setup -> sun calibration -> R_Init -> API59 closure.
RB_DrawSingleTechnique, viewport, iterator fog and DX7 hardware-light source
already exist; reuse them. Stages1-3, whole-file SHA and GPU smoke stay OPEN.

### Verified tessellated surface setup checkpoint

After3f1c0ac, the shared rb_tess.h now models the primary field span through
firstOptimizedVertex at5a7e8 (modeled size5a7ec), preserving every old field
position and the sole allocation in rb_sky.cpp. New rb_shade.cpp restores real
RB_BeginSurface1003a5f0/153 and its primary35-entry diagnostic helper10037930/304.
It logs through existing shared helpers BEFORE resetting precisely six fields;
materialTime and optimized counts remain untouched, exactly as retail.

Both functions pass both referees: +457 genuine C++ bytes. Engine C++ now
103178/253580=40.688540106%,609 bodies. This is the frozen legacy inventory
meter with IJG explicitly excluded from its numerator, not whole-DLL completion.
All1428 old extents survive; ratchet now protects1430. Both removal negatives
reject the lost new body. All105 fixtures pass, including4200 actual surface
begins,35 independently target-derived names and complete-field preservation.
No new assembly/export roots, workers or duplicate build outputs; billing unknown.

Candidate SHA354c64897ce39e7ed8ef689d44fa598aa6724cb4163920fd6072162b565e84f6;
same-offset8.174227824%, not source progress. Freeze/source/log hashes are in
proof/surface_begin_checkpoint.json. Builds and fixtures are terminal and passed.
Next closure: real EndSurface/draw/upload/2D setup -> sun calibration -> R_Init
-> remaining API59 callbacks. RB_DrawSingleTechnique, iterator fog and viewport
updates already have real source; reuse them. Do not add dummy draw callbacks.
GetRefAPI, stages1-3, retail SHA and real client/GPU smoke remain OPEN.

### Backend layout checkpoint afterf35cb77

Fixed the LIVE common PC backend type in target/src/opencod2/headers/cod2_defs.h:
remove the extra OGL matrix and restore explicit16-byte matrix alignment for
MSVC. All six primary-backed layout assertions pass with the original compiler,
including debugFont36b58 and complete backend36b60. The common and SDK views
still share one backend allocation. The inactive historical common_types.h copy
is not compiled and was not changed. All1428 protected matches survive, no new
source-byte credit; C++ stays102721/253580=40.508320845%. All104 fixtures pass,
including both matrix views, primary instruction checks and extra-field negatives.
SHA2665956c3d567aa8de4cc1365fbcc3b91b95e4f30f9a27ba5a4d4859513d478f;
same-offset8.210416811%, not completion. Receipt: backend_common_checkpoint.json.
One output, no workers; tokens unavailable. Stages1-3 and GPU/SHA remain open.

### Latest verified work

Restored the authentic IJG6b encoder (22 C TUs), its target-backed allocator,
error-callback and BGR ABI, actual R_SaveJpg, JPEG/savegame capture, the shared
screenshot dispatcher and all nine command registrations. Original upstream
README/license is retained; 28 imported files are unchanged, five adapted.
Provenance and ABI: src/jpeg-6b/COD2.md; archive hash and per-file provenance
are pinned in proof/jpeg_commands_checkpoint.json. No new assembly or stubs.

Both referees accept four new engine bodies /252 bytes and136 IJG bodies /
38859 bytes. Dependency credit is separate. Engine C++102721 bytes /607 bodies,
40.508320845% of the frozen253580-byte legacy inventory. That denominator still
includes nine early IJG entries; object-origin filtering excludes them from the
numerator. This is a legacy comparison meter, NOT a whole-DLL completion claim.
Mixed110508 bytes /638 bodies; unchanged31 assembly-containing bodies /7787 bytes.
All1288 prior protected extents survive; the ratchet now protects1428. Removal
of all four new engine matches and two representative IJG matches is rejected.

All103 actual-source fixtures pass. Tests include real codec/Pillow decoding,
allocator ownership,63 screenshot routes and all nine registrations. Additional
linked-code audit confirms actual callback addresses, command strings and RI
slot0x104; wrong-callback/wrong-slot controls fail. One output reused, no workers.
Token billing unavailable; measured gain is252 engine bytes +38859 library bytes.

Candidate SHA e3ab109fd5e447ed7cafe8907f4fd550969ff9a1da795d27c7dca1212e5ec956;
file1695744 bytes; .text939858, .rdata600607, .data6084596, .reloc86926.
Same-offset8.210416811% is NOT source recovery or retail identity. Still159
interim exports, no genuine GetRefAPI, no real client/GPU smoke, no V4/V5.

Next: startup sun-sprite query calibration and its genuine draw/flush helpers,
then R_Init and the remaining API59 callback closures. Fix/assert the common
PC matrix-stack view before consuming post-stack backend fields: it currently
includes an extra Mac/OGL matrix absent from the SDK-backed PC view. Do not
create duplicate state or fake callbacks. Calibration1003a9d0 is occlusion
sampling, NOT a CPU benchmark; query107645b4, result dx+0x2c2c.

### Previous sun command checkpoint1d7e60a

Aftera7294fb, r_sky.cpp restores sun population28cd0/826, dvar-file loading
291c0/102, saving29080/101 and load/save command callbacks29010/122,290f0/46.
The actual21-entry name table and96-byte sun record/world+160 layout are pinned.
This reuses existing dvars, rgp/world, material registration(track6), file imports,
AngleVectors and existing rounding. Empty shaders use rgp.defaultMaterial.
Load checks argc -> cheats -> loaded world, parses before updating, frees even
after parse failure, but does not free a missing file. Save has no cheat/world
gate and writes only after successful serialization; original write status is
ignored. No cloned world/sun state, new TU, flags, exports or authored assembly.

R_SaveSun101B and R_SaveSun_f46B pass BOTH referees: +147 C++ bytes.
All1286 previous extents survive; ratchet now protects1288. Both new removal
negatives reject regressions. Authored C++102469/253580=40.408943923%,603 bodies;
mixed110256/634, same31/7787 assembly exclusions. All99 fixtures pass, including
144 native sun routes checking independent retail names, field/layout publication,
file ownership, command gates and four rounding modes with target math models.
Population/load source remains unaccepted; no extra V2 credit. Population uses
preexisting I_fround/AngleVectors; audit and separately exclude any inlined
authored assembly IF this body ever matches. Never blindly relax the counter.
Receipt/source hashes: target/work/proof/sun_commands_checkpoint.json.

Seven of nine command SOURCE implementations now exist; the screenshot pair
still needs the genuine JPEG chain. R_LevelShot already exists and should be
reused. R_SaveJpg14670/713 and its original JPEG dependency are absent from the
active TU list. Plain reference IJG6b is NOT drop-in proof: target stores
per-object allocation/free callbacks in cinfo+18/+1c, absent from its stock
header. Do not use the old Mac-offset draft, modern libjpeg-turbo or a D3DX
substitute and call that retail reconstruction. JPEG wrapper/header/library ABI
is the next bounded dependency batch, then screenshot callbacks/registration.

Current SHA7e87e52be7e6813e8dd20e2da99375096123bc17b3acb40dc63b6ea0a377f268;
.text895842, .rdata593519, .data6084596, .reloc85890; file1638400 bytes.
Same-offset8.179359098%, NOT whole-file completion. The genuine name table adds
96 aligned data bytes; no filler. Still no GetRefAPI or real GPU/client smoke;
stages1-3/structural checkpoint remain OPEN. One output reused, no workers;
billing unavailable. Build,99 fixtures and both ratchet negatives are finished.

### Material/cache checkpointa7294fb

After47b747c, actual material reload and picmip command source is restored in
r_material.cpp. Reload walks each unique non-water image in descending unsigned
address order using the original count snapshot. Picmip walks the existing1024
hash slots, skips water/null bindings, compares ONLY platform0, releases before
assigning both picmip bytes/reloading, and retains the original ERR_DROP path.
The command looks up an existing material; it does not create one. Before the
reload it binds the real white image across16 LIVE sampler states. No duplicate
image state, hash table, stats, wrapper workaround, new flags or authored ASM.

Cache stats/flush callbacks reuse the existing s_cache and real flush. Stats
1002bb90/84 and white binder1003ec50/33 pass both referees: +117 C++ bytes.
All1284 old extents survive; the new ratchet protects1286. Removing either new
match is rejected. C++102322/253580=40.350974052%,601 bodies; mixed110109/632,
same31/7787 assembly exclusions. All98 fixtures pass, including26 native actual
material routes and48 stats routes, plus old material/sampler/regression tests.
Source/proof identities: target/work/proof/material_commands_checkpoint.json.

Five of the nine command SOURCE implementations now exist: image list,
apply-picmip, material-texture reload, cache stats and cache flush. This is NOT
five byte-accepted callbacks. The remaining screenshot pair and sun pair still
need real closures. Do not add a partial/dummy registration table to hide them.
Other new material/helper bodies remain unmatched; do not count restored source
as extra V2 coverage. Primary usage/errors, format handling and pointer order
are deliberately preserved until the original is reconstructed.

Current SHA06caec127d0b8673c4f358109d4fc15317efc587ebb0334be39069976443911f;
.text894562, .rdata593215, .data6084500, .reloc85708; file1638400 bytes.
Same-offset8.198965967%, NOT whole-file completion. Still no GetRefAPI/client
smoke; stages1-3/structural checkpoint remain OPEN. One build output, no workers;
billing unavailable. The build, negative controls and98 fixtures have finished.

Next: screenshot/sun command closures -> genuine nine-command registration ->
R_Init/benchmark -> API. Reuse existing global/sine/DObj setup (already V2),
FFT_Init source in universal/fft.cpp and R_LevelShot in r_screenshot_capture.cpp;
those last two are present but currently unaccepted. Do not rewrite existing
code from memory or substitute unrelated callbacks. Keep structure first.

### Hardware startup checkpoint47b747c

After676e402, r_device.cpp now restores higher device creation128b0/271,
settings reduction12c20/91 and hardware startup12c80/289. The real chain is
presentation -> CreateDeviceInternal -> original FP controls -> video/shared
viewport -> resources -> gamma modified reset -> R_InitSystems -> window
publication. Startup retries AA, then refresh, then resolution; existing devices
only reinitialize systems. Failure messages/return behavior match primary,
including retrying after a returning fatal callback. No fake successful init.

All state is reused: dx/vidConfig, real dvars and backEnd.sceneViewport at
1072dde8/1072ddec, NOT dxState or newly invented width/height globals. HWND is
captured before presentation setup, then actual parms are read for publication.
Window swap-chain and viewport x/y remain untouched. _controlfp calls use the
existing original CRT; no authored assembly. Primary still ignores the factory
status and does not add a retry cleanup; do not silently modernize this behavior.

Both compiler waves pass unchanged byte/binding/source gates and all1284
protected extents. All96 fixtures pass:48 higher-device routes,361 hardware
threshold/retry/failure routes, retained1204 AA/presentation/device routes.
These three source bodies remain unmatched; NO new V2 credit. C++ stays
102205/253580=40.304834766%,599 bodies; mixed109992/630, same31/7787 assembly
exclusions. Source/proof hashes: target/work/proof/hardware_startup_checkpoint.json.
All new functions are in the linked map; real ShowWindow closes that missing
retail import. Only IsWindow remains missing among named imports; no extras.
Still159 temporary exports/no GetRefAPI. One output reused, no workers; billing
unavailable. No own build or fixture session remains running. No push.

Current SHAb6be81ba215fc957d4548c8b9b1e5c5439fc74039c659c0daa548ce3f10c00b5;
.text893666, .rdata593007, .data6084500, .reloc85626; file1638400 bytes.
Same-offset8.195185028%, not source recovery/whole-file completion. Stages1-3,
structural checkpoint, SHA and real client/GPU smoke remain OPEN.

Next genuine closure: R_Init10012f80/169 needs registration52c0's real callback
chain and benchmark3a9d0, not a stub entrypoint. Reinspection confirms global
initializer12e70/109, sine table12ee0/43, model DObj12f40/51 and backend
initializer33f80/64 ALREADY pass both referees; reuse them. Size checks for
rg31a0/rgp10f0 and SDK backEnd36b60 already exist. Do not rewrite that work.
Image-list0d940 and cache-flush2baf0 callback implementations also already
match. Commands/targets and missing chains are pinned in ATTEMPTS.md.
Continue source/structure closure, not flag sweeps.

### Material/systems checkpoint676e402

Afterdddd459, actual Material_Init100173e0 and its registration/raw helpers
10017350/10017190 are restored in r_material.cpp. The28 normal and12 optional
fill-test entries use typed pointers into the existing rgp, not another state
block. Native tests compare EVERY name/destination against the primary tables.
Startup clears the actual0x299c materialGlobals before shader preload. Raw
fallback/rebinding preserves rawTexdef sampler/semantic/image/padding and only
copies the name before redirecting rawMaterial.textures. SDK-side views have
compile-time checks for every newly consumed layout; rgp is still allocated
only once in r_init.cpp.

R_InitSystems10012040 now calls real R_InitImages -> Material_Init -> light
registration in that order, resets rg's real water count, clears five fogs and
the NORMAL debugGlobals allocation (not a duplicate/backend frame), sets the
five original limits, then marks registered. Do NOT import the reference's
extra font initializer: no such call exists in this PC1.0 primary body.

Combined original-compiler build passes both referees and all1284 protected
extents. All94 source fixtures pass;32 startup routes check both fill modes,
raw/default comparisons/counts and fatal builtin failures;51 systems routes
check order, shared ownership and bounded resets. Four new bodies have the
right instruction shapes but rejected dependency bindings; NO V2 gain claimed.
C++ stays102205/253580=40.304834766%,599 bodies; mixed109992/630, same31/7787
assembly exclusions. Receipts/hashes: target/work/proof/material_systems_checkpoint.json.
No roots, exports, TU, flags or assembly added. One output, no workers; billing
unavailable. Both build sessions and all94 fixtures have finished.

Current SHA8661b340a44fc4b96064b0dd995e830b6366c2af874d40aafd84ff55a3a2a8e3;
.text893026, .rdata592911, .data6084500, .reloc85526; file1638400 bytes. Same-offset8.217924675%,
not whole-file identity. Material_Init and R_InitSystems are present in the
linked map. Still no GetRefAPI or GPU/client smoke; stages1-3 remain OPEN.
Next genuine closure: higher device128b0/271 calls restored presentation,
CreateDeviceInternal, FP control, video storage, resources and systems, then
publishes the window. Continue with primary-pinned signatures/storage, followed
by startup12c80/R_Init/real API graph. No per-body flag/spelling tuning yet.

### Material loading checkpoint dddd459

Material binary fixup1001c4e0/603, file loader1001c740/171 and registration
10017100/144 now have actual C++ source in the existing material TUs. They
connect serialized names/textures/constants to existing string interning,
Image_Register, renderer-owned water setup, cached techniques and validation.
Registration reuses the already matched hash/add/duplicate bodies. No new TU,
globals, flags, root exports or assembly. Permanent allocation/error behavior
and DX7 normal/specular skips are preserved, not replaced with safer guesses.

Both referees and all1284 protected extents pass; all92 fixtures pass, including
77 native material routes and the existing51 technique-set routes. Authored
C++ remains102205/253580=40.304834766%,599 bodies; mixed109992/630. The same
31/7787 assembly exclusions remain. No new V2 gain: Material_Register has
matching code but its loader binding is unaccepted, so it receives NO credit.
Proof/source hashes: target/work/proof/material_binary_checkpoint.json.

Current SHA6b943f1d34a8678a2e08ed70cbf532e5115a285132e3190cd72eb7cf63dd5875;
.text892594, .rdata591743, .data6084500, .reloc85300; file1634304 bytes.
Same-offset8.267076881%, not whole-file completion. No GetRefAPI/boot/SHA claim.
Next: real28-entry/12-entry registration tables, raw material helper17190,
Material_Init173e0 -> finalization12040 -> higher device/startup/API closure.
Primary tables and r_testFillEnable101ce79c are pinned; do not fabricate tables
or confuse raw material's texture-name rebinding with copying a whole record.
One build output, no workers; actual billing unavailable. Build and full suite
finished. The earlier approval-service usage failure cleared on the next turn.

### Water ownership checkpoint d998efe

Wave after7e82de5 fixes a real shared-state defect uncovered while following
material fixup1c4e0. Water loading/reset used TWO standalone allocations while
retail stores the count/16 records in rg at1028/102c. Those duplicate declarations
are removed; every lookup/create/shutdown now uses rg's actual fields, the same
count startup12040 clears. Source remains recoverable in Git; no folders/assets
were deleted. Compile assertions pin68-byte records and fog boundary146c.

The build passes both referees/source attribution with all1284 old extents
retained. No new accepted body: authored C/C++ stays102205/253580=40.304834766%,
599 bodies; mixed109992 bytes/630 bodies, same31/7787 authored-assembly exclusions.
40 native ownership routes, existing water/NaN tests and all91 fixtures pass
after the completed build (latest/water_owner_fixtures.log). No own build/test
remains running. Source/evidence hashes: target/work/proof/water_owner_checkpoint.json.

Current SHA8d4622a76b8aa46ccd939e7b59544193a2b52d329a41eb0a39931f77ad7e9fac;
.text891298, .rdata591391, .data6084500, .reloc85258; file1634304 bytes.
Same-offset8.300025062%, NOT source coverage or identity. Removing duplicate
water storage INCREASES the .data virtual-size gap from512 to1600; this is
correct ownership repair, not a regression to fix with size fillers. No wrappers,
aliases, flags, roots, TU or authored ASM. One output, no workers; billing not exposed.

Next real material closure: fixup1c4e0/603, file loading1c740/171, then register
17100/144 through the already matched hash/add/duplicate helpers. Reuse existing
image registration, string interning, cached techniques and validation. Water
fixup must now use the repaired real rg records. Stack field mapping notes are
in ATTEMPTS.md; do not mistake the image-pointer zero for writable.floatTime.
Full Material_Init/finalization/higher startup/API and stages1-3 remain OPEN.

### Shader preload checkpoint7e82de5

Wave after e6017ea restores shader-source preload and file caching in the
EXISTING mtlLoadGlob owner, r_material_load_obj.cpp. It lists root/lib hlsl files,
uses one permanent name+text block per file, publishes/sorts the real cache,
then frees lib/root lists. No second shader database, globals, TU, flags or roots.
The83-byte case-sensitive comparator1001c8d0 passes both unchanged referees.
Original VC7.1 std::sort headers reproduce THIRTEEN dependency bodies /2696 bytes;
none of those library bytes are relabeled authored game reconstruction.

All1270 prior extents survive; the ratchet now protects1284. Comparator/_Sort/
_Rotate removal negatives all reject lost bodies. Authored C/C++102205/253580
=40.304834766%,599 bodies. Mixed109992 bytes/630 bodies; same31/7787 authored
assembly exclusions. The file helper/preload source remains unaccepted; source
restoration alone is not V2. No compiler/code spelling sweeps or authored ASM.
All90 fixtures pass after the final build, including nine native cache scenarios
with0/1/2/33/80 root files, borrowed/owned data, prefixes, short reads, failed
opens and the original case-sensitive-sort/case-insensitive-lookup mismatch.

Current SHA08356b902c32869692a3bf4c35255c30c1591577137b38d8899908013c840ccb;
.text891298, .rdata591391, .data6085588, .reloc85258; file1630208 bytes.
Raw same-offset8.301051317%, NOT source coverage/retail identity. Still no
GetRefAPI; structural checkpoint and stages1-3 remain OPEN. One output, no workers.
Per-turn billing is not exposed: verified gain83 game bytes+2696 dependencies.
No own build/test remains running. Frozen source/evidence identities:
target/work/proof/shader_preload_checkpoint.json.

One compile issue was a legacy typedef min/max collision with VC7.1 xutility.
Including <algorithm> BEFORE the legacy view fixes it without editing references,
changing flags, macro-renaming types or writing a replacement sort implementation.

Next material closure: Material_Register17100/144 calls lookup17050, loader1c740,
register16ed0 and duplicate16f30. Default failure/duplicate behavior is real work,
not a placeholder. Then tables17350/64 and raw/default17190/88 -> Material_Init
173e0/124 -> finalization12040 -> higher device/startup/R_Init/API. Shader preload
needed by Material_Init now has actual compiled source and its shared cache.

### Image initialization checkpoint e6017ea

Wave after94e48e9 restores R_RegisterBuiltinImages1000d560/276 and the complete
R_InitImages1000d880/124 in r_init.cpp, the existing rgp owner. DX7 creates water
color instead of DX9's normal/specularity/grid/lightmap family. Startup sets
picmip, publishes those real images, binds16 live samplers and uses the existing
Image_AllocProg(12,4) for $raw. RawTexdef's name/padding stay untouched. No new
globals, TU, SDK/flags/exports, wrappers or authored-assembly definitions.

Both referees and source attribution pass with every1270 prior extent retained.
No new body is byte-accepted: C/C++ remains102122/253580=40.272103478%,598 bodies;
mixed109909 bytes/629 bodies, same31/7787 authored-assembly exclusions. These
two real startup source bodies are not silently counted as byte recovery.
44 native startup routes, existing576 capture/gamma routes and all89 full
fixtures pass after the completed build (latest/image_startup_fixtures.log).
Proof/source identities: target/work/proof/image_startup_checkpoint.json.
No own build/test remains running. No duplicate output or workers; billing/token
cost is not exposed.

Current SHA1ebb2a6ae9cde0a5f38b215a30826f2738ece55159726347b53f5b24a009d8d2;
.text887682, .rdata591311, .data6085588, .reloc85202; file1630208 bytes.
Same-offset8.324979259%, NOT source coverage/retail identity. Whole SHA and the
early structural gate/stages1-3 remain open. The common DxState view now has
a compile assertion for sampler20e4; SDK rb_state.cpp remains its single owner.

Next: actual Material_Init173e0/124, its shader-source cache setup1c930/282 and
material registration17100 through17350/64 and17190/88. Shader file-list/cache
state ALREADY exists as mtlLoadGlob in r_material_load_obj.cpp; reuse it, not a
parallel shader database. Then recover finalization12040 -> higher device128b0
-> startup12c80 -> R_Init/API. Keep file load/error semantics and typed ownership.

### Image/light checkpoint94e48e9

Source wave after66a4ff2 restores nine real functions: outdoor lookup/image,
water-color callback/cubemap, complete ten-builtin dispatcher, image registration,
packed light image entry, light file loader and light registry. This closes real
image/light dependencies required by startup; no dummy $ branch or unresolved
light-loader link. New r_light.cpp owns the actual260-byte count+64-pointer
registry. Shared r_light.h replaces the shader's duplicate24-byte definition
view. Source remains target/work/src only; no new SDK, exports or compiler flags.

Both completed builds pass unchanged byte/binding/source gates. All1270 prior
extents survive, with NO new accepted bodies this wave. Authored C/C++ remains
102122/253580=40.272103478%,598 bodies; mixed109909 bytes,629 bodies;31/7787
authored-assembly exclusions. The restored source is not silently byte-match
credit. No instruction/flag tuning and no new assembly definitions; old rounding
helpers are reused where already implemented, with separate accounting.

Native tests pass92 image routing/error cases,54 watercolor cases, eight FULL
512x512 outdoor maps across four rounding modes, and21 light-definition routes.
All88 fixtures pass after the final build; log
latest/light_image_structure_fixtures.log. No own build or test remains running.
Frozen source/receipt identities: target/work/proof/light_image_structure_checkpoint.json.

Current SHA52d858dcd943adc024a0f4a3e8de0ee6bd74fea1509a715f3f75e98aad650aa8;
.text887298, .rdata591311, .data6085588, .reloc85138, file1630208 bytes.
The .data virtual-size gap is now512 bytes, down from768, with actual light
storage added and no size fillers. Same-offset8.340211041% is NOT a completion
meter. Still159 temporary exports/no GetRefAPI; whole SHA is not retail.
One output reused; no workers. Per-turn billing is not exposed. Zero V2 byte
gain is reported honestly despite the connected source/ownership restoration.

Next startup source: real Image_Init1000d880/124 calls existing R_SetPicmip1000d680,
then builtin registration1000d560/276, initializes16 samplers from backend state,
and publishes the existing programmable raw image/raw texture definition. Keep
rgp/image hash/backend ownership shared, not copied globals or guessed offsets.
Material_Init100173e0 and finalization10012040 then remain mandatory before the
higher device/startup/API closure. Do not confuse those init bodies with reload.

PINNED capacity-path light error has a malformed original format/argument list;
source preserves the exact count-only call with an explicit comment. Fixes wait
until original reconstruction is complete. No real client/GPU smoke or release.

### Video checkpoint29bc6db

Wave after d782265 restores monitor fallback and video/aspect storage in the
existing r_monitor.cpp/r_init.cpp owners. All1269 prior extents survive both
unchanged referees. R_GetMonitorDimensions10011560/132 adds one accepted C++
body; video storage remains unaccepted. It reuses the old I_fround, with no
new authored assembly definitions and no assembly relabeled as C++ credit.
Authored C/C++102122/253580=40.272103478%,598 bodies; mixed109909 bytes,629
bodies. The31/7787 authored-assembly exclusion set remains unchanged.

126 focused native32 monitor/video routes and all84 fixtures pass after the
completed build (latest/video_structure_fixtures.log). Ratchet now protects1270;
removing the new monitor function is rejected. No own build or test remains.
Source/evidence hashes: target/work/proof/video_structure_checkpoint.json.
Current SHA940d70e63e81262689add6ff447c2dd336337977fc630c634a222fd2071ce528;
.text885522, .rdata590959, .data6085332, .reloc85018; file1626112 bytes.
Raw same-offset8.305210350%, not source coverage or retail identity.
No new globals, exports, TU, compiler flags or imports. No source/flag sweeps.
No workers or duplicate output. Per-turn billing is not exposed; gain132 bytes.

The next missing startup assets are now pinned correctly:10012040 calls IMAGE
INITIALIZATION1000d880 and MATERIAL INITIALIZATION100173e0, not reload routines.
Its light_dynamic literal registers a light definition through10014c60, stored
in rgp.dlightDef. The required light registry is count+64 pointers at101d7eb0,
with loader150e0/172 and image-entry reader15090/68; that reader calls actual
Image_Register1000d200. Recover these real connected modules, not a guessed
Material_Register call. Video source restores needed structure without claiming
registration/device/API closure. Those closures and retail SHA remain OPEN.
Additional closure check: Image_Register1000d200/94 needs BOTH file loading and
the full519-byte builtin dispatcher100108a0. That dispatcher still requires real
default/checker and outdoor-image creators among its existing procedural helpers.
Do not add an unresolved light-loader TU, skip the builtin branch or returnnull
as a stand-in. Close these actual image creators, then Image_Register and the
light loader/registry together. No speculative light source was added this wave.

### Resources checkpoint d782265

Source wave after e4dd313: restored the real dynamic VB/IB constructors, their
startup pools and1024-particle geometry in r_dxbuffers.cpp. Real resource startup
in r_device.cpp now calls render targets -> cache VB -> existing cache reset ->
dynamic buffers -> particle buffer -> event query -> eight sun queries ->
initial render state. Event failure stops; sun-query failures log and continue.
The old152-byte resource inventory missed109 real bytes. No partial-success
return, dummy callbacks, new globals, exports, compiler flags or authored ASM.

Fixed a genuine shared-interface defect now: Mac union vs SDK struct pointer
types gave different allocator linker names. The SINGLE existing static VB
allocator and both world/particle callers now share void** ownership. Its222
primary bytes still match, as do all1267 previous extents. Existing SMC_ClearCache
is callable by startup without duplicating cache storage. Shared sun header
checks48-byte stride/query36/issued44 in both type views; r_sky owns all four.

New accepted C++ is the129-byte dynamic VB and129-byte dynamic IB helper.
Authored C/C++101990/253580=40.220048900%,597 bodies. Mixed109777 bytes,628
bodies; authored ASM exclusions remain31/7787. Pool initializer, particle body
and complete resource startup are real source but NOT accepted coverage.
No instruction/flag tuning campaign. Native tests pass24 dynamic routes,
three complete particle RNG streams, two isolated original-failure faults and
16 resource/query routes. All83 fixtures pass after the completed build;
log latest/resources_structure_fixtures.log. Ratchet protects1269 extents;
removing either new helper or the repaired old allocator is rejected.
Source/evidence hashes: target/work/proof/resources_structure_checkpoint.json.
No own build or test process remains running at this checkpoint.

Current SHA bd63ec1fe85c88280f9e1f6b22b038a2f9e5692ede2a240155bfa3126e313f3c;
.text885170, .rdata590959, .data6085332, .reloc84966; file1626112 bytes.
Raw same-offset8.311908013%, NOT source coverage or retail identity. Stage1-3
and the early structural gate remain OPEN. Hardware/startup/API are still missing.
No workers or duplicate build output. No reliable per-turn billing counter;
this wave adds258 verified bytes plus connected unaccepted startup source.

PINNED original particle bug is preserved: failed index allocation/lock leads
to a null write. Native child tests disable core dumps and verify that fault;
this is reconstruction, not permission to fix retail behavior before matching.

Next structural closure: video configuration100115f0, registration completion
10012040 -> full higher device caller100128b0 -> startup10012c80 -> real R_Init
and API callbacks. Resource startup already uses real implemented callees even
where bytes are still unmatched; do not replace them with fake return values.

### Device checkpoint e4dd313

Source wave after d3f05a8: new r_device.cpp follows r_window.cpp in candidate
tus.txt. It restores real AA probing10011460/100, presentation setup100114d0/137
and retrying device creation100126d0/113. ALL THREE pass both unchanged referees
on the first normal-profile build; no prior1264 extent is lost. No new exports,
globals, flags, library substitutes or authored assembly. Existing dx and the
actual r_swapInterval dvar are reused; the reference's r_vsync is not a PC name.

Authored C/C++101732/253580=40.118305860%,595 bodies. Mixed109519 bytes,626
bodies; same31 authored-assembly exclusions/7787 bytes. This wave gains350
verified C++ bytes. This is a secondary source metric, NOT completion of the
structural gate or stages1-3. All1204 focused native32 device routes and all80
full fixtures pass after the completed build (latest/device_structure_fixtures.log).
The ratchet now protects1267 extents; removal of each new body is rejected.
Frozen source/binding/layout/log identities: proof/device_structure_checkpoint.json
under target/work. No own build/test remains running at this checkpoint.

Current candidate SHA7cc9514234fc696f781fa7474b1431c6e0f33fdd81a4a38b80d8ca1f50bda051;
.text883874, .rdata590559, .data6085332, .reloc84812; file1626112 bytes.
Raw same-offset8.308235101%, not source coverage or SHA identity. Still159
temporary exports, no GetRefAPI; full startup/device resource closure remains
open. One build output reused; no workers. No reliable per-turn billing counter.

Next structural chain: resource creation10012100 (render targets, static-model
cache buffers, dynamic/particle buffers, query8), video configuration100115f0,
registration finalization10012040 -> full higher device caller100128b0 ->
startup10012c80, then the real R_Init/API. Keep primary failure/retry branches.
Missing callbacks/resources are not placeholders. No instruction-tuning campaign
until the early structural gate in WHOLEFILE.md is actually closed.

### Window source checkpoint d3f05a8

Latest wave after fdb699f: r_window.cpp restores real Win32 window creation,
refresh selection and startup parameter preparation. Candidate TU follows
r_monitor.cpp; no new globals, exports, SDK substitutes or compiler flags.
r_window.h pins the36-byte PC record. All79 fixtures pass; the completed build
passes both unchanged referees with every1263 prior extent retained. Refresh
selection10012b00/131 adds one accepted C++ body; the ratchet now protects1264.
Window creation/parameter setup remain unaccepted, not silently counted.

Current authored C/C++101382/253580=39.980282357%,592 bodies; mixed109169 bytes,
623 bodies, same31 authored-assembly exclusions/7787 bytes. Restoring the real
AdjustWindowRectEx call closes one missing import. Only IsWindow and ShowWindow
remain missing from the named-import set; no extra named imports. Full startup,
device creation, API graph and metadata/layout remain OPEN, not a release.

Current candidate SHA127549b628eeab1f0a35b5d98f9e33d8d3591b10063893aa8abf2f032217417b;
.text883490, .rdata590527, .data6085332, .reloc84780, file1626112 bytes.
Whole-file raw same-offset8.305804497%, not source coverage or SHA identity.
Frozen receipts: target/work/proof/window_structure_*.json. Tests cover36
window-creation routes plus927 refresh/setup routes. A removal negative rejects
loss of the new refresh function. No local flag/spelling sweep and no new ASM.
Source/evidence hashes: target/work/proof/window_structure_checkpoint.json.
No own build/test remains running. No workers or duplicate build outputs used.
Per-turn billing/token cost is not exposed; this wave gains131 verified bytes
and restores two additional real startup bodies without claiming their match.

Next: restore device/presentation-parameter creation and startup10012c80 so
these real window helpers connect to the existing D3D capability/enum source.
Keep the primary's exact retry/failure branches, not Kisak/CoD4 assumptions.
Shutdown10012db0 also requires actual resource release10012210 before adding
its IsWindow loop; do not root a dummy import. Full startup/API closure is the
priority, not chasing a source-percentage threshold. Fine FP tuning stays deferred.

### Backend/outdoor checkpoint fdb699f

Owner priority: finish the early structural gate in WHOLEFILE.md before another
function-tuning campaign. That gate is OPEN, not a coverage milestone. Defer
the FP-status and outdoor rounding instruction gaps; no new authored assembly.

Source wave after00fec50: normal GfxBackEndData storage and its real frame
initializer are restored in r_rendercmds.cpp. R_InitRenderCmds now sets the
real debug limits and allocates both2MB index buffers into existing tess
storage. rb_tess.h exposes the second ushort pointer without moving any
material/count field. Its existing owner is rb_sky.cpp; no duplicate globals.
The genuine caller10012fab is pinned, but full R_Init source is still missing.
OutdoorGlob and five real
bounds/mapping/trace helpers are in new r_outdoor.cpp, placed after r_model_lod
in candidate tus.txt. Existing shared bounds and identity helpers are reused;
this is not proof of historical TU order. The /Os experiment is removed.

Completed build/referees/source attribution retain all1262 previous extents;
new outdoor height trace10020590/175 passes both. Ratchet now protects1263.
C/C++101251/253580 (39.929%),591 bodies; mixed109038 bytes,622 bodies.
Assembly exclusions remain31 bodies/7787 bytes. No source-coverage target is
being substituted for the structural gate.

The actual normal frame record occupies2399596 typed bytes. Primary code pins
base1042e780, commands+219d0c, debug+249d18 and the final used record extent.
No fabricated filler or alias of the debug frame. Candidate .data virtual size
is6085332 vs6086100 retail: gap768 bytes, down from2400448. Both raw .data
sizes are57344. This is a size observation, NOT matching layout/data or SHA.

Current SHA31cbeb3764aca5e2581829477a2ce55d22d5d84f2a2a62dc48b8d86ab2e5b9bb;
.text882930, .rdata590319, .reloc84718; file1626112 bytes. Raw same-offset
8.290950809%. No GetRefAPI;159 temporary exports. USER32 still lacks three
real imports; startup/API/metadata/order work is not complete.

Frozen intermediate snapshots:target/work/proof/backend_structure_{warm_bind,
layout,source_coverage}.json. Final snapshots use rendercmd_structure_*.
Native fixtures pass106 outdoor routes,24 normal-frame routes and four startup
routes, including ownership replacement during unlock/allocation and untouched
command counters. The earlier76-fixture backend batch passed. All77 final
fixtures pass after the completed build (log
latest/rendercmd_structure_fixtures_final.log). The first concurrent batch failed
the freshness gate during the live build; never weaken that gate. Removing the
new175-byte trace is rejected. No whole-link build remains running.
Source/evidence identities and the final results are pinned in
target/work/proof/backend_structure_checkpoint.json. No test process remains.
No new compiler flags kept; /QIfist probe
is test-only and emits64-bit FISTP, not the required32-bit operation.

Next structural closure: real startup10012f80 calls Swap_Init -> register dvars
-> renderer command registration100052c0 -> globals -> render commands -> draw
groups -> hardware initialization10012c80 -> material selection -> sine table
-> bit swap -> model DObj -> backend initialization1003a9d0. Recover missing
real bodies and shared interfaces before introducing GetRefAPI; no dummy
callbacks or artificial roots to hide missing startup. Exact function tuning
and the deferred shader/outdoor FP gaps wait until the early structural gate.
No workers/duplicate builds. Tooling exposes no reliable per-turn billing/token
counter, so no invented cost figure; accepted source gain is175 bytes this wave.

### Previous procedural-image checkpoint

Previous committed checkpoint:5caa779. Six real procedural-image functions now
compile in r_image_load_obj.cpp: cube upload, solid BGRA pixel, specularity,
direction-driven cubemap generation, light-grid weights and sun half-angle.
The actual existing image setup/upload, specularity and pixel callbacks are
reused. No new TU, library, export, compiler flags or authored assembly.

New verified source:Image_GenerateSolidColor100100f0/102. Authored C/C++ is now
**101076/253580 bytes (39.860%)**,590 bodies. Mixed source108863 bytes,621 bodies;
the same31 assembly-bearing bodies/7787 bytes are excluded. Both referees retain
all1261 prior extents; the ratchet now protects1262 and rejects removing the new
solid-color body. Unique accepted engine+library bytes356995/1089680 (32.761%).

Native32 tests cover134 procedural routes, including all six cube directions,
texel centers, BGRA ordering, L8 format, face-slice pointers, zero resolution,
buffer guards, submap forwarding and the98304-byte sun buffer allocation/free.
All18 face-axis descriptor values are independently recovered from primary
instructions in the fixture, not trusted from an uninitialized reference table.

Unaccepted: cube uploader84 vs86; specularity117 vs119; cubemap generator754
vs786. Light-grid43 and sun46 are masked-equal but dependency-blocked by the
generator. A bounded vector-helper trial changes786 to754 without acceptance;
keep the reused helpers, do not continue local spelling/flag sweeps. Details
and the next material-loader chain are in ATTEMPTS.md.

Current candidate SHA453d90185a655fc172e12b49ea8b493eea0b7ea72d16d28921838ef38d1c35ac;
raw same-offset8.196589377%, .text881522 bytes,159 interim exports. Still no
GetRefAPI or retail SHA identity. Frozen proof:target/work/proof/procedural_*.json.
One output reused, no workers or additional build trees.
All74 fixtures pass after the completed build. The new-body removal negative
also passes. Receipt/log/source hashes are pinned in procedural_checkpoint.json;
the ratchet protects1262 extents. No own build remains running at this checkpoint.

The active stages1-3 remain connected renderer source, original dependency
reuse, and the genuine entrypoint/callback graph. They are NOT complete.
Next missing source closure: remaining procedural creators/dispatcher ->
material-instance fixup/file loading -> real material registration callbacks.
Never import the reference's alias/fallback/partial-material behavior: primary
failure paths differ. Preserve the actual source and protected matches throughout.

### Previous API source checkpoint

Previous committed checkpoint:eec7920. Restored real API59 polygon submission
and both effect-update forwards in the same compiled source tree. No additional
game bytes are accepted this wave: C/C++ remains100974/253580 (39.819%).
All1261 protected extents survive both unchanged referees and source attribution.
No new assembly or checker changes. This is useful source recovery, NOT a
coverage increase or completion of the owner's stages1-3.

- R_AddPolyToScene10023ed0/245 uses the existing draw-surface helper, real
  68-byte vertex copies,2048/8192 pool limits and fallback material. Full draw
  storage still consumes polygon storage. Captured backend ownership and
  signed-remainder sort keys follow primary bytes, not the conflicting Mac draft.
- API slots22/23 forward to actual client imports166/165: FX_UpdateBolt and
  FX_UpdateNonBolt. Compile assertions pin import offsets/table size. The old
  API inventory's shifted labels remain explicitly untrusted.
- Native32 fixtures pass6480 polygon routes plus128 forwarding calls. The
  source wave also tests upper-bit narrowing, negative keys and full draw storage.
- Polygon compiled244 vs primary245 with different registers/stack storage;
  do not count it. Six-byte effect jumps are independently confirmed but the
  unchanged byte referee does not search their two-byte unmasked anchors;
  no relaxed gate or manual coverage credit. Bounded trials are in ATTEMPTS.md.
- One actual callback joins interim roots to preserve the external stack ABI.
  Candidate now has159 temporary exports. This is NOT stage3's real GetRefAPI
  callback table; replace these roots through real API reachability, not fillers.
- One incremental output reused; no workers or duplicate build trees. Whole
  candidate SHA is d4ffd0c6a14e61c9a8fb4d0bfd0b6bde74f551e317deec5f02cf6a061053c8e6.
  Raw same-offset equality8.116811567%; not a completion meter. Candidate .text
  is880242 bytes. Unique accepted engine+library bytes remain356893 (32.752%).

Frozen source/binding/layout receipts:target/work/proof/scene_api_*.json.
All73 fixtures pass after the completed build; fixture/result hashes and source
identities are pinned in scene_api_checkpoint.json. No own build is left running.
Current goal remains active: connected renderer source, original dependencies,
then the real entrypoint/callback graph. These are the conversational stages1-3,
not a claim that the first three smaller numbered roadmap items are finished.
No whole-file identity, client/GPU smoke or independent checkout replay yet.

### Previous material-pass coverage checkpoint

- Previous source checkpoint: `b15270e`; workspace consolidation: `084b513`.
  Current authored C/C++: **100974/253580 bytes (39.819%)**
  against the SUPPORTED game inventory, not the entire DLL.
- Mixed C/C++ and authored assembly:620 game bodies,108761 bytes.
  Assembly is excluded from the C/C++ meter. This wave adds **555 C/C++ bytes**
  in four bodies;589 accepted bodies are ordinary C/C++.
- Prior SDK reuse added433 verified library extents /67471 bytes; none are
  relabeled game source. All1257 prior extents survive; the ratchet now protects
  **1261**. Four removal negatives reject loss of any new body.
  Unique verified engine+library extents cover356893/1089680 retail .text bytes
  (**32.752%**, relocation-normalized; NOT whole-file identity or authored C++).
- The previous **66** fixtures passed after a forced same-output rebuild; warm/fresh
  binding JSONs are identical. Three removal negatives reject loss of either
  CRT exception-table caller or a new SDK body. No new assembly definitions
  or relaxed binding ownership.
- Current source-wave receipt: `target/work/proof/material_pass_checkpoint.json`.
  The accepted SDK checkpoint is `target/work/proof/sdk_checkpoint.json`. Current referees:
  `target/work/proof/latest/`. Layout: `target/work/layout/current.json`.
- **Whole-file retail SHA does not match. No release or runtime proof.**

### Actual whole-file work completed

Current source wave:

- Four new accepted bodies: stream-index parsing10018f90/89, destination
  parsing10018ff0/197, source parsing100190c0/216, and four-layout declaration
  building10016740/53. Index bounds warn but do not reject; narrow before
  adding to preserve byte wrapping without signed-overflow UB. The builder
  reloads the actual declaration pointer after each device call.
- Restored complete DX9 pass loading: state map, sorted vertex routes, vertex
  shader/arguments, then pixel shader/arguments. Exactly16 routes is rejected
  after parsing its final semicolon; zero routes and reused declarations follow
  the original paths. This does not mean the whole pass is byte-verified.
- Restored DX9 and DX7 technique-file loading, both capped at four passes and
  freeing file data before final allocation. The original DX7 path does not
  write technique flags; the DX9 path accumulates shader flags. Original full
  boundaries are595/580 bytes, not inventory588/569.
- Restored technique-set loading and both cache layers. Quoted groups may
  share one technique; wholly inactive groups skip loading. Mixed active and
  inactive labels all receive the same loaded technique. Primary34-byte use
  mask lives beside material stream tables; existing type-name lookup is reused.
  Error cleanup and the original EOF-with-pending-label behavior are preserved.
- New native32 source fixtures pass96 routing/pass cases,50 technique-file
  cases and51 technique-set/cache cases. All71 fixtures passed after the
  final build, including source attribution and all prior source fixtures.
- Byte-equal but unaccepted: shader handlers75 each, cached technique101,
  cached set79 and pass-shader parser266; their unresolved dependencies still
  block binding. Vertex-route loader599 vs587, technique loaders600/589 vs
  595/580, technique-set557 vs556 and pass dispatcher71 remain drafts.
- Keeping real shader handlers out of line reduces DX9 technique742 to600;
  primary calls justify this guard, not historical annotation provenance.
  A shared-separator goto trial worsens557 to565 and is removed. Do not repeat.
- Stages1-3 are NOT complete. Material loading now has a much larger connected
  source path; the real GetRefAPI entrypoint is still missing. Never add dummy
  callbacks or a partial table to claim stage3. Whole-file/API/GPU proof remains open.

Previous shader creation source wave (no new accepted game bytes then):

- Added `src/gfx_d3d/r_material_shader.cpp`: real cached shader compilation,
  original PC macros/include callbacks, compiler warnings, FP restoration,
  16-byte shader header/program/name allocation and vertex/pixel device creation.
  The shared shader header replaces the old unnamed length bytes, with pinned
  offsets. Original error-path releases and leaks are preserved, not repaired.
- Added the real Material_LoadPassShader parser/cache/compiler/cache-insertion
  path in material_load_obj. Its full266-byte body is masked-equal at1001a810,
  but binding correctly rejects its unresolved Material_CreateShader callee.
  It uses the existing I_fround helper; if later accepted its assembly expansion
  must be explicitly excluded rather than counted as ordinary C++.
- New source fixtures pass252 creation routes and36 parser/cache routes. The
  former tests actual32-bit allocation/header sizes, PC macros, include calls,
  shader types0/1/256, versions including negatives, 65540-byte programs,
  all release/leak branches and FP restoration. All68 fixtures passed after
  the completed connected build; no simultaneous rebuild/freshness race.
- Compiler body is708 versus retail705, with differing local slots and a real
  `_clearfp` call versus FNCLEX. One original-VC7.1 probe confirms pragma
  intrinsic(_clearfp) is unsupported (C4163). No authored assembly was added
  to force the match. Explicit typed include-object modeling gives the same
  result as the pointer-shaped draft; do not repeat either variant.
- All1257 protected extents survive the connected wave. Candidate .text is
  now876562 bytes (was875554): real code growth, not padding. Raw same-offset
  equality is8.0247%; it remains a layout diagnostic, not source coverage.

Previous accepted SDK integration:

- Material_SetPassShaderArguments is compiled from the real source tree, no
  longer appended from a test-only fixture. Its real D3DX shader-table call
  pulls original Summer2004 SDK objects, growing candidate .text from437792
  to875554 bytes. This is library reuse, not newly authored game source.
- The217-byte wrapper still differs in register allocation. Its SDK entry
  also fails binding closure through operator new. Neither is counted as a
  match; the433 accepted library extents are independently verified bodies.
- Corrected a literal-bounds bug exposed by the new library layout. The old
  checker attributed unnamed data after a5-byte fabs string to the string.
  Bounds now reject that. Two real12-byte CRT exception tables get their exact
  extents/owners from linked PDB contributions, independently confirmed against
  original VC7.1 COFF records. Their internal code labels must keep exact
  instruction offsets inside one matched owner, with a verification dependency.
  Full data/pointer checks and one-to-one ownership remain; no old gate removed.
- Warm candidate raw same-file-offset equality rises from2.044% to7.863%.
  This diagnostic includes headers/data/debug and is NOT source completion.

Previous cubemap/gamma source checkpoint:

- New accepted source: BGRA vertical flip100266f0/97 and hardware gamma
  upload100307e0/91. The uploader copies the real512-byte GfxGammaRamp into
  three SDK gamma channels and routes it to the actual target swap chain.
- Added complete source for cubemap begin/end/save, readback, flipping,
  software gamma, TGA output and Fresnel-alpha routing. These close real API
  dependencies, but **only the two bodies above receive new coverage credit**.
  Tests cover90 begin cases,576 capture routes,144 saves (including257-pixel
  headers),48 hardware ramps and35 software-gamma buffers. Readback failure
  still flips; write failure still frees both buffers; original dangling saved
  pointers are preserved, not silently fixed.
- Remaining blockers: begin -> render-target setup -> viewport366; end ->
  gamma-table producer157; save -> copy89's one SIB encoding difference and
  alpha262-vs266 -> FresnelTerm. Several callers already have equal bytes but
  fail dependency binding. No masked-only or native-test result is credited.
- The producer's real second caller and GfxGammaRamp type fix its argument
  convention and two caller bodies. Its loop-tail scheduling remains different;
  stop syntax sweeps and use original TU/function-set evidence next.
- Gamma/alpha drafts reuse the existing I_fround assembly helper. They are
  unaccepted; accepted exclusions remain31 bodies/7787 bytes. If either later
  matches, its assembly expansion needs explicit exclusion review. The stricter
  build gate will reject unreviewed accounting instead of inflating C/C++ credit.

Previously accepted and still protected:

- Restored the real BeginDebugFrame callback, API59 slot49:73 bytes accepted.
  It saves the original frame pointers, unlocks the original vertex cache when
  needed and switches to the embedded debug frame. Eight routing tests pass.
- Restored typed debug-frame storage and pinned its used offsets at compile
  time. Candidate .data virtual size grows from1248244 to3648180 bytes, versus
  retail6086100. This is genuine state, not padding; full original global size
  and final placement are NOT independently proved by the callback match.
- Restored shared view setup10025570:286 bytes accepted. This is needed by
  LOD-origin and scene submission.192 view/LOD behavior cases pass. The LOD
  callback itself remains unaccepted: a floating constant operand width differs.
- Restored four primary-proven empty API callbacks and the sun-reset wrapper
  for eventual GetRefAPI closure. These receive **zero new credited bytes**;
  they are not invented substitutes for missing implementations.
- Current candidate has158 temporary exports and still no GetRefAPI.54 of98
  written API slots now have accepted implementations. The real front door is
  **not implemented yet**; completing its actual callback graph remains first.
- Current .text virtual size437792 versus retail1089680. Raw same-file-offset
  equality is2.044084%; this is a layout diagnostic, NOT source completion.
- Retail debug metadata pins an age1 PDB at the original c:\\builds path. Our
  reused PDB has a different GUID and increasing age. These remain real SHA
  blockers, not hash fields to silently ignore or patch.

### Cleanup

One active source tree and one incremental build; no duplicate build created.
Superseded handoffs, duplicate status files, notes, claims and rules are saved
in `archive/docs_20261021/`, not erased. Old goals and paths are not instructions.
Required gate inputs are local in `target/work/proof/history/`; API evidence
and inventory are local in `target/work/proof/retail/`. Inactive entrypoints are
in `archive/legacy_entrypoints/`. Shared target/src headers remain required.
Unrelated staged work is preserved, not bundled into this cleanup. No push.

### Next work

1. Recover API59 GetRefAPI and the typed callback/caller graph. Retail has 108
   slots: 98 written callbacks, ten initial zeros.54 written slots have accepted
   implementations; unverified does not mean source absent. Use primary code
   and `target/work/layout/api_callbacks.tsv`; never guess signatures or stub bodies.
2. Close the existing shader source, not another imported implementation.
   Material_CreateShader1001a4c0/705 now exists and compiles708; actual PC
   defines are {"PC","",0,0}. Resolve local-slot ownership and the evidenced
   FP-instruction difference without guessing compiler flags or adding assembly
   to inflate C++ coverage. There is also a real cached registration wrapper
   at1001a7b0..1001a803 (omitted by the inventory), plus include construction
   at1001a790. The pass parser already reproduces266 code bytes but is blocked
   by the compiler body. Resolve SDK operator-new closure separately; no gates
   may be loosened. Do not repeat the unsupported _clearfp intrinsic probe.
3. Replace temporary roots with genuine reachability as connected groups close,
   retaining all accepted extents. Candidate has158 exports and no GetRefAPI;
   retail exports only GetRefAPI. Recover TU/data/library ownership alongside code.
4. Complete missing real source and original dependency calls. Reuse exact
   VC7.1/Summer2004 libraries and correct upstream source, not library reversal
   for a counter. Resolve exact layout and metadata, then cold rebuild and smoke.

Same-object relinking already reproduced raw .text/.data/.reloc but changed
timestamp/debug/.rdata/whole-file SHA. This is a real reproducibility blocker;
no output patching or normalized hash may substitute for retail identity.

### Resume

From gfx: `sh target/work/tools/build.sh`. Use `--rebuild` only when warranted.
Full fixtures: `python3 target/work/tests/run.py` (fails immediately on a failed
child). A stale broad extraction in the viewport fixture included the new gamma
function; it now extracts only its intended setter. All assertions remain.
One output: `target/build/codex_boundsoutside_1016_02`; `target/work/build` is
a symlink, not a duplicate. No own builds remain running. Before retrying source
forms, read `target/work/ATTEMPTS.md` and archived NOTES.md. Do not repeat the
three recorded LOD syntax trials; investigate genuine compiler/caller context.
The shared view helper and debug callback now MUST survive every wave. r_bsp upload/init
and light-history drafts remain unaccepted: preserve them without counting them.
Do connected source work next, not another parser/report framework.

Anchor SHA256:
`4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`.
Previous material-source candidate SHA256:
`070ae3b624fb297cc62d968779b80d095204140b990869f50a5cef6c9259067c`.
Relinking can change debug/timestamp bytes; current actual SHA is in
layout/current.json; immutable receipts keep historical build measurements.

### Limits

Forced compilation passed in the one existing output; no independent fresh
checkout replay or client/GPU smoke test. Do not run receipt-dependent fixtures
against a simultaneously rebuilding DLL: the source-coverage freshness check
correctly rejected that intermediate state; the post-build full rerun passed.
Historical layout receipts are frozen
in proof rather than pointing at the mutable layout/current.json.
No reliable whole-project completion percentage or release date is established.
Renderer checks no longer need dev/codex, **but client/deepseek tools still use
codex/client/salvage_gemini/data/names_1.0.json**. Deleting that folder can break
those tracks; they were not modified here. No retail binaries/assets committed.
