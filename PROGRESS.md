# Renderer progress

## Current verified checkpoint - 2026-11-03, small helpers

C/C++116526/253580=45.952362174%,721 bodies; +204B/+7 bodies since
bb21ec4. All2511 source/library extents pass the unchanged binding referee;
all prior candidates and accepted extents survive.36 assembly-bearing bodies/
8601 code bytes remain excluded. The denominator is provisional, not whole-file
completion. Root src/ remains10 complete verified files/61 emitted functions.

The PC transparency probe now returns the existing byte type Bool, reproducing
retail's AL-only normalization:46 new C++ bytes. A shorter candidate-search
anchor exposes six already compiled C++ bodies (158B): load-step logging31,
image-list collection23, outdoor coordinates25, static-model index-cache init20,
backend color update28 and parse-session end31. Full bytes, operand bindings,
imports, extents and dependency closure remain mandatory. Six new library
extents are accounted separately.15 new raw candidates do NOT mean15 matches.

Shadow receiver source now has one direct expression, avoiding extra float
rounding stores:102->69 bytes. Retail is also69, but pointer centering still
differs (+8 versus+4); this draft earns ZERO coverage. It remains in work/src/.
Failed image inline, fallback register, model-name and sphere-cull trials are
restored and recorded. No new assembly, workers, extra build output or clean-TU claim.

Fixtures:30 actual capability probes,192 model-name boundaries,70 shadow paths,
361 hardware startup and631 light gather/cull cases pass, as do image lookup/
shutdown and the10-file clean-source audit. 20 new-extent removal negatives cover
both game retention gates and the all-extents gate for libraries. One physical
build output; seven incremental links this wave. Token totals are unavailable.

Receipt: target/work/proof/nov03_small_helpers_checkpoint.json. Raw same-offset
file equality12.923033048%; C++ growth is not whole-file equality. Whole-DLL SHA
and GPU smoke remain unfinished. No push; unrelated354 staged files and
rb_state.c are untouched. Old checkpoints below are historical.

## Earlier verified checkpoint - 2026-11-03

C/C++116322/253580=45.871914189%,714 bodies; +391B/+9 bodies since
cfe7803. Both referees agree on the complete accepted set. All2498 protected
source/library extents pass. The denominator is inventory-based/provisional,
not whole-DLL completion.36 assembly-bearing bodies/8601 code bytes stay out.

Clean src/ now contains10 complete verified files/61 emitted functions. The
buffer TU has all6 bodies verified, in retail order across515 bytes including
matching padding. Four established bodies anchor the two previously ambiguous
free helpers. Other newly verified bodies are six math helpers and I_isupper.
Independent region certificates use a frozen pre-discovery seed; the unchanged
old referee reproduces the exact final accepted set.18 deletion negatives pass.

Window settings now matches its208-byte extent:190 code +18 table/padding bytes.
Shared aspect-result labels reproduce retail's block order. Its existing rounding
assembly excludes the whole190-byte code body from C/C++ credit. Both retention
gates reject deleting it. Device creation271 is still uncredited: resource
initialization has other unresolved calls. Do not infer closure from its first
reported blocker alone.

Native126 video routes,1248 picmip policies and1024 lightmap directions pass.
The lightmap generator remains an unmatched589/605-byte draft; its closer size
adds zero coverage. Failed header-precision, channel-loop, store and scope trials
add zero. Coverage publication now preserves the last valid report on failure;
the actual shell-fragment failure/success fixture passes. One build output, no
workers. Token totals are unavailable; no cost estimate is invented.

Receipt: target/work/proof/nov03_buffer_window_checkpoint.json. Same-offset
file equality12.929784724%; whole-DLL SHA and GPU smoke remain unfinished.
No push. Unrelated354 staged files and rb_state.c are preserved.

## Earlier checkpoint - 2026-11-03

Latest verified C/C++:115931/253580=45.717722218%,705 bodies. +513B/+6
existing C++ bodies newly verified through direct-callee disambiguation;38 new
source/library extents separately accounted,2488 protected extents retained.
Both referees pass; independently derived candidates through the unchanged old
referee reproduce the exact accepted set.12 C++ deletion negatives pass.
No compiler rebuild, new assembly or worker was needed for this verification
gain. Token totals are not exposed; no cost estimate is invented.

Root src/ now contains9 fully verified TUs/55 emitted functions: the entire
texture-memory unit is included. Copying it adds no coverage. Mixed drafts stay
in target/work/src/. Receipt: target/work/proof/nov03_callee_checkpoint.json.
Whole-file SHA and GPU smoke remain unfinished; denominator is provisional.

Last verified C/C++:115418/253580=45.515419197%,699 bodies; +801B since
b26ed3b. The reconstructed index allocator adds72 fully matched bytes.
GetRefAPI's paired pointer stores disambiguate EndRegistration79 and
FinishLoadingModels33. Both referees and all2445 prior extents passed; an
unchanged old-referee replay accepts exactly the same set. Both retention gates
now protect2448 extents and reject removing all three new bodies. The112 API
bytes are newly verified existing source; the allocator is newly recovered code.
The reconstructed particle builder544 now matches fully and pins its73-byte
vertex-unlock helper. Both referees and all2450 protected extents pass; removing
either new extent fails both retention gates. No new assembly. Device-resource
creation261 stays uncredited: render-target initialization remains unmatched.

Frozen evidence: target/work/proof/nov03_particle_cloud_source_coverage.json,
nov03_api_old_referee_replay.json and nov03_api_ambiguous_negatives.json.
The denominator remains provisional. Whole-file SHA and GPU smoke are unfinished.

The particle position-array lifetime and UV-before-index table initialization
match; volatile UV reads were rejected and reverted. Physical build
outputs can be unaccepted probes; do not quote them as fresh coverage. The81-byte
static-model helper's matching bytes remain uncredited because its lighting
sampler is unmatched. No goal completion or user-requested pause is recorded.

## Active verified checkpoint - 2026-11-03

C/C++114617/253580=45.199542551%,694 bodies: +121B/+6 bodies
since1800136.61B are newly verified existing JPEG callbacks;60B is the restored
R_ScreenshotFilename helper.2445 protected source/library extents, all retained.
35 authored-assembly-bearing bodies/8411B stay excluded; API65/98 unchanged.
The denominator is inventory-based/provisional, not proof of whole-file coverage.
Root src/ now has8 complete verified files/49 emitted matches including JPEG.

Screenshot source corrections:256-byte level-shot filename buffer, recovered
filename helper, counter while loop, inlined JPEG capture and the second switch's
default return. LevelShot159 and ScreenShotCmd567 now byte-match, but remain
UNCREDITED: resampling's unresolved call chain blocks binding acceptance. Do not
count these726 bytes or promote the incomplete screenshot TU to clean src/.

Native1920 pixel-filter comparisons against independent area/center formulas
and63 screenshot command cases pass. Existing six verifier fixtures and JPEG
old-referee replay pass. Both retention gates reject deleting the60-byte helper;
10 callback removal negatives were also checked. No new authored assembly.
Pixel-filter local-lifetime and cube-stride changes are tested, unmatched drafts.

One build output, zero new workers. Four screenshot build attempts; one receipt
was correctly rejected because source changed while its referees ran. Final
build, both referees, source-freshness and regression pass. Raw same-offset meter
is12.903966313%; whole-DLL SHA and GPU smoke are unfinished.
Receipt: target/work/proof/nov03_jpeg_screenshot_checkpoint.json. No push.
Gemini's scene files/assignment and the owner's354 staged files are preserved.

## Active: complete JPEG TU verified - 2026-11-03

The full r_jpeg.cpp now passes: all10 emitted bodies and their bindings.
Copied the unchanged verified file to root src/gfx_d3d/r_jpeg.cpp. Clean src/
now holds8 complete verified files/49 emitted matches. Copying adds no coverage.
The five existing callbacks add61 newly verified C++ bytes:114557/253580=
45.175881379%,693 bodies, using the established inventory-based denominator.
The old inventory omits these callbacks; this meter alone cannot establish100%.

Discovery uses paired MOV-immediate HIGHLOW sites in the already verified JPEG
producers, exact instruction prefixes, one consistent destination, <=32-byte
source bodies, aligned/trap-padded target boundaries and existing byte/binding/
import/extent/call gates. No global RET search, mask change or new assembly.
An independent source/retail raw-body comparison and unmodified old-referee
replay accept exactly the same set. No overlap with prior accepted extents.
Six focused verifier fixtures and10 removal negatives pass; all2444 protected
extents remain. No compiler build was needed for this verification gain.

Root proof records the original discovery separately from producer-derived
candidates and pins the old-referee replay. Existing JPEG encoder/decoder/Pillow
results apply to unchanged source. Whole-DLL SHA/GPU validation is unfinished.
Gemini's scene worktree remains untouched. Main frame/cube trials continue;
those candidates are uncredited until the full pipeline accepts them.

## PAUSED after JPEG checkpoint - 2026-11-03

Verified C++114496/253580=45.151825854%,688 bodies. Since871d13e:
+1856B/+6 engine C++ bodies, plus221B of IJG dependency code counted separately.
All2432 prior extents retained; both gates now protect2439. All14 new-removal
negatives pass.35 assembly bodies/8411B remain excluded. API65/98 bodies accepted.
Raw same-offset12.896674502% is a separate meter. Whole-DLL
SHA and GPU smoke remain unfinished. No full-suite repeat or new normalized-span
audit; affected real JPEG encoder/decoder and frame/image tests pass.

New engine matches: R_LoadJpg785, Image_LoadRaw169,
Material_RegisterRawImage81, R_RegisterRawImage30, R_SaveJpg713 and
R_TakeScreenshotJpeg78. Library jpeg_CreateCompress221 also matches.
Memory-source setup needed actual inlining and one captured source-manager
pointer. Compression needed the three-argument constructor with allocator
callbacks set on cinfo, preserved as an aggregate across clearing the object.
This preserves the independently matched constructor and fixes its inlined save
path. Existing real IJG tests and an independent Pillow decode pass.

One build output, no spawned workers. Fourteen original builds since the last
commit: eight earlier image/math trials gave zero gains and were set aside;
the resumed source-lifetime/JPEG work used six. No new assembly or CPU flags.
Small unmatched cache/cull/model/frame/cube drafts remain identified in the
handoff; they are not credited. Their native behavior is tested.

Root src/ remains seven verified files/39 emitted matches. DO NOT promote
r_jpeg.cpp yet: five sparse callback bodies still lack accepted placements.
They are a candidate-discovery gap to investigate, not permission to relax the
referee. Exact follow-up is in HANDOFF.md and target/work/ATTEMPTS.md.

Gemini's separate worktree/branch and five-body SCENE_01 mission are preserved.
Its1152-case native baseline passes. WORKERS.md records disjoint ownership;
Codex did not edit r_scene.cpp. A setup backup is target/work/workers/SCENE_01/.
Worker results do not count until the serialized original-toolchain gate here.
Receipt: target/work/proof/nov03_jpeg_checkpoint.json. No push performed.

## Active JPEG/image gain and worker setup - 2026-11-03

Verified C++113705/253580=44.839892736%,686 bodies: +1065B/+4 bodies.
R_LoadJpg785B, Image_LoadRaw169B, Material_RegisterRawImage81B and
R_RegisterRawImage30B now pass both referees. All2432 prior extents retained;
retention now2436, and both gates reject removing each new body (eight negatives).
35 assembly-bearing bodies/8411B stay excluded. No new assembly or verifier
relaxation. Whole SHA and GPU smoke remain unfinished.

The real IJG memory-source setup now inlines in the image loader and retains
one source-manager pointer, as retail does. Forcing inlining alone gave837B
with repeated cinfo->src reloads; capturing that pointer restored the785B body.
Existing JPEG decoder and frame/image native fixtures pass. This is active
work, not a paused checkpoint. No commit or push was made for this wave.

Gemini checkout: worktrees/gemini on workers/gemini-gfx, based on871d13e.
SCENE_01 owns r_scene.cpp's five scene-command bodies/1363 target bytes.
WORKERS.md and its GEMINI_START_HERE.md define ownership, references and the
single serialized whole-DLL gate. The worker's native1152-case scene baseline
passes; no duplicate build was copied. Code changes here remain in the primary.
Queue/map generator: target/work/tools/work_queue.py. Ownership gaps and
heuristic complexity are explicit, not asserted original PC TU provenance.

Active again at owner request, 2026-11-03. Resume matching; no checkpoint requested.
The PAUSED entry below is the previous saved state.

## PAUSED - owner requested checkpoint, 2026-11-02

Verified C++112640/253580=44.419906933%,682 bodies, UNCHANGED.
This pass added ZERO verified bytes or bodies. All2432 protected extents remain;
35 assembly bodies/8411B excluded. API64/98 accepted; raw same-offset
12.913634714% is a separate meter. Whole SHA/GPU unfinished.

Cost: eight original builds, one reused output, no workers. This was poor yield.
Bounded lightmap/cubemap/Fresnel/CPU trials did not match and were reverted.
Their results and complete last trial patch are saved; do not repeat them.
The final three small shader-cache/cull/model-pointer source edits remain
UNMATCHED drafts in target/work/src; they pass behavior fixtures and retain
all prior matches. They add no coverage. Compiler profile and image source
are restored to the previous checkpoint. No new assembly or retained CPU flags.

New tests pin1024 lightmap directions/4096 bytes, retail's carried normalized Y,
and Fresnel values/symmetry/NaNs. Existing shader preload and visibility cases,
assembly-exclusion negatives and the verified-only source gate pass. Root src/
remains seven fully verified snapshots/39 emitted matches, unchanged.

Resume from this build; no compiler is left running. Read target/work/ATTEMPTS.md
first. The nearest-diff ranking in proof/nov02_nearest_ready_functions.json is
DIAGNOSTIC ONLY: its zero-open count ignores indirect/data/import/out-of-range
bindings. R_InitRenderCmds is an explicit counterexample. Inspect actual bind
reasons before selecting another group. Do not repeat the final three syntax
forms or count near matches as progress. Receipt: target/work/proof/nov02_pause_checkpoint.json.

## Specular dependency closure - 2026-11-02

C++112640/253580=44.419906933%,682 bodies: +528B/+3 C++ bodies.
Image_GenerateSpecularity119B, Image_RebuildCosinePowerMap202B and
RB_UpdateBackendDvars207B now pass both referees. Their shared lookup also
matches262B, but its existing inline I_fround assembly excludes that entire
body from C++ coverage. Mixed gain790B/+4 bodies;35 assembly bodies/8411B
excluded. All2428 previous extents retained; both gates now protect2432.
API callback count remains64/98 accepted. No new assembly or synthetic roots.

The source fix is one explicit double intermediate before the original clamp.
It restores retail x87 comparisons and unlocks the three real callers through
their dependency chain. Target RET at10029425 confirms262B; the old GLM259B
inventory omitted the final three-byte stack adjustment. No target truncation.

Cost: six original builds, one reused output, zero workers; token meter not
available. Rejected clamp/cubemap trials recorded in target/work/ATTEMPTS.md.
The first trial correctly failed stale-source accounting, and new lookup
acceptance correctly demanded a separate assembly exclusion. Both were handled
without weakening the checks. All eight removal negatives pass. Final source
fixtures cover8192-byte lookup,134 procedural image routes and422 backend/
image rebuild routes. Full-suite/GPU/whole-SHA work remains unfinished.

Image_LoadBuiltin519B remains UNCOUNTED: next binding blocker is
Image_LoadLightmapWeights, followed by the remaining generated-image helpers.
Do not repeat the rejected cubemap precision, rowBase-hoist or VectorCopy trials.
Root src/ remains seven verified-only files/39 matches. Whole-TU promotion of
the lookup was refused: two emitted11B float-log symbols have ambiguous retail
placements. The lookup body remains verified in target/work/src/gfx_d3d/;
no partial file was promoted. Raw same-offset12.906504943%; separate from C++ coverage.
Candidate SHA is in the receipt. No fresh normalized-span audit.
Receipt: target/work/proof/nov02_specular_checkpoint.json. Work remains active.

## Image/API verification checkpoint - 2026-11-02

C++112112/253580=44.211688619%,679 bodies: +29B/+6 existing callbacks
newly verified through the actual GetRefAPI pointer stores. All2422 prior
extents retained; both gates ratcheted to2428. API64/98 accepted,34 unmatched.
34 assembly-bearing bodies/8149B excluded, unchanged. No new algorithm body
accepted. This is a small verification gain, not a reconstruction breakthrough.

Short callback placement is limited to real relocated API MOV stores, exact
known retail starts/extents <=12B and unchanged byte/binding checks. An
independent replay of the previous unmodified referee with those API-pinned
candidate addresses accepts exactly the same set.12 removal negatives pass.

Image interface/callers now use semantic then imageTrack; solid/water color
helpers use RGB arguments while preserving BGRA pixels. Corrected specular
PI precision and loop order from target evidence. Image_LoadBuiltin519B now
matches instructions but remains UNCOUNTED because shared callees do not bind.
Specular lookup and Image_Register remain unmatched; rejected clamp/helper/
water probes are documented in target/work/ATTEMPTS.md. Retail preserves NaN;
no NaN behavior fix is claimed.

Cost:10 original builds, one reused output, zero workers; token meter unavailable.
This was poor matching yield.11 verifier fixtures, eight final image fixtures,
original-referee replay and verified-only snapshot check pass. No full-suite
repeat or fresh normalized-span audit. Raw same-offset12.915741237%, separate
from source coverage; whole SHA and GPU smoke unfinished. Root src/ remains
seven verified-only snapshots/39 matches; active source target/work/src/.
Receipt: target/work/proof/nov02_image_api_checkpoint.json. No push or goal pause.
Next: use the fixed graph and recorded residuals; do not repeat rejected
specular clamp helper/std::min/max or water operand-order probes.

## Small screen-clear checkpoint - 2026-11-02

Verified C++112083/253580=44.200252386%,673 bodies. Added255B/+2 bodies:
RB_ClearScreen211 and RB_ClearScreenCmd44. All2420 previous extents retained;
ratchet now2422, with both new removals rejected by both gates.34 assembly
bodies/8149B remain excluded. API callback count stays58 accepted/40 unmatched.

Retail's clear log names nativeColor.packed. Restored the four-byte local
color union and its exact stringized expression; the prior instructions
already matched but the diagnostic string prevented acceptance. One original
build, both referees, log/old-spelling negative, source attribution/six assembly
negatives, linked API and verified-only snapshot checks pass. No full-suite or
fresh normalized-span audit repeated. SHA/GPU unfinished. Root src/ unchanged.
Receipt: target/work/proof/nov02_clear_checkpoint.json. Matching remains active.

## Callback matching batch1 - 2026-11-02

Verified C++111828/253580=44.099692405%,671 bodies (+212B/+1). API callbacks
58 accepted/40 unmatched. R_SetLodOrigin212 now passes both referees: fix the
constant FOV conversion using existing float DEG2RAD evaluation. All2419 prior
extents retained; both gates ratcheted to2420 and reject removing this body.
34/8149 authored-assembly exclusions unchanged; only GetRefAPI exported.

Material fixup now retains texture/constant cursors across callbacks, as retail
does.78 material cases pass, including a new owner-replacement regression
that rejects the previous implementation. Image registration may inline in
that real caller; an earlier never-inline assertion was unsupported. These
material bodies remain UNMATCHED, with no added coverage. Sun branch layout
and frame OR branch are closer; shared callee closure remains open.

Three bounded original builds, zero workers, affected source fixtures only.
Rejected size pragmas all removed; no new parser, build tree, roots or assembly.
LOD192, frame4105, image92, material78, sun144 and raw-material fixtures pass;
linked API, source attribution and verified-only snapshot checks pass. No full
suite repeat or fresh whole-file span audit; previous188-fixture/audit result
is historical. Raw same-offset 12.917307625829647%, NOT source coverage. SHA/GPU unfinished.

Receipt: target/work/proof/nov02_callback_match_checkpoint.json. Active source
stays target/work/src; root src/ stays seven verified-only snapshots/39 matches.
Next: connected material helper/loader matching; do not repeat /Os probes or
chase isolated scheduling changes before shared callees. Exact residuals in
ATTEMPTS.md and target/work/scratch/callback_match_1/.

## Step3 source closure complete - 2026-11-02

Step3 source/API/dispatch closure is COMPLETE (2026-11-02). The owner resumed
work; old PAUSED sections below are historical. All98 actual API59 callbacks
have compiled source and the DLL exports ONLY GetRefAPI. The initializer is
1051-byte/binding-identical;108 slots include ten genuine zeros. Visibility/
portal gathering, shadow generation, outer scene/RenderScene and the complete
backend/tess dispatch tables now connect through real callers. No placeholder
callbacks, synthetic retention array, extra TU, new assembly or flags.

C++111616/253580=44.016089597%,670 accepted bodies: +2079B/+8 bodies since
the previous pipeline checkpoint.34 assembly-bearing bodies/8149B are excluded,
including existing water/FFT helpers newly retained by the real graph. Original
compiler/link, both referees and all2393 prior extents pass; protection now2419.
Both strengthened gates reject removing GetRefAPI.188 fixtures pass across
recorded runs resumed at repaired fixtures, plus independent byte/data replay.
Normalized verified retail spans1275503/1851392=68.894269825%; raw same-offset
12.908179359%. These are different meters. Whole SHA remains unmatched.

112 TUs,29 preserved fragments, unique full object paths and12 shared global
owners checked. API table:57 callback bodies accepted,41 still unmatched.
Root src/ stays seven verified-only files/39 emitted matches (be356f3); mixed
working files are NOT promoted. Actual active source is target/work/src/.

This completes the requested connected-source structure pass, not historical
PC TU-boundary proof, every original code/data contributor, final offsets,
whole-file identity or GPU smoke. Next is bounded matching of the41 callback
bodies and shared dependencies using this fixed graph/order, then remaining
contributors, exact data/library/layout/metadata and SHA. Keep the real single
export; never restore artificial roots to gain a meter. One active build only.

Receipt: target/work/proof/nov02_step3_checkpoint.json. Failed single-export
trial and accounting/fixture corrections are retained in ATTEMPTS.md. The
final link passed byte/binding/regression; the build wrapper then stopped on
its old assembly-exclusion expectation. Attribution was reviewed, extended to
EXCLUDE the two existing asm-bearing bodies, and rerun successfully on the
same unchanged DLL. No build or game binary is committed; no push.

## Historical checkpoints below

## Current: PAUSED at pipeline checkpoint - 2026-11-02

Owner requested checkpoint then pause. Work is PAUSED; no own live build/test
job remains. Step3 is still IN PROGRESS and not complete. Eleven retail roles
restored this continuation: point-light draw, floatZ clear, depth setup, normal
mode, mode dispatch and shadow-cookie drawing; point-light surface gathering,
ranking/selection/partition generation and scene-light culling. Actual code in
working r_scene/r_shadowcookie/r_light/r_dpvs.cpp. Existing command9 matrix
record moved unchanged to r_scene_commands.h; same allocator/ABI,112 TUs.

Three successful original build/both-referee passes; one failed material-slot
layout assertion corrected before acceptance. All2392 previous extents retained.
27 affected fixtures plus verified-source snapshot check pass, including120
normal-chain and631 gather/cull cases. Only floatZ clear10024a40/53 gains new
byte credit. Other new bodies remain uncredited; body presence/native behavior
is not acceptance. Partition193B has a retail placement but unmatched selector
callees block it. Culling129B still has one multiply-load-order residual.

C++109484 ->109537/253580=43.196229987%,661 ->662 bodies.32 authored-assembly
bodies/7820B remain excluded. Both gates now2393, two removal negatives pass.
Same-offset10.424534620%, diagnostic only; candidate SHA256:
d40e530a2acb00eff3dc78f9df4f5cf8d8f23de8c3db11068b42f8d33c6d3aef.
Root src/ unchanged: seven verified-only snapshots/39 emitted matches, commit
be356f3; no mixed source promoted. New working source is saved, not published.

Why slow: batches were too small, with repeated build/review cycles before
closing larger dependencies. The plan also understated step3: missing outer
visibility/portal/shadow-generation implementations and the actual RenderScene/
API59 callback graph are real source work. No false claim that source presence
finishes it. Resume with larger connected implementation batches and one build
per prepared wave; avoid repeated tuning/reporting before main graph closure.
Exact next dependencies and residuals are in HANDOFF.md. No further work until
owner resumes. Receipt:target/work/proof/nov02_pipeline_pause_checkpoint.json.

## Current: scene modes and verified-only source snapshot - 2026-11-02

Step3 remains IN PROGRESS. Five real routines restored in working r_scene.cpp:
GetClearColor, frame-clear selection, DX7/fullbright/debug-shader scene modes.
Original compiler, both referees and all2391 old extents pass;20 affected
fixtures pass, including1152 clear/mode cases. GetClearColor10024920/156 adds
verified credit. Four other bodies remain unmatched; native correctness alone
is not byte proof. Explicit layout check caught registered/clearScreen field
confusion before acceptance; correction and failed build retained.

C++109328 ->109484/253580=43.175329285%,661 bodies.32 authored assembly
bodies/7820B still excluded. Both gates strengthened to2392, with two removal
negatives. Same-offset10.390290117%, diagnostic only. Candidate SHA256:
5dcf29d6e56b68e13a7a9e7775009cf597d173e42cb1a40f2390fd5baad72128.

Owner requested actual source files, then ONLY verified files in root src/.
Committed verified-only snapshot be356f3: seven C++ files,39 matched emitted
functions, every source definition accounted for, pinned build evidence and
check script. No mixed r_scene/r_rendercmds/backend files promoted. Validate:
python3 tools/check_verified_source.py. src/ is an immutable inspection/release
snapshot, not a standalone renderer build or second development tree. Working
code stays in target/work/src. SOURCE.md explains both locations. Unrelated
staged scratch changes preserved byte-for-byte; no push or deletion/cleanup.

Next: normal scene mode/depth/light/shadow dependencies, visibility and main
RenderScene driver, genuine API59 GetRefAPI. Direct primary normal dependency
records saved; source for those is not claimed. No full-suite/GPU/V4/V5 claim.
No own live jobs. Receipt:target/work/proof/nov02_scene_modes_checkpoint.json.

## Current: verified scene-dependency checkpoint - 2026-11-02

Step3 remains IN PROGRESS. Restored seven real source routines: point-to-cell
BSP traversal in r_dpvs.cpp; shortsort/quicksort in r_scene.cpp; begin-view,
light-properties, render-target and sun command producers in r_rendercmds.cpp.
Six now pass BOTH referees:93+70+301+146+79+87=776 new C++ bytes. Light writer
is still unmatched192B versus195B and receives no credit. Existing matched
allocator, packet layouts and data owners reused; no new TU/global/assembly/
export/root or compiler change.112 TUs, link order unchanged.

C++108552 ->109328/253580=43.113810237%,654 ->660 bodies. All32 authored-
assembly bodies/7820B remain excluded. All2385 previous extents retained;
both gates strengthened to2391 using hash-pinned scene_dependencies_warm_bind.
All12 independent deletion negatives pass.23 affected fixtures pass, including
86 sort/cell cases,33 real32-bit producer cases and fresh linked table/PDB checks.
Main sort's retail double division by record size is preserved. Two bounded
source corrections, exact before/after residuals and primary evidence retained.

Same-offset10.187469752% is diagnostic only. Candidate SHA256:
5d4fd19e1b4936ead60588fb8a2d8efbf0cc759da3331e2207c3ad9b5ae7e0dd.
Next: genuine scene-mode/visibility/shadow/light graph, RenderScene and API59
GetRefAPI. Their direct primary instruction records are ready; no simplified
Mac driver or guessed callback substituted. No full-suite/GPU/V4/V5 claim.
No live own build/test job; no cleanup/commit/push. Receipt:
target/work/proof/nov02_scene_dependencies_checkpoint.json.

## Current: executor and frame-submission checkpoint - 2026-11-02

Step3 remains IN PROGRESS. Restored16 genuine source routines: eight debug
rendering routines in the original rb_debug.cpp TU, four backend GPU benchmark
routines, the actual RB_ExecuteRenderCommands executor and three frontend
submission routines (R_IssueRenderCommands, R_EndFrame, R_EndDebugFrame).
The existing complete command/surface tables and real recovery, timer, fence,
cache, debug-transfer and presentation helpers are reused. No new assembly,
exports or artificial roots.112 TUs; previous relative order preserved.

Original compiler, BOTH referees and all2385 protected extents pass.11 focused
fixtures pass on the final build, including fresh linked table/PDB checks;
the earlier executor wave also passed27 affected fixtures. New native cases:
57 debug-render,84 executor,28 benchmark and22 submission. Tests mock engine/
device boundaries; they do not prove GPU operation or byte acceptance.

New verified C++ credit: ZERO. C++108552/253580=42.807792413%,654 bodies.
All32 authored-assembly bodies/7820B remain separately excluded. All three
submission bodies have unique masked retail placements (111+114+86=311B),
but binding rejects them on the unmatched executor/debug-transfer callees.
They remain uncredited; actual executor candidate598B versus retail608B.
Same-offset10.184877109% is diagnostic only. Candidate SHA256:
23d0d185385ab051b0d3b8a8a84cb1ed97e0d1fc89043485d21f9c70fd6db746.

Next: genuine RenderScene visibility/shadow/compositor graph and GetRefAPI
API59. Primary records for scene driver/dependencies are saved; import142 is
still unidentified and must not be invented. Executor matching would also
unlock two already-shaped submission bodies, but step3 closure remains the
current priority. No full-suite/GPU/V4/V5 claim. No commit/push or new cleanup.
One active build, no own live jobs. Checkpoint:
target/work/proof/nov02_executor_submission_checkpoint.json.

## Current: complete command-table checkpoint - 2026-11-02

Checkpoint saved at owner request. Step3 is still IN PROGRESS. All33 backend
command roles now have genuine source, with the complete34-slot retail table
linked: only terminating slot0 is NULL. All33 linked pointers independently
resolve to their real retained implementations. Surface table still resolves
all seven real implementations and its original raw-geometry null entry.
No dummy callbacks, marker roots, new exports, TUs, flags or order changes.

This batch restored17 source routines:12 late-post/glow presentation/debug
routines in src/gfx_d3d/rb_backend.cpp and five filter application/glow/blur
drivers in rb_imagefilter.cpp. Existing filter generation and identical
GfxImageFilter record are reused. Shared glow fields replace exactly the old
opaque20B; import145 is now typed float(float), with identical slot/size.
Primary/ref differences and the original-build declaration correction are in
ATTEMPTS.md; failed build/native diagnostic logs are retained.

Original compiler and BOTH referees pass. All2381 prior extents retained, plus
four newly verified bodies/246 C++ bytes: Goto12B,Call30B,Return18B,real surface
copy186B. New acceptance/protection count2385. Strengthened both existing gates
using hash-pinned late_post_warm_bind.json; each body's independent removal
negative is rejected. No weakening or assembly reclassification.

C++:108552/253580=42.807792413%,654 bodies (+246B).
All32 authored-assembly bodies/7820B remain separately excluded. Same-offset
9.998044714% is only a whole-file diagnostic.
Candidate SHA256:e805a6d4a537d48d611fee1299ecdf1f9a9366ceff67ef9a2ab0ac96103c1e39.

22 affected renderer fixtures pass, including34 real filter cases and119
late-post cases. Fresh linked command/surface pointer and PDB-owner checks pass.
No full-suite/GPU/V4/V5 claim. The new table now retains the formerly omitted
private handlers and sorted driver; this closes that earlier source/link gap.

Next: actual RB_ExecuteRenderCommands with its debug/benchmark dependencies,
then RenderScene scene generation and genuine GetRefAPI/API59. Restored table
is not a working-frame/complete-step3 or retail-SHA claim. One active build;
no extra cleanup, commit or push. Receipt:proof/nov02_late_post_checkpoint.json.

## Current: step3 draw-surface and sun source checkpoint - 2026-11-01

Step3 remains ACTIVE and IN PROGRESS. This continuation restored19 source
routines: sorted-surface time/technique helpers, the draw-surface driver and
command,13 sun routines and two sun commands.32/33 command roles now have
source. Only late-post remains among command roles; its blur/glow/debug
implementation dependencies still require genuine source. The complete command
table/executor and RenderScene/GetRefAPI graph are also still required.

Actual source: src/gfx_d3d/rb_backend.cpp and rb_sky.cpp. The shared backend
now models the real2046x104B lighting array and near-clip field at view+148.
All existing offsets/sizeof backend remain unchanged. Duplicate lighting type
in rb_shade was removed without changing any shader body. Failed build and
correction are preserved in ATTEMPTS.md and proof/latest/nov01_drawsurfs_failed_build.log.

Original compiler/both referees pass, retaining all2381 accepted extents.750
draw-surface cases,94 sun cases (distinct DX7/DX9 matrix owners),24 sun command
cases,22 affected fixtures, full lighting chain and PDB/table pointer checks
pass. Public sun drivers are emitted in the DLL. Private command handlers and
sorted driver remain omitted until their genuine command-table caller exists;
no artificial root/export was added. No full-suite/GPU or complete-step3 claim.

C++ remains108306/253580=42.710781607%,650 bodies:0 new verified
C++ bytes. Source restoration and tested behavior are distinct from byte credit.
Same-offset diagnostic9.045842264%; retail SHA not matched.
Candidate SHA256:1620cd3afd2b63ebb1c7dbfe15612d61daf24c3048a7e9b26f2d709f65e27fe4.
Receipt: target/work/proof/nov01_drawsurfs_sun_checkpoint.json.
No additional build copies, deletions, commits or pushes in this continuation.

## Current: step3 entity dispatch source checkpoint - 2026-11-01

Owner-authorized step3 is IN PROGRESS. Steps1/2 are complete. Cleanup freed
2481555665 bytes from32966 obsolete generated files; source, proofs, maps,
logs, symlinks and the one active build were retained. No broad deletion.

This request restored18 real source routines: nine sprite/oriented-quad helpers,
four line/rail helpers, two cylinder paths, entity selector/backend adapter and
the sprite command caller. Source lives in src/gfx_d3d/rb_tess.cpp and
rb_backend.cpp. Complete8-slot rb_tessTable is linked in its real backend
owner; all seven pointers bind genuine implementations and slot7 is retail NULL.
No new TU/order, flags, roots/exports or authored assembly. Existing I_fround/
FastSinCos reuse retains their separate attribution. SDK entity layout is116B.

Original compiler and both referees pass, retaining all2381 accepted extents.
Geometry fixtures pass including3888 line/rail and468 cylinder/entity routes;
120 sprite-command routes and all17 affected backend/entity fixtures pass.
PDB-owner and linked-table checks pass. Prior sprite source restores exactly
when removing only this batch's appended geometry and includes; no old source
or fixture assertions discarded. The SDK packet duplicate was fixed using the
existing COD2_SDK_TYPES guard; the failed build is explained in ATTEMPTS.md.

Verified C++ remains108306/253580=42.710781607%,650 bodies;
zero new matched-byte credit. Same-offset8.940786176%
is only a file diagnostic. Candidate SHA256:
357f97a241edbdc087aa642441f904ebf52cf4bb335b945f0006517b69b33421.

29/33 backend command roles now have source. The private sprite handler is
not emitted until its genuine command-table caller is restored; no artificial
retention root was added. Four command roles/dependencies, full command table/
executor, RenderScene/GetRefAPI and final byte/layout/SHA identity remain open.
No complete-step3, full-suite, GPU, V4 or V5 claim.
Receipt: target/work/proof/nov01_entity_dispatch_checkpoint.json.

## Current: step3 sprite dependency checkpoint - 2026-11-01

Owner authorized step3; it is IN PROGRESS, not complete. Earlier pause notes
are historical. Cleanup removed32966 obsolete generated files/2481555665 bytes;
active build/source/proof/logs/maps/symlinks preserved. See cleanup receipt.

Nine real source functions now close sprite and oriented-quad geometry in
rb_tess.cpp, reusing atlas fields, original MakeNormalVectors, shared tess and
backend state. Primary geometry/projection/NaN/BGRA behavior is pinned in
ATTEMPTS.md. Old file remains an exact prefix, no assertions removed, no new
TU/order/root/export/global/flag/assembly or partial dispatch table.

Original compiler, both referees and all2381 protected extents pass; their exact
accepted set is unchanged. Affected native checks pass:2129 surfaces,386 rigid,
1255 skinned,494 particles,72 stamps,10800 sprites and54 oriented quads, plus
PDB owner regression. MakeNormalVectors's array declarator was restored after
a link error; no alias/ABI adapter. No full162-fixture replay or GPU test.

C++ remains108306/253580=42.710781607%,650 bodies; zero new byte credit. These
new dependencies remain uncredited until a real byte/binding match. Same-offset
8.785929722% is diagnostic, no normalized-span audit this batch.
Candidate SHA256:1ab2bef1b0484f6b17e693e9757c8bab52d068176fabce436bad832243060a09.
Receipt: proof/nov01_sprite_group_checkpoint.json. Full tess/command dispatch,
RenderScene/API and whole-file identity remain open. Continue remaining real
line/rail/cylinder dependencies and genuine table/caller graph, not leaf tuning.

## Previous: existing layout validated and reused - 2026-11-01

Owner-authorized step2 complete. Kept the established tree, compile settings and
candidate order:111 unique TUs, all source/object paths present,29 preserved
fragments resolving and one definition for each of12 shared globals. No engine
source, headers, compiler flags, roots or object order changed. No rebuild needed.

Corrected one report-only ambiguity in the existing file_layout.py: both common
files compile to common.obj, so a basename dictionary overwrote the renderer
owner. Full PDB paths now resolve the collision; unresolved ambiguity fails
instead of guessing. Refreshed file_layout.tsv and extended the existing
PDB-owner test; it passes with I_strlen in gfx_d3d/common.cpp and printing/error
functions in qcommon/common.cpp. Step1 DLL/bind/accounting hashes are unchanged.

Receipt: proof/nov01_layout_review.json. This establishes a usable candidate
layout, not proof of exact original PC file boundaries/order or retail SHA.
Code coverage remains42.710781607%; no new verified bytes. No new build, full
suite or GPU run for a metadata-only correction. The broader goal stays PAUSED;
no API/dispatch implementation was started under the step2 request.

## Historical: pending-edit verification passed - 2026-11-01

Owner authorized step1 only. Review is complete; the broader reconstruction goal
remains PAUSED. No source or test changes were needed. The previous refresh's
uncertainty about two edits is resolved at the scope described here.

rb_tess.cpp is the exact old file plus an appended particle-cloud block. Removing
only that block restores the old source SHA exactly. test_tess_skinned.py changes
only its extraction end to exclude that block; restoring that line reproduces
the exact previous fixture hash. No old assertions or skinned source were removed.

Existing native checks pass:1255 skinned and494 particle routes. Review against
retail3ee10/40ca0/40d40/40df0/40f30 found no discrepancy in the epsilon/signed
branches, rotation, constants or draw/binding paths checked. Original-toolchain
incremental build, both referees and all2381 protected extents pass. The accepted
address/extent set is unchanged; all176 current accounting source hashes match.
C++ stays108306/253580=42.710781607%,650 bodies: zero new verified bytes. New
particle source remains unmatched, not promoted to a byte match by these tests.

Receipt: proof/nov01_pending_review.json. Fresh candidate SHA256:
5ce474db2252b1fe864a10081b27c61dc6b96c78e3938bd833f012d733ee438d
Same-offset equality8.772426369% is diagnostic only. One
existing build output reused. No full-suite replay, new normalized-span audit,
retail SHA or GPU test was performed. The160-suite result below is historical;
this review does not claim that all161 current fixtures were rerun. No further
implementation started. Pending/untracked work and unrelated staging preserved.

## Historical workspace refresh - 2026-11-01

Codex reconstruction goal: PAUSED. This refresh updates documentation only;
it does not authorize resuming code work. Previous "ACTIVE" statements below
are historical observations, not current instructions.

The retail file/TU layout pass already exists: target/work/layout/README.md,
section "Retail file layout checkpoint - 2026-10-24", plus file_layout.tsv,
fragments.json, src/tus.txt and src/profile.mk. Reuse these; do not repeat the
layout setup or require all missing code before acknowledging the layout map.
Candidate ordering and original historical ordering remain different claims.

Last recorded receipt examined: proof/skinned_tess_checkpoint.json,2026-10-27.
It records160 fixtures,2381 protected extents, C++108306/253580=42.710781607%,
and address-normalized file spans68.549286159%. The latter includes verified
non-source regions; it is NOT C/C++ source coverage or a retail-identical file.
Its same-offset equality is8.810235758%; no V4/V5 or GetRefAPI completion.

Read-only hash check today:363 recorded source/header/tool/fixture/artifact/log
files checked;361 match. Two differ from that receipt:
- src/gfx_d3d/rb_tess.cpp
- tests/test_tess_skinned.py

The current DLL and generated layout agree on SHA256
83a00007c88c38cfaa11835ccb9db7cd74520146df5b9aac4eae742363703a37,
which differs from the receipt's255ca9c0bec76892519271a38161bd2d6df83002331a47450987925d05465e11.
Therefore that receipt does not certify the current source/output pair. Preserve
pending work; inspect the exact two edits and existing build logs before deciding
what verification is needed. No builds/tests were run in this documentation pass.

Continuation: read HANDOFF.md. Classify pending edits before further code; then
use the owner's current scope. Work in connected source/layout batches, reuse
one build, and avoid another full-suite cycle for every small function. Report
verified code/file deltas separately from reconstructed-but-unmatched source.
Never stage the entire index: unrelated legacy artifacts were already staged.

## Recorded checkpoint: skinned-model tessellation - 2026-10-27

rb_tess now contains both real skinned-model paths and their signed-offset
selector. Cached drawing flushes, captures stride/args, binds IB, reloads the
live backend VB and draws. Uncached drawing handles capacity and odd-index
flushes separately, copies vertices, then uses the existing matched120-byte
XSurfaceGetTris for rebasing. No duplicate index copier, storage, root, export,
TU or assembly. TessBad is the actual empty RET at1003ef20; it does not stand
in for any missing kind. r_vb_state_t+8 now has the real typed Windows VB pointer
instead of a function-pointer placeholder; its12-byte layout is unchanged.

Original compiler and both referees retain all2381 protected extents. All160
fixtures pass, including1255 new routes and live callback/count publication
checks. Independent2349-code/9387-data union audit passes. New bodies remain
unmatched: cached274/276, uncached278/304, selector20/38, empty1 unplaced. Zero
new verified bytes. No source/register sweeps until actual caller/table context
exists. C++108306/253580 =42.710781607%,650 bodies; verified address-normalized
file spans1269116/1851392 =68.549286159%; exact same offsets8.810235758%.
All32 authored assembly bodies/7820 bytes remain excluded.55 API slots accepted;
GetRefAPI absent. Receipt: target/work/proof/skinned_tess_checkpoint.json.
Candidate SHA256:
255ca9c0bec76892519271a38161bd2d6df83002331a47450987925d05465e11.
Goal token observation2050903, +48308 since tess-surfaces, zero new verified
bytes. Goal ACTIVE; no V4/V5, pause, commit or push.

Next restore entity tessellation primitives in rb_tess, then its complete real
table and the draw-surface/command graph. The actual jump table1004110c maps
4 sprite1003fb50,5 rail10040c00,6 particle10040f30,7 quad1003fba0,8 line10041030,
9 cylinder DX7=100401a0/other=1003fdb0. Physical block order differs. The active
enum is correct. PC particle driver has4096 vertices/2048 primitives/baseIndex0
and no reference DX7 early return; do not import the reference's wrong args.
Sealed next evidence: skinned_tess_entity_switch.json and skinned_tess_next_entity_primary.asm
(read windows, not certified full extents). Five backend command roles still
lack source; complete actual dependencies before adding tables/executor.

## Historical checkpoint: tessellation source and Windows buffer ABI - 2026-10-27

The original rb_tess.cpp TU now holds real polygon, world-triangle, cached-model
and rigid-model submission. Its current link-order slot follows rb_surface.
Existing flush/overflow, copy, logging, buffer binding and draw helpers are
reused. rb_state owns RB_PushMatrixStack, now accepted at1003e480/46 bytes.
Raw Mac STABS confirms the names and source homes. The four new drivers remain
unmatched: poly408/489, triangles132/153, cached203/209 and rigid417 versus
retail326 plus its outlined123-byte matrix helper. Explicit primary-proven
matrix assignments reduce rigid512 to417; no compiler-impossibility claim.
Poly's Ghidra477 inventory truncates its final block; actual extent is489.

A real cross-TU link failure exposed IDirect3DVertexBuffer9 incorrectly tagged
as a union in the active reference headers. All three active declarations now
use the SDK's opaque struct COM interface. The bogus Mac matrix payload was
removed; no cast, ABI adapter or root was added. Full original-toolchain build
passes. The disabled common_types.h legacy body was left alone. Matrix native
fixtures now preserve align16 and assert actual0x110/0xcd0 strides.

All159 fixtures pass, including2129 surface and386 rigid routes. Both referees
retain all2380 old extents plus the new46-byte push; the2381 ratchet rejects
its removal. Independent audit rechecks2349 code/9387 data regions and union.
C++108306/253580 =42.710781607%,650 bodies (+46). Verified address-normalized
file spans1269116/1851392 =68.549286159% (+56, including10 relocation bytes).
Exact same-file offsets8.809533583%; all32 assembly bodies/7820 bytes excluded.
55 API slots have accepted bodies; GetRefAPI is absent. No V4/V5 claim.
Receipt: target/work/proof/tess_surfaces_checkpoint.json. Candidate SHA256:
26e288a39046757e9db4a6510186e08e8e24cb2f59866715fe2299203e1c677b.
Goal token observation2002595, +310060 since text-graph, for46 new C++ bytes.
Goal ACTIVE; no pause, commit or push. One real original TU, no new export/root/
assembly or partial dispatch table.

Next close the skinned cached/noncached paths and entity tessellation primitives
in rb_tess, then restore the complete actual tess table and draw-surface kernel.
The real empty TessBad is separately pinned; do not substitute it for missing
handlers. Remaining PC tess slots are recorded in
proof/tess_surfaces_remaining_table_inventory.json. Five backend command roles
still lack source: sprite, draw-surfs, sun, late-post-effects, sun-post-effects.
Finish those actual dependencies before linking the full command table/executor.

## Historical checkpoint: PC text command graph - 2026-10-27

Both text command handlers, the real 2D cursor/text kernel and the world-space
text/quad graph now have source in rb_backend. Existing matrix, surface and
DX7/DX9 vertex helpers are reused. R_GetCharacterGlyph remains one r_font owner:
its static linkage was corrected to public, with its body and accepted103-byte
extent unchanged. Font/Glyph use a shared r_font header. The8x4 color table is
function-local to RB_LookupColor, as raw Mac STABS confirms. No extra root,
export, TU, assembly, duplicate table or partial command table was added.

PC instructions require one foreground/shadow/cursor pass, BGRA color with
original alpha, signed time/256 blink, color escapes counted+2 without glyph
budget cost, and a16-bit world-quad index cursor. Reference extra draws and
alpha-low-byte handling were rejected. Primary text extent is743 contiguous
bytes; the Ghidra740 inventory omits three epilogue bytes. Helper names for the
cursor/quad remain descriptive. Two handlers/static2D kernel await the actual
command table/executor before emission; do not add ABI-only roots.

All157 fixtures pass, including1207 new text routes. Original compiler/both
referees, all2380 protected extents and independent2348-code/9387-data audit
pass. New emitted bodies remain unmatched: lookup83/76, quad434/440, space425/442;
zero new verified bytes. C++ remains108260/253580 =42.692641376%,649 bodies.
Verified address-normalized file spans remain1269060/1851392 =68.546261408%.
Exact same-file offsets8.729215639%; all32 assembly bodies/7820 bytes excluded.
55 API slots have accepted bodies; GetRefAPI remains absent. No V4/V5 claim.
Receipt: target/work/proof/text_graph_checkpoint.json. Candidate SHA256:
b773d5abf4d565992202cdc0f145ce1e9876b2af57b32859fa62d68300c539ae.
Goal token observation1692535, +128236 since backend-dvars, zero new verified
bytes. Goal ACTIVE; no pause, commit or push.

Five handler roles still lack source: sprite, draw-surfs, sun, late-post-effects,
sun-post-effects. Next close the actual draw-surface dependencies/table. Primary
1002f951 MOV loads the order value, not a descriptor pointer: kernel1002f430
really takes four arguments (surfs/count in EAX/ECX, tech/order on stack).
Existing producer/record layout needs no change. Evidence and next-callee
inventory are sealed as text_graph_next_drawsurf.json and tess_table.json in
proof. Keep Mac diagnostic counters/NULL placeholders out of PC source.

## Historical checkpoint: backend dvar updates and image rebuild - 2026-10-27

Real source now restores Image_RebuildCosinePowerMap in r_image and the backend
dvar updater in rb_backend, reusing existing sampler, anisotropy, image and AA
helpers. PC order, callback mutations and live globals are preserved. The image
path directly releases the texture without changing tracking; it recreates the
32x256 L8 map and uploads its 8192-byte payload. No new TU, root, export, table
owner or assembly. The private updater name remains descriptive.

All 156 fixtures pass, including 422 new source routes. Original compiler,
byte/binding referees and all 2380 protected extents pass. The two new bodies
remain unmatched (image200/202, updater202/207), with zero new verified bytes.
Debug-expression and entity-declaration trials did not match and were reverted.
An image-buffer alignment trial lost Image_Create2DTexture and was also reverted.
No compiler-impossibility claim. Fixtures reading the DLL must run after linking;
a concurrent mmap reader received SIGBUS and its failed run was discarded.

C++ remains108260/253580 =42.692641376%,649 bodies. Independently audited verified
address-normalized file spans remain1269060/1851392 =68.546261408%. Exact same-file
offsets are8.779772193%, not whole-file identity. All32 authored assembly bodies/
7820 bytes stay excluded.55 API slots have accepted bodies; GetRefAPI is absent.
Receipt: target/work/proof/backend_dvars_checkpoint.json. Candidate SHA256:
ab4a86f33dd7997cf65abdb28309e8f4ee4f8f2a10fbbbb6f8f09a3b8d8db3d9.
The assembly source guard was reviewed: the entire old rb_backend file remains
an identical prefix; only non-assembly C++ was appended. No predicate relaxed.
Goal token observation1564299, +563538 since the previous sealed checkpoint,
with zero new verified bytes. Goal ACTIVE; no V4/V5, pause, commit or push.

Next complete the real backend command graph. Primary PC table10190518 has34
slots, with only slot0 NULL. Seven handler roles still lack source: sprite,
text, text-in-space, draw-surfs, sun, late-post-effects and sun-post-effects.
Verify their actual payloads/callees before implementing; Mac reference NULLs
and WASM diagnostic counters are not PC evidence. Existing static handlers need
the real table/executor to become linked contributors. Then close the actual
API/frontend drivers and remaining byte/layout/metadata differences.

## Historical checkpoint: ref-entity submission and short-body discovery - 2026-10-26

R_AddRefEntityToScene and its two private helpers now have real source in
r_scene.cpp, using the existing allocator, draw-key helper and model draw graph.
PC order/limits, signed type paths, warning strings/imports, copy116/clear52,
zero/NaN scale and model/cent routing are preserved. The single four-byte entity
surface token precedes the existing eight-byte stride table in writable .data;
linked owner, values and +4 displacement are verified. No filler or extra TU,
root, export or assembly. Private helper names remain descriptive.

All 155 fixtures pass, including 2708 actual ref-entity routes, warning-import
mutation, error return/throw, capacities, aliasing and untouched guards. The
callback201 vs retail209 and helpers125/128 vs retail128/128 remain unmatched
and receive no credit. Raw instruction differences are saved in
scratch/codex_1026_refentity/first_diffs.txt. No compiler-impossibility claim.

Discovery now admits unique unrelocated6/7-byte straight-line return bodies.
All previous byte/binding/relocation/import/data/extent/closure predicates are
unchanged. The first broader rule was rejected by regression: truncated short
hit lists displaced existing caller proofs. Final logic preserves caller-only
placement for1/3/5-byte, masked, branching and ambiguous short functions. The
expanded existing fixture covers all these negatives and retains the old tests.

Both referees accept four previously undiscovered leaves: R_GetMaterialName7
and ShortNoSwap6 are C++; the two SDK bodies7+6 stay dependency-only. All2376
old extents survive; the ratchet now protects2380 and rejects removal of the new
material accessor. Independent audit checks2348 code and9387 data regions and
the union. C++ is108260/253580 =42.692641376%,649 bodies (+13 bytes). Verified
file spans1269060/1851392 =68.546261408% (+26 bytes including dependencies).
Exact same-file-offset equality is8.705449737%; final positions remain open.
All32 authored assembly bodies/7820 bytes remain excluded.55 API slots have
accepted bodies; a complete real GetRefAPI/table is still absent.

Candidate SHA256:
28e45df055ac34dbafaed50848505a8466e398fd1fad586a61555ec9f679354e.
Receipt: target/work/proof/ref_entity_checkpoint.json. The current audit is
ref_entity_short_coverage_audit.json; the earlier pre-discovery audit remains
historical and is not the final receipt's audit. V2/V3 only; no V4/V5 claim.
Goal token observation1000761, +96533 since the model checkpoint observation;
this group gains13 C++ bytes and13 dependency bytes. Goal ACTIVE, no pause,
commit, push or subagent.

Next prioritize closing the nearly matched model/scene graph. R_SkinGfxEntity
now has a61-byte hit from the restored caller context, but its bounds callee
still fails closure. Boxes985/Axes959 have one normalized x87 addition-order
difference each; the local precision trial failed and was reverted. Entity
helper instruction order also differs from primary before record copying.
Missing API/table and remaining frontend/backend drivers/handlers must be real
source, not placeholder callbacks. API legacy labels are shifted after slot19:
use pinned targets and verified source mapping, never their unverified names.
The current mapping audit is scratch/codex_1026_refentity/api_source_audit_final.json.

## Historical checkpoint: model publication and draw graph - 2026-10-26

Real source now connects model pre-skinning, static-cache publication, DObj/
XModel skinning callers, the scene worker, the complete frontend dispatcher,
DPVS model drawing and packed draw-surface submission. Each stays in its
original file. Existing cache/GPU commands, DPVS state, draw-key helper, shared
debug drawing and colorCyan are reused. No new TU, root, export or assembly.

The dispatcher is R_ProcessFrontendCmdInternal(type,data,context), with the
original two-argument R_AddFrontendCmd wrapper. This corrects the initial name
conflation before the final proof. All eight cases and default have real
implementations. Native checks cover 155 caller routes, 778 dispatcher routes
and 5184 draw/submission routes, including state ordering, command payloads,
capacity limits, warnings, compact null-material walking and packed strides.
The eight-byte stride table has its real writable .data owner in r_scene.

Fresh original build/referees retain all 2376 protected extents. All 154 fixtures
and the independent code/data/union audit pass. The new group remains unmatched
and gets zero C++ credit. R_SkinSceneEnt has a 29-byte hit but its callee binding
is unresolved. Debug Boxes985/Axes959 each show one normalized x87 expression
ordering difference; a bounded local precision trial gives no hit and its
unnecessary flags were reverted. This does not establish compiler impossibility.

C++ remains 108247/253580 = 42.687514788%, 647 bodies. Verified address-normalized
file spans remain 1269034/1851392 = 68.544857059%. Exact same-file-offset equality
is 8.717656769%, down from the pre-skin checkpoint's 8.927714930% as contributors
move. Layout structure is being restored; final positions are unfinished. All
32 authored assembly bodies/7820 bytes remain excluded. Candidate SHA256:
91276df9f887d79177f660eafe58aeafce3996d6c6e45e9db38f01cfa432d011.
Receipt: target/work/proof/model_publication_checkpoint.json. V3 only for this
group; no V4/V5 claim. Goal token observation 904228, +96783 since the pre-skin
observation, with zero additional verified C++ bytes in this group.

Next: R_AddRefEntityToScene10023db0/209 and its two128-byte helpers. Its real
model dependency graph now exists. Draft and primary notes are in
scratch/codex_1026_cache/ref_entity_draft.cpp and ref_entity_next.json, not active
source or progress. Place the single writable entity-surface token immediately
before the existing stride table when integrating it. Do not import the Mac
six-element stand-in. GetRefAPI, remaining callbacks/code/data, final layout/
metadata, retail SHA and runtime/GPU smoke remain open. Goal ACTIVE; no pause,
commit, push or subagent.

## Historical checkpoint: DPVS ownership and model-cache publication - 2026-10-26

DPVS now owns one real 108-byte state record and a separate 4-byte cull
configuration. Mac STABS and thirteen PC initializer operands pin its fields;
the five debug flags start at offset 100. Eleven split storage owners were
removed. The linked configuration follows the state at +108. No filler was
added. Frozen proof: target/work/proof/dpvs_state_checkpoint.json.

The model-cache source now allocates tree blocks, publishes cached vertices
and packed indices, and updates the LRU tree. It uses the existing cache,
GPU skinning command and skin buffer. R_UsedCachedStaticModelSurface matches
1002b8c0/87. The other three new bodies are behavior-tested but unmatched;
the two private helper names are descriptive, not historical claims.

The clean original-compiler build retains all 2375 prior extents and adds one,
for 2376 accepted extents. The strengthened ratchet rejects removal of the
new extent. All 150 fixtures pass, including DPVS ABI/flags and cache size
boundaries, packed indices, full capacity, eviction, backreferences and LRU.
The independent audit rechecks 2344 code and 9387 data regions and the union.

Accepted authored C++ is 108247/253580 = 42.687514788%, 647 bodies (+87 bytes).
Verified address-normalized file spans are 1269034/1851392 = 68.544857059%.
Exact same-file-offset equality is 8.831517042%. These are distinct meters;
neither proves whole-file identity. All 32 authored assembly bodies/7820 bytes
remain excluded from C++ credit. Candidate SHA256:
3d0a73414760f4b9d5520caf574b938b6c2fa6198d370ac8fe73ffbefc71b163.
Frozen receipt: target/work/proof/cache_publication_checkpoint.json.

Continue the connected model/scene/frontend API graph and bounded cache ABI/
copy scheduling checks. GetRefAPI, missing callback bodies, remaining code/data,
final placement and metadata, retail SHA and GPU/runtime smoke remain open.
Goal ACTIVE; V2/V3 only. No commits, pushes, subagents or extra TUs/roots/exports.
Goal token observation 695731; this cache wave adds 87 verified C++ bytes.

## Historical checkpoint: shared helper ownership - 2026-10-26

Removed110 physical helper copies (2695 candidate function bytes;3520 .text
virtual bytes including their alignment). The shared math header now emits
C++ inline definitions with one instance. Shadow-cookie headers parse without
/Op, then its real function bodies enable precise math locally. A broad initial
trial lost the two vector lengths and UnGetLeanFraction by selecting CRT sqrt;
separating header precision restores their exact fsqrt bodies. All2375 protected
retail extents survive. No new assembly instructions or definition bodies.

Removed all seven remaining matched alias groups. Callers share VectorAdd/
VectorScale, DotProduct/Dot2Product and the supported original names
VectorAngleMultiply, GetRotatedBounds and AxisTransformVector. Declarations and
native fixtures use these actual owners. The final2375 accepted rows now equal
2375 unique retail extents; the previous2461 rows included aliases. This is
physical consolidation, not lost recovered functions or added C++ credit.

Clean original build/referees/ratchet and all148 fixtures pass. Independent
recheck covers2343 code and9387 data regions, symmetric masks, the union and
all32/7820 assembly exclusions. The header's approved hash was re-reviewed only
after proving exact linkage/prototype diffs and unchanged assembly definitions;
six mutation/unreviewed-assembly controls still pass. Source-placement metadata
now uses the referee's PDB/private-symbol reader. No roots/exports/TUs added.

C++ remains108160/253580=42.653206089%,646 bodies. Verified address-normalized
file spans are1,268,935/1,851,392=68.539509731%, ten conservatively counted data
bytes fewer after eliminating duplicate contributions. Exact same-file-offset
equality improves8.812450308% ->8.828870385% (+304 equal bytes). Neither metric
is whole-file identity. Candidate SHA256:
c18262c0f0a3bd97b2751caa6b1dc5178b20329a804ce1eab95d68daf65f23a9.

Receipt:proof/shared_helpers_checkpoint.json, with frozen binding/coverage/source/
layout packets and helper_linkage_review.json. All historical raw-image packet
hashes remain intact. An audit writer reused its old output path; restored that
file byte-for-byte from its SHA-verified original log, archived the exact auditor
source, and made an explicit output path mandatory. Current audit has its own
shared_helpers_coverage_audit.json. No evidence was inferred or regenerated from
the new DLL for the old receipt.

Next: consolidate the real DPVS owner, then continue the connected scene/model/
frontend/backend API graph. Raw Mac STABS defines dpvsGlob as108 bytes with an
embedded five-byte DpvsDebug at100, and separate4-byte cullDist configuration.
PC initializer/queue/hull/plane fields agree; the reference's224-byte buffer and
119-byte tail are wrong for this record. Existing active source already owns
most fields as split globals; fold them without duplicate storage/filler, not
by adding108 new bytes. Type/PC evidence is in scratch/codex_1026_helpers/
dpvs_stabs.json and dpvs_pc_fields.json. No DPVS owner source change yet.

Goal stays ACTIVE: API59, missing scene/model/DPVS/backend source, unmatched code/
data, final metadata/positions, SHA and runtime/GPU remain open. No commits,
pushes or subagents. Goal token observation154794 (43972 at turn start), no added
C++ bytes; the measured gain here is removal of duplicate machine-code instances.
Earlier checkpoints, including all five finished source-home moves, are history.

## Active checkpoint: raw-image API and codec graph - 2026-10-26

Owner resumed for100% readable reconstruction and whole-retail SHA identity;
work remains ACTIVE. This batch restores raw-image material callbacks, the real
JPEG file loader, memory source and decoder in their source homes. All44 codec
TUs follow the non-overlapping order constrained by retail byte placements.
Source/native checks pass; raw caller/helper bodies match but remain unaccepted
through R_LoadJpg (724 candidate vs785 retail). The two API wrappers need their
final address-taken API context; no exports/roots or dummy callbacks were added.

Fresh original build, all148 fixtures, full binding replay and independent byte/
interval audit pass.2461 binding rows/2375 unique target extents retain every
previous1987 row's target/extent. The build ratchet now protects all2375 extents;
removed/resized negative controls fail. Receipt:proof/api_raw_checkpoint.json;
frozen bindings, file coverage, source coverage and layout have api_raw prefixes.

Verified address-normalized retail file spans:1,268,945/1,851,392=68.540049865%.
Code746915, initialized data464860, HIGHLOW entries57170 bytes, unioned once.
This adds243601 proven file bytes, including193362 original dependency code
bytes, while authored C++ remains108160/253580=42.653206089%,646 bodies.
The newly resolved existing I_fround10001810/33 is assembly, bringing exclusions
to32 bodies/7820 bytes. All31 previous exclusions and assembly-source hashes
remain protected. No headers/BSS/unowned padding credit or new authored assembly.
Same-file-offset equality is8.812450308% (previous9.461367447%); genuine added
contributors shift addresses. Final placement/metadata is still unfinished.
Candidate SHA256:21a4a1663c0d1a20385e89a76e1f9831b36872ddf095b7472008dec33d0176b6.

Referee corrections preserve distinct source-private procedures/data and actual
PDB owners despite misleading map labels. Instruction discovery resynchronizes
after inline HIGHLOW tables instead of inventing a bogus memmove jump outside
the image. Byte/relocation/import/data-binding/callee-closure checks stay enforced;
tests retain real calls and relocated MOV operands. Empty PDB labels stay empty.
These are documented checker fixes, not a claim that the referee file is unchanged.

Next connected group: API20 scene/entity submission and its genuine DPVS/model/
skinning helpers; primary assembly and exact PC/reference disagreements are
recorded in ATTEMPTS.md. Do not wire a partial advertised GetRefAPI or invent an
independent DPVS draw flag. RenderScene, frame/backend dispatch, unmatched bodies,
final file layout/metadata, V4 SHA and V5 runtime/GPU remain open. No commits,
pushes or subagents; tokens per verified byte unavailable. Earlier notes are
historical, including the requested pause and the previous five completed moves.

## Latest checkpoint: retail file spans verified; paused at owner request

Verified1,025,344/1,851,392 retail file bytes =55.382328540%, counting
address-normalized code, initialized data and HIGHLOW entries. This is distinct
from exact same-file-offset equality, which remains9.461367447%. Whole-file
SHA identity and runtime/GPU verification remain open (V2/V3 evidence only).
Original compiler/SDK dependencies are included in file coverage, separately
from authored game C++:108160/253580=42.653206089%,646 bodies, unchanged.
The full-file union includes553553 code bytes,419275 data bytes and52516
relocation-entry bytes. No headers, unowned zero padding, BSS or any of the
31 authored-assembly bodies/7787 bytes receive credit in this file-span meter.

Corrected candidate discovery for tiny return leaves and qualified library-private
PDB data by archive plus actual COFF member. Five-byte jump thunks retain their
original specialized proof path. The unchanged binding referee accepts1987 rows
(1979 unique target extents); all1496 previous rows survive. Newly proved original
dependency extents add152145 bytes. No compiler source or layout inputs changed
in this wave. The previous five source-home fixes remain finished.

Both builds and all144 fixtures pass. Final accounting freshness checks also
pass: current DLL must agree with layout, replayed bindings with build proof,
and every accepted code extent is freshly rechecked. Independent audit rechecks
1955 code and8946 data regions, their union and assembly exclusions. Receipt:
target/work/proof/retail_50_checkpoint.json; frozen coverage and bindings are
retail_50_coverage.json and retail_50_bind.json in the same directory. Candidate
SHA256:7925c380767a13c1fd5986e1bc1da107a96c851fb63d6b50fd032ab56196c377.

PAUSED after this checkpoint as requested. Resume preserving all1987 accepted
rows and the immutable1448 gate. Remaining work includes API/scene closure,
unmatched game bodies, library/data/link order, headers and exact DLL positions.
Known library edges include Error -> vsnprintf -> __output and EvalRange ->
__CIpow (including __CIpow_pentium4 extent). No new research on those edges
was started for this pause. No commits/pushes or subagents. Token cost per new
verified byte is unavailable; no new authored C++ bytes in this wave.
Earlier sections below are historical checkpoints, including their hashes/counts.

## Latest: five placement issues finished - 2026-10-25

This supersedes the earlier open-exception lists. All five mapped-owner issues
are resolved: the corner transform/brush culler are in r_dpvs, the light-grid
callback is in r_image_load_obj, and both quaternion instances are emitted by
com_math. Retired the two split TUs; no replacement source tree or worker.
VC7.1 local precise regions retain the DPVS/light-grid code, while com_math
headers parse without /Op before precise math is enabled for its definitions.
The shared xanim header is unchanged. These are matching reconstruction choices,
not recovered historical pragma spelling. No compiler/ABI excuse or new assembly.

The light-grid merge exposed the CRT month-table negative-base dependency.
Four original pinned LIBCMT members now link in retail data order: intrncvt,
mbctype,matherr,days. Their entire404-byte initialized block matches retail.
Vendor objects remain build artifacts/dependencies, with no authored credit.
No referee/accounting policy, protected hash, padding or game bytes were patched.

A forced rebuild and full141-fixture replay pass. After an EOF-only cleanup,
a fresh build/referee pass and brush/BSP/model/CRT/layout/assembly-attribution
checks also pass. All1481 starting accepted bindings survive;1496 now accepted.
Six newly accepted C/C++ header instances add214 bytes; nine new CRT matches
add1519 library bytes separately. C/C++108160/253580=42.653206089%,646 bodies.
All31 authored-assembly exclusions/7787 bytes remain unchanged.
Same-offset9.461367447% is diagnostic; candidate SHA256:
d026a6149fcf1d000448c11c5e1ef88bf5c966e8409000b75f6f9dc62fd4463c.
Zero disagreements in the current mapped-owner inventory; unclassified shared
helpers/constants and exact PC file boundaries/offsets are not proved complete.

Receipts: proof/placement_five_checkpoint.json, placement_five_bind.json and
updated retail_position_audit.json. Preserve all1496 accepted final bindings in
future waves, not only the immutable1448 gate. Logs: proof/latest/placement_five_*
plus the bounded trials documented in ATTEMPTS.md. No commits/pushes. Token cost
per accepted byte is unavailable; no subagents were used.

Continued matching after the moves: a cell-filter precise-region trial and
three wavelet source forms give no additional accepted bytes; all are reverted.
R_CullBrushEntity's existing335-byte filter dependency and Image_LoadWavelet's
539-vs537-byte mismatch remain code work. The culler is byte-matched/source-placed
but not binding-accepted. The image loader/reload wrappers remain unaccepted
through the wavelet edge. Whole-DLL SHA, full API/scene closure and runtime/GPU
remain open. Do not re-run the finished moves or reintroduce the split TUs.

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

## Latest recovery checkpoint - 2026-10-25 (Codex)

This section supersedes the historical instructions and numbers below. Claude
continued through commit bdacf3c (Image_Reload register argument) but left the
handoff stale and two uncommitted r_image.cpp edits. Those edits are preserved.
The remaining file moves listed below were already completed; do not repeat them.
Claude restored the world-loader driver/BSP helper source and further matches.
Fresh baseline:107742 C/C++ bytes,638 bodies,139 fixtures; all1448 protected
extents pass. None of Claude's work was reset or overwritten.

Continuation: native C++ bool for private Image_IsCodeImage matches1000cc80/23
and unlocks Image_FindExisting1000d140/181:204 new verified C/C++ bytes.
The lost-image water builder now follows the primary's separate DX9/DX7 calls;
it remains an uncredited74-byte draft with two MOVZX vs MOV AX/CX differences.
The stored-dimension texture-creator experiment gave no gain and was reverted.
No new TU/order, roots, flags, globals, SDK, assembly or referee changes.

Final original build + both referees +139/139 fixtures pass. All1479 accepted
source/library bindings from the recovered state survive, including the1448
immutable protected extents. C/C++107946/253580=42.568814575%,640 bodies;
same-offset9.483404919%. Candidate SHA256:
c0413d8d51c19d52773f641057d58d1f06ff87b1125e7b36108112fabd918721.
Whole-DLL identity and GPU/runtime testing remain OPEN. No commits or pushes.
Token cost per accepted byte is unavailable; no subagents were used.

Receipt: target/work/proof/image_resume_checkpoint.json (152 compiler-source
hashes,139 fixture hashes and retained/new bindings). Final logs:
proof/latest/codex_image_resume_final_{build,fixtures}.log. Bounded attempts:
ATTEMPTS.md and scratch/codex_1025_resume. Next investigate water's dimension
call context and Image_LoadWavelet1000f380: its unaccepted539-byte body blocks
Image_LoadFromData, Image_LoadFromFile and Image_Reload. Their byte hits alone
are not accepted closure. World/API/scene and final layout still need completion.

## Structure-first renderer checkpoint - 2026-10-24

Work only in gfx; actual source is `target/work/src/`. This is the sole current
status log. WHOLEFILE.md remains the roadmap. Stages1-3 are NOT complete.

### Latest: handoff file moves complete; static-model source wave (Codex)

Eighteen bodies now live in their retail files across seven gated moves,
including the later-confirmed1002a360 bounds owner. No move was reverted.
The original build, BOTH referees, all1448 protected extents and139/139
fixtures pass. Immutable protected bind SHA is unchanged. Ten negative
controls now reject losing/misbinding either accepted spawn leaf.

New accepted C++: vec3 lookup10002ed0/115 and hex lookup10002f50/192,
307 bytes. C++104380 ->104687/253580=41.283618582%,618 ->620 bodies.
Same-offset9.067717696% ->9.185953056% is diagnostic.
The actual initial runner had135 fixtures (handoff139 was stale); cache
allocation and three static-model fixtures raise it to139.31 inherited
assembly exclusions/7787 bytes and the accounting/referee tools are unchanged.

Restored the genuine two-pass entity/misc-model load path, validated model
fallback, flags/transforms, and DX7/DX9 lighting-cache paths in existing TUs.
Other new bodies remain uncredited drafts: their exact sizes/differences and
six bounded source trials are in ATTEMPTS.md. R_RegisterModel's definition
has a primary-justified noinline guard; this is not historical provenance.
No new TU/root/export/flag or authored assembly definition in the source wave.

r_model_lod and r_lightgrid_weights retain the handoff's explicit /Op/fabs
DEFERs. Layout/evidence maps are fresh. Stages1-3 and whole-file/runtime
remain OPEN. No commits or pushes; inherited staged work preserved.
Receipts: proof/structure_checkpoint.json and proof/static_model_checkpoint.json;
final logs: proof/latest/codex_static_bounds_merge_*.log. Token cost unavailable
per move. Next work: caller/TU evidence for the listed residual load-chain
mismatches, then genuine world/API closure; no tiny repeated spelling sweeps.

### Earlier: convex winding helpers merged into r_dpvs as C++ (Codex)

Original build, both referees and all1448 protected extents pass;
136/136 actual-source fixtures. C++104380/253580=
41.162552252%,618 bodies; same-offset9.064800971%.
No new byte credit from file placement. Logs/receipt: proof/latest/codex_winding_merge_*.
No commits or pushes; inherited staged work preserved. Token cost unavailable
per move. Whole-file identity and runtime remain open.

### Earlier: cache vertex-buffer initializer moved into r_staticmodelcache (Codex)

Original build, both referees and all1448 protected extents pass;
136/136 actual-source fixtures. C++104380/253580=
41.162552252%,618 bodies; same-offset9.065827226%.
No new byte credit from file placement. Logs/receipt: proof/latest/codex_cache_buffer_merge_*.
No commits or pushes; inherited staged work preserved. Token cost unavailable
per move. Whole-file identity and runtime remain open.

### Earlier: console command registration moved into r_cmds (Codex)

Original build, both referees and all1448 protected extents pass;
135/135 actual-source fixtures. C++104380/253580=
41.162552252%,618 bodies; same-offset9.070418366%.
No new byte credit from file placement. Logs/receipt: proof/latest/codex_cmds_merge_*.
No commits or pushes; inherited staged work preserved. Token cost unavailable
per move. Whole-file identity and runtime remain open.

### Earlier: five static-buffer helpers moved into r_buffers (Codex)

Original build, both referees and all1448 protected extents pass;
135/135 actual-source fixtures. C++104380/253580=
41.162552252%,618 bodies; same-offset9.077656164%.
No new byte credit from file placement. Logs/receipt: proof/latest/codex_buffers_merge_*.
No commits or pushes; inherited staged work preserved. Token cost unavailable
per move. Whole-file identity and runtime remain open.

### Earlier: dynamic index and vertex uploads moved into rb_shade (Codex)

Original build, both referees and all1448 protected extents pass;
135/135 actual-source fixtures. C++104380/253580=
41.162552252%,618 bodies; same-offset9.068581910%.
No new byte credit from file placement. Logs/receipt: proof/latest/codex_upload_merge_*.
No commits or pushes; inherited staged work preserved. Token cost unavailable
per move. Whole-file identity and runtime remain open.

### Earlier: buffer initialization moved into r_init (Codex)

Moved five r_dxbuffers initialization/release bodies into r_init in retail
address order, retaining the original section boundaries through fragments.json.
Original build, both referees and all1448 protected extents pass. The actual
current runner discovers135 fixtures, all passing (the handoff said139).
C++104380/253580=41.162552252%,618 bodies; same-offset9.067393615%.
No new byte credit. Logs: proof/latest/codex_dxbuffers_merge_{build,fixtures}.log.
Static-buffer and cache helpers remain in r_dxbuffers pending their moves.
No commits; prior staged work preserved. Token cost is not available per move.

### Earlier: one type view, r_init/r_model/r_screenshot merged

gfx.h and r_local.h now work in one file (r_local.h first): the Mac header
declarations that the real SDK/PC headers own are skipped by generated
COD2_SDK_TYPES guards (tools/sdk_guard.py; gfx.h-only TUs unchanged).
Merged: r_init (+r_fatal_init, r_device, r_caps_device, r_monitor,
r_window, r_display_modes), r_model (+r_model_bounds, r_skin_rigid),
r_screenshot (+r_screenshot_capture), rb_2d split into rb_backend/rb_sky.
DObjAnimMat/XBoneInfo now use the Mac _s tags everywhere. tus.txt 93 TUs.
Build, both referees, 1448/1448 extents and all fixtures pass (logs
proof/latest/{model_backend,rinit_header,screenshot}_merge_*.log). C++
104237/253580 = 41.106159792%, 617 bodies, unchanged; same-offset 9.0616%.
Left (layout/README.md): material and rb_shade need one type definition
each (duplicate CodeSamplerSource tables; opaque GfxTess fields), r_model_lod
and r_lightgrid_weights are /Op, per-function moves into r_buffers/r_cmds.
layout/evidence.tsv lists 93 bodies with no retail address to verify.

### Earlier: retail file layout (owner request: lay out files like retail)

tus.txt now follows retail body order (path order gfx_d3d/r_*, rb_*, jpeg-6b,
universal), from the median accepted address per TU; bodyless TUs take their
alphabetical slot. Five groups merged into their retail files (rb_light,
rb_state, r_dpvs, com_math, rb_shade) and two renamed (rb_imagefilter,
r_shadowcookie), named by the Mac 1.3 source tree. New tools/file_layout.py
writes layout/file_layout.tsv: retail address + Mac file + retail file for
every linked function, the map for placing new code. Details, constraints,
remaining merges and whole-file contributors: layout/README.md, last section.

Original build, BOTH referees, all1448 extents and all fixtures pass (logs
proof/latest/retail_files_{build,fixtures}.log). C++104237/253580=
41.106159792%,617 bodies, unchanged. Same-offset9.060749965% (was9.138583293,
diagnostic). .text -288 B from fewer duplicate static-inline copies.
PINNED: the first object referencing fabs sets its form for all /Op TUs;
r_lightgrid_weights must follow r_water_load_obj until retail's earlier
fabs user exists. Next structural step: merge gfx.h and r_local.h type views,
then the r_init/material/screenshot/rb_shade merges are mechanical.

### Earlier: API dependency audit and execution priority corrected

No new source or coverage claimed in this audit.54 API slots remain byte/binding
accepted. Six more callbacks already have matching bodies but OPEN callee
bindings, now explicitly mapped with actual symbols/source owners/exact reasons
in layout/api_callbacks.tsv. Other38 unverified slots still need classification;
44 unverified bindings must not be described as44 missing callback bodies.

Known actual source gaps include LoadWorld1690, real RenderScene257a0, material
API wrapper17290 and raw-image172b0/171f0/fc30/14940. Existing material17100 and
IWI imagefa40 code must not be confused with those gaps. Primary traces and the
six exact dependency edges are in ATTEMPTS.md. Keep existing command work, but
prioritize a connected API/interface/owner batch before further isolated backend
handlers or tiny full-suite waves. WHOLEFILE.md records that execution order.

Metadata was checked against the existing fresh bind and all108 old manifest
rows; old columns are unchanged. No compiler inputs changed, so no repeat build
or135-test replay was needed. Last code checkpoint remains e3bce0e:135 fixtures,
all1448 extents, C++41.106159792%, same-offset9.138583293%,26/33 command-source
handlers. One build/output, no workers; token cost unavailable. Stages1-3 OPEN.

### Earlier: early post-effects and accepted callback source ownership

Restored command25=10030c10/126B in rb_backend.cpp, reusing the actual screen
copy and existing dvar/device/target owners. Flush before checking live flags,
set resolvedPostSunTarget14 first, copy target1 only for distortion OR the real
renderer/capability/glow/fullbright predicate, then publish1 after copy returns.
Advance the live cursor after COM callbacks. No new state, TU/order/root/flag.

Original build, BOTH referees and all135 fixtures pass.3076 new early-post cases
exercise all flag/renderer combinations, ordinary/optimized flushes, retries,
callback mutations, target publication and null skipped dvars. Existing48 copy,
48 save,240 blur and1536 blend cases remain. Actual Image_GetSurface and original
DX retry/logging macro run in the fixture; COM is mocked, no GPU claim.

API59 manifest now records source ownership for all54 accepted callback slots,
using fresh bind object -> unique current tus.txt entry -> existing source.
All prior slots/addresses/status/symbol/UNVERIFIED-label columns are unchanged.
44 callback owners remain UNVERIFIED, ten slots UNUSED_ZERO. This establishes
candidate ownership only, not historical grouping or complete API source.

All1448 accepted extents and their exact set remain; C++104237/253580=
41.106159792%,617 bodies, no new byte credit;31 assembly exclusions/7787B
unchanged. Source26/33 backend handlers; seven plus dispatcher/API/RenderScene/
world chains remain. Stages1-3 are OPEN. Same-offset9.138583293%
is diagnostic;157 temporary exports, no GetRefAPI. One output, no workers;
tokens unavailable. Receipt: proof/early_post_checkpoint.json.
Next: genuine sun/query/drawing and late glow/blur/debug chains. Existing111-byte
RB_NeedsSceneCopy already matches; keep it. Primary dependencies in ATTEMPTS.md.

### Earlier: actual line geometry and XYZ vertex writer

Restored XYZ/UV/color-pointer writer1002e550/229B, 2D line helper10031470/760B,
3D/debug line helper10031780/1332B and command31 wrapper10031cc0/91B. PC2D has
no width argument. Both paths reuse actual Vec2Normalize and RB_TessOverflow;
3D preserves the real depthTest byte input, temporary identity projection/view,
and fresh-view/fresh-material restoration. No point-style Z bias or extra guards.
Offsets precede overflow; 2D XYZ remains live per setter, 3D clip math stays fixed.
Counts publish index-before-vertices and vertex-after. Material-state view owns
no storage. Volatile preserves the two primary stores; no historical claim.

Original build, BOTH referees and all135 fixtures pass. Native17280 direct/
command line cases cover fixed count/width across callbacks, negative/zero
counts/widths, exact/overflow limits, NaN/infinite/degenerate endpoints, original
normalization/overflow, live color/XYZ/cursor, frozen clip math/offsets and depth/
view restoration. Vertex tests now check2688 complete DX7/DX9 buffers. Initial
VC7.1 offsetof(array-element) assertion failed; equivalent member-offset-plus-
word-size assertion passes. No executable workaround or compiler flag change.

All1448 accepted extents and their exact set remain; C++104237/253580=
41.106159792%,617 bodies. NO new byte credit;31 assembly exclusions/7787B
unchanged. Source now25/33 command handlers; eight plus full dispatcher/API/
RenderScene/world closure remain. Stages1-3 are OPEN. Same-offset9.138583293%
is diagnostic;157 temporary exports, no GetRefAPI. No new TU/order/flags/roots/
exports/globals/assembly. One output, no workers; tokens unavailable.
Receipt: proof/backend_lines_checkpoint.json. GPU and exact x87 remain unproved.
Next: command25 early-post uses the existing copy helper; dependencies and eight
remaining primary table entries are pinned in ATTEMPTS.md.

### Earlier: genuine 2D/3D point commands

Restored RB_DrawPoints2D10030de0/655B, RB_DrawPoints3D10031070/931B and command30
wrapper10031420/70B in rb_backend.cpp. Reuse shared point packets, original
vertex/overflow/matrix helpers and existing rgp/tess/state owners. 2D retains the
batch; 3D temporarily sets identity projection/view and restores the live view,
even for empty counts. 3D clip math precedes overflow; 2D geometry follows it.
Size/matrix captures, live per-setter counts, early indices and late vertices
follow PC instructions. No TU/order/flag/root/export/global or assembly added.

Original build, BOTH referees and all134 fixtures pass;7776 native point routes
exercise signed counts/sizes/dimensions, exact capacity, callback mutations,
packet/cursor lifetime and real overflow declaration restore. All1448 accepted
extents retained with the exact accepted address/extent set unchanged. C++ stays
104237/253580=41.106159792%,617 bodies; no new byte credit for private routines
awaiting genuine table reachability.31 assembly-bearing bodies/7787B excluded.
Source exists for24/33 handlers; nine plus the full dispatcher/API/RenderScene/
world chains remain. Stages1-3 are OPEN. Same-offset9.053728222%,157 temporary
exports, no GetRefAPI. GPU and exact x87 execution are untested by the mocks.
One output, no workers; token cost unavailable. Receipt: proof/backend_points_checkpoint.json.
Next: line31 helper pair/dispatch; pinned primary evidence is in ATTEMPTS.md.

### Earlier: stencil planes and packed triangles

rb_backend.cpp now has actual stencil-plane command7, triangle command32 and
its real render helper. They reuse existing vertex setters, Begin/EndSurface,
RB_Set3D and RB_TessOverflow. Shared rb_commands.h pins plane and16-byte triangle
prefixes; triangle payload is five separate arrays with signed-short counts.
Point/line16-byte vertices and packet layouts are also pinned, but their helpers/
handlers are NOT counted as reconstructed source yet.

Stencil geometry is read AFTER overflow; vertex counts are live per setter,
while distance/depth stay fixed for each quad. Counts publish AFTER vertex and
index writes. Plane count reloads each iteration. Triangles capture packed-array
pointers and scalar counts before callbacks, copy indices before vertices, then
publish counts and flush. The PC3D transition condition is preserved, rather than
the reversed Mac draft condition. No duplicate tess/material/state is allocated.

Final original build, BOTH referees and all133 fixtures pass; the exact1448
accepted extents remain. Native2160 stencil and8640 direct/packed triangle cases
check captures/live mutations, late publication, five-array offsets, index wrap/
guards, unconditional final flush and actual overflow declaration restore,
including its extra flush branch. Vertex/surface calls are mocked; existing
vertex/submission helpers have separate native checks, no GPU proof is claimed.

NO new byte credit: C++104237/253580=41.106159792%,617 bodies, frozen inventory;
31 assembly exclusions/7787 bytes unchanged. All three new bodies await genuine
table reachability. Source exists for23/33 non-null command handlers;10 plus the
real dispatcher/API/RenderScene/world chains remain. Stages1-3 are NOT complete.
No new TU/order, roots, flags, globals or authored assembly; all prior backend
source restores exactly by removing the new section. Named imports stay exact;
157 temporary exports, no GetRefAPI. Same-offset equality9.053728222% is diagnostic.
Proof: proof/backend_geometry_checkpoint.json; protected bind unchanged.
Next: point30 and line31 helper pairs/dispatch. Their primary mapping is pinned
in ATTEMPTS.md, not inferred from the incomplete Mac command table.

### Earlier: actual screen copy/save/blur/blend chain

Five new private functions in rb_backend.cpp restore screen copying, save,
shadow-blur pass/dispatch and saved-screen blending. They reuse actual
Image_GetSurface, R_DX_CALL and the single r_permanent.h/DxState/backend owners.
No new buffer, allocation or partial command table. New handlers are10/28/29;
source exists for21 of33 non-null handlers, with12 plus the genuine dispatcher,
remaining API/RenderScene/world chains still open. Stages1-3 are NOT complete.

The copy/release retry paths use live device/source state and a captured surface.
Save publishes scene time AFTER copying. Blur captures dimensions/image BEFORE
copy, reads material AFTER callbacks, completes each pair before reloading the
sc_blur pointer/count. Blend uses wrapped32-bit tick subtraction, primary float-
widened0.01 base,0.99f clamp, high-byte alpha and full0..1 UVs. It reuses existing
I_fround; NO new assembly definitions or C++ credit for containing expansions.
The Mac low-byte alpha/power-of-two UV and captured blur count are not copied.

Final original build, BOTH referees and all132 fixtures pass; the exact1448
accepted extents remain. Native48 copies/48 saves/240 blur commands/1536 blends
check actual image helper/macro, retries/logs, changing devices/targets/cursors,
material/time publication, live blur dvar pointers, wrapped ticks and UV/color.
COM and biased rounding are modeled; no GPU/client or exact original x87/CIpow
proof. Existing31 assembly exclusions/7787 bytes stay unchanged.

NO new byte credit: C++104237/253580=41.106159792%,617 bodies, frozen inventory;
all five new bodies remain uncredited pending genuine table reachability. No
new TU/order, roots, flags or globals. All prior backend source reconstructs
exactly by removing only the new section. Named imports stay exact;157 temporary
exports and no GetRefAPI remain. Proof: proof/backend_screen_checkpoint.json;
protected bind stays image_residency_warm_bind.json. Next connected group is
debug geometry (stencil planes, points, triangles, lines), reusing existing vertex
writers/overflow. Primary table7 is StencilPlanes; blur is table28.

### Earlier: genuine frontend command interfaces

Four writers in r_rendercmds.cpp now use correct roles and shared typed records:
R_AddCmdSetViewport(21bf0/98B), R_AddCmdBlendSavedScreen(222f0/93B),
R_AddCmdClearScreen(22220/118B) and four-argument R_AddCmdDrawSurfs(21890/108B).
Retail client copies108 API words to60f080 and directly calls slots56/54/55 for
viewport/blend/clear; its source declarations agree. The API inventory's three
accepted symbol rows now use these actual writer names, with historical legacy
labels still explicitly unverified. No partial GetRefAPI table is advertised.

The duplicate unmatched typed clear draft and false no-argument RenderScene
null-jump draft are removed; both remain recoverable in git. Real API36
RenderScene257a0 is still missing. Temporary exports drop159->157, while every
verified extent stays protected. Clear/viewport remain unguarded allocations;
blend/draw-surfaces retain their actual null checks and unused bytes.

First probe's16-byte color copy lost the118-byte clear match and was rejected.
Four explicit4-byte copies preserve typed float payloads and the original
instructions: final original build and BOTH referees retain all1448 extents.
All131 full fixtures pass;1051 focused typed cases test raw float bits, live
allocator-mutated colors, padding and exact allocation/null policies. Primary
client instruction checks calibrate slots; this is not a client/GPU run.

NO new byte credit: C++104237/253580=41.106159792%,617 bodies, frozen inventory;
31 assembly exclusions/7787 bytes unchanged. Same-offset equality9.053728222%
is diagnostic only. Named imports remain exact. No new globals, TU/order, flags
or authored assembly. Backend handler source remains18/33. Stages1-3 remain
OPEN: full dispatcher, remaining callbacks, real RenderScene/world loading and
GetRefAPI still need source. Proof: proof/frontend_types_checkpoint.json.
Next connected backend group: actual screen copy/save/blend, using shared state
rather than duplicating buffers or substituting Mac-only behavior.

### Earlier: PC raw-frame surface and command

RB_StretchRawCmd and the primary-pinned role helper RB_DrawRawSurface now have
source in rb_backend.cpp. Actual PC behavior creates ONE offscreen surface,
locks/retries through the existing logging path, copies RGBA to BGRA with the
returned pitch, unlocks, stretches to the live target0 and releases once. It
does not use the Mac texture/GetSurfaceLevel substitute or add a surface flush.
The actual32-byte payload is shared in rb_commands.h; arguments are captured
before COM work and command advancement uses live execution state afterward.

Original-toolchain build and both referees retain the exact1448 accepted extent
set; all130 final fixtures pass. Native4320 direct/command routes check creation
failure, zero dimensions, padding/canaries, channel order, retries and ignored
lock/unlock/stretch errors, exact retail log, live device/target/cursor changes
and release order. COM is mocked; no GPU/client run or arbitrary overlap proof.

NO new byte credit: C++104237/253580=41.106159792%,617 bodies on the frozen
inventory, not whole-DLL completion.31 assembly exclusions/7787 bytes unchanged.
Source exists for18 of33 non-null command handlers;15 plus the genuine table/
dispatcher and world/API closure remain. No new globals, roots, TU/order, flags,
exports or authored assembly. Removing only the new section restores every prior
backend source byte. Named imports stay exact;159 temporary exports, no GetRefAPI.
Same-offset equality9.153328955% is diagnostic. Stages1-3 remain OPEN.
Proof: proof/backend_raw_checkpoint.json; protected bind remains
image_residency_warm_bind.json. ATTEMPTS.md also records a frontend type/name
trap: matched writer22220 emits clear-screen despite its old blend-screen label.
Confirm its true client-facing signature before building the typed API table.

### Earlier: typed scene/LOD and image residency

r_scene_records.h replaces SDK backend/command opaque scene and LOD arrays with
shared16/20-byte records matching the common view. Objective shader time uses
sceneDef.floatTime. Both views pass size/offset checks and reject wrong-width
time. Storage/offsets stay unchanged. r_image_registry.h shares the actual0x2004-
byte ImageList between the existing registry and new rb_imagetouch.cpp.

Image residency now has real comparator, traversal and command33 source. It uses
actual registry iteration, original CRT qsort, live feedbackReplaceMaterial and
existing DrawStretchPic/EndSurface, then clears the sole feedback pointer. The
primary comparator's unusual second-zero-semantic rule is preserved. There is
NO duplicate registry/global, partial command table, new export or assembly.
Source exists for17 of33 non-null handlers;16 and genuine dispatcher/API/world
closure remain. Stages1-3 are NOT complete.

Original build/both referees match the real56-byte comparator entry10035850;
all1447 prior extents survive. C++104237/253580=41.106159792%,617 bodies on the
frozen legacy inventory, NOT whole-DLL completion. The full129-fixture suite
passes, including196608 comparator cases,144 actual registry/command traversals
and60 interrupted draws. Traversal and command source remain uncredited. Draws
are mocked: no GPU residency/client execution proof.31 assembly exclusions/
7787 bytes stay unchanged. Same-offset equality9.153328955% is diagnostic only.

The new frozen bind ratchets the gate to1448 extents; comparator removal,
wrong extent and lost binding negatives each fail correctly. No byte-spelling
sweep was used. Candidate new TU follows backend, without a historical order
claim. All named imports remain exact;159 temporary exports and no GetRefAPI.
Proof: proof/backend_residency_checkpoint.json and image_residency_warm_bind.json.
Next actual chain: raw-frame command17; primary PC offscreen-surface behavior
is recorded in ATTEMPTS.md and differs from the Mac texture substitute.

### Earlier: begin-view and 3D matrix restoration

RB_BeginViewCmd and RB_Set3D now have actual source in rb_backend.cpp. The48-byte
shared command record carries scene, view, LOD and view-count payloads. Begin-view
retains the original packet across a flush, publishes viewport/matrix/tile/video
state, and calls the existing viewport, PC frustum and matrix implementations.
Set3D restores identity at the active stack level and uses fresh camera state
after existing matrix callbacks. No Mac pixel/power-of-two scaling is introduced.

Source exists for16 of33 non-null command handlers;17 remain, plus the genuine
dispatcher/table, world-load and remaining API closure. Scene/LOD byte views still
need typed shared recovery. Stages1-3 are NOT complete; no whole-file/GPU claim.

Original-toolchain build, both referees and all128 full fixtures pass, retaining
the exact1447 accepted extents. Native240 begin-view plus240 direct3D cases check
shared ABI, pre-flush capture, callback-mutated cameras/cursors, selected matrix
stack, payload copies, viewport sequencing and unscaled PC frustum arithmetic.
Native matrix/COM hooks do not prove real GPU behavior or all IEEE cases.

NO new V2 credit: C++104181/253580=41.084076031%,616 bodies, frozen inventory;
31 assembly exclusions/7787 bytes unchanged. Same-offset equality9.062694448%
is only diagnostic. Named imports stay exact;159 temporary exports and no
GetRefAPI remain. No new roots, flags, globals, TU/order or authored assembly.
Removing only the new section restores all prior backend source exactly.
Proof: proof/backend_view_checkpoint.json. Next: typed scene/LOD ownership and
remaining genuine command chains, then world/API closure; no leaf flag sweeps.

### Earlier: backend light, stencil, shadow and clipping

Four more actual handlers now have source in rb_backend.cpp: light properties,
stencil reference, shadow cookie and clip planes.15 of33 non-null handler bodies
are source-restored;18, the genuine table/dispatcher and API closure remain.
Original packet ownership, live retries/counts and stack-zero shadow invalidation
are pinned against retail, rather than copied from the different Mac wrappers.
The shared packet header gains actual76/8/72-byte records and variable planes.

Original build and both referees retain the exact1447 accepted extent set;
all127 final fixtures pass. Focused native checks cover64 light,120 shadow,
72 stencil and168 clip cases, including raw special-value bits, live command/
device changes, retries, cached state publication and nonzero matrix-stack level.
No new assembly, state owners, roots, flags or TU-order changes. Every prior
backend source byte is recovered by removing only the new four-handler section.

NO new V2 byte credit: C++104181/253580=41.084076031%,616 bodies on the frozen
inventory;31 assembly exclusions/7787 bytes unchanged. Same-offset equality
9.068527897% is diagnostic only. COM calls are mocked, no client/GPU execution.
The initial concurrent fixture run was rejected by its freshness guard; the
entire final suite ran after fresh build/referees and passed unchanged guards.
Stages1-3 and whole-file identity remain OPEN. Next connected source work is
BeginView and Set3D, then remaining actual command chains and world/API closure.
Proof: proof/backend_state_checkpoint.json.

### Earlier: four backend 2D commands

RB_StretchPicCmd, RB_StretchPicRotateCmd, RB_DrawQuadPicCmd and
RB_DrawFullScreenColoredQuadCmd now have real source in rb_backend.cpp, with
shared, size-asserted command records. Source exists for11 of33 non-null
handlers;22 and the actual dispatcher/table still remain. These private bodies
await genuine table reachability and receive NO new byte-match credit.

The original compiler build and both referees retain all1447 protected extents;
all126 fixtures pass. Focused native checks cover540 arbitrary quads,3240 rotated
quads and12 forwarding cases, including early count publication, capacity,
callback-mutated materials/colors and live cursor advancement. Rotation reuses
existing FastSinCos assembly; no new assembly is authored. Future acceptance
must audit containing expansions separately. Mock trigonometry/COM checks do
not establish exact x87 arithmetic, GPU execution or complete command execution.

C++ remains104181/253580=41.084076031%,616 bodies on the frozen inventory;
31 assembly-containing bodies/7787 bytes remain excluded. Same-offset equality
9.068527897% is a layout diagnostic. Stages1-3, API/world-load closure and
whole-file identity remain OPEN. Proof: proof/backend_2d_checkpoint.json.

### Earlier: backend control/state commands and presentation

Six private handlers now have real source in the existing rb_backend.cpp:
Goto/Call/Return, material color, viewport and render target. Together with the
existing clear handler,7 of33 non-null command-table bodies are source-restored;
this is NOT a completed dispatcher/table or byte-accepted callback graph.
Payload pointers are captured before surface flush; advancement reloads live
execution state afterward. Material color copies raw bits, not FP conversions.

RB_EndFrame33b20 now presents the selected swap chain once, handles lost/error
results, resets the live dynamic index cursor/projection flag, updates logging
and applies modified gamma settings through the existing shared implementation.
No GPU smoke or full command execution is claimed.

rb_commands.h owns the shared16-byte execution state and command records.
Backend's smaller tess view is replaced by the existing full rb_tess.h schema;
the single tess allocation stays unchanged. No TU/link-order entries were added.
All prior executable/assembly source restores byte-for-byte when only these
declaration/include moves are reversed. The full-file assembly source pin was
reviewed/updated; no assembly instruction or exclusion policy changed.

A discarded split-TU trial produced EAX worker fragments at2eb64/74/94,
not actual callback entries2eb60/70/90. Those48 interior bytes were NOT promoted
or ratcheted. Correct private linkage is retained in the original TU; handlers
stay uncredited until the genuine table gives them actual reachability.

Final original-compiler build and both referees retain all1447 old extents;
NO new byte credit. C++104181/253580=41.084076031%,616 bodies on the legacy
inventory, not whole-DLL completion. Same-offset file equality9.068527897% is
only a layout diagnostic. Native30 control,96 state-handler and260 presentation
routes pass, including payload/pointer changes, fatal returns, live cursor and
gamma/logging callbacks. All125 final fixtures pass; the pre-existing frame-data
fixture is restored verbatim, with presentation in a separate new test. The six
assembly-negative checks and original31 exclusions/7787 bytes remain intact.

Evidence/logs: proof/latest/backend_commands_preflight.log,
backend_commands_build.log and backend_commands_fixtures.log. The remaining26
handler bodies, real dispatcher, remaining API/world-load closure, exact layout/
metadata/SHA and client/GPU execution remain OPEN. No new flags, roots or globals.
Frozen measurements and declaration/assembly review: proof/backend_commands_checkpoint.json.

### Lost-device recovery and shared permanent state

R_ResetDevice13690 (role name) and R_RecoverLostDevice137f0 now connect the
actual reset/release/recreate/reload/calibration sequence. Only DEVICELOST
postpones recovery; other cooperative-level results continue. Reset captures
the original window/video/AA parameters before resource release, reloads the
live device afterward, restores both FP-control masks, then clears deviceLost
before resource creation. Returning fatal callbacks retain original continuation.

Image_BuildWaterMapd0f0 and R_ReloadLostImagesd2e0 restore category5 dynamic
textures only: DX7 one mip/X8R8G8B8 versus DX9 full mips/L8. Thirteen program
images and already-created textures are skipped. Existing model, world, material
and calibration helpers are reused; vertex-declaration release is now callable
without clearing the declarations needed for rebuilding.

r_permanent.h shares the existing SDK-side MaterialTextureDef and complete
10f0-byte permanent-state schema across material/device/state users. It replaces
the duplicate material definition and the state's smaller head-only view;
r_init.cpp still owns the ONE allocation. All relevant offsets are compile-pinned.

Cold original-compiler build, both referees and all123 fixtures pass, retaining
all1447 protected extents. NO new byte credit: C++104181/253580=41.084076031%,
616 bodies, frozen legacy denominator. All four new bodies remain uncredited.
2304 reset/recovery routes,1536 water rebuilds and2048 lost-image selectors
pass, including callback/device/world changes, format/mip choices and failure
publication. FP-control calls are mocked in native checks; no actual GPU reset
or hardware calibration is claimed. Same-offset file equality9.098775408% is
only a layout diagnostic. Named imports remain exact, with159 temporary exports
and no GetRefAPI. No new globals, flags, roots or authored assembly.

Proof: proof/device_recovery_checkpoint.json; logs under proof/latest/ named
device_recovery_preflight.log, device_recovery_build.log and
device_recovery_fixtures.log. Backend dispatcher/command closure, remaining API
callbacks/world load, original TU/order proof, SHA and game smoke remain OPEN.

### Genuine frame start

R_BeginFrame10021f40 (API59 slot47) now connects actual material sorting,
modified light/sun/settings handling, LOD distance publication, client debug
flushing and optional skin-cache locking. Two address-pinned internal helpers
use role names, not claimed original names. Existing sun/light/cache functions
and all mutable state owners are reused; no stubs or injected callbacks.

Material comparison uses the pinned byte sortKey13 and typed140-byte technique
elements. Material_Sort87 bytes now match both referees, adding87 game C++ bytes.
The original VC7.1 std::sort also reproduces ten dependency extents/1830 bytes,
kept OUT of game credit. Current game C++104181/253580=41.084076031%,616 bodies;
frozen legacy denominator, NOT whole-DLL completion. All1436 prior extents
survive; the gate now protects1447 with11 independent removal negatives.
Material comparison and the three new frame bodies remain uncredited.

4105 native frame routes pass, including modified-flag order, inverse forced
LOD distances and live dvar/world/client mutations.589824 comparator cases and
128 sorts pass with actual Material/TechniqueSet shapes and sole sorted-index
writes. Original compiler/ABI pins, both referees and all121 full fixtures pass.
Named import set remains exact; same-offset file equality9.109524077%
is only a layout diagnostic. No new globals, roots, flags or authored assembly.
Evidence: proof/frame_start_warm_bind.json and proof/latest/frame_start_build.log
plus frame_start_fixtures.log. Remaining API/backend dispatch, world load,
original file/order proof, SHA and client/GPU execution are still OPEN.
Frozen measurements/source hashes: proof/frame_start_checkpoint.json.

### Console API source

R_ConsoleTextWidth1000c390 (API59 slot78) and R_DrawConsoleText1000c4b0
(slot79), plus their two packed-console helpers, now have genuine source in
r_font.cpp. The client API confirms int width/void draw; GLM's shifted labels
and Mac's extra ResolveFont/null-font handling are not PC proof. Native checks
cover2048 text runs,2052 icon routes and14 integrated width/draw routes with
actual font/glyph layouts, RGB carryover, trailing spaces, flips, fractional
icon units, late default-material changes and incomplete icons. Input expansion
cases are bounded; no claim of safety for arbitrary malformed console streams.

Original compiler, both referees and all1436 protected extents pass. NO new
byte credit: C++ remains104094/253580=41.049767332%,615 bodies. Same-offset
file equality8.848045147% is only a layout diagnostic. All four new source
bodies remain uncredited pending matching. No new globals, roots, flags or
assembly. All119 full fixtures pass; logs are proof/latest/console_text_build.log
and console_text_fixtures.log. The real GetRefAPI and remaining callback graph
are still open, especially frame/backend dispatch and world-load closure.
Frozen measurements and source/test hashes: proof/console_text_checkpoint.json.

### Genuine shutdown source

Eleven shutdown helpers/callers are restored in their existing source owners:
stream cleanup; normal debug frame; light/font registries; images; render
targets; dynamic pools; reset resources; hardware; command removal; R_Shutdown.
MaterialGlobals now has one shared definition and its existing sole instance.
The caller performs logical cleanup regardless of destroyWindow, then optional
hardware teardown and dvar-system removal, then ten exact command removals.
This includes retail's unregistered r_vc_stats; no invented extra startup command.

Both referees accept three new extents/444 C++ bytes: R_ShutdownRenderTargets162,
R_UnregisterCmds114 and the previously unaccepted R_GetImageMemory168. Current
C++104094/253580=41.049767332%,615 bodies; legacy denominator, NOT whole-DLL
completion. All1433 old extents survive; the gate now protects1436, with three
independent removal negatives. Other new source bodies remain uncredited.
All retail named imports now exist with no extras, including genuine IsWindow.
Order/hints/metadata remain unproved. Same-offset file equality8.849233442% is
only a layout diagnostic, not progress toward a claimed source percentage.

4096 native resource routes,2048 image routes and300 logical shutdown routes
pass. Checks use actual shared PC resource/image/material schemas and exercise
optional allocations, release order, retained/colliding program-image hashes,
live sampler/window bounds, interrupted cleanup, count-only registry resets and
normal-frame ownership. The crashing nonzero alwaysfails path is NOT executed;
its loops are retained from primary instructions. All118 full fixtures pass.

Original compiler/preflight and both referees pass. One existing build, no new
flags, roots, storage or authored assembly. Logs: proof/latest/shutdown_preflight.log,
renderer_shutdown_build.log and renderer_shutdown_fixtures.log. Frozen new binding
evidence: proof/renderer_shutdown_checkpoint.json and renderer_shutdown_warm_bind.json.
GetRefAPI/API59 callback closure,
final ownership/order proof, SHA and client/GPU smoke remain OPEN.

### Major startup-source checkpoint

Follow-up: R_BeginRegistration now has primary-proven source in r_init.cpp:
always call R_Init, then copy the complete44-byte video configuration. Retail
10013190..100131a9 calls10012f80 and copies eleven words from101d4c6c.
The sole vidConfig allocation is unchanged; no temporary root/export was added.
Native tests cover repeated initialization, all44 bytes, output guards, startup
failure before publication and self-alias. Original compiler and both referees
retain all1433 protected extents. This is source recovery, not new V2 credit:
C++ remains103650/253580=40.874674659%; whole-file same-offset8.864897331% is
only a layout diagnostic. Genuine API reachability and shutdown remain open.
All115 fixtures pass. Logs: proof/latest/begin_registration_build.log and
proof/latest/begin_registration_fixtures.log.

After2a1b722, ten genuine functions complete the candidate's R_Init source
closure: optimized/ordinary tess drivers and EndSurface;2D matrix state,
overflow, packed quads and sun-query calibration; font file loading/registration;
and the actual13-step R_Init caller. Device/pass/surface callers now share ONE
20-byte GfxDrawPrimArgs definition. The candidate startup sequence links through
actual source, not dummy functions. GetRefAPI is still absent: this does NOT
finish stages1-3, the export/callback graph, GPU execution or retail SHA.

Existing mutable owners are retained: one tess, rg/rgp, backEnd, dx/dxState,
sun-query state and font registry. Read-only surface views add no allocations.
2D state preserves unused cache data and the primary identity-copy quirk;
calibration performs actual BeginScene/clear/query/draw/EndScene/GetData polling,
not a CPU benchmark or injected result. Font loading preserves both16-byte disk
and20-byte runtime layouts, real file ownership/fixups and the16-font cache.
R_Init uses fonts/smalldevfont track1 and publishes samples only after font,
sine/FFT and DObj setup. Primary rg base101d4d00 fixes FFT offsets2510/2d10.

All114 fixtures pass: new96 ordinary/48 optimized/1024 EndSurface routes,
864 matrix/8 overflow/240 quad/109 calibration routes,60 font and32 startup
routes. Tests include live state/cached-pointer changes, exact capacity bounds,
query retries/failure fallback, allocation guards and startup exception order.
Original compiler/preflights, both referees/source attribution and all1433 old
extents pass. Accepted address/extent set unchanged; NO byte-credit gain:
C++103650/253580=40.874674659%,612 bodies, frozen legacy comparison denominator.
These ten functions are real source recovery but remain individually uncredited.
No new roots, mutable owners, flags or authored assembly. Earlier FP/all-input
matching limits remain open. One build output, no workers; billing unavailable.

Receipt/source/decompiler/log hashes: proof/renderer_startup_checkpoint.json.
Candidate SHA40bf1f60a49a7c3baa1284fbee70deb3c81e5f507f2a5b51bfa010eb680b90dc;
same-offset8.850961871%, NOT source completion. Build and final114-fixture suite are terminal.

Next: genuine Shutdown/BeginRegistration and remaining callback closures, then
fully typed GetRefAPI/API59. Follow primary code, not shifted GLM labels (bce0's
R_PickMaterial label is actually RegisterFont, confirmed by its error strings).
Shutdown13080 resets font count inlined: Mac r_init calls R_ShutdownFonts and
r_font owns its static counter. Keep the owner; restore that genuine helper when
needed, do not expose/duplicate the static registry or add a fake reset wrapper.
R_Init is reconstructed source, not yet a byte-matched/smoke-tested entry path.
Stages1-3 and whole-file identity remain OPEN.

### Connected interpolation/entity/lighting/draw checkpoint

Afteraa03608, RB_GetLightingAtPoint/RB_SetupEntityLighting in rb_light_grid.cpp
and RB_SetupLighting/RB_DrawTechnique in rb_shade.cpp now connect the real grid
helpers to existing viewport/fog/hardware-light/pass drawing. No fake callbacks,
new export roots, mutable state, flags or authored assembly definitions. The
single16-byte DX7 renormalization constant is pinned at primary10190690.
Original MSVC confirms world.lightGrid11c, entity.origin3c, lighting104 bytes and
backend.viewCount3b4; the callers use the existing shared allocations/views.

All110 source fixtures pass. New tests cover65536 bounded interpolation routes
(all256 occupancy masks, four rounding modes, x8724/64-bit precision),7 entity
routes,2240 full lighting cases and420 draw dispatches. They check cached-light
publication/reload, exact shader constants/override, callback changes to technique
and renderer and output guards. Existing rounding assembly is reused, not added.
Full IEEE-input equivalence and exact FP instruction spelling remain UNPROVED:
this is not a declaration that interpolation is byte-matched. If it ever matches,
audit its inlined helper assembly separately rather than awarding C++ credit.

Original-compiler whole build, both referees/source attribution and all1433 old
extents pass; accepted address/extent set is unchanged. NO new byte credit:
engine C++ stays103650/253580=40.874674659%,612 bodies. All four new callers
remain uncredited. No register/flag sweep. One output reused, no workers;
billing unknown. Build and final110-fixture suite are terminal and passed.

Receipt/source/decompiler/log hashes: proof/lighting_chain_checkpoint.json.
Candidate SHA944f6e0d8fa6a41b6b23d54e46708575a69cf7dd588efed458cdb365714cc95f;
same-offset8.386284482%, NOT source completion. Next real closure: optimized/ordinary tess
surface drivers and EndSurface -> 2D/stretch pic -> sun calibration -> R_Init
and remaining API59 front door. All their lighting/upload/pass dependencies now
have genuine source. GfxDrawPrimArgs has two identical private definitions in
rb_state.cpp and rb_shader_matrices.cpp; share its schema before new drivers.
Do not edit assembly-bearing rb_backend.cpp casually (its entire file is pinned).
GetRefAPI, stages1-3, exact FP/SHA and actual GPU/client smoke remain OPEN.

### Verified grid visibility/cache source checkpoint

After20ee614, rb_light_grid.cpp adds seven genuine source implementations:
history insert/search, three debug boxes, actual corner visibility and valid-point
retrieval. Existing six-byte history allocation/count, shared colors/backend state,
Vec3Normalize and RI sight tracing are reused. No new state/roots/flags/assembly.
History capacity is400000 hex; insertion control stays a full-width int. A corner
without a trace bit skips collision. Otherwise trace sample -> gridpoint+0.01 times
normalized(sample-gridpoint), zero extents/model, oldHit0, brushmask2001. Debug
state is reread after callbacks; returned points reload grid.points after tracing.
The blue sample box directly calls AddDebugBox, preserving primary call structure.

Original-compiler build, both referees and all1433 protected extents pass.
All108 fixtures pass, including135 sorted-cache/capacity/narrowing cases,54 exact
float32 debug boxes and1152 visibility routes. Tests include full-width flag256,
trace rejection and callbacks changing debug/backend/point-array state. No new
body is byte-accepted: source C++ remains103650/253580=40.874674659%,612 bodies.
This is genuine connected source recovery, NOT a byte-coverage gain or finished
startup/API graph. No spelling or compiler-flag sweep. One output, no workers;
billing unavailable. Build and final108-test suite are terminal and passed.

Receipt/source/decompiler/log hashes: proof/light_grid_visibility_checkpoint.json.
Candidate SHA5518fc55c69c73f98fe7c815e8cd8a8d3b68d2607c03c5b434c06550da5b6565;
same-offset8.406107405%, NOT source completion. Next: grid interpolation and entity lighting
-> lighting/DrawTechnique/EndSurface/2D -> sun calibration -> R_Init/API59.
Existing /QIfist probe already generates QWORD instead of target DWORD FISTP;
do not repeat it or invent new x87 assembly. Hard float spelling still needs
bounded source/caller proof; the earlier owner asked to defer it, not fake it.
Stages1-3, retail whole-file SHA and actual GPU/client smoke remain OPEN.

### Verified light-grid helper checkpoint

Afterbb693a0, rb_light_grid.cpp restores five genuine helpers: packed coordinate
search,24-coefficient accumulation, scaling, primary default coefficients and
nearest/predecessor fallback. Shared16/8/24-byte layouts are asserted; existing
rgp/world/dvar state is reused. No new globals, roots, flags or authored assembly.
Search misses return predecessor (possibly-1), NOT the insertion point in the old
Mac draft. Retail fallback consumes it without bounds repair; native fixtures
use a guarded prefix record to verify that behavior. PC missing-grid gating also
differs from the reference. GLM data/decomp helps; its src/f ASM wrappers do not.

Both referees accept the141-byte search: engine C++103650/253580=40.874674659%,
612 bodies, same frozen legacy comparison denominator. Four other source helpers
remain uncredited: no flag or spelling sweeps. All1432 older extents survive;
ratchet protects1433, and removing the new extent fails. All107 fixtures pass,
including4000 packed searches,576 fallback/early-return cases and60 coefficient
cases.24 default values are independently derived from primary instruction writes.
One output reused, no workers; billing unavailable. Build/full fixtures terminal.

Receipt/source/proof/decompiler hashes: proof/light_grid_helpers_checkpoint.json.
Candidate SHA76d8efa78e6219d9388fc00168ae9d83b1fec7df9d5f93befe256fa37949d263;
same-offset8.175956253%, NOT source completion. Remaining real closures: grid visibility,
interpolation and shared log lookup/insertion -> SetupEntityLighting/lighting ->
DrawTechnique/EndSurface/2D -> sun calibration -> R_Init/API59. Do not skip those
branches or fabricate callbacks. Stages1-3, retail SHA and GPU smoke stay OPEN.

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
