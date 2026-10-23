# Renderer progress

## Structure-first Direct3D device wave - 2026-10-23

Work only in gfx. Source: `target/work/src/`. Plan: [WHOLEFILE.md](WHOLEFILE.md).
This is the sole current progress/continuation log. Update it instead of creating
new handoffs. Machine proof receipts and technical reference notes stay separate.

### Latest source work

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
