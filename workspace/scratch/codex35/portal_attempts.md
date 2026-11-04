# Bounds and portal cohort attempts, 2026-10-10

Authoritative progress requires unchanged cmp.py and bindcheck.py, complete
extents, bindings and all preceding matches. Diagnostic fd logs do not count.
Accounting erratum: older totals below include213 table/padding bytes and
are superseded. Checkpoint15 proves532/92,089 code bytes,36.3155612%.
Historical function/extent evidence remains valid; no referee was changed.
Cold checkpoint13 proves 527 functions /91,941 code bytes. The denominator
253,580 is the SUPPORTED game inventory, not whole-DLL checksum proof.

| Trial | Change and terminal outcome |
| --- | --- |
| 211 | Missing declarations: compile failed. No credit. |
| 212-213 | Correct triangle bounds uses existing TransformBounds, adding60. Cell caller and brush/frustum parents remain drafts. |
| 214 | Double-distance and key-order trial loses a protected format helper. Rejected. |
| 215 | Cell-first signature reproduces139 masked bytes, but wrong ri.Error call invalidates the ri binding and dependents. Rejected. |
| 216 | Primary-pinned ri.Printf warning fixes cell linking. 527/91,941; independently reproduced in checkpoint13. |
| 217-218 | Frustum indexing/float staging, local bounds copies and genuine draw-call argument grouping preserve527. No gain. |
| 219 | Mutable original image-name table plus corrected bounds-TU order now preserves527, including R_PickMaterial. No new code credit. |
| 220 | Signed comparison emits JGE, not target JNS. No dispatcher match. |
| 221-222 | Original sign-bit mask, typed callback table and unsigned packed sort accept bounds dispatcher1002bce0/58. 528/91,999, no loss. |
| 223 | Add actual portal-plane TU and parent root. All528 retained; portal bodies uncredited. |
| 224 | Expand four ordered unprojections and inline their real helper. All528 retained; no portal gain. |
| 225 | Existing VectorScale and local declaration ordering. Image upload bindings lost via call-table decode. Rejected. |
| 226 | Restore ordinary four-corner loop; compiler expands it. Float dot helper removes incorrect double temporaries; nearest672 now has only two operand-load pair differences. All528 retained. |
| 227 | Reuse DotProduct and reference-supported projection parameter order. Same two nearest differences. All528 retained. |
| 228 | Direct rejection jump matches the original bevel control flow; reduces local frame. Nearest operands reversed at source: no gain. All528 retained. |
| 229 | Bounded /G6 portal-only scheduling trial: same nearest mismatch, no gain; all528 retained. Flag removed. |
| 230 | Bounded portal-only /Op adds float truncations absent from the target and loses upload bindings. Rejected; flag removed. |
| 231 | Bit-preserving memcpy for bevel normals recovers target0x80 frame and first78 instructions; remaining corner scheduling/copies differ. One shared nearest loop index changes which two load pairs differ. All528 retained. |

Trial232 tests existing VectorScale after bit-preserving normal copy, the
reference's distance>nearest comparison, and RB_SetSampler's byte local.
The sampler's formal int argument and every caller remain unchanged. The
byte local is supported by the Mac source and pinned PC byte operations.
Consult result_232.log for terminal acceptance; do not assume a gain.

Native portal tests now scan convex windings of every size3..128, both
orientations and16 plane directions, alongside projection near/NaN guards,
plane copies, bevel rejection/force and debug-buffer allocation/capacity.
The C winding experiment is an uncredited alternate implementation; it is
not another function or proven historical C TU. Do not count aliases twice.

## Later attempts

238 restores Image_TrackTexture's earlier parameter order; no gain.239/240
surface-pointer variants pass stream tests but fail full1519-byte equality.
240 removes a Gaussian2D Vector4Set expansion; behavior passes, bytes do not.
240's bounded rotate /Op removal gives no gain and is not retained.241/242
view-flag ordering, dot-expression and wind-normalization variants preserve
all528 but add zero complete matches. Premature fd output during the240 link
was discarded; diagnosis was repeated only after its terminal result.
243 adds code-constant65 and state-rule95/caller91, all528 retained.
244 reverses the source equality operand order in material-name lookup:
the52-byte body now matches, including the interned-name semantics.
532/92,089 is independently cold-reproduced by proof_checkpoint15.
245/246 compile failures and247's tess type link failure are retained,
not credited.248 compiles the genuine fog cohort but is rejected: using
frontEndDataOut for106d3194 breaks twelve older bindings. That slot is
backEndData, distinct from frontEndDataOut at101da9c8.249 uses the correct
pointer and tests fog-only /Op;250 removes that flag and uses the existing
Vector4Set plus shared black-color tail and conditional device logging.
Consult terminal ledgers before credit. Native fog tests exercise actual logging,
COM slot57, all byte color values, overrides, cache hits/retry and NaNs.

249 is rejected: /Op removes the color match and shifts matrix table bytes into
the known false-call rejection, losing required closure.250 retains all532
and adds105 fog bytes.251 failed to compile the logfile type declaration;
252 fixes it and preserves534, while the657-byte iterator's color callee
still blocks closure.253 /G6 is identical and removed.254's GetVerts export
removal worsens the natural convention; no gain, export restored.255 fixes
the fog-color store scheduling with a scalar packed value and byte alpha
assignment. Both unchanged referees accept536/93,023 executable bytes.
proof_checkpoint16 independently cold-reproduces255,40 suites and458 inputs.
The fd attempt during253's live link was discarded; post-link diagnostics
replace it. No partial diagnostic comparison is credited.

## Plane, skinning and decal trials after checkpoint16

256-259 complete with536/93,023 and no gain or protected loss. The399-byte
plane solver still differs in the saved-ESI pop location. A separate real
com_plane.cpp /Op TU and /G6 do not fix it; /G6 is removed in260. The
skinning scalar-expression/offset trials and Gaussian2D pair-index loop pass
their actual-source tests but add no accepted body. These remain drafts.

260 separates the clipper's on-plane/crossing branches; no gain.261 tests
a misread ClipPoint layout and shared copy helpers; rejected, losing shader
matrix closure through the known embedded-table false-call decode. The
destination-base adjustment confirms the original xyz/lmapCoord/normal
order was correct;262 restores it. No wrong layout is retained or credited.
262 struct assignment,263 continue/scalar-copy and264 local-pointer/vector
copies do not close the clipper.264 preserves536.265 indexed output and
local-pointer copy scheduling adds no accepted body and loses the same
shader closure; rejected.266 restores the original clipper and uses genuine
VectorCopy/Vector2Copy directly on the indexed fragment arrays. The entire
494-byte fragment-transfer caller is diagnostically equal, including its
natural EBX clip-buffer argument, but still has ZERO credit: the386-byte
clipping callee blocks binding. Removing the interim CellSurfaces export
with an out-of-line static definition does not fix that412-byte body.

test_mark_clipping.py executes actual clipper/helper/fragment source with
all front/back/on-plane classifications, threshold equality, NaNs, eight
interpolated fields, six planes, capacity rejection and untouched output
fields/guards. This is behavioral evidence, not byte-match acceptance.
267 is the next indexed-input induction experiment; consult its terminal
ledger before credit. Frozen proof_checkpoint16 is unchanged.

267 indexes the input point inside the loop. This resolves the clipper's
preserved-register and counter-update differences, leaving only initial
guard scheduling.268 adds a positive-count guard around the for loop,
retaining a duplicate test.269 uses the guard plus do/while and direct
indexed vector copies: both unchanged referees accept386+494, retaining
all536 earlier bodies,538/93,903 code bytes. Binding SHA
a88f9dd8fd3f9a1e914ce5de990e88c34bebb8019f4a6798d76851e87b845b0e.
Cold17 is running; it requires full ledger equality,463 manifested inputs,
43 suites and all513 checkpoint9 extents. No new checker/ABI/assembly work.
Snapshot skipped only the unreadable root-owned core dump; the compiled
source/input manifest is complete and the crash dump is not a build input.

270 changes the sampler state to a byte formal used directly. Native
exhaustive filter/address/cache tests pass;538 retained and no gain.
The1025-byte sampler remains different in natural index calling context.
271 fixes the PC initializer: clear NULL images up to maxTextureMaps only
when !dx.deviceLost, NOT the Mac-derived white-image loop over16. The
new binary-pinned DxGlobals+2d3c assertion and native lost-device/init
tests pass. Consult271's terminal binding before credit; cold17 is separate.

Cold17 completes43 suites, full ledger equality, all513 baseline extents,
zero overlap and463 before/after input hashes. REPORT.md records the hashes.

271 evidence is INVALIDATED:272 began on the same build before271's check
finished;271's freshness gate rejects the changed DLL.272 then stops with
a truncated shell line when build.sh was edited while bash read it. Both
are discarded, not byte-match evidence. The image-first parameter order
was diagnostically identical and is removed. The runner now holds flock
through build/compare/binding/regression; a nested invocation verifies that
contention is rejected before starting work or its log. Never edit a live
runner.273 checks byte state and the PC initializer freshly. Cold17 had its
own build directory and frozen source, unaffected by the failed warm trials.

273 completes the recovery full build and both unchanged referees,538/93,903
with no protected loss or sampler gain. The PC initializer correction stays
uncredited.274 checks the runner's diagnostic-only link mode on unchanged
source; it is a harness test, NOT a fresh source reconstruction claim. This
mode skips all referee/ledger generation and explicitly gives no coverage.
Only the default full mode plus an independent cold replay accepts gains.

274 terminates0 with the diagnostic-only message; no cmp/bind trial files
exist. Invalid mode exits1 before starting work, bash -n passes, and the
463 frozen17 inputs still validate after all runner/draft changes. No job
is left running from these trials;538/93,903 remains the accepted checkpoint.

275/276 fail compile assertions; primary rg base101d4d00 fixes sin1510,
trig2510,bits2d10.277 adds actual water/mip/upload/downsample bodies.
278 water /Op,279 /Zp4,281 FFT /Oy-,282 /G6 give no gain; all removed.
280 height division inside loop matches the instruction sequence except
20/24-byte frame allocation. No dummy padding.279-283 add real connected
material override/lookup, sampler/pixel args and full DX7 pass/glow.
284 int sampler formal differs more, restored to byte285.
285 full cmp/bind/regression finishes0, retains538/93,903, no gain. Binding
a82b0a03ab74cc7fabfcfd45a33e3849302a555a7ca754f083eca6121313ac8d.
All45 suites pass, including actual water/downsample and independent FFT
direct-DFT oracles, plus expanded actual DX7 pass tests. Cold17 unchanged.
286 signed code sampler, indexed material lookup, normal inlining and
existing vector helpers: link0, native water/shader tests pass. Diagnostic
only, no cmp/bind files or coverage credit. Full-body comparisons next.

286 material lookup instruction loads now match except a saved EBP;
code-image still uses different natural argument registers. Vector helpers
change x87 scheduling but do not match the water comparison.
287 corrects objective glow output to BGRA: target keeps red/green/blue on
the x87 stack, stores alpha, then converts blue/green/red/alpha. Earlier
RGBA draft/native expectation were wrong and are corrected, no credit.
288 uses a real float color[4] value and BGRA conversion; native test passes
and full358-byte instruction diagnostic is equal (only after-RET alignment
differs).289 full unchanged referee run is pending, no assumed acceptance.

289 accepts540/94,281; cold18 independently reproduces it with45 suites.
290 tests actual unsigned-long FFT parameters and scalar butterfly caches:
native direct-DFT/water tests pass, diagnostic link0, no byte gain.
291 real DX9 pass/technique caller cohort fails missing VectorCopy4 include;
292 adds existing com_math.h, native shaders/draw pass and link0.293 full
referees accept544/94,753 with no protected losses. Cold19 freshly builds
and links, then an environment reset interrupts verification. Revalidated
frozen inputs; unchanged verification tail on that cold DLL terminates0,
full binding SHA equality,46 suites,469 input hashes, no overlap/loss.
294 args-first pixel signature does not match and is reverted in295.
295 indexed FFT butterflies and real trig aggregate pass DFT/shader tests,
link0, still unmatched.296 reference-backed water helper parameter order
passes water/portal native tests and link0. Diagnostic only, no new credit.
Sequential client takeover agreed by owner; latest renderer proof19 saved.
