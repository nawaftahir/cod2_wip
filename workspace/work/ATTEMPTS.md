# Reconstruction attempts

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
