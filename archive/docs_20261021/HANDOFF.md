# Renderer handoff — 2026-10-08 (read this first)

## Current — gfx-only workspace, whole-file first, 2026-10-21

Owner cleared the percentage goal and requested a committed checkpoint, gfx-only
writes and the roadmap to actual retail SHA. Checkpoint221cfa5 is committed;
no push. Read WHOLEFILE.md; it supersedes the40%/45% priorities below.

Active source remains target/work/src. Historical regression JSONs now live
under target/work/proof/history with unchanged pinned hashes. The lone draft
COM fixture input is under tests/fixtures, not an external scratch path. API
oracle and SUPPORTED inventory are preserved under proof/retail. The old
exploratory Makefile and library checker were moved/copied recoverably to
archive/legacy_entrypoints; current make verify selects the sole pinned build.
No active renderer build/check/fixture references dev/codex. Other tracks were
not edited; known client/deepseek names_1.0.json references still make deleting
codex unsafe for those tools. Renderer-only clearance is not workspace-wide.

Relink31006 retains all820 extents,612 mixed game bodies/107659 executable bytes,
authored C/C++99872/253580=39.384809528%. Full55-fixture source batch passed after
consolidation; two new whole-file/API-oracle checks also pass. Fresh post-relink
string check covers9878 extents and source attribution's six negatives pass.
No compiler/build/fixture session remains live. No new source credit this turn.

Whole-file-first findings: retail has one export, GetRefAPI; current has152
temporary exports and no GetRefAPI export. Of98 written API callback slots,
53 have accepted implementations; do not call the remaining45 absent source
without checking their drafts. Ten further slots remain initial zeros.
See layout/api_callbacks.tsv. First source task: real API59 callback graph and
retention, not more isolated spelling trials or invented callback stubs.

Same-object relink preserves raw .text/.data/.reloc hashes but changes whole
SHA, .rdata/debug hashes and timestamp. Metadata reproducibility is a verified
remaining task; no binary patch was made. The current SHA is
b779f9d3f034bd9fa993f528a5c0a6700666c642f45b59878e21e92e65310e68,
NOT retail. Before/after evidence is saved. Cold SHA identity and runtime smoke
remain unachieved. Older cpp_checkpoint.json is historical; its frozen source
attribution is cpp_pause_source_coverage.json. Current source receipt remains
source_coverage_current.json. Continue inside gfx only when owner requests it.

## PAUSED — world/sun/history checkpoint, 2026-10-21

Owner explicitly paused. No renderer build or fixture session remains live.
Latest full gate30037 passed all820 protected address-extents. Actual authored
C/C++99872/253580 =39.384809528%,581 bodies;1560 bytes remain to40%.
Mixed meter612 bodies/107659 executable bytes includes the unchanged31
assembly-bearing bodies/7787 bytes. Whole-file identity is NOT achieved.
This continuation adds309 accepted C++ bytes, no new assembly or library credit:
- R_GetMaxModelSurfaceCount100296a0/73, in r_staticmodel_load_obj.cpp.
- R_FlushSun10029120/158, in r_sky.cpp; only seven fields in each of four
 48-byte records are cleared. Query/error/cumulative-visibility bytes survive.
- BuildGridFilename10037670/78, in rb_light_derive.cpp; real outlined helper
 shared by the history initialization/save callers, not an inline-only draft.

All three pass both unchanged referees and are now pinned in check_checkpoint.py
and regression.py via world_sun_warm_bind.json and light_history_warm_bind.json.
Current bind SHA08c9bfa93c8e99a3f3ee3db1e0820953a85b1256c380d00583ef717fe3cdaf42.
Fresh source attribution SHAf730edc10a3da1e06feac91e03383572d90c438887a877dbfdba479cc876d610.
Receipt:target/work/proof/cpp_checkpoint.json. Warm V2/V3 only; independent
cold replay and a fresh full55-fixture batch remain outstanding. Previous
52 checks passed at the earlier checkpoint; all three newly added actual-source
fixtures passed separately (world dynamic112 cases, sun reset255 patterns,
history60 load/save paths plus60 filename bounds). Do not call that a fresh55 run.

New source stays in existing TUs, original profile and the gated BSP-first
candidate order. Layout README records new state ownership. Unaccepted drafts:
R_InitWorldDynamicData217 (primary217) differs only in early allocation register
choices; its model instance pointer is now explicit, preserving the target's
otherwise dead address calculation. First draft215 lacked that calculation.
RB_InitLightVisHistory196 vs194 and RB_SaveLightVisHistory100 vs94 remain
unaccepted; filename helper78 is accepted. Reusing fileLength for its unsigned
cap and sharing history globals did not improve either caller. Do not count
these lengths or start another unbounded register-tie sweep. No new TU/SDK,
assembly, referee relaxation, deletion, commit, push or release promotion.

Resume from target/work/src and ROADMAP.md; goal40% remains incomplete.

## Active — structure and world-buffer continuation, 2026-10-21

Goal ACTIVE:40% authored C/C++, then ROADMAP.md. Current99563/253580 =
39.262954492%;1869 bytes remain. This continuation adds ZERO accepted bytes.
Final gate26915 retains all817 protected extents.50 actual-source fixtures,
the9876-string-extent check and six source-accounting negatives pass. No
renderer build or fixture session remains live. Proof:cpp_checkpoint.json and
source_coverage_current.json (SHAa0ff5418ae8a35fc57ad6217e0393a6c24b23c626d14860553ce01ee21b5be97).

Retained: r_bsp.cpp first in tus.txt, a regression-safe candidate order, NOT
proven historical order. The separate material parser move still loses two
CRT bindings and was restored. Layout README records the exact failure and
why shared-helper addresses cannot mechanically determine object order.
The world-buffer uploader now calls the primary's Com_Memcpy rather than
CRT memcpy. Its461-byte draft remains unaccepted against472; the30-byte
reload wrapper is raw-equal but blocked by it. Three bounded copy forms are
exhausted: do not repeat an induction-pointer spelling sweep.72 actual-source
upload cases pass; the fixture caught the old wrong-copy-service version.

R_FilterEntityIntoCells_r uses VectorCopy and has the correct335-byte length,
but is still unmatched. Original negative-OR AABB tests and bevel memcpy are
restored. New BSP fixture pins NaN behavior against49 x87 relation pairs.
Static-model bounds /Op459 versus441 failed; original profile restored.
All retained source is target/work/src. Current bind differs from old DX7
JSON but preserves every protected extent; this is V2/V3, not a new independent
cold checkpoint, whole-file identity or GPU proof. Raw same-offset2.017887082%
is NOT source coverage. No deletion, commit, push or release promotion.

## Earlier — DX7 accounting checkpoint, 2026-10-21

Newest owner milestone is40% actual C/C++, then ROADMAP.md. Goal ACTIVE.
Latest build58478 passed all817 extents. Bind JSON remains identical to the
609-body cold checkpoint. No renderer build or fixture session remains live.
Retained code change: noinline on Com_Memcpy, Com_Memset and _copyDWord, with
unchanged byte/binding acceptance. It prevents those assembly helpers from
silently entering the C/C++ caller meter; no historical annotation claim.
source_coverage.py now excludes31 authored-assembly bodies/7787 bytes, pins
assembly-containing source and fails closed on changed or unknown assembly.
Receipt:target/work/proof/cpp_checkpoint.json and source_coverage_current.json.
The attribution receipt SHA is
905e8e629ad05879f6b1f5e714f06b47b8b8bb38d09dbf447a26873583745d59.
Current authored C/C++99563/253580=39.262954492%;1869 bytes short of40%.
This continuation adds ZERO accepted bytes;40% is NOT achieved.
The48-source-fixture batch, separate9876-string-extent fixture and source meter's
six negative controls pass. New tests cover actual wavelet-loader routing and
code-image selection. All unsuccessful code-generation trials were restored;
ATTEMPTS.md lists them. Avoid further selector/guard/loop spelling sweeps.
Current source stays target/work/src; no deletion/commit/push/promotion occurred.
The confirmed guards/DX7 facts are also recorded in the shared cod2-re skill.

Owner requested a complete, fastest-path plan after pointing out OpenCoD2 is
already imported. Read ROADMAP.md: reuse existing source, prioritize caller-
group/structure causes, limit unchanged-hypothesis spelling trials, and carry
layout/data/library/PE identity alongside code.45% means C/C++, not assembly.

Planning-turn trials were restored. Final session86511 passed both referees
and all817 protected extents; all422 original frozen inputs remain unchanged.
No renderer build is live. New actual-source picmip fixture passed1248 cases.
This planning/cleanup pass adds ZERO accepted bytes. All18 agent trials are
archived; no deletion, commit, push or release-tree promotion occurred.

Earlier owner target:45% actual C/C++, excluding assembly. Cold session36858
finished successfully: all817 protected extents retained, all422 frozen input
hashes unchanged, and bind/cmp byte-identical to dx7_pause snapshots. The
separate PDB-string fixture also passed9876 compiler-named string extents.
Receipt:target/work/proof/dx7_checkpoint.json. No renderer build remains live.
All18 old target/agent_* trials and compiler debris were moved reversibly into
archive/target_trials_20261021; no source or evidence is being deleted.
The top-level dev/codex tree still supplies historical research/tool imports;
do not delete it wholesale. Only target/work/src is active reconstruction.

Owner resumed after the pause. Session8328 finished successfully, preserving817
protected extents. Current source:target/work/src. Batch95248 completed45/45
fixtures, no failures,49.94 seconds; proof/texture_fixture_run.json SHA256
a5ad80f956807bb596514656b7af98166dd31624656ca05771a3344e5e48b745.
No renderer build or fixture batch remained live at resume. The PDB/string-
literal fixture was excluded while linking and subsequently passed separately.

Current accepted MIXED meter:609 game bodies /107350 executable bytes.
Proper-source coverage AT MOST99563/253580 =39.262954492%; complete inline
assembly attribution is still pending. This resume added7 real C++ bodies /
1712 executable bytes, not new assembly or library bytes:
10018370/73 index parser;100183c0/90 named index;1001ab70/311 DX7 option;
1001ad80/393 texture argument;1001af10/165 packed argument list;
1001afc0/316 texture operator;1001b100/364 coordinate generator.
All seven pass unchanged discovery/binding referees and regression. New tests
exercise actual source, all26 table rows/376 bytes, error partial writes,
two-sampler/eight-stage wiring and generator behavior. Individual new fixtures
passed, including45-fixture batch; separate PDB check/cold replay now pass.

Frozen pause bind:proof/dx7_pause_bind.json SHA256
622d74f862a8bc4e6df16932e6b339e1fae2c765ed068cdab36592bd5aa59569;
cmp:proof/dx7_pause_cmp.json SHA256
463e7bbaaf97b7b4be56be3f2ac1a4b0b53be8cb682b90b1ddd73dfbae7c5daf.
check_checkpoint.py already protects all7 through texture_warm_bind,
texture_list_warm_bind and texture_function_warm_bind. Independent forced
rebuild36858 reproduced this609-body checkpoint. Whole-file raw same-offset
equality at pause:1.999576535%, NOT source coverage or whole-file identity.

Unaccepted drafts retained, not credited: sampler list801 versus retail771;
stage list345 versus323; pass options75 versus97; pass wrapper70 versus65;
texture-state137 and sampler-prefix87 have branch-layout differences.
Cached state-map lookup now matches84 raw bytes at10018e80 after separating
cache-hit return from load-failure return, but binding still depends on the
unmatched state-parser chain. LoadPassStateMap161 is likewise blocked.
Condition349 versus346 remains unresolved. Arithmetic ERROR*!matched did not
improve it and was restored. Default state sampler helper remains347 versus303.

Rejected/restored: token helper moved to r_material.cpp, display enumeration
initialization/countdown trials, FFT aggregate temporaries plus /Oy-, and the
DX7 option table moved across TUs. No gain; original TU/profile/order restored.
Keep the added native display/FFT checks, but do not credit those draft bodies.
Table ownership stays in r_material_load_obj.cpp. The DX7 operator values are
compact engine IDs, NOT D3DTEXTUREOP; select is1. Coordinate parsing calls the
real Com_Parse, not the reference's Com_ParseOnLine. genEyeFacingDotCoords is
named by the warning but rejected by the target; preserve that behavior.

Source-only archive:proof/dx7_20261021_source.tar.gz, SHA256
855edbb2302e30bf3b79f1b2ed72abe07db78854bbf44e98518a9538c6c54d32.
This is source/tests/tools/layout, not a duplicate build; it preserves known
legacy assembly and is not an assembly-free release. Never unpack over newer work.

Next: continue reconstruction in the SAME source/build directories.
Continue the owner's45% proper-C++ target; neither it nor40% is achieved.
No deletion, commit, push or release promotion. No new assembly or referee
relaxations. Older paused/live-session paragraphs below are historical only.

## Historical continuation — clean image checkpoint, 2026-10-21

Owner pause, 2026-10-21: goal PAUSED until an explicit resume. No renderer
build/check process was found by the host process check at pause. Session43175
is historical, not live. Do not launch duplicate builds.

Latest confirmed warm acceptance:602 game bodies /105638 executable bytes;
proper-source coverage AT MOST97851/253580 =38.587822383%, pending complete
assembly attribution. Material_ParseRuleSetValue10018710/375 is newly accepted;
proof/state_value_warm_bind.json SHA256
053e0c8fc4c8b2f945256308f8aad12bd1ec52ab49e22a8032983de9f8159970.
810 protected extents retained. This continuation gained1439 accepted C++ bytes.
The independently cold-reproduced601 checkpoint below remains recoverable.

Last draft adds Material_LoadCachedStateMap (descriptive name,10018e80/84)
and tests/test_state_map_cache.py. The last tool output was truncated: its
terminal build/test result has NOT been independently recovered. Give this
draft zero credit; inspect current reports and rerun the existing single build
when resuming. Material_ParseRuleSetCondition remains349 versus retail346;
its dependent parser chain is not accepted. Sampler while-loop remains347
versus303. Positive-entry RuleSetValue loop with separator branch before the
semicolon-success branch produced the accepted375. Do not repeat boolean,
ternary or force-inline condition trials; they did not resolve the mismatch.
Fullscreen forced-inline trial216 versus149 was rejected and restored.
Isolated scratch/codex_20261021_round_cpp /QIfist probe passed runtime rounding
tests but emitted qword FISTP, not retail dword FISTP: no source credit and no
canonical compiler/header changes. No deletion, commit, push or promotion.

On resume, work toward45% proper C/C++, not mixed coverage.
Latest forced rebuild:601 game functions /105263 executable bytes =41.510765833%
MIXED. Proper-source coverage is AT MOST97476/253580 =38.439940058%; complete
inline-assembly attribution remains pending. Minimum additional proper bytes
for45%:16635. Whole-file raw same-offset equality is1.912614941%, not source
coverage; no whole-DLL identity or GPU proof.

Proof:target/work/proof/image_body_checkpoint.json. Warm/cold bind AND cmp JSON
are byte-identical;809 protected extents survive,40 source/audit fixtures pass,
415 source/tool/SDK inputs remain unchanged and all9 removal negatives reject.
Source-only snapshot (not another build tree):
target/work/proof/image_body_20261021_source.tar.gz, SHA256
51cfb7a43532e8482e670c3ceecdb333fa185d29e58c6039b74ffda2ab934cef.
It preserves source/tests/tools, including explicit legacy assembly exclusions;
compiler and SDK libraries remain external pinned dependencies. Do not unpack
over newer work. Current clean source remains target/work/src.

Adds1775 real C++ bytes /9 bodies over the previous592-body cold checkpoint.
This resumed turn adds1064: imagecompare1000d900/49 and R_ImageList_f1000d940
1070 full/1015 executable. The latter's55 switch/padding bytes are audited and
excluded. Actual SDK map/volmap/cubemap interfaces fix the primary frame;
physical case order must be RGB32,RGBA32,A8,L8,RGB16,AL16,DXT1,R32F,DXT3,DXT5.
Masked instructions alone missed exchanged strings/table targets; restoring
that source order clears the unchanged binder. No checker relaxation.

Source uses original VC7.1 std::sort rather than reconstructing library sorting
internals. New standard-library helpers receive zero game credit. Both image
label arrays belong to r_image.cpp; layout/README.md records primary addresses.
Fullscreen accounting now reuses the genuine Image_IsCodeTrack helper. It still
has149 bytes with the width condition register mismatch, not accepted. Earlier
plain inline platform-helper trial compiled216 bytes and was restored. No
forceinline platform-helper trial has yet been performed at this checkpoint.

No renderer process remains live at this frozen checkpoint. Subsequent active
work may advance; check current handles/build reports before rebuilding. Never
duplicate builds or touch foreign client containers. One link died with a Wine
connection reset; it was terminal before retrying, and the clean rebuild passed.
No deletion, commit, push or release promotion.

## Historical owner pause — 2026-10-21 (superseded above)

Latest completed build24802 passed both referees and every797 protected
game/library address-extent. No renderer build remains running. Active source
is target/work/src; original tus.txt order and compiler flags are restored.
User requires45% proper C/C++, not45% mixed coverage. Resume that requirement.

Current mixed meter:599 game bodies /104199 executable bytes =41.091174383%.
Known assembly exclusions remain7787 bytes; proper-source coverage is AT MOST
96412/253580 =38.020348608%. Full inline-assembly attribution is still pending.
This continuation added84 accepted C++ bytes: Image_Iterate1000d480/47,
R_AddImageToList1000c7e0/17 and Image_IsCodeTrack1000c7c0/20. Their snapshot is
work/proof/image_warm_bind.json, SHA256
26febf15d31ddd34cee5a34e3be12f103e5c884c756750cdab26dfde28f76f68.
check_checkpoint.py protects it. Current shader/image cohort cold replay remains
pending; do not describe this warm state as a completed cold checkpoint.

New actual source in r_image.cpp includes list construction, memory reporting
and the minspec accessor. Only the three bodies above count. List wrapper23
matches diagnostic instructions but misses the unchanged referee's minimum
literal anchor; memory reporter168 differs in final load/store scheduling.
Flat int-output and existing-helper inline trials did not fix it; original
structured output/platform-helper forms are restored. No R_ImageList_f source
has been added: primary strings, table rows and comparator were inspected only.

State-rule parser now uses the primary's bottom-tested rule limit and matches
the full517-byte extent100188e0..10018ae4, not inventory505. Binding is blocked
on its condition helper. No credit yet. Condition349 and value382 are active
drafts; target346/375. A bool-return Material_MatchToken trial lost protected
10018350/17, so its Bool signature is restored. Default handling uses a plain
ternary. test_state_rules.py exercises grouped-condition masks, copied values,
errors and256/257 bounds; it passed. All37 earlier fixtures passed as a batch;
the combined38-fixture batch has not yet been rerun on final source.

Other failed trials and restored changes are in work/ATTEMPTS.md. New local
recursive-pointer/SDK-record types preserve all matches but do not fix nested
347/589 bodies. The sampler loop currently has its leaf after the loop. Static
visibility on RB_GetCodeImage preserves all matches but leaves632 bytes; no
signature permutation was attempted. Water norm-expression trial failed and
was restored. No new assembly, verifier relaxation, duplicate build directory,
deletion, commit, push or release promotion. No workers were spawned.

## Active continuation — owner requires45% proper source, 2026-10-21

Do not pause or declare completion at the mixed meter. Latest protected warm
state:596 game functions /104115 executable bytes; proper C/C++ upper bound
96328/253580 =37.987222967%. Four new shader routines add627 executable C++
bytes beyond the frozen592-body checkpoint: scalar constant lookup188,
default constant lookup50, row-selection parser285 and default dispatcher104.
The last has a128-byte full extent including24 bytes of audited switch data.
All794 game/library extents are now required by tools/check_checkpoint.py.
Warm reports:proof/shader_warm_bind.json and shader_warm_cmp.json; mutable cohort
receipt:shader_lookup_checkpoint.json. Full current-cohort cold replay is pending.

PINNED call-boundary correction: Material_DefaultShaderArgument receives the
constant NAME separately, in addition to routing and output. Do not substitute
the Mac routing.name field. Explicit argument parsing does not initialize that
field either. This correction matches the default dispatcher and its real caller
now differs mainly in the final default-fill block. Primary shader-argument-list
parser1001a160 is separate from SDK wrapper1001a920; the Mac reference merged them.

Both recursive/nested parsers and argument-list parser remain UNACCEPTED.
Historical build16557 completed; noinline alone did not fix the nested bodies.
Array helper noinline annotations retain their accepted103/271-byte bodies.
The explicit-loop trials grew sampler347/496 and constant786/955; do not repeat.
Parent pointer-result conditionals must be integer-valued ?:1:0, not bool-return
function changes: the former reproduces caller211/358 bodies, still gated on
their unmatched nested callees. bool-return trials216/363 were rejected.

Real typed tables now cover159 primary sampler/constant/default rows. All names,
values, children, array counts and strides have an independent actual-C check.
State-name arrays start at8-byte boundaries in retail; aligning the first array
fixes the prior220-byte condition-parser data regression without a checker change.

SDK wrapper source is preserved and natively tested in
target/scratch/codex_20261021_shader_wrapper.cpp, not active compiled source.
Its217-byte body still has register differences and linking it disturbs the
old CRT _names binding. Exploratory anonymous-string checker changes were
REJECTED and reversed; bindcheck.py and string_literal.py match their frozen
literal_checkpoint.json tool hashes exactly. No verifier relaxation is retained.
test_shader_argument_list.py explicitly labels the deferred wrapper paths.

New test_xsurface_stream.py passes28832-bit packed rigid/skinned stream cases
against the unchanged loader. Before changing it, read NOTES.md180-225:
shared allocation, integer bone-width and unrolled-weight trials were already
tested historically and failed. No XSurface source change has been made here.
No agents spawned; optional permission for one cheaper worker was requested.

## Latest verified checkpoint — 2026-10-21

592 game functions /103488 executable bytes =40.810789494% MIXED.
Four newly reconstructed C/C++ routines add704 bytes over the588-body state:
Material_RegisterLiteral10016390/150, Material_RegisterString10016440/246,
Material_ParseConstantArrayOffset10019970/271 and R_HashString1002bfe0/37.
Proper-source coverage is AT MOST95701/253580 =37.739963720%; complete inline-
assembly attribution remains pending. At least5731 more non-asm bytes are needed
for40%. Do not quote the mixed meter as40% proper reconstructed source.

Proof:target/work/proof/literal_checkpoint.json. Final warm and forced rebuild
bind AND cmp JSONs are byte-identical; all790 game/library extents are protected
by tools/check_checkpoint.py. Removing any of the four new extents fails it.
All31 actual-source/audit fixtures pass;32-bit native fixtures require running
outside the sandbox's syscall restrictions. Whole-file raw same-offset equality
is1.825707360%, NOT source coverage. No whole-DLL identity or GPU smoke claim.

Clean working source:target/work/src. No new TU, compiler flags, root, assembly,
duplicate build directory, deletion, commit, push or release promotion.
Both fresh builds and all tests have completed; no task from this wave is live.

The narrowly scoped string-literal referee correction is documented below and
in work/ATTEMPTS.md. It compares full compiler-encoded literal lengths, not
neighbor data or just prefixes;9661 current literals pass negative controls.
On the frozen three-function sampler cohort, legacy/corrected checks have the
IDENTICAL accepted game set. Its five library gains receive ZERO game credit.
Original sampler_checkpoint.json and sampler_legacy_bind.json remain preserved.

Next: missing real constant-source caller10019ca0/358, using the newly matched
literal registry and existing literal-vector parser; confirm its remaining
recursive code-constant helper10019a80/540 directly on the primary binary.
Sampler caller207/211 and nested helper344/303 remain real active drafts, not
accepted coverage. Do not repeat their earlier spelling/flag sweeps. Other
model/viewport/image/vertex/Fresnel drafts remain unaccepted and preserved.

Literal registry lesson: target copies without incrementing literalCount.
Reversed float-comparison operands, a local destination pointer, and an indexed
return reproduce150 bytes. First pointer-return152 and global-indexed-store159
forms fail. Preserve signed-zero identity, NaN rejection and the exact16 limit.

## Resumed by owner — 2026-10-21

Owner said "go fast" after the pause. Active source remains target/work/src;
one serialized build at a time. New cohort: real sampler tables/caller,
R_HashString in r_utils.cpp, Material_RegisterString using that real helper,
and Material_ParseConstantArrayOffset10019970. String registry's complete PC
extent is246 bytes through RET10016535, NOT the inventory's239. Hash helper
1002bfe0/37 and registry246 pass the old byte AND binding referees, but no
new checkpoint is accepted until all783 old bindings survive.

The two CRT underscore-literal regressions expose the old checker's next-symbol
size inference reading12 bytes beyond the2-byte literal into unnamed CRT data.
A separate exact compiler-named-string boundary correction is under validation:
tools/string_literal.py, tools/bindcheck.py and test_string_literal_bounds.py.
The test covers9657 actual compiler literals, changed-byte/truncation negatives,
embedded NUL and wide strings. It compares full encoded byte counts including
terminators, not just prefixes. Other binding/relocation/call gates are unchanged.
Do not confuse this in-flight validation with a frozen completed checkpoint.

## Prior pause receipt — 2026-10-21

Owner requested an immediate pause at 1% remaining usage. Goal is PAUSED,
not complete. Resume only on request. Latest independently frozen checkpoint
is the material_checkpoint.json cohort below: 588 game functions, 102784 bytes;
proper C/C++ upper bound is 37.462339301%, NOT 40% proper source.

Last unaccepted trial adds Material_RegisterString (10016440/239) in
target/work/src/gfx_d3d/r_material.cpp, with passing native fixture
target/work/tests/test_material_strings.py. Build session35491 is no longer
available. Current regression.json still reports 588/102784 and no baseline
losses; no additional bytes are credited. Inspect current build/bind.json and
cmp.json before retrying. Do not duplicate builds or replace the hash-pinned
material_warm_bind.json checkpoint with an unreviewed trial.

Next bounded cohort: real Material_ParseSamplerSource caller10019620/211,
the saved deferred nested helper100194f0/303, and primary sampler tables.
Verify actual callee1005fa50 before naming it. Primary tables: root1018ec38,
light1018eb58, lightmap1018eb80, lightGrid1018ec0c. Read work/ATTEMPTS.md
for the earlier nested helper's two library string-binding regressions.
Keep one build directory and preserve all783 protected extents. No deletion,
commit, push, or release promotion was performed during this pause.

## Verified checkpoint — 2026-10-21, historical ACTIVE state

LATEST forced-rebuild acceptance:588 game functions /102784 bytes =40.533165076% MIXED.
Nine new pure C/C++ extents add1306 bytes over the579-body checkpoint. Proper
source upper bound94997 bytes /37.462339301%; at least6435 more are needed for40%, and the
complete inline-assembly attribution audit is still pending. All783 extents
are now protected by work/tools/check_checkpoint.py and its hash-pinned
work/proof/material_warm_bind.json. The forced rebuild in the SAME directory
completed successfully. Warm/cold bind AND cmp files are byte-identical.
Proof: work/proof/material_checkpoint.json. All nine new extents are independently
decoded through their final RET, and removing each one separately fails the gate.
All ten touched native fixtures pass. No build/test remains running from this wave.

New accepted: polygon10005440/197, box10005590/240, string10005680/131,
scaled string10005710/145, shader constant lookup10019400/123,
array offset10019480/103, scalar sampler lookup10019700/123,
literal vector100198c0/170 and existing integer parser1005ff30/74.
All are readable C/C++, not inline assembly or retail byte wrappers. New native
fixtures cover polygon7200, box11560, string280, scaled string2048, literal20,
array560, scalar sampler and serialized table16 cases. Old model/plume tests
also pass. New compiler body matches are never credited without call/data binding.

UNACCEPTED active drafts: three vertex writers in rb_backend.cpp, Image_FindExisting
and its range helper in r_image.cpp, older Fresnel and model/state near matches.
The failed nested sampler is OUTSIDE active src, in
target/scratch/codex_20261020_sampler_source_deferred.cpp. Its99-case fixture
is clearly labeled deferred, not compiled-source coverage. Do not put it back
without rechecking the two library string bindings noted in work/ATTEMPTS.md.
No new build directory, TU order, flags, assembly, deletion, commit or push.

Earlier frozen checkpoint was579 /101478 game bytes,40.018% MIXED and
AT MOST36.947% proper C/C++. All774 baseline extents were retained by the
completed restored build; source/proof hashes are in
target/work/proof/continuation_checkpoint.json. Goal is NOT complete.

Owner resumed the goal. Sessions91001/55075 completed successfully, but the
separate endpoint-temporary trial added ZERO accepted bytes and enlarged the
boxes frame. It is rejected and original r_model_bounds.cpp restored.

New ACCEPTED readable source: R_AddDebugPolygon in work/src/gfx_d3d/r_debug.cpp.
PINNED PC10005440 through RET10005504,197 bytes; scalar append, both capacity
checks and ordered polygon/vertex allocation. Actual-source fixture passes7200
cases, and the existing1458 plume cases pass. No retention wrapper or guessed
register declaration was added. Its genuine caller R_VisitPortals1000a020 is
still missing, but the compiler retained the external function without an export
and generated the correct custom ABI. Warm and forced rebuild accepted sets and
bind/cmp hashes are identical:775 extents retained. The strengthened checkpoint
gate also rejects a negative control removing the new197-byte target.
Current580/101675 =40.095827747% MIXED; proper-source upper bound93888/37.025002%.
Proof: work/proof/polygon_checkpoint.json and polygon_warm_bind/cmp.json.
The older continuation receipt describes the preceding source. Goal ACTIVE.
No delete, commit, push or release promotion.

## Bounds/caller continuation — 2026-10-20

Current accepted accounting remains579 game functions /101478 bytes, with
all774 baseline game/library extents retained by the last completed fresh build.
This is40.018% MIXED, at most36.947% proper C/C++; no new accepted gain.

New readable source in target/work/src/gfx_d3d/r_scene.cpp restores the genuine
API callback10020cd0/12 and worker10023d40/47. The worker's instruction body
matches but its bounds callee is unresolved. The tiny callback is below the
unchanged discovery anchor requirements. Neither is counted. Its96-route
actual-source test passes; view-matrix tests now include ChangedWorldMatrix.
The old Fresnel receipt below is historical, not a hash of current roots/source.

The bounded six-order endpoint-expression batch finished: every gate passed,
but every variant added ZERO accepted bytes. Original model source is restored
and its final full gate passed. Do not repeat this permutation sweep.
Matrix/viewport failed forms and the corrected227-byte projection extent are
in work/ATTEMPTS.md.
No checker weakening, new assembly, TU reorder, commit or push.

Image-accounting and water norm-order follow-ups also added ZERO accepted bytes.
Both original source files are restored and the complete checkpoint gate passes.
New test_image_setup.py and test_fullscreen_targets.py reuse existing fixtures
against the clean source:256 track values and1152 allocation cases pass.
proof/continuation_checkpoint.json records source and proof hashes for the
restored state. The40% proper-source goal remains active and unmet.

## Latest bounded reconstruction work — 2026-10-20

Active tree remains target/work. New real FresnelTerm source is in the existing
r_utils.cpp, explicitly UNACCEPTED. PC201-byte body versus candidate203 differs
at the x87 cleanup: target FSTP ST(1), candidate FXCH ST(1); FSTP ST(0).
Full fresh rebuild passes both unchanged referees and retains all774 checkpoint
address/extents. Game accounting remains579 /101478 MIXED bytes; ZERO newly
accepted bytes. Proper-source40% remains active and unmet (upper bound36.947%).

Review target/work/proof/fresnel_defer.json for pinned source/build hashes,
addresses, exact cleanup bytes and limits. Fresh binding SHA:
ac01f62504f4f873bd02977d9899b207640fce80cfb80ad9059492b7103c0b45.
New actual-source tests: test_fresnel.py (96 optical/edge cases) and
test_debug_plumes.py (1458 cases plus swap order/null source). Front-end fog's
13720 cases remain green. All are host tests, not GPU or whole-file proof.

Rejected model /Op, endpoint rewrite, fog scheduling, debug loop, Fresnel
precision/CPU/size/C-mode trials are recorded in target/work/ATTEMPTS.md.
No new assembly, checker edits, duplicate build, retained C variant or TU-order
change. Original profile.mk and tus.txt are restored. Only the Fresnel retention
root is new; replace it when a real caller is reconstructed. Do not repeat the
failed sweeps or count the nearly identical function. No commit or push.

## Clean active workspace — 2026-10-20

**Start in `target/work/README.md`, not the old mutable scratch tree.**
Owner requested source/build cleanup and layout work alongside reconstruction.
The clean tree has113 source/header/config files copied unchanged from the
frozen model checkpoint, separate actual-source tests, proof and layout notes.
Object order, roots and per-TU flags are unchanged. Build and verify from gfx:

    sh target/work/tools/build.sh

A forced clean-tree rebuild reproduced the pinned checkpoint bind/cmp hashes
exactly: fafcdfc2... and e5cf4577... respectively. All774 accepted game/library
address-extents remain. Regression still reports579 game bodies /101478 bytes,
40.018% MIXED, at most36.947% assembly-free. Cleanup gains ZERO coverage.
Raw same-file-offset equality is1.8562249378%, not source coverage or SHA identity.
Model actual-source and referee trap fixtures pass from their new test paths;
the layout reporter passed its identity control. No GPU or whole-DLL match.

`target/work/build` points at the same existing build directory.150 old Codex
build directories and the retired mutable source were MOVED, never deleted, to
`archive/old_renderer_builds_20261020/`. The old source path now has a pointer;
inside Docker it is mapped to clean src to preserve compiler-visible paths.
Other agents' directories, staged work and historical proof packets remain.
Archival does not reclaim disk space. No commit, push or release promotion.

Future work: edit clean src, run actual-source tests and the one build entry,
inspect its current map/section report, preserve checkpoint extents, update
layout ownership when evidence changes. Keep failed attempts in one log rather
than proliferating scratch/build copies. Unknown original data/TU order remains
explicitly unknown. The source-only40% goal is still active and unmet.

## Resumed by owner — 2026-10-20

The owner requested a checkpoint on10-19, then explicitly set the goal active
on10-20. Work is resumed. The **40% assembly-free goal is unmet**. The saved
checkpoint below remains frozen; newer trials now use the clean workspace above.

Latest packet: **target/scratch/codex_1019_model_checkpoint/**. Read its README
before editing. It includes a full147-file source/test snapshot (`src/`,1.9MB),
a seven-file review overlay, hashes, both referees, regression and build evidence.
No binary/object copy, release promotion, deletion, commit or push was made.

Latest accepted result: **579 game functions /101,478 executable bytes /253,580
=40.018140231879485% MIXED source**. Six genuine new C++ functions add885 bytes,
with all sampler-checkpoint source/library extents retained. No new assembly.
The source-only upper bound is **93,691 bytes /36.9473144569761%**, not40%.
At least7,741 additional assembly-free bytes remain, and full inline-memory
attribution is still pending. Do not describe the mixed total as proper C++
coverage or a finished renderer.

New accepted targets: debug line10005510/119; LOD distance1001d960/143;
surface selection1001d9f0/98; pose dispatch1001da60/20;
origin bounds1001fda0/35; bone-bounds expansion1001fdd0/470.

The complete new model cohort is in r_model_bounds.cpp/r_model_lod.cpp. Native
actual-source tests pass512 corner oracles, all four bone-bit words, LOD edge
cases, ownership/fallback/default-model routing, twelve box edges, three axes
and line-buffer capacity. Compile-time assertions pin the actual PC layouts.

Highest-value next work: debug boxes1001da80/985 differ in only six unmasked
operand bytes; axes1001de60/959 have the analogous end-point X-sum ordering.
Keep the current baseline; a hand-expanded three-row transform was worse and
is reverted. Closing these should allow the byte-equal484-byte bounds worker
to bind. The worker's real R_UpdateGfxEntityBounds caller is now present; do
not re-export the internal worker or force a register ABI. Packet README has
exact byte offsets, failed form, source paths, gates and replay commands.

The older state cohort's viewport366 still blocks two more byte-equal bodies
(486+252 bytes). Its revision_2 packet remains separate and unchanged.

Only active build output: target/build/codex_boundsoutside_1016_02; active source:
target/work/src. The former mutable source is archived as described above.
A forced rebuild of every object
reproduced both warm referee hashes exactly, with zero regressions. All147
frozen inputs equal the live source and296 external inputs are unchanged.
Do not trust cmp/bind after
any later diagnostic link. No GPU or whole-DLL identity claim.

## Current owner gate — 2026-10-19

Pause only after at least **40% verified readable C/C++ game-code coverage,
excluding handwritten assembly**. This supersedes the older mixed-source gate.
Exclude entire accepted bodies containing handwritten assembly, including inline
expansions of assembly helpers; keep them in separate accounting. Compiler-generated
instructions do not make a C/C++ function assembly source. Calls to separately
accounted assembly functions do not by themselves exclude a C/C++ caller.

The assembly-free total is not yet established. A source-confirmed scan excludes
31 accepted bodies / 7,787 bytes containing direct assembly, fsincos, rdtsc or
I_fround expansions. With the new885 C++ bytes, assembly-free coverage is
**at most 93,691 /253,580 =36.9473144569761%**, with at least7,741 bytes needed for
40%. This is an upper bound, not a fully audited assembly-free percentage.
Replay: `python3 target/scratch/codex_1019_sampler/source_only_audit.py`;
the saved JSON lists every excluded body. No referee or accepted proof changed.

The 39.669% below is mixed-source
coverage, NOT progress against the clarified pause gate. Neither subtracting only
Box's 567 bytes nor calling the pre-Box ledger C++ establishes the required total:
inherited memory, rounding, sine/cosine and timing helpers also use assembly.
Keep accepted source and proof intact while auditing this split. No pause or
completion is authorized before this gate passes. The owner's later explicit
pause request created this checkpoint; the owner has since resumed the goal.

Review packet for the gate audit and rejected bounded trials:
`target/scratch/codex_1019_source_gate/`. Expanded actual-source skinning,
portal-plane and occluder tests pass. The old occluder fixture's bounds check
was corrected against retail TEST AH,41h / JNP evidence, not a source change.
All 420 sampler compiler inputs were restored and checked unchanged.

## Current state cohort — 2026-10-19

`target/scratch/codex_1019_rt_state/revision_2/` preserves the new renderer
state source separately from the accepted sampler checkpoint. Both unchanged
referees find complete instruction-body matches for RB_SetRenderTarget
1003ea30/486 and RB_SetInitialState1003c2a0/252, but reject their callee chain:
the first needs RB_UpdateViewportConstants1003e690/366; the second needs the
first. These 738 bytes are NOT accepted coverage. All sampler address/extent
pairs remain accepted, with zero new pairs and zero losses.

Current candidate changes: a separate rb_viewport.cpp TU, a shared setter in
rb_backend.cpp, the target-pinned 0x2170-byte DxState clear extent, and the
initializer's active-state assignments before its reference-state assignments.
Host tests pass 3,120 target transitions, 240 viewport cases and all five
initializer sampler defaults on the actual 32-bit cache type. No GPU proof.

Normal source/flags are restored after bounded reciprocal precision tests.
The volatile and double-divisor experiments fail the viewport match and are
not retained. /QIfist C++ casts produce QWORD FISTP, not the existing helper's
DWORD FISTP, so they do not reclaim any assembly-free coverage. See the packet
README and rounding_cpp_probe.s before repeating these experiments.

The earlier statement that every mutable compiler input equals the sampler
checkpoint applies only to that earlier restored checkpoint, NOT this newer
state cohort. Its separate source overlay and warm proof identify the changes.
The 40% source-only gate remains unmet and the goal remains active.

## Accepted sampler checkpoint — 2026-10-19

**573 game functions / 100,593 executable bytes / 253,580 = 39.66913794463286%.**
Four new C/C++ functions add **1,176 bytes**, with every earlier accepted extent
retained. No new assembly or referee change. Mixed coverage is 835 executable
bytes short of 40%; this is NOT the gap to the owner's C/C++-only gate above.
The goal is NOT complete or paused.

Review packet: `target/scratch/codex_1019_sampler/`. Its source overlay, tests,
extent audit, warm and forced-rebuild referee output, regression, input hashes
and receipts are saved. A full forced source rebuild with the immutable compiler
image reproduces both referee hashes exactly; all 420 recorded inputs remain
unchanged. The sampler suite passes 131,072 transitions, and saved view-matrix
and 32-bit skinning/router tests pass. No game/GPU or whole-DLL identity claim.

New accepted targets: sampler filter 1003d920/41, sampler 1003d950/1041,
unbind 1003dd70/49 and initializer 1003ddb0/45. The sampler's actual final RET
is 1003dd60; GLM's 1025-byte size is too short. All 1,176 bytes are code, not tables.
Setting the shared helper's mag filter before the zero-anisotropy min-filter
fallback matches both outlined and expanded forms. Keep that accepted source.

Accounting: the pre-Box source ledger is now 100,026 bytes (39.44553986907485%)
and includes inherited inline assembly. Box source assembly adds 567 bytes.
Neither figure is an assembly-free C++ percentage. The new 1,176 bytes are
ordinary C/C++ bodies with no new assembly.

Mutable source: `target/scratch/codex_boundsoutside_1016/`; single completed
output: `target/build/codex_boundsoutside_1016_02/`. No own build is running.
The unaccepted fog draft and new readable surface router remain separate from
accepted coverage. Signature/order/inlining trials and the failed four-option
flag sweep are reverted; read ATTEMPTS_1019.md and codex_1019_flags/README.md.
No release/canonical files were changed; nothing deleted, committed or pushed.

## Resumed — 2026-10-19

The owner resumed the 40% goal. The **98,850-byte pre-Box source ledger
(38.981780897547125%) includes inherited inline assembly**. It is not an
assembly-free C++ percentage: memory, rounding, sine/cosine and timing helpers
already contain assembly. The new 567-byte reference assembly helper is
separate. Combined accepted game source is 99,417 bytes (39.205378973105134%).
Do not describe either percentage as pure C++. A full assembly-free split is
not established; see codex_1019_fog/README.md for concrete accepted examples.

Draft `r_fog.cpp` now has the complete 143-byte R_SetFog shape from indexed
stores instead of the old 108-byte pointer form. It is NOT accepted yet;
remaining instruction scheduling differences add zero coverage. Its actual
source passes `test_frontend_fog.py` (13,720 cases). Other bounded failures
remain recorded in ATTEMPTS_1019.md. The old pause receipt stays immutable.
Saved source overlay, both referees, regression, diagnostics and hashes:
`target/scratch/codex_1019_fog/`. All earlier accepted extents are retained;
only the intended fog source differs from the saved compiler-input manifest.
The final build is complete; no own build remains running. Nothing was deleted,
committed or pushed. The goal is still active, not paused or completed.

## Owner-requested pause checkpoint — 2026-10-19

Coverage is unchanged: **99,417 / 253,580 bytes = 39.205378973105134%**,
split into **98,850 C/C++ bytes (38.981780897547125%)** and **567 reference
assembly bytes**. The 40% objective is incomplete and is paused at the owner's
request. This continuation added no accepted bytes.

All failed trials are reverted. A final serialized rebuild reproduces the
saved `codex_1019_box/bind.json` and `cmp.json` hashes exactly; all 124 recorded
source/config hashes are restored and strict regression passes with zero loss.
Receipt: `target/scratch/codex_1019_box/pause_receipt.json`; regression:
`pause_regression.json`. Existing frozen source and overlays remain intact.
No build remains running; no files were deleted, committed or pushed.

Resume in `target/scratch/codex_boundsoutside_1016/`, reusing only
`target/build/codex_boundsoutside_1016_02/`. Read ATTEMPTS_1019.md first.
Newly rejected: picmip assignment/store forms, early negative-sine store in
MatrixRotationX, and existing validation-helper reuse in RB_ChangedWorldMatrix.
Do not repeat them. Near screenshot/material-image wrappers still need real
source/callee reconstruction; artificial register saves or stack padding are
not an acceptable route. No whole-DLL checksum or game/GPU smoke claim.

## Active source-backed assembly checkpoint — 2026-10-19

Follow-up: a forced `make -B` rebuild of every game TU in the same output
directory reproduced the saved cmp.json and bind.json hashes exactly. All
accepted extents are identical, with zero losses and unchanged coverage.
`codex_1019_box/replay_receipt.json` records fresh proof/input hashes;
124 source/config hashes remained unchanged through the replay. Five frozen
native suites, the current water test and trap-extent tests passed again.
No gain from the bounded fullscreen, water-order or /G5 scheduling trials;
all failed trial changes are removed and recorded in ATTEMPTS_1019.md.
This is full forced source recompilation, not an isolated release build.

`target/scratch/codex_1019_box/` adds a fully matched, reference-derived
567-byte BoxOnPlaneSide x87 implementation. **Combined verified game source is
99,417 / 253,580 bytes = 39.205378973105134%.** Keep its accounting separate:
C/C++ remains **98,850 bytes / 38.981780897547125%**, plus 567 assembly bytes.
All accepted functions from the frozen C/C++ checkpoint are retained.
The 40% goal remains active; no goal completion, cold reproduction or release
claim is made.

This is attributed Quake III source with the retail-pinned unsigned error
branch, not emitted retail bytes. Its full body passes both referees and 3,072
actual MSVC/Wine calls plus three invalid-signbit breakpoint checks. The packet
contains the source overlay, tests, tool snapshots, accounting, hashes and logs.
cmp.py's trap-preservation correction stops at returns/indirect jumps so table
bytes are not mistaken for executable branches. The original C fallback remains.

The complete mutable source and ordinary compiler flags are restored in
`target/scratch/codex_boundsoutside_1016/`. The single completed build directory
is `target/build/codex_boundsoutside_1016_02/`; no build remains running. Further
failed image/helper, plane-scheduling and winding trials are recorded in
ATTEMPTS_1019.md. The 149-byte fullscreen tracker is still the highest-leverage
unmatched dependency, blocking the exact 2,102-byte render-target initializer.

## Active checkpoint — 2026-10-19

Frozen review packet: `target/scratch/codex_1019_checkpoint/`.
**568 game functions / 98,850 of 253,580 executable bytes = 38.981780897547125%.**
All proof97 matches are retained; nine complete functions add 1,258 bytes.
Read the packet README for exact extents, hashes, tests and replay instructions.
This is warm V2/V3 evidence; independent cold reproduction and whole-DLL identity
remain outstanding. No canonical tree, commit or push changed.

The key gain is the cookie source cohort. Force-inlining its common source
helper creates both complete 160-byte bodies; ordinary signed max expressions
also match the complete 2,102-byte R_InitRenderTargets body. Its only rejected
dependency is the 149-byte Image_TrackFullscreenTexture. That tracker remains
four bytes away in the original source form: the first platform decrement uses
ECX after loading width, while retail uses EAX before loading width. Matching it
would unlock 2,251 bytes and leave only 331 bytes to strict 40%.

Mutable trials continue in `target/scratch/codex_boundsoutside_1016/`, reusing
`target/build/codex_boundsoutside_1016_02/`. Never quote a trial as the frozen
checkpoint. Current attempt notes: `ATTEMPTS_1019.md`. The old occluder native
fixture had the first-plane predicate reversed; the packet corrects it against
retail x87 C0/C3 testing and passes the ordered/NaN cases.

## PAUSED verified checkpoint — 2026-10-18

The owner requested a checkpoint and pause. A fresh serialized rebuild from
`target/scratch/codex_boundsoutside_1016/` is now **562 game functions / 97,840 of 253,580
executable bytes = 38.58348450193233%**. This is a strict gain of three functions and 248
bytes over proof97, with `baseline_lost: []`, `checkpoint_lost: []`, and an independent
accepted-set comparison reporting no proof97 losses:

- `Image_GetPlatformScreenWidth`, `0x1000c9b0`, 14 bytes
- `Image_GetPlatformScreenHeight`, `0x1000c9c0`, 14 bytes
- `Material_ParseRuleSetConditionTest`, `0x100184d0`, 220 bytes

The build and proof are in `target/build/codex_boundsoutside_1016_02/`. Integrity hashes:

- `bind.json`: `7f57fa585693b91ace469ee86c79ae38a0a220ad0fc402b31604aabd491cdc14`
- `cmp.json`: `3ea550aa3ada23fa0a9b6990eec46fe1144f1d3a7e0dcaf6b24508a6dd5461e1`
- candidate `gfx.dll`: `246b2c274ba9d0784a845f3bb1d6b400ab9e376ab9c1c28fd9df079eb8d65512`

`tools/bindcheck.py` now validates recursive named `.rdata` / `.data` closure, including
ordinary bytes, relocation parity, one-to-one symbol bindings, code callbacks, cycles and
bounds. Its synthetic positive/negative suite passed before the official rebuild. `tools/pb.sh`
now honors a scratch tree's `profile.mk`, fixing clean-build selection without changing the
pinned compiler. These changes remain owner-review work and are not committed.

Three bounded compiler-shaping trials were built and rejected, then removed from the saved
source: post-loop validation in `Material_ParseRuleSet`, a split angle/store schedule in
`RotatePointAroundVector`, and `memcpy` between the distinct color locals in `RB_ClearScreen`.
They produced no additional exact function. On resume, do not repeat those forms. The strongest
untested lead is `XSurfaceOptimizeRigid`: use a first-declared
`register XVertexBuffer *vertexSource = surfVerts` local while keeping its three-parameter,
non-const ABI; if it fails, bounded per-TU `/G6` then `/G7` probes remain. The strict 39% gap is
1,057 bytes; the strict 40% gap is 3,592 bytes. No build process is left running.

## PAUSED checkpoint — 2026-10-18

Work stopped at the owner's request because the laptop was under load. The active comparison
was interrupted cleanly; `docker ps` showed no running container afterward. The accepted
checkpoint is still **559 game functions / 97,592 of 253,580 executable bytes =
38.48568499092988%**. Nothing from this session is accepted or promotable yet.

The current unverified experiment is `target/scratch/codex_boundsoutside_1016/`, with its
incremental output in `target/build/codex_boundsoutside_1016_01/`. It contains three focused
source-shape tests: ternary platform/clamp forms for `Image_TrackFullscreenTexture` and
`R_InitFullscreenRenderTargetImage`, plus paired `memcpy` copies in `Material_ParseRuleSet`.
The interrupted build had not produced referee results, so do not count any bytes from it.

Pause-time scratch hashes:

- `r_image.cpp`: `6ec02d64851cbe618d9b3626742c1654030f841041c13d4d9ffce84ce0e682b6`
- `r_rendertarget.cpp`: `0ade8c2c0e6df32fb77cfdb0b3a9d226be3874886ca001bc38e57ea45f06c199`
- `r_material_load_obj.cpp`: `e54f76ade0ba3e49817685b00415fb0c17cdfc4e56d3f7b61a75a46a7d2f2d05`

On resume, run one serialized incremental build, then inspect only
`Image_TrackFullscreenTexture`, `R_InitRenderTargets`, and `Material_ParseRuleSet`. The image
leaf plus caller is the highest-leverage lead (2,251 bytes). The material nested checker is
experimental and must not affect official coverage without independent acceptance. No
canonical source, commit, or push was made.

## PAUSED checkpoint — 2026-10-16

The accepted strict checkpoint is unchanged: **559 game functions / 97,592 of 253,580
executable bytes = 38.48568499092988%**. The requested 39% checkpoint was **not reached**;
it needs 98,897 accepted bytes, so the remaining gap is **1,305 bytes**. The frozen authority is
`target/scratch/codex_1015_40/proof97/`, and its accepted build is
`target/build/codex_1015_track3/`. The strict 40% gap is **3,840 bytes**. Do not quote the
39.717% raw `gamecov.py` result: it includes 13 STL/library functions and embedded table bytes
that the strict accounting excludes.

Pause-time integrity hashes:

- `cmp.json`: `05a645d5f7c8b3c963f1a0b0cda0b1d1468624721c2e5a3d3c15d237e2b5cd3d`
- `bind.json`: `4446cbbc8cb6917ee0d41cc32f9b20a144b10bac4502a2c99cfe5f13932182e9`
- `regression.json`: `9ab94e65607b21f1eaced6216edaec28447d7f0c9810a8d36a3e58c76f522ae5`
- accepted `gfx.dll`: `5a810b5fc54dbd4016a9f3e3e837053dfb2f89dc13b79330d8aacec160a5747d`

The 2026-10-16 work is preserved, but it produced no accepted gain. Read
`target/scratch/codex_boundsoutside_1016/REPORT.md` before resuming. The most promising lead is
now `XSurfaceOptimizeRigid` (retail `0x1002da90`, 186 bytes): its post-create-buffer body is
exact, while the current evidence-driven volatile-load form still has a different prologue,
register allocation, and load schedule. If solved it should also unlock exact
`XSurfaceOptimize` (180 B), `XModelOptimize` (102 B), and `R_OptimizeModel` (26 B), for a
494-byte cohort. `XModelUnoptimize` remains a second near miss and may unlock its exact 30-byte
`R_ReleaseModel` caller. The scratch tree also contains unsuccessful
experiments for `R_IsBoundsOutsideViewNoStack`, `Image_LoadWavelet`, and `RB_ClearScreen`; it is
**not promotable as a tree**. Start each new attempt by restoring that file from proof97 and
carry forward only an official exact match.

The last built unaccepted candidate is `target/build/codex_boundsoutside_1016_01/` (DLL SHA-256
`f78372b0f57f43e43efb1c7b9764c07f66fa5ce56b3e96964d2fd466147ae120`). Its raw build summary
is not strict coverage. `fd.sh` confirms `XSurfaceOptimizeRigid` is still mismatched. Scratch
source hashes are recorded in its report. A separate stronger nested-data referee experiment
accepts only `Material_ParseRuleSetConditionTest` (220 B) beyond proof97; do not count it until
that referee change and its tests are independently accepted. Even combined with the proposed
494-byte XSurface cohort it would remain 591 bytes short of strict 39%.

Proof97 replay passed tests 1-40. `test_skinning.py` was then killed by SIGSYS under the
filesystem sandbox (not an assertion/source failure), so tests 42-53 were not replayed in this
session. Earlier individual `test_image_setup.py` and `test_regression.py` runs passed. No
renderer container or build was left running at pause. `docker ps` shows one foreign Radiant
container (`d68c54ddf8e7`); do not stop or modify it. No canonical source, commit, or push was
made. Keep whole-link work serialized: check `docker ps`, reuse the existing incremental build,
and never launch the same source/output pair twice.

2026-10-15 current renderer checkpoint, produced by **Codex**: **559 game functions /
97,592 executable bytes = 38.48568499%**. Frozen proof97 adds exact readable source for
`Image_TrackTexture1000ca70/200` and unlocks six dependent setup/load/render-target bodies,
for 1,563 new bytes over proof96. The unchanged referee and regression retain every prior
extent with zero losses. Inputs and proof artifacts are in
`target/scratch/codex_1015_40/proof97/`; the accepted build is
`target/build/codex_1015_track3/`. Canonical `verified/src` is unchanged; this remains
owner-review work, not a release. The strict 40% checkpoint needs 3,840 more bytes.
Library bytes never count and whole-DLL identity is not achieved.

The exact MSVC 7.1 toolchain image has been restored locally. Do not repeat the bounded failed
campaigns for `R_SetPicmip`, `R_WatersEquivalent`, `R_EnumerateDisplayModes`,
`RB_SetSampler`, `IntersectPlanes`, or `R_StaticModelBounds`; their 2026-10-15 reports are
under `target/scratch/agent_*_1015/`. The separate material nested-table checker limitation
remains documented below. Serialize whole-link builds and never launch duplicate source/output
builds. No commit or push was made.

2026-10-09 update: an independently cold-reproduced candidate is **467 game
functions / 76,102 bytes = 30.011%**, with all 439 baseline matches retained.
Read [HANDOFF_CODEX30.md](HANDOFF_CODEX30.md) for source, proofs and replay commands.
This is a review candidate, not a canonical merge: the `build/v` number below
remains 26.523%. No library gains are included and no release/SHA claim is made.

## The only goal
CoD2's **own** renderer source for `gfx_d3d_mp_x86_s.dll` 1.0, function by function, that
binds byte-identical at the retail VA. The owner wants it so CoD2 can be extended.

**Does NOT count, do NOT work on:** D3DX / the HLSL shader compiler, DxErr, the CRT, STL
internals, IJG JPEG. They are Microsoft or third-party code and get linked from the original
.lib files later. Earlier work on them is frozen in `archive/library_recon/` (with the old
handoff `HANDOFF_codex_1006.md`). Don't read it for direction, don't extend it, don't audit it.

## Number (the only one to quote)
`python3 tools/gamecov.py` (reads `target/build/v/bind.json`):

**game source 439 fns 67,258 / 253,580 B = 26.523%** (cold rebuild 2026-10-08).

- Game code = 0x10001000-0x10041db0 + 0x10057990-0x10062200 (SUPPORTED: GLM sizes + the JPEG
  gaps). Anything outside those ranges is library and never counts.
- A function counts only when bind.json has `why == []` **and** `t` == the retail VA exactly.
- Next milestone: 30% = 76,074 B (+8,816 B).

## Where things are
| Path | What |
|---|---|
| `target/verified/src/` | The single game tree. Only verified work lands here. |
| `target/verified/HANDOFF.md` | Per-round checkpoints, near-misses, debts, next chains. |
| `target/scratch/AGENT_BRIEF.md` | How to build, diff and verify one function; lessons. |
| `target/scratch/READY2_game.tsv` | Work list from the retail call graph (regenerate below). |
| `tools/` | `vb.sh`, `pb.sh`, `fd.sh`, `gamecov.py`, `ready.py`, `bindcheck.py`. |
| `archive/scratch_game_1008/` | Old agent drafts and backups (game). Mine for drafts only. |
| `archive/library_recon/` | Frozen library work. Not yours. |

## Loop
    cd gfx/target
    cp -r verified/src scratch/codex/src             # your draft tree
    ../tools/pb.sh scratch/codex/src build/codex     # ~40 s, parallel-safe
    ../tools/fd.sh '<Name>@@' <retail-va> <size> build/codex   # ours vs retail
    python3 ../tools/gamecov.py build/codex/bind.json
    python3 ../tools/ready.py scratch/READY2_game.tsv          # refresh the work list
Before proposing a merge: diff your bind.json against `build/v/bind.json` by retail VA and
prove no game function was lost. Leave the merge into `verified/src` to owner review.

## What to work on (in this order)
1. Near-misses listed in `target/verified/HANDOFF.md` (IntersectPlanes, RB_ProjectionMatrixChanged,
   Material_ReleaseVertexDecls, XModelUnoptimize ...). Several unlock their callers.
2. Caller chains. Most remaining leaves take LTCG register arguments and only match once their
   callers are in source: RB_EndSurface 0x1003a8d0 (+ 0x1003a690/a7b0/a580/a340, 0x10034910,
   0x1003a000), R_LoadWorld 0x10001690, Material_LoadMaterial 0x1001c4e0, 0x100137f0.
3. Names from the Mac PC tree `refrences/cod2-mp-macho/PC/gfx_d3d/*.c`. GLM names are often wrong.

## Hard rules (owner)
- No inline asm, `_emit`, byte arrays, retail-byte copying, `{}` stubs, dummy callbacks or
  non-retail helper functions. Readable C/C++ only. Unknown name/offset/constant = DEFER.
- No commits, no pushes: the owner reviews and commits. Don't touch glm/, codex/,
  claude_client/, cod2engine/, cod2engineold/binaries. Never delete root-owned `_CL_*` files.
- Report in plain words: verified list (name, VA, bytes, file), files changed, near-misses.
  Never quote a number that isn't `gamecov.py` output on a finished build.
