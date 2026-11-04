# Renderer continuation — 2026-09-26

Full objective remains readable-source, checksum-identical reconstruction of the
entire CoD2 1.0 MP renderer DLL. No canonical release target is complete or linked.
Do not reinterpret the goal as decompilation dumps, instruction-shape coverage,
compatibility with the client, or a tiny matched subset.

## Current authoritative evidence

WORKSPACE HANDOFF2026-09-27: new shared renderer work goes in dev/gfx.
Read gfx/HANDOFF.md and RULES.md; old accepted evidence here remains frozen.
Nine DeepSeek scratch folders moved intact to gfx/archive/deepseek-20260927;
no deletions. Original-path checks need temporary restoration, not evidence edits.
The fully matched two-function source now also lives in
gfx/target/src/codex/renderer_views.c; `make verify-views` replays its proof.
Shared nine-TU build compiles but fails missing GetRefAPI; no linked baseline.
Do not import the whole JPEG expanded source as a fully matched file.

LATEST verified per-function coverage: **76,311 / 1,089,680 = 7.003065%**.
2026-09-27 independent source checkpoint adds139 unique engine instruction
bytes: far-plane calculation1000aa60/82 and record initializer10023e90/57.
Earlier76172 totals below are historical; JPEG remains73123, engine now3188.
Reproduce: python3 codex/renderer/check_seven_percent.py. Fresh pinned/O2/Gy
run baseline_jpeg_7h016wwk; readable source scratch/codex_seven_percent/j_checkpoint.c.
Both FULL bodies pass strict length/sites/bindings and unchanged original
referee100%; RET+CC full-boundary checks and seven individually wrong-global
binding negatives PASS. No callees, no copied retail bytes or assembly wrappers.
Record initializer slot24 is pinned by refapi_pinned.json; legacy R_noop name is
false (body writes nine DWORDs per68-byte record). Source view is NOT a claimed
historical struct layout/type/name. All other words preserved by host fixture.
Far-plane global names are descriptive; addresses and float-zero pool are
target-proven, not inferred CVar identities. Fixture tests all8 override guard
combinations, nonzero input, lower bound, mode2, signedzero, NaN and infinity.
Host fixtures are NOT retail-runtime proof. No canonical files changed; earlier
verified source stays frozen. Whole-DLL link/SHA/boot gates remain incomplete.
Proof packet: baseline_jpeg_7h016wwk/seven_percent_packet.json. Do not double
count recovered snapshot shapes or these139 bytes in a later batch.

- Anchor: `cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll`, hash checked by
  `audit_legacy.py`; actual `.text` denominator 1,089,680 bytes.
- `recovered_dbu46avj/manifest.json`: provenance-preserved 78 engine source files,
  79 candidate functions. Fresh snapshot rebuild: `baseline_6ygs9qm0/results.json`,
  all 79 instruction-shape matches. These remain UNREVIEWED, not canonical.
- 94 CRT reference matches are recorded in the snapshot manifest, not copied as
  redistributable source. See BATCH_2_REVIEW for flags and remaining CRT issues.
- `src/`: nine source files, sixteen matching custom-engine candidates /608 bytes
  plus one explicitly deferred EndDelayedDrawing draft. Latest combined fourteen:
  `material_verify_e3jlgrpg/{packet.json,checks.log}`; delayed two separately183B.
  Original GLM referee matches plus stricter length/site/binding checks,
  negative wrong-binding rejection, five host behavioral fixture programs passed.
  Still REVIEWABLE: independent acceptance and whole-track link/regression pending.
- Reproduce the clean packet: `python3 codex/renderer/verify_material.py`.
- `refapi_pinned.json`: 98 populated + 10 zero export slots, 169 import slots,
  API 59. `pin_refapi.py` derives destinations from target instructions.
- `LABEL_CORRECTIONS.md`: crucial corrections for four wrongly named GLM functions,
  renderer-selector global and SetCullDist NaN behavior. GLM adapter labels are
  not signatures. Do not propagate them into public headers.
- `BATCH_3_REVIEW.md`: three more corrected renderer names/ABIs and two full CRT
  boundary proofs. `_output` now matches complete 2010 code +32 switch data;
  `_setlocale_get_all` matches its complete 191-byte body, not a 35-byte prefix.
  `_strcats` was never the remaining mismatch; the earlier report was corrected.
- `BATCH_4_REVIEW.md`: fourteen authentic SDK assembly/helper matches, two MT
  wctomb matches, full 113-byte free body and five resolved _output data sites.
  Reuse the named fresh run objects; these are not independent acceptance.
- `_output` follow-up in BATCH_4_REVIEW: all 34 relocation sites accounted for
  (9 local, 10 source-data, 15 callee-shape supported). `check_crt_block.py` replays
  the proofs with input hashes. Callee dependencies and independent review remain.
  `authcrt_7df5umf_` contains the fresh initializer-table objects; do not discard
  data-only objects merely because the function batch labels them DEFER.

## Next execution (not another planning pass)

Picmip full-body investigation (2026-09-27, no added credit): target79 bytes
has block1 assignment AFTER third format comparison, then subtract-based signed
minimum selection. Original source assigns block1 before comparisons and uses
CMP for minimum. From dimensions snapshot, preserved picmip_clamp /m8f2cvv8
makes explicit DXT/else block selection and height-width subtraction; helper79
still fails+7 due changed natural register allocation (source blockESI/picmipEBX
vs target blockEDX/picmipEDI), Setup249vs246. picmip_difference /frnhkfgk tests
equivalent width-height minimum selection: helper79 stillfails+7, Setup247vs246.
Both compile fresh/O2/Gy. Neither is a match despite same helper length. Full
native image_reload fixture PASS onfrnhkfgk after approved32-bit execution;
existing FIX warnings remain. Do not copy either over accepted source.
Subtraction reasoning is only for valid dimensions where signed difference
does not overflow; no portable malformed-input guarantee claimed. Next resolve
minimum-result lifetime/real caller allocation, not just branch spelling.

Setup-source checkpoint (2026-09-27, ZERO extra credit): preserved new overlays
setup_clamps /wmadqnay uses target-shaped subtraction clamp guards and stores
each dimension before calculating the next; Setup241vs246, clamp79stillfails+9.
setup_expression /_u22bngb reverses noPicmip branch, clears its two bytes with
memset, uses explicit dimension/default1 results and unsigned levels shift.
Setup now246vs246 but FAILS relocation site/type equality: target calls at
34,58,162,187,203,234; source32,60,158,182,204,234. Equal length is NOT match.
It also changes Setup image from ECX to EAX, regressing Image_LoadRaw168vs169.
Do NOT promote this source or run caller checker expecting success; accepted
caller overlays remain separate. Native full image_reload fixture PASS with
setup_expression, but 32-bit execution requires sandbox approval (initial
exit159 was sandbox, approved executionexit0). Existing FIX macro warnings.
Next reconcile real Setup/ClampPicmip ABI context; current clamp79 equality
still fails and affects caller allocation. No fabricated calling convention,
signature reorder or coverage credit. Accepted JPEG j6w8nim1 unchanged.

Independent logging experiments (2026-09-27): upload_log_predicate /uhytupzk
uses a pointer-only inline uchar return under the external debug guard. Fresh
/O2/Gy still446vs472, no SETNE/TEST pair. check_raw_image_context.py --run
codex/renderer/baseline_jpeg_uhytupzk PASS169, six bad bindings and131JPEGshapes.
upload_cpp_bool /24pazxvo uses the SAME pointer-only predicate returning native
bool under /TP. Compiles but same446-byte2D and same direct pointer branch;
native C++ bool return alone is not the missing context. Neither run earns new
credit. Failed pre-approval run1ymj0p22 has NO object/build proof (Docker denied);
use completed uhytupzk instead. Do not confuse the two runs.
Stop testing equivalent pointer/uchar/bool spellings in isolation: inspect the
real shared logging caller/helper group and compilation context before more
variants. No impossibility or LTCG inference from these bounded failures.

Logging-context probe upload_logging_context /nviatdy9 compiles at/O2/Gy,
but2D remains446vs472. An inline unsigned-char predicate returning debug&&fp
does not recover target's bool materialization. KisakCOD rb_logfile.cpp supports
the RB_IsLogging conceptual pattern, NOT this target's historical helper name
or inline boundary. Probe labels its local helper as non-historical. Do not
repeat this exact uchar helper experiment or count it as matched source.

NEW upload-local source investigation (2026-09-27, no added coverage):
Three preserved /O2/Gy source overlays, no parameter narrowing or register glue:
upload_local_shift /4f0fuakj removes explicit&31 only in 2D local dimension
shifts after ushort cast; upload_log_bool /gfkp4_15 additionally casts logging
truth to byte (NO instruction improvement); both2D448vs472. These unmasked C
shifts have defined behavior only for valid shift counts<32; do not claim general
portable equivalence to hardware masked shifts or ship as verified source.
upload_clamp_pair /3iauf5vu initializes width=height=1 before dimension guards:
2D446vs472, but its FIRST42bytes exactly match the target, including allocation,
MOVZX EDX,DI, width onstack and height inEBP. Next difference target MOV EDX,EBP
vs source MOV EDX,1 at+42. Target logging also materializes SETNE CL/TEST CL;
source pointer test skips that pair. Byte cast spelling had no effect; do not
repeat it. Whole-group /TP probe caao9za4 compiles but same446-byte2D; C++ mode
alone does NOT resolve it. No compiler-impossibility claim.
check_raw_image_context.py now accepts --run. On3iauf5vu PASS169 rawcaller,
six wrong-binding negatives, source/object hashes, all131 earlierJPEG shapes.
Native full image_reload fixture also PASS on3iauf5vu (same existing FIX macro
warnings). Helpers still unclosed; no rawcaller/retailGPU native runtime claim.
Preferred accepted JPEG source remains j6w8nim1, coverage76172/1089680≈6.99%.
Next inspect target-backed logging helper/inlining context before introducing
any helper: no invented historical names, volatile variables or marker variants.

NEW independent source-expression checkpoint (2026-09-27, zero added credit):
scratch/codex_jpeg_upload_dimensions / baseline_jpeg_nwvfxb62 preserves the
material-context source, changing ONLY 2D dimension-clamp expression order and
using a local ushort conversion before the explicit low-five-bit shift mask.
The unsigned-int mip parameter remains unchanged: no new argument-type claim.
This natural source change puts mip in EDI and resolves Image_LoadRaw's +125
discrepancy. Its COMPLETE169 bytes now pass strict binding checks AND original
referee100%, six individually wrong-binding negatives rejected. Reproduce with
python3 codex/renderer/check_raw_image_context.py (checks source/object hashes
and all131 parent JPEG shapes). Earlier material-context replay also preserved
all131 JPEG shapes and eight existing texture bodies1141, no new byte credit.
Expanded native image_reload recording-mock fixture PASS on nwvfxb62 using the
same command below with upload_dimensions replacing material_context; existing
FIX macro warnings remain. It does not exercise new raw-material/JPEG callers.
2D callee remains450vs complete472, volume356vs348, so dependency closure and
coverage are unchanged76172/1089680. Source 2D first instructions now use EDI
for mip, but still emit AND31 rather than target MOVZX EDX,DI, and keep width
in EBP rather than target's stackwidth; do not treat caller success as callee
success. Preserve this overlay separately, do not replace accepted j6w8nim1.
Next bounded work: actual dimension-expression/local storage and row-helper
context, while retaining unsigned argument types and all successful regressions.

NEW outward image-family source checkpoint (NO additional coverage, 2026-09-27):
scratch/codex_jpeg_material_context combines the complete JPEG source group with
the actual preserved wavelet_reload_group texture/setup/upload/file source and
the target171f0 material caller. No fake register glue or canonical edits.
Fresh uyz5omc5 compiles at pinned /O2/Gy; source Image_LoadRaw is now169 versus
target169, but strict diff STILL FAILS+125 (targetpushEDI,sourcepush0). Do not
count length equality. Its callee2D upload uses wrong natural allocation
(candidateEBXmip/stackface vs targetEDImip/EBXface); lower real bodies remain
unmatched. R_LoadJpg785 survives this actual context; JPEG131 regression on this
new expanded group still needs replay before promoting it over frozen j6w8nim1.
R_RegisterRawImage100171f0 source81 DOES pass complete strict/original100% with
all five unique symbol bindings (eight sites); raw_material_bindings.json stores
the target-proven globals/callees. Still zero coverage here: Release84vs87 and
Image_LoadRaw169 mismatched; source helpers/caller closure are NOT complete.
Material comparison fields are opaque32-bit words at38/3c/40, not fabricated
pointer types or a complete allocation layout. Target returns RAW material when
all three words equal. Old recovered clustb/F171f0 returns DEFAULT on equality:
do not import that apparently matching dump as behaviorally valid source.
Existing full image_reload native fixture PASS using expanded material-context
group, via IMAGE_CREATE_SOURCE override and --gc-sections; all previous real
setup/create/upload/bitmap/file/reload recording-mock checks execute. This does
NOT exercise the newly added raw-material caller or original GPU/runtime.
Command: cc -m32 -malign-double -std=c89 -Wall -Wextra -Wno-unused-parameter
-Wno-unused-function -ffunction-sections -fdata-sections -D__forceinline=__inline__
'-D__declspec(x)=' '-DIMAGE_CREATE_SOURCE="scratch/codex_jpeg_material_context/jpeg_complete_group.c"'
codex/renderer/test_image_reload.c -Wl,--gc-sections -o
codex/renderer/baseline_jpeg_uyz5omc5/image_context_fixture32; run that executable.
Earlier texture-only context rmx26daf: LoadRaw170,Setup229,2D453,volume356;
actual material caller makes LoadRaw169 and RegisterRaw81, no helper-size gains.
Rejected bounded mip-type probe scratch/codex_jpeg_upload_mip /uwd6psrr:
ushort mip +noexplicit&31 ->2D453,volume325,LoadRaw169stillfails+125. Parameter
type remains HYPOTHESIS; MOVZXfromDI/SI alone does not establish the full C type.
Keep probe separate; do not ship or prefer it merely because code is smaller.
CRITICAL already-known BATCH29 boundary:2D upload1000ea20 is472 COMPLETE code
bytes, RET1000ebf7 then8CC toec00. Legacy459 is a truncated prefix; this turn's
early459-length diagnostic was NOT a valid full-body gate and earned zero credit.
Next: reuse BATCH29/30 full472-byte boundary and real caller/row-helper contexts,
not another signature assumption or marker variant. Frozen accepted JPEG remains
scratch/codex_jpeg_source_callbacks /j6w8nim1, authoritative total76172≈6.99%.

CODE CHECKPOINT76172/1089680≈6.99% (2026-09-27): +2467 unique codebytes.
JPEG73123 +engine3049. check_jpeg_constructor.py PASS: finish_input_pass17,
get_interesting_appn326, save_marker622, marker-reader initializer131 and actual
constructor310 =1406. All actual callback bindings checked, original scores kept
separate from the explicitly corrected instruction-aware referee. Full marker
dispatcher882 rechecked with563 code +319 alignment/selector/table excluded;
packed selector bytes are not blindly disassembled as executable instructions.
test_jpeg_app_markers.c executes actual constructor/memory/APP0/APP14/COM paths:
JFIF1.2 densities72, Adobe transform2, saved ordered metadata, COM limit3 of8,
five-byte partial APP0 suspension/resume, exact bytes and balanced real cleanup.
No original-retail runtime claim. Required native services remain mocked.

check_jpeg_loader.py --run codex/renderer/baseline_jpeg_j6w8nim1 PASS:1061 new
codebytes including full R_LoadJpg785, format_message167, reset_error_mgr17,
seven actual renderer source/error/memory callbacks92. Complete500-byte standard
message-pointer table125 entries (124 full strings +NULL) reconstructed and
checked; table/string data receive ZERO codebyte credit. Every loader relocation
has a proven code/service/data binding; wrong bindings rejected. CRT sprintf88
is SDK reference identity/binding only, ZERO CRT codebyte credit, not assumed
redistribution permission or closed whole-CRT IO dependencies. Fresh
authcrt_ttgts880 matches target100f5f14 after local mask correction; its true __cdecl
variadic signature is confirmed by actual Microsoft source. Preserve this run.

IMPORTANT actual-source fixes, not masked-callee handwaving:
PINNED renderer free slot101d49e0 takes ONE pointer argument. JPEG target_free
callback takes pointer+size, but image_jpeg_free10014620 DISCARDS size and calls
that one-argument renderer service. Target13 bytes: load pointer/push/call/pop/RET.
Old two-argument declaration produced a wrong6-byte forwarding tail jump.
Only old source snapshot body785 matched, not this previously unverified helper.
New source reconstructs the real wrapper; no invented custom-ABI adapter.
PINNED image_jpeg_skip_input1004a960 is21 codebytes, then11CC, not24. Source
must cache info->src in a local BEFORE the positive-byte guard. Old twice-
dereferenced source emitted24 (reload due possible alias), failed real body.
Caching the actual pointer gives complete21-byte target match, not padding credit.

Final frozen source scratch/codex_jpeg_source_callbacks; fresh j6w8nim1 keeps all
131 parent shapes, constructor/startup replay PASS and complete real-source
colored baseline/eight-scan progressive/image-loader native fixture PASS.
test_jpeg_image_loader_services.c uses actual one-argument renderer free, with
a fixture-only8-byte allocation header to track exact freed sizes/alignment.
Previous accepted fixture/source snapshots are preserved rather than rewritten.
Intermediate scratch/codex_jpeg_service_abi /fkc_izp2 fixes free but NOT skip;
preserve for attempted-build evidence, do not use it as final loader proof.
New accepted packets jpeg_constructor_packet.json1406 and jpeg_loader_packet.json
1061 are additive; startup_packet1644 now points to the final fresh group and
still SUPERSEDES old color-only22/961 accounting. No canonical edits or commits.
Whole-DLL link/layout/checksum remains incomplete. Actual upstream Image_LoadRaw
still164vs169; setup/upload helper ABI/caller groups need reconstruction next,
not a fabricated thunk or accepting a nearly matching caller.

CODE CHECKPOINT73705/1089680≈6.76% (2026-09-27): +1622 unique codebytes.
Fresh c4_b88se rebuild of frozen scratch/codex_jpeg_raw_caller retains all131
parent shapes; fresh native actual-source JPEG baseline/progressive/loader
fixture PASS. probe_jpeg_raw_loader.py now accepts --run and pins per-run logs.
check_jpeg_color_initializers.py --run codex/renderer/baseline_jpeg_c4_b88se
--instruction-aware --startup PASS: master_selection1004fc90/442 and
jpeg_start_decompress1004a400/241 now close, with all15 prior direct dependencies
freshly rebound and18 wrong master/startup bindings rejected. Both retain the
unchanged original referee100%; real constructor/loader work still uncredited.
939 previously held color/merged/table bytes now clear the audited LOCAL
instruction-aware referee + strict complete-length/site/type/symbol binding
checks. No shared GLM checker/source/ledger changes. Original false scores stay
recorded (table builders97, merged initializer96); raw equality for both195-byte
builders proves the ModRM false-mask defect. Never describe these as original-
referee100%: the corrected gate is explicit, not a silent waiver.
audit_legacy.load_matcher(instruction_aware=True) is explicit opt-in; default
remains unchanged legacy behavior. Adapter uses complete instruction decode,
includes final E9/E8 fields and rejects truncated absolute relocations. Original
shared-section mask-rebasing defect is NOT repaired; check_shape still rejects
nonzero/shared-function sections rather than accepting them unsafely.
referee_branch_probe.py PASS:136 JPEG +four renderer diagnostic cases and
synthetic immediate/ModRM mutation, final-branch and truncated-relocation checks.
New jpeg_startup_packet.json counts1644 INCLUSIVE bytes:22 callbacks already
credited +939 newly cleared initializer/table +683 new master/startup.
It SUPERSEDES jpeg_color_initializers_packet.json22 and
jpeg_color_closure_packet.json961 for accounting; DO NOT SUM all three.
Other historical packets retained. Current JPEG70656 +engine3049 codebytes.
Separate log names keep legacy/closure/startup packet hashes replayable.
Whole DLL not linked, no original-game/runtime equivalence claim.
Next actual code/dependency group: get_interesting_appn326 +save_marker622
(both legacy false masks), jinit_marker_reader131, constructor310; then the
now-exact R_LoadJpg785 with complete RI/string/error-table/ABI binding closure.
Fresh object defines all four real bodies; APP helpers call examine_app0/14,
marker init references reset/read/read_restart/skip/get_interesting_appn;
constructor inlines input init and binds its four real callbacks directly.

CODE CHECKPOINT72083/1089680≈6.61% (2026-09-27): +22 actual required callbacks.
check_jpeg_color_initializers.py PASS: start_pass_dcolor1004bf00/1 and
start_pass_merged_upsample10050150/21, original referee100%, exact full bodies.
Both color429/full452 and merged120 initializer bindings now completely audited,
all23noncode color alignment/switch bytes excluded;17 wrong-binding tests reject.
Merged initializer ends in a real E9 tail call to10050080, not RET; the original
referee omits its final-five-byte branch mask (96vs100), not a source mismatch.
Both195-byte YCC builders are RAW BYTE IDENTICAL, contain no relocations, and
still get legacy97 because embedded E9 ModRM falsely masks the PE only.
Do not attribute those false failures to source/compiler differences.
jpeg_color_initializers_packet.json credits22 only; holds939 initializer/table
codebytes explicitly for instruction-aware referee-fix review. Retain it AND all
previous packets. Current accepted JPEG69034 +engine3049; whole DLL incomplete.

NEW substantial source checkpoint (NOT COVERAGE): actual upstream Image_LoadRaw
1000fc30 is implemented in scratch/codex_jpeg_raw_caller/r_image_load_raw.c.
Source caller uses target-proven mapType field0==4 branch and separate actual
2D/3D upload paths; RI free-temp101d49f8/free-file101d4b00 cleanup is target-pinned.
Structural modern opencod2 Image_LoadRaw skips that branch; do not blindly copy it.
Private/noinline R_LoadJpg +this real caller gives COMPLETE785-byte loader MATCH
at10014940, both unchanged original referee100% AND strict-site/length equality.
Previously public loader805 did NOT match. No ABI adapter, invented caller or
retail bytes inserted. Logical setup/upload declarations retain unresolved helper
body/custom calling-context work; Image_LoadRaw itself164vs169, NOT MATCHED.
Fresh6wvslmqa keeps all131 color-inline parent shapes; native real-codec baseline/
8-scan-progressive/loader fixture PASS. probe_jpeg_raw_loader.py replays all this,
pins input/object hashes and logs; run/raw_loader_probe_packet.json creditsZERO
because loader's own27 relocation bindings/dependency closure remain pending.
New raw-caller source now frozen. Preserve color-inline and prior accepted roots.
Next: fix documented legacy masking in an explicitly audited local referee (do
not silently waive it), revalidate complete initializers/master442/startup241,
constructor310/marker helpers, then bind the now-exact real loader785.

CODE CHECKPOINT72061/1089680≈6.61% (2026-09-27): +97 genuine source codebytes.
check_jpeg_color_callbacks.py PASS: grayscale_convert1004bd20/39 and
jcopy_sample_rows10057990/58, unchanged original referee100%, full RET/CC
boundaries, actual helper binding and wrong-binding rejection. All129 entropy
parent shapes retained in fresh uo3oxv1l; source scratch/codex_jpeg_color_inline
now frozen. Native actual-codec baseline/progressive/loader fixture PASS; the
two existing FIX macro warnings remain, not a warning-free claim.
Retain jpeg_color_callbacks_packet.json alongside ALL eight earlier JPEG packets.
JPEG69012 +engine3049 codebytes. No DLL link/checksum/game-boot claim.
PINNED: target grayscale callback passes jcopy inputs through ECX/EAX/EDX plus
three stack args. Private helper declaration with compiler-controlled inlining
matches actual helper58/callback39 AND keeps other actual callers inline.
Rejected experiment: scratch/codex_jpeg_color_api /kkzkt7iv forced noinline;
it matches those two but loses merged_2v_upsample/int_upsample/h2v2_upsample.
No credit from that overlay; do not overwrite accepted entropy source inputs.
Existing check_jpeg_image_loader.py only permits its two accepted source roots;
direct invocation on new color root rejected as intended. New callback checker
reuses the recorded fixture command with explicit root/executable substitution.
referee_branch_probe.py now tests136 JPEG sections +four renderer cases,
with recorded source/object hash checks and embedded-opcode mutation negatives.
Diagnostic-only instruction-aware masking clears merged initializer120 (legacy96),
both YCC table builders195 (legacy97), retains all129 prior entropy shapes.
No GLM checker edits, no acceptance gate replacement or credit for these cases.
Color initializer1004bf10 complete452 matches legacy:429code +alignment3 +20
switchdata; old429 inventory omits table. Still uncounted until callback/data
binding closure. Next: replay initializer callbacks on frozen color-inline group,
close their data bindings and resolve documented legacy mask bug explicitly.

CODE CHECKPOINT71964/1089680≈6.60% (2026-09-27): +5544entropy codebytes.
check_jpeg_entropy.py PASS67999:11functions, full original-referee+strict
site/type/data-binding checks, three prior dependencies rechecked, all122
parent-group shapes retained. Includes actual baseline/progressive MCUdecode,
DC/AC first/refine, start-pass callbacks and both entropy initializers.
Derived-table builder1004c5e0 inventory694 was a truncation: complete712
endsRET then8CC before bit-buffer1004c8b0; extra18bytes are code, notpadding.
No GLM/canonical inventory changed; local proof corrects full extent explicitly.
Four whole64byte extension arrays +complete320byte natural-order table matched;
combined .data section has unrelated relocations, but no relocation INSIDE
each proven table range. Do not reject valid tables merely for section-wide
relocations, and do not compare a prefix or mask their values.
Native sourceintegration now includes valid8-scan progressive DC/AC first/refine
JPEG; both frozenmaster and entropy overlays PASS (59911/61889 and gate67999).
Updated check_jpeg_image_loader.py accepts --run and binds actual fixture root;
per-run native packets distinguish both overlays. Old four-path native packet
superseded by five-path rerun, not stale evidence. Allocations balanced.
New proof jpeg_entropy_packet.json pins entropy/native logs and source inputs;
source entropy_api now frozen. JPEG68915 +engine3049codebytes. Whole DLL not
linked; no game/retail runtime claim. Master/startup still held pending actual
color/merged initializer callbacks; dimensions, quantizer and entropy dependencies
are now closed. Continue independently; no DeepSeek tasks or workspace edits.

Previous dimensionscheckpoint66420/1089680≈6.10%: +527dimensions codebytes.
NEW integration checkpoint: check_jpeg_image_loader.py PASS27206, actual
source-built JPEG decoder + all IDCT modules + R_LoadJpg. Synthetic colored
3x2 JPEG -> exact BGRA163/135/100/255 (not a neutral-gray swizzle blindspot).
Missing-file / oversized / grayscale paths, encoded-file ownership and real
decoder allocation/free balance pass. Only filesystem/renderer service slots
mocked. No system libjpeg, retail execution, game boot, or new codebyte credit.
Recorded jpeg_image_loader_native_packet.json; existing macro warnings retained
in build log. Earlier colored fixture attempt had an invalid all-one Huffman
code: repaired the fixture to valid DC codes0/10, not the engine implementation.
New independently-owned entropy overlay scratch/codex_jpeg_entropy_api:
real sequential/progressive caller group makes derived-table and huff-decode
helpers private/noinline. Freshmi1di9r9:129shapes/36096bytes, zero build failures;
all122master-parent addresses retained. New helper/decoder bodies still need
binding, boundary and native-fixture review before credit. Source master_api
remains frozen and every accepted packet still points at its original inputs.
check_jpeg_dimensions.py PASS75647: full548byte dimensions block at1004f9e0,
527instructions +1NOP +20switchtable;21noncode bytes excluded. Source-built
use_merged_upsample128 dependency rechecked, five distinct wrong bindings
rejected. Real full source-group native32 fixture540cases: odd dimensions,
1/2/4/8 scaling thresholds, six color spaces, quantized/nonquantized output,
component IDCT scaling and merged-upsample row count. Host compiler reports
only two existing FIX macro redefinitions in concatenated original modules;
not a warning-free build claim. No retail bytes/native engine code invoked.
Proof jpeg_dimensions_packet.json, source remains frozen0rckeoeb.
JPEG63371 +engine3049 codebytes. This closes master-selection's dimensions
dependency; master/startup remain uncounted until other callbacks close.

Previous quantizercheckpoint65893/1089680≈6.05%: +1724unique quantizer codebytes.
Six substantial bodies: ordered-dither287/Floyd-Steinberg436/start-pass1 234/
init1 148/start-pass2 285/init2 296; four real requiredcallbacks1/21/15/1.
check_jpeg_quantizers.py PASS81150: strict full bodies + original referee,
12prior directcallee bodies freshly rechecked;23wrong-bindings rejected;
all90previous wholecaller-group shapes retained. Real32bit fixture9cases:
1/3component one-pass +3component two-pass, none/ordered/FS dither, palette
accuracy, two-row state, new-colormap reset, unsupported mode-change fatal
cleanup, balanced real allocator. Fixture clamp lookup is mocked simple range
segment, not original IDCT wrapped table. No game/V4 claim.
Fresh mastergroup0rckeoeb,122shapes/31669bytes, zero compile failures; actual
quantizer + merged-upsample callees fix master_selection450->442 (shapeMATCH).
This442 and startup241 remain UNCOUNTED until all module callbacks close.
Current source scratch/codex_jpeg_master_api preserved by quantizer proof:
do not edit in-place now; new experiments need an overlay to retain input hashes.
Proof jpeg_quantizer_packet.json; retain all earlier packets. JPEG62844codebytes
+ engine3049. Header/input/bridge fixtures and accepted sources remain intact.
Prior2z946zv0 source hashes superseded by0rckeoeb after actualquantizer/merge
group additions; source-local aliases avoid my_cquantizer/my_upsampler/table
collisions and are not claimed historical module organization.
Next: dimensions527code+1align+20table proof; color/merged initializer blocks;
Huffman/progressive callback groups (base has only fill_bit_buffer286 closed,
not their start-pass/decode bodies). Then close master/startup and realloader.
User explicitly stopped DeepSeek assignments: continue independently, leave
its source folder untouched and do not send new work prompts.

Previous inputcheckpoint64169/1089680≈5.89%: +296unique codebytes since
lastcheckpoint: jpeg_consume_input149 + jpeg_read_header147. Dispatcher is
183byte fullblock:149code/3alignment/20switchtable/11selector;34notcredited.
Fresh realcaller inputAPIgroup6c1izr_2,84shapes/21399bytes, all82parent retained.
check_jpeg_input_block.py PASS73723; all8dispatcher +1header wrong-binding
negatives rejected; default393 dependency rechecked + complete 8byte1.0 data.
Actual32bit parser fixtures pass header suspension/resume, grayscale defaults,
READY behavior, tables-only abort, required-image rejection, bad-state cleanup.
Bridgechecker refreshed19848 and inputchecker61339 after new fixture coverage.
Retain ALL prior packets plus jpeg_input_block_packet.json; totalJPEG61120
sourcecodebytes + engine3049. Startup241 matches but remains UNCOUNTED.
Next sourcecontext: scratch/codex_jpeg_master_api (preserves accepted overlays),
private dimensions and actual sequential/progressive entropy callers included.
Fresh2z946zv0:90shapes/22351bytes, all84inputgroup retained, no build failures.
Master_selection still450vs442, UNCOUNTED. Dimensions full548block matched in
earlierex3xmm52 context but needs527code/1align/20table proof, NOTCOUNTED.
ex3xmm52 sourcehashes superseded by2z946zv0; lzobm2dj failed on original headers'
unguarded typedefs and colliding module-local tables. Group adds jdhuff guard
and local aliases only; no historical TU organization claim or fake callers.
Next: reconcile actual remaining master call registers, audit dimensions block,
then startup dependency closure. No fresh base replay needed after fixture-only
changes; base/IDCT/marker PASS from priorcheckpoint remain unchanged.

Previous bridgecheckpoint63873/1089680≈5.86%: +481unique source codebytes:
error_exit51/output_message49/jpeg_finish_decompress227/jpeg_read_scanlines154.
Fresh MSVC /O2/Gy complete codec + actualR_LoadJpg caller group96y3u0mv:
82shapes/21011bytes, all79parent bridge shapes retained. Newproof:
check_jpeg_renderer_bridge.py --run codex/renderer/baseline_jpeg_96y3u0mv.
Real32bit allocator/constructor/error callbacks + scan/finish suspension,
progress/excess-row/EOI cleanup tests PASS (downstream callbacks mocked).
Base92690, IDCT15953, marker44084 all PASS. Keep ALLthree old packets plus
jpeg_renderer_bridge_packet.json; totalJPEG60824codebytes, engine3049.
Constructor310at10049e00 matches with realR_LoadJpg + private/noinline ctor,
but remains UNCOUNTED: marker-reader dependency held. Loader10014940 itself
805vs785bytes after real API private-linkage/inline-memory-source experiment;
its true caller is1000fc30 (call1000fc5c), not a fabricated wrapper.
Error manager appended callback offsets0x84fatal/0x88print, size0x8c, pinned
by loader stores/callback instructions; fixture verifies preserved constructor
client_data and renderer allocation/free callbacks. Current complete-group
source is scratch/codex_jpeg_image_loader; earlier5548zlhq input hashes are
superseded by96y3u0mv after jpeglib/r_jpeg_load changes, not replayable as-is.
DeepSeek independent fresh review:1373vs1485bytes,9% diagnostic, ZEROmatches;
state0 + two callers still absent. Corrected mission target evidence: state1
input IS stack-sourced [ESP+0x10] after locals8/pushEBX, not proven customABI.
Logger10038110 also consumes changedBits in incomingEBX (caller1003cc87),
besides stackstateBits1; worker one-argument prototype omits this input.
Do not touch worker source while it works; direct it to real logger/helpergroup.

Previous marker checkpoint63392/1089680≈5.82%: +1976codebytes.
Fresh commonAPIgroup56yqdjvj: actualget_dht795/get_dqt618 inliningmatches;
fullread_markers563+NOP1/switch64/map254 proven,319noncodebytesnotcredited.
Fullbaseline regression54691PASS; markerblock4024PASS; IDCTblock54601PASS.
CombinedJPEG182shapes/181directclosed/60343bytes. BOTHseparateblockpackets
pin latestbasepacketSHA. Real32markerfixturesPASS 8/16bitquant/Huff/DRI/EOI,
empty/partial suspension, malformedSOI/DQT/Huff errors. No game/V4 claim.
Replay fullBATCH_52command thencheck_jpeg_idct_block.py andcheck_jpeg_marker_block.py.
Userrequested sourceimplementationlargerbatches, notstandalonereview reports.
DeepSeekprompt DEEPSEEK_RENDER_STATE_BUILD.md; fourrealprimarybodies required.

Latest BATCH_55_STATE_REVIEW_MARKER_LEAD: userflagged slow/source-poor batches.
DeepSeek8finalINCOMPLETE,0newmatches; onebodywrongMac/helperform. Assignment
DEEPSEEK_RENDER_STATE_BUILD.md now replaces mixedqueue with wholeWindowsstate
module/realcallers/helpers, concreteDLL/KisakWindows leads, source-first batching.
No workeredits. Ownmarker commonAPIgroup fresh56yqdjvj addsDHT795/DQT618matches;
check_jpeg_marker_block.pyPASS also fullread_markers563code+319table/alignment.
1976candidatecodebytes NOT yetcredited: needsactualmarkerfixture/fullregression.
Currentaccepted61416≈5.64%. Newoverlay scratch/codex_jpeg_api_common_group pinned.

Next ownsource checkpoint BATCH_54_API_CONTEXT: baseline_jpeg_j1kw2vhc fresh
API/memory/input/marker group34shapes/8466bytes, all15prior shapes retained.
Accepted coverage STILL BATCH_53(61416≈5.64%). Newmarkerinit131 shapeHELD:
get_interesting_appn326 oldBATCH_8legacyE9maskbug +read_markers fullblockproof.
Immediate substantivecandidate read_markers1004f280:full882blockoriginal100%;
actualcode563+NOP1+switch64+map254. Needs strictfullblock binding/control/negative
proof via existing pattern, not scanning tabledata as instructions or counting
882ascode. Pin actualhelpers from oldsourceproofs, notnames. Newoverlay
scratch/codex_jpeg_api_input_group muststayunchanged for j1kw2vhc replay.
CreateDecompress311target310 STILLcdecl-vs-registerABI unresolved; actualcall
10014a18 within R_LoadJpg10014940/785 offers realcallercontext, nofakecaller.

LATEST checkpoint BATCH_53_IDCT_BLOCK:61416/1089680≈5.64% reviewed subset.
Full regression session3760PASS (base178shapes/176closed/57469), followed by
IDCTblock session47131PASS adds selector781 plus closes initializer117:
combined179distinctJPEG shapes/178directclosed/58367bytes. The two JSON packets
are deliberately separate; basepacket stilllists the initializer unresolved.
Run fullBATCH_52command THEN python3 codex/renderer/check_jpeg_idct_block.py.
Blockpacket pins basepacketSHA to prevent stale combined accounting.
Switch32/alignment3excludedcodecredit; all20blocksymbols negativechecked,
6sourcekernels revalidated, real32-bit selectorfixturePASS all6methods/table
reuse/skips; nativekernels288targetcases0differences CW027FexplicitPASS too.
Remaining oldformat_message167/sprintf2sites STILLHELD; no gate weakening.
No release/progressrepo edits or commits. Next ownwork: remaining realJPEG API/
controller groups, preserving DeepSeek engine regions and acceptedoverlay hashes.

LATEST checkpoint BATCH_52_DECODER_CALLBACKS:60518/1089680≈5.55% reviewed subset.
Full replay session93207 PASS:178JPEG shapes/176directclosed/57469bytes;
new1005bytes: start_input_pass92, start_pass_upsample26, fullsize_upsample11,
noop_upsample11, dummy_consume_data3, coefficient initializer364, upsampler498.
Use --decode-run baseline_jpeg_d6d0wpgj with --memory-run baseline_jpeg_9nwllwps
and all prior arguments. Expanded actual32-bit source fixtures PASS, negatives
and unchanged prior matches PASS. Threeunresolvedsites remain: IDCTstart_pass
and twoformat_message/sprintf. No wholefile/link/game/canonical/commit claim.

Next high-yield ownwork: BATCH_51_IDCT_LEAD.md. Actual _start_pass1004c0e0
matches full816block: code781+LEAalign3+switchtable32, not a source mismatch.
Both normalizedfullblock and unchangedoriginalreferee100% with scopedextent816;
acceptance stillpending complete branch/table/binding/negative replay. Reuse
check_crt_block complete-table proof pattern; do not blindly flagprobe or count
table/alignment as functioncode. Acceptedsourceoverlays remain unchanged.
DeepSeekcampaign8 nowexists butINCOMPLETE(oneunmatchedprimary,11deferred).
Userrouting continuation DEEPSEEK_CAMPAIGN_8_CONTINUE.md; preserve workerfiles.

LATEST checkpoint BATCH_50_REVIEW:total59513/1089680≈5.46%. DeepSeek revision2
independentlyfreshbuilt twoLocate functions/186NEWbytes;64/32hostsourcefixture
scope labeled, own32testPASS. EightTUs24reportedfuncs only1body>=256; notbiggoal.
Route DEEPSEEK_CAMPAIGN_8.md/QUEUE:28substantial>=512candidates/26619provisional
bytes, choose12primaries+realhelpers, avoidtinyfilequota. Notreportedrunningyet.

Own decoder callergroup baseline_jpeg_kep_s022 retains33existingbodies and yields
fiveinitializer shapes; onlymain1004db80/205 andpost10051650/131close(+336bytes).
Full session81394 PASSED173JPEGshapes/169directclosed/56464bytes, allnegative
bindings plus actual32bitmain/context/post/virtualmemoryfixture. Add --decode-run
codex/renderer/baseline_jpeg_kep_s022 to latest fullcommand includingmemorygroup.
Remaining newinit shapes979bytes HELD: inverseDCTstart_pass1004c0e0 unresolved;
upsamplehelpers100516e0/100517e0/100517f0 andcoef1004aa30/1004ad90 needgenuine
calleeproofs (object sizes26/11/11/19/3). DoNOT accept merelybecause pointerfits.
Existing336functions/fullbounds areacceptedsubset, not V4. Inputs muststayunchanged.

Latest session70318 PASS: source-group JPEG memory initializer10055840/160 now
matches with its REAL Create callers present and private/noinline linkage under
cl/O2/Gy ONLY, noGL/LTCG. Fresh run baseline_jpeg_9nwllwps, overlay
scratch/codex_jpeg_api_group. All13memory matches retained; default_decompress
parms393 alreadycounted, omitted fromsupplementalcredit. Fullbinding and negative
tests for14memoryfunctions, sourcefixture and wholeJPEG regression pass.
JPEG168shapes/167directlyclosed/56128bytes; total58991/1089680≈5.41%.
Replay existing fullcommand with --memory-run baseline_jpeg_9nwllwps instead
ofvctq8lbv. CONTEXT_EVIDENCE.md records boundedcontextproof; actualCreateAPI bodies
stillunmatched, nohistoricalTUclaim, callback/game/V4 acceptance remainseparate.
This concrete result refutes general customABI=>LTCGonly assumptions, not proof
everyenginefamily matches. Share withDeepSeek's caller/TU investigation.
DXErr remainsboundedDEFER: previouslytried O1/O2/framepointer/hotpatch variants
didnotmatch; doNOT rerunthose withoutnew authenticatedlibrary/compiler evidence.

Latest own checkpoint2026-09-27: session82866 PASSED full JPEG dependency replay,
167shape bodies,166directly closed/55968bytes. Memory source adds1085uniquebytes:
realize_virt_arrays10055190/360,access_virt_sarray10055440/329,
access_virt_barray10055590/345,self_destruct10055800/51; prior9allocators retained.
Reviewed total58831/1089680≈5.40%, not whole-file identity. BATCH_49_JPEG_MEMORY.md
records complete bounds/data-symbol/negative/fixture checks. Add --memory-run
codex/renderer/baseline_jpeg_vctq8lbv to the existing full replay command. Inputs
rehash after fixture execution. Superseded hi2byq_1 source overlay hash changed;
do not replay that old run as current proof. No clean-source promotion or commit.
Memory source fixture passes virtual zero-fill/preservation/final-row checks and
allocated==freed; actual game runtime/callback acceptance is still separate.

DeepSeek campaign7 preliminary review found no new acceptedbytes:10001230already
counted; twoLocate shapes each had unresolvedallocator; logs overwritten; global
LTCG-onlyclaimunsupported. Route DEEPSEEK_CAMPAIGN_7_REVISION.md into new folder,
not current own JPEG scope. Preserve original worker inputs. See BATCH_48 review.

Owner routing update: use DEEPSEEK_CAMPAIGN_6.md + its 288-entry TSV for a single
large externally routed reconstruction/review packet. Campaign6 owns only
scratch/deepseek_campaign_6; Codex JPEG work remains separate. It incorporates
Campaign5's90 CRT seed rows plus bounded engine-family implementation. NOT yet
reported running or accepted. 20% is217936/1089680; new accepted bytes needed160190.
Partial-source checkpoint now lives in independent Git repo dev/renderer-progress,
commit6527626. Owner corrected release policy: cod2engine ONLY completed work.
Mistaken partial-checkpoint commit a0396d5 remains there for owner to undo later;
do not rewrite history or make further partial-source release-tree commits.

Latest session30407 PASSED:163 JPEG shapes,162 directly closed/54883 bytes.
Authentic SDK ftol2.obj SHA33f11763619e4b5b87fa5397ffd7e86ab33cb4ca7414dc188b288df7878cf128
from pinned image /opt/msvc710/Vc7/crt/src/intel/dll_lib/ftol2.obj exactly equals
target1010a8a8's complete117-byte body, no relocations. This is symbol identity
ONLY, no runtime117-byte reconstructed-source credit. Nine compiler-generated
__ftol2 calls nowbound with per-symbol negatives; forward_DCT_float1765 and
idct_float1062 become directly closed C-source proofs. Format_message167 remains
DEFER: sprintf100f5f14 strict88 agrees but original referee95%; two calls unbound.
No legacy-gate weakening or sprintf88 source credit. Add --toolchain-ftol2
codex/renderer/scratch/codex_runtime_binding/sdk_ftol2.obj to latest replay.
Reviewed total57746/1089680≈5.30%, excludingCRT; no canonical changes/commits.

Native behavioral evidence: unchanged anchor loading helper extracted/reused in
own target_oracle.c; DXerr5252-case regression still0 mismatches. New
test_jpeg_idct_target.c executes original islow8x8/float8x8/reduced4x4 kernels
and genuine source under explicitly selected CW027F:288 cases,0 differing bytes,
including guard-column/row sentinels and zero/DC/random coefficients. Table
construction follows IJG range-limit and unit quantization scaling. This is NOT
original runtime CW observation, game boot, wholefile proof or new byte credit.
Reproduce/persist: python3 codex/renderer/check_jpeg_idct_target.py.
Owner requested verified clean-src saves/commits only when explicitly signaled;
do NOT move research or SDK objects to canonical on your own.

Combined session71096 PASSED all replay/fixtures:163 shapes,160 directly closed
JPEG bodies/52056 bytes; unresolved forward_DCT_float1765/idct_float1062/
format_message167 remain excluded. Reviewed total54919/1089680=5.04% excluding
CRT. Supplemental bound/negative suite includes both new upsamplers317 bytes.
Two missing-entry discovery arguments now accepted, preserving prior scope and
rejecting any regression in already-closed supplements. Both adapter and real
API-source roundtrips pass current err/client_data/allocator preservation asserts.
Goal10%active, no wholefile/link/canonical or runtimeasm provenance claims.

Latest missing-entry replay session74884 PASSED:161 shapes/54733 JPEG bytes,
158 directly closed functions/51739 bytes. Three NEW candidates DEFER:
forward_DCT_float1765 and idct_float1062 call __ftol2 at1010a8a8; format_message167
calls sprintf100f5f14 twice. No external runtime symbol guessed/bound. Newly
reviewed9678 bytes brings total54602/1089680=5.01083% excludingCRT. Old4.12%
statements are historical. DeepSeek5 owns runtime cohort; no overlapping edits.
verify_jpeg_reference.py --missing-entry-discovery now diagnoses missing aligned
entries only when a target PE pointer or decoded direct branch references them,
then BOTH referees/fullsource sections must match. Default behavior unchanged.
Discovery37wm8ixj reuses43 hashed objects;7d2elyfu reuses7 fresh utility objects.
Extra two upsamplers199+118 await latest combined session approval.
Full command: prior combined replay + --api-run baseline_jpeg_gw_mrcxy
--missing-discovery baseline_jpeg_37wm8ixj --missing-discovery baseline_jpeg_7d2elyfu
(all paths prefixed codex/renderer/). Current combined session remains running.
Source API integration passes actual modified Create routines (callback save/
restore PINNED10041710/10049e00), preserving err/client_data/alloc/free. Source
byte matches remain DEFER; no new credit for API draft. Prior adapter test also
passes; current fixture hash recorded. scratch/codex_jpeg_api own draft only.

External follow-up ready: DEEPSEEK_CAMPAIGN_5.md routes90 authentic CRT-C
candidates from baseline_p9txpec2 through one grouped dependency/boundary/negative
review. Own scratch/deepseek_crt_5 only, no JPEG overlap. Prepared, NOT claimed
running. SDK-source licensing/distribution remains separate; no automatic
counter additions. Owner can route while Codex continues JPEG closure.

Latest combined acceptance replay session59657 PASSED:120 JPEG bodies/42061
code bytes, no unresolved direct relocations;35 supplemental library bodies/
12453 bytes validated by full decode/return/alignment/internalbranch gates and
28 deliberate wrongbinding rejections, recorded host roundtrip passes.
Whole reviewed per-function subset44924/1089680=4.1227% excludingCRT, NOT V4.
Replay check_jpeg_dependencies.py with --encoder-discovery baseline_jpeg_iiv3cbly
--encoder-inline baseline_jpeg_resg1sio --encoder-preprocess baseline_jpeg_imk9bf3i
--encoder-coeff baseline_jpeg_imk9bf3i --utility-discovery baseline_jpeg_jo87fsju
(all run paths prefixed codex/renderer/).
New boundary scan iiv3cbly reuses all43 original hashed objects, finds encoder
rgb_ycc_start215(old207), encode_mcu_huff379(old370), htest_one_block227(old224).
Preprocess_context612(old598) verified with fresh utility object imk9bf3i.
Fresh7TU utility batch jo87fsju adds decompress_onepass679(old667),
decompress_smooth_data1612(old1606), int_upsample316: all matched under both
referees; zero directrelocations, targetstruct/callback ABI not newly inferred.
Shared GLM inventory remains untouched; original Create APIs still unverified.
No10%claim; DeepSeek campaign4 remains honest0NEW and workerfolder unchanged.

Coefficient group now VERIFIED by combined session66175:113 JPEG bodies/38021
bytes, all direct relocations supported, fixtures/boundary/negative gates green.
New2309-byte group: start_pass_coef224 at10041db0 and compress_data692 at10041e90
were absent from inventory; compress_output521 at100423a0 was truncated518.
Explicit in-memory corrections preserve GLM files and bind first_pass590 and
jinit_c_coef_controller282; group internal3calls+2initializer sites allchecked.
Replay prior encoder command plus --encoder-coeff baseline_jpeg_imk9bf3i.
Total reviewed subset40884/1089680≈3.752% excludingCRT, no wholefile claim.
Next saved-object --boundary-discovery diagnoses omittedtails≤16bytes; default
referee unchanged and discoveries still require explicit fullbody acceptance.

Mission4 independent review: fresh baseline_jpeg_qiv1a2iy compiles campaign4,
reproduces10shapes; check_deepseek_review.py retains3/176 with all wrongbinding
tests and real32-bit fixture; verify_image_family retains8/1141. Newbytes0.
Worker's lightmap source/fixture is useful but its formula oracle shares host
atan2/acos, not independent originalDLL behavior. Runtime rounding observation
remains unknown; no allmode-source-adapter or historicalasm provenance claim.
Workerfolder untouched. Checker stale 'callbacks mocked' caveat corrected:
real drafts run with mocked external services, not retailruntime proof.

Separate encoder utility-inline3TU build baseline_jpeg_imk9bf3i yields genuine
new shapes compress_first_pass590, jinit_c_coef_controller282 and
pre_process_data554. First two DEFER unresolved compress_output100423a0 and
start_pass_coef10041db0 respectively. Existing sampler/prep proofs preserved.
Only pre_process_data554 enters supplemental acceptance replay through
--encoder-preprocess codex/renderer/baseline_jpeg_imk9bf3i, with no relocations.
Combined replay session84595 PASSED:108 bodies/35712 JPEG bytes, no unresolved
direct relocations;23 new encoder bodies/6104 bytes pass boundaries/bindings and
negative checks, recorded roundtrip passes. Reviewed per-function subset now
38575/1089680=3.54003% excludingCRT, not V4/canonical or wholeDLL completion.
Older2.98%/provisional statements below are historical and superseded.

Latest encoder gate2026-09-27 supersedes provisional/crash notes below:
fresh broader jcmaster build baseline_jpeg_resg1sio adds initial_setup456 to
per_scan_setup453. Combined107 JPEG bodies/35158 bytes, no unresolved direct
relocations,22 new encoder bodies/5550 bytes. check_jpeg_dependencies.py now
replays full instruction decoding, finalRET, alignmentCC padding, internal jump
boundaries, every source-backed binding and per-symbol wrong-address rejection
for new encoder scope. Existing JPEG bodies remain green. Source integration
roundtrip passed and is recorded in packet (host allocator/API initialization
adapter, not original DLL runtime proof). Command uses --encoder-discovery
baseline_jpeg_vfibt139 --encoder-inline baseline_jpeg_resg1sio; paths relative
to codex/renderer. Latest rerun session95622 passed; rerun with extra internal
branch-target-boundary check underway. Pending that replay, reviewed subset
would be38021/1089680 =3.489% excludingCRT, NOT full-file/link acceptance.
No claim of10%; keep goal active. Independent review/indirectABI/link pending.

Encoder follow-up supersedes the crash note below: test_jpeg_roundtrip.c now
passes after explicit host-only initialization of target_alloc/target_free,
marker reader and input controller. Stock IJG Create APIs erase renderer callback
fields; they are not tested/claimed reconstructed by this adapter. Compile all
jpeg_bgr/j*.c except jutils.c with -m32 -malign-double -std=c89 -O2 -lm.
Fresh baseline_jpeg_01zpu8j1 includes jutils.c in own codex_jpeg_encoder_inline
jcmaster.c, matching per_scan_setup453 under BOTH referees. Combined replay:
python3 codex/renderer/check_jpeg_dependencies.py --encoder-discovery
codex/renderer/baseline_jpeg_vfibt139 --encoder-inline
codex/renderer/baseline_jpeg_01zpu8j1
passes106 functions/34702 bytes, no unresolved direct relocations; existing
validate_script967 is replayed against the new object (not silently dropped).
New encoder scope totals5094 bytes above old JPEG29608, remains provisional
until independent full-boundary and per-binding negative checks. Broader saved
object replay rqd99qm6 also finds initial_setup456, not included/credited yet.
DeepSeek owns campaign4 image/cubemap/math; own encoder workspace only.

JPEG encoder continuation: encoder-discovery vfibt139 supplements the existing
dependency replay with20 candidates/4641 bytes;105 total bodies/34249 bytes.
prepare_for_pass396 still has3 unresolved per_scan_setup bindings; equal453-byte
per_scan_setup fails relocation-site equality and is NOT accepted. Supplemental
coverage remains provisional pending complete bounds/negative/behavior checks.
New test_jpeg_roundtrip.c compiles with -m32 -malign-double and all scratch/jpeg_bgr
j*.c except jutils.c (included by jdinput.c), but runtime exits139. Diagnose this
before claiming roundtrip behavior; no passing fixture or new coverage claim.

Mission3 review2026-09-27: fresh baseline_jpeg_plbfn3j_ reproduces10shapes;
check_deepseek_review.py and imagefamily retain3/176+8/1141. Actual32-bit exact
workerfixture passed. Source inlineasm matches targetFADD/FISTP primitive, no
newwholefunction credit; water96vs98. Hostflooradapter is NOT all-rounding-mode
equivalent: nonnearest fixturetests oracle only, notadapter. Runtime027F remains
unobserved; copied opencod2 helper is supportive, nothistoricalprovenance. Worker
/Oi- experiment98water rejected globalrowcopyregression remainsuncredited.
Campaign4 should reuse stageA evidence, notrepeat it. Workerfolders untouched.

Separate DXerr probe: O1/Oy-/hotpatch freshxtlvkpna no matches; CL explicitly
ignores unknown /hotpatch(D4002). Thus hotpatch entry cannotbe explained by this
flag on pinnedCL; librarycompiler/version stillunknown, NOT proofimpossible.
Targetprologue evidence and savedobjects supersede arbitraryflagguessing. Optional
generic --frame-pointer/--hotpatch added; defaultunchanged, inspectwarninglogs.

Bulk continuation: check_dxerr_mappings.py now compiles analysis-only native32
target_oracle.c, loads originalPE sections at preferredbase unchanged/noentry,
and compares actual100efe3c outputs with host decompile over thresholdneighbors
and4096seededrandomcodes. Results scratch/codex_dxerr_switch/mapping_review.json.
No byteprogress/exhaustive/wide claim. Existing localDxErr.lib has newerD2D1
COMDAT symbols, not authenticated2005 source; don't assume versionmatch.
No new numberedreport. Next audit mappingresults/actualswitchlowering before
morecompilerexperiments. Goal10%remainsactive.

Latest BATCH_47_REVIEW.md: active10%renderer objective, stillcounted32,471≈2.98%
subset(excludingCRT). Larger non-image library candidates DXErrA/W100efe3c/
100f2b25 investigated. prepare_dxerr_probe and prepare_dxerr_switch create own
unverified candidates (646reference mappings); noacceptedsource. Freshg0jt6np0
decomp10372,1cuv4ijr switchO2raw12254,viydevhp switchO1raw11395, allDEFER.
No more arbitrary variants; auditactualtables/extents or authenticlibraryversion
next. Genericverifier optional--optimization added, defaultO2unchanged.
DeepSeekcampaignfolder untouched. Goalnotcomplete/no10%claim.

Latest BATCH_46_REVIEW.md: DEEPSEEK_CAMPAIGN_4.md is large staged assignment
(Aconversion,Bmath,Ccubemap,Dlightmap), single combined review return. Owner
routes externally. Separate sharedreferee work: referee_branch_probe.py replaces
PE rawscan only IN MEMORY for diagnostic tests; finaltailjmp10020d50 96→100,
three priorframe matches stay100. No gate replacement/new111credit. Existing
strict binding checks alreadypass Submit. Next expanded independentharness
review/regression and Submit/AdvanceFrame source behavior; no randomvariants.

Codex separate render-submit source started: scratch/codex_render_submit/
j_render_submit.c copies preserved debugpair and adds real10020d50 endcmd→
zero counters→execute/end→AdvanceFrame10021040. Fresh baseline_jpeg_ndwi4wbp
compiles, preserves three258 shapes; Submit111 equals target111 but NOT a
match in discovery. Independent strict bound check DOES match111; original
referee disagrees at finaltailjmp (known terminalbranch masking hazard). Remains
DEFER-REFEREE-DISAGREEMENT, no newcredit orbehavior
fixture claim. Next inspect actualsite/byte discrepancy from savedobject rather
than recompiling unchanged. DeepSeekrounding3 assigned externally ifowner routes.

Latest BATCH_45_REVIEW.md: Mission2 independently reviewed as honestDEFER,
zeroNEW code bytes. Freshh3ay7tvx retains mission1 three176 and image8/1141;
sourcehash+bothreferees+negativechecks and actual cubemapfixture pass. Numerical
review demonstrates Ccast127.5→127 vs nearest-FISTP-model128; runtime retail
roundingmode not yetpinned. No tolerance accepted as exactpixels. Workercompare
diagnostic cannot accept matches before relocationmap equality. New
DEEPSEEK_MISSION_3.md is bounded sharedconversion investigation, NEWowned
scratch/deepseek_rounding_3; owner may route. Workerfolders unchanged. Next
separate render-submit forCodex or returned numericalpacket review.

Latest BATCH_44_REVIEW.md: Codex frame-end10021f90 freshn2weway4 matches86NEW,
check_frame_end.py validates fullboundaries/both referees/allbindings/negative
tests and executes32-bit test_frame_end.c. External submit/backend remains
unmatched; noV4/canonical. DEEPSEEK_MISSION_2.md ready for owner routing, owns
NEWscratch/deepseek_cubemap_2 only. Continue separate render-submit10020d50/
10021040 or independently review returned mission2; no image overlap.

Routing2026-09-27: DEEPSEEK_MISSION_2.md prepared for actual cubemap+3pixel
callbacks, owns scratch/deepseek_cubemap_2 only; owner will route. Codex owns
separate scratch/codex_frame_end candidate10021f90 (legacyBeginFrame, supported
actualEndFrame). Fresh build started; no match credited until bound checks/tests.

Latest BATCH_43_REVIEW.md: independently reviewed DeepSeek image mission1.
Fresh baseline_jpeg__4k10qm8 proves Release87+LightGrid43+Sun46=176NEW bytes;
check_deepseek_review.py runs hash/both-referee/all-bindings/negative checks
and actual32-bit builtin+release fixture. Retained1141/header67/dispatch261/
formatter26/file240 green on fresh source. Worker source untouched. IMPORTANT:
CC10 is109, RETcc7c+3CC, NOT125: older B38/39 entries below are superseded.
DeepSeek right about this mission error. Its hardcoded fixture proof and blanket
TU-cause claims are not accepted; current realImage_Load caller IS in itsTU.
No canonical/V4/full procedural pixel proof. Next newownedoverlay for real
cubemap generator+three pixelcallbacks, not repeating register probes.

Latest BATCH_42_REVIEW.md: separate scratch/codex_debug_pair adds actual
BeginDebugFrame10021ff0 (legacy EndFrame label incorrect),73NEW bytes.
Fresh baseline_jpeg_arnc6688 retains End114/helper71 for3/258 total. Replay
check_debug_frame.py <run> and default oldrun both green; 32-bit
test_debug_pair.c passes save/unlock/switch/no-lock flag preservation plus prior
End/command buffer assertions. Immutable build inputs restored/preserved;
new fixture separate+hashed. No independent/V4/canonical claim. DeepSeek image
folder untouched; next separate non-image group or returned packet review.

Latest actual source checkpoint: BATCH_41_REVIEW.md. Separate
scratch/codex_debug_frame adds EndDebugFrame10022040 (corrects legacy Begin
label) and AddCmdEndOfList10020ec0. Fresh baseline_jpeg_8cwyzk_y matches114+71;
check_debug_frame.py passes both referees, complete extents, all bindings and
negative tests.32-bit test_debug_frame assertions pass.185NEW reviewable bytes,
no independent acceptance/V4; three backend callees still unmatched. Initial
Docker permission failure gp6dflnp retained; approved build succeeded. DeepSeek
image folder untouched. Continue separate non-image source or review its returned
packet when owner says done. Do not recount old114 shape-only snapshot bytes.

Scheduling update: read FAST_ROUTE.md and DEEPSEEK_MISSION_1.md. Prefer a complete
image caller/callee cluster pass over isolated spelling probes. External worker
owns only scratch/deepseek_image_1; do not edit there while assigned. The saved
79-function GLM packet totals only 2,170 shape-only inventory bytes, with reviewed
overlap; it is not a large unused progress reserve. Retained load-entry group
replayed 8/1141 green; anchor audit green. No new match or V4 claim.

Latest: BATCH_40_REVIEW.md. load_entry overlay adds actualImage_Load10AB0 on
preservedimage_alloc. Fresh baseline_jpeg_kt0uomxd55vs43DEFER; builtin108A0
explicitextern unresolved.32-bit test_image_load_entry.c passes builtin delegation
mock and actualordinary allocation->file->dispatcher->bitmap->upload source,
failureNULL/registry retained. Eight prior1141 preserved. PINNED builtinsemantic
EBX (entrycopiesECXbeforebuiltin),nameEAX/trackEDX. Next actual builtin/procedural
dependencies with verifiedpixels/signatures,notinventedABI. No newmatch/V4.

Latest: BATCH_39_REVIEW.md. Bounded hashweight119 expression probe corrected
overlay wavelet_hash_weight_fixed fresh baseline_jpeg_m6rgcb1p compiles67vs82
DEFER,alloc109vs125DEFER. Source-selected32-bit alloc/collision tests pass.
First hash_weight/0crglwga attempt accidental declaration edit failscompile,
preserved/notcredited; fixedoverlay sourced from unchangedimage_alloc. No new
matches. Next genuine highercaller/TU evidence,notmore arbitrary hashvariants.
Prior8/1141 plus file/header/dispatch/path preserved; no canonical/V4.

Latest: BATCH_38_REVIEW.md. image_alloc overlay adds realCC10 allocation+CB40
empty-slot hash. Fresh baseline_jpeg_x6fy50yp compiles; actualtargetCC10=125not
legacy109,CB40=82not72. Objectalloc109vs125DEFER;hash82 equal butreloc+46vs44
DEFER. Signedbyte hash weightindex119,mask2047,linearprobe;allocation36+nameNUL,
name32/trailing36,category30/semantic10/track12.32-bit test_image_alloc.c passes
copy/guards/signedhash/collisions/truncation/unmodifiedbytes;8prior1141 retained.
No newmatch. Next auditedactualextents/caller context;do not creditlegacy109.
Canonical/independent/V4 remain unfinished.

Latest: BATCH_37_REVIEW.md. file_payload overlay preserves reload_group and
keeps payload=file+28 distinct from filebase BEFORE validation. Freshqqtw3j8j
matchesFile240bytes. check_image_file.py proves both referees/all16bindings/six
strings/negativefree slot,retainedheader/dispatch/formatter and source-selected
reload32-bit fixture. NEW240 only;Release84vs87/Reload44vs42DEFER. Memsetprobe
0ya16zgjRelease80 worse,notpreferred. Fixture runner explicitly-Dsaved source
prevents older-overlay tests. Next real imagegroup remainder;CRT86 stillDEFER.
No canonical/closure/independent/V4 claim,original snapshots preserved.

Latest: BATCH_36_REVIEW.md. reload_group adds actualReleaseC910/ReloadD450,
private filehelper. Fresh baseline_jpeg_234kei0o file242vs240,release84vs87,
reload44vs42DEFER.32-bit test_image_reload.c passes accounting/COM/nulltexture,
successful fullfile reload and failedreload cleanup/errorname. Eight prior1141
retained; header/dispatcher/path rechecked via configurable savedrun/fixture.
No newmatches. Next actualbody/context/structzeroing audit; CRTstrict-only86still
DEFER. Fixtures/checkers reused, no canonical/independent/V4.

Latest: BATCH_35_REVIEW.md. Authentic glm/crt71/vsnprint.c freshauthcrt_6_oplcrm
strict86 matches _vsnprintf100f61b9 and _output/_flsbuf bindings, BUT original
referee95 misses actualcalloperand+41. check_crt_vsnprint.py pins/replays expected
DEFER/wrong-binding rejection; ZERO credit, no silentreferee replacement. Fresh
_flsbufauthcrt_1g0gftf0278vs281DEFER. CRTseparate/no provenance approval/runtime.
Next realcaller-group work plus independent harnessdiscrepancyreview; do not
countstrict-only CRT86. Prior engine/header/dispatch proofs preserved, noV4.

Latest: BATCH_34_REVIEW.md. path_formatter overlay replaces extern with genuine
staticva_list/_vsnprintf formatter; fresh baseline_jpeg_f2h112qr matches26bytes,
naturalESI/EDI fixedargs. check_image_path_formatter.py pinsCRT100f61b9 binding,
negative test,both referees,26+6CC boundary,retained dispatch/header,new hostCRT
adapter fixture for return/termination/guards plus fullfile mocks. NEW26only;
file252vs240DEFER,CRT unmatched. Dispatch checker optionalrun/fixture reused;
rootpacket most recent explicitrun. Eight prior1141 retained. No canonical/V4.

Latest: BATCH_33_REVIEW.md. file_loader overlay adds realFA40/headerF2A0; static
dispatcher now naturally targetEAX/ECX/EDX. Fresh baseline_jpeg_87hqwidm matches
header67+dispatcher261code/316section. check_image_dispatch.py verifies all jump/
callee bindings,full table/strings,both referees,negative binding,file32-bit error/
success fixture. NEW328code bytes; loaders remain unmatched dependencies,file
243vs240DEFER. Read101d4afc/free101d4b00 labels corrected; header+28,byteversion.
Sharedswitch checker explicit REL32 callee extension replays oldslice/row green;
8prior/1141group bytes retained. Next actual formatter/caller and rest of image
group; no canonical/closure/independent/V4 claim.

Latest: BATCH_32_REVIEW.md. bitmap_loader overlay now actualBitmapF5A0 plus real
DXT/wavelet behind13-format dispatcher. Fresh baseline_jpeg_e3mllafh487vs527
DEFER; dispatcherraw344 vslegacy261 needs code/tableaudit. Eight established
matches/1141 preserved via group replay.32-bit test_image_bitmap_loader.c tests
real dispatcher->setup->creator->upload->row source with mock COM:BGR3->4 alphaFF,
16-byte temp alloc/free guards,pitched output,format1 noallocation. No newmatches.
Next dispatcher/TU audit now all3 loaders present; don't force ABI, no canonical/V4.

Latest: BATCH_31_REVIEW.md. dxt_loader overlay replaces DXT extern with actual
staticF7B0 source; fresh baseline_jpeg_fvsjzfck342vs331DEFER,uploads unchanged.
verify_image_family.py --run that run8/1141 retained.32-bit test_image_dxt_loader.c
passes real loader->setup->creator->upload->row source with mock COM:4 ordinary,
24cube mip-supported,6cube mip-disabled uploads and correct skipped-data advance.
No new match. Next realBitmapF5A0 BGR conversion/temp buffer and full caller group;
reference WASM/debug modifications excluded. No canonical/historical TU/V4 claim.

Latest: BATCH_30_REVIEW.md. private_upload makes2D/cube helper static only;
fresh baseline_jpeg_6t3n_63q453vs472DEFER,volume356vs348. Full-source32-bit
all-upload mocks pass. New verify_image_family.py replays8 already matched bodies
/1141code bytes with all switch bytes/bindings/creator strings,input identities;
defaultprivate run and --run baseline_jpeg_t8vfcrgk both8/1141,0 lost matches.
Run-local packet only; no new matches,fixture/whole-track regression/closure/V4
claim. Reuse this cheap replay for future actual TU changes; original packets kept.

Latest: BATCH_29_REVIEW.md. wavelet_all_upload adds real2D/cube LockRect/copy/
UnlockRect+logs/retry source on preserved row_step. Freshd157pax8 compiles484vs
actual472 (NOT legacy459); volume356vs348DEFER. PINNED EA20 finalRETebf7+8CC,
inventory omitted13-byte retry/return tail. test_image_all_upload.c32-bit passes
2D/all6faces,stdcall/retries/logs/padding and reused volume/memory/creator mocks.
Byte-mip volume experiment ocqsxcwv357vs348DEFER,not preferred. Next real shared
caller/TU scalar reconciliation; no new matches/canonical/V4. SDK local sufficient.

Latest: BATCH_28_REVIEW.md. New row_step overlay assigns rowStep in ordinary
format cases. Fresh baseline_jpeg_t8vfcrgk matches slice135 and rows226 code,
both complete switch sections187/274. check_image_slice.py reusable local-switch
checker proves all13 actualbindings/all97 table bytes/negative bindings/both
referees and volume+row32-bit fixtures. New361 .text bytes only; no tables/padding
credited. Volume356vs348 stillDEFER; next actual2D/cube upload then caller group.
Preserve prior matched creator/memory/helper/probe; no canonical/independent/V4.

Latest: BATCH_27_REVIEW.md. wavelet_volume_upload adds real volume EC00 caller,
SDK stdcall locks/12-byte LockedBox,logs/retries/slice copies. Fresh668lqodd
(baseline_jpeg_668lqodd) compiles356vs348DEFER; static slice187 full-section
original-referee100% discovery only (strict/table bindings pending),135code;
row270 raw vs226code need code/table audit.32-bit test_image_volume.c passes
retries,logs,strides,high-mip clamp plus memory/creator mocks. PINNED target has
NO retry=0 store despite misleading Ghidra decompile. Next slice/row tables
then real2D/cube upload. No new credited matches, no canonical/V4.

Latest: BATCH_26_REVIEW.md. Tracking pointer/do/switch probe baseline_m80op9h_
(full name baseline_jpeg_m80op9h_)175vs200DEFER. New wavelet_upload_helpers adds
real E840 source-slice/E900 memcpy rows. Fresh baseline_jpeg_qm8omcnn compiles,
227vs135/282vs226 raw sections DEFER (tables/context not yet audited).32-bit
test_image_upload_rows.c passes pitched/tight/DXT/guards and reused memory/COM
mocks. PINNED format16 slice3bytes vs row/card4bytes; do not unify. No new matches.
Next actual boundary/caller audit then EA20/EC00 SDK logs/retry uploads. Preserve
original passing packets; no canonical/V4 claim.

Latest: BATCH_25_REVIEW.md. scratch/wavelet_memory_clamps uses target subtraction
clamps; fresh baseline_jpeg_olyhxdy7 matches F020 full mip accounting135 bytes.
check_image_memory_chain.py verifies both referees,both calls to matched EF40,
negative wrong callee,135+9CC extent,complete dependency149+tables and32-bit
source-selected fixtures. New135 bytes only; EF40/creators not recounted.
Tracking179vs200 staysDEFER. check_image_memory_size.main(run) reused, default
old run preserved; root mip packet pins most recently checked explicit run.
Next tracker real loop/context then uploads/row-copy. No canonical/independent/V4.

Latest: BATCH_24_REVIEW.md. Memory-size EF40 already exact:149 code bytes plus
3 alignment+16 jump+51 format table bytes in219-byte COMDAT. Reused fresh
baseline_jpeg_v9fqhj84; check_image_memory_size.py proves strict complete code,
original full-section referee, every full-section byte after actual6 bindings,
negative bad table binding,32-bit fixture. New149 .text bytes REVIEWABLE, not67
table bytes. No source changes/rebuild necessary; generic length gate was wrong
for this mixed section. F020123vs135/CA70163vs200 stillDEFER. Next real context
and upload/row-copy, not retries of unchanged correct switch. NoV4 claim.

Latest: BATCH_23_REVIEW.md. New scratch/wavelet_memory_family adds real mip-size,
card-memory and tracking dependencies. Fresh baseline_jpeg_v9fqhj84 compiles;
zero new matches (219vs149,123vs135,163vs200); creator362 and alpha134 retained.
test_image_memory.c32-bit warning-clean passes mip/block/cube/category0..255
accounting and reuses creator COM mocks. PINNED F020's decompiler64-bit return
is bogus: EDX is live depth; real return is int. Full register/stack map in report.
Next audit EF40 switch code/data extent before tuning, then SDK upload/row-copy
source. Preserve prior accepted source/probe objects; no canonical/V4 claim.

Latest: BATCH_22_REVIEW.md supersedes the incorrect checkpoint21 3D usage claim.
Full stack trace proves FORMAT ([esp+1c] after12 saved-reg+4 description bytes).
scratch/wavelet_create_format fresh baseline_jpeg_4un7pbxe now matches all3
creators113+130+119=362 bytes (only130 new). check_image_create.py pins all13
bindings/full strings/boundaries, negative wrong binding and32-bit failure mocks.
Old create_family preserved but its3D usage diagnostic is wrong; do not promote.
Next tracker1000ca70/memory1000f020, uploadsEA20/EC00,rowcopyE900,slicesE840;
verify full register arguments and SDK locks before implementation. NoV4 claim.

Latest: BATCH_21_REVIEW.md. New scratch/wavelet_create_family contains real
stdcall SDK texture creation bodies; fresh baseline_jpeg_cgedw3d1 matches
2D113+cube119 bytes with both referees. check_image_create.py verifies all
bindings/full strings, rejects wrong device binding, runs32-bit success/failure
COM mocks. New232 bytes REVIEWABLE only; 3D130vs130 fails+95 dimension reload.
PINNED error-description100efe3c RET4 (stdcall), error100138c0 plainRET; image
category30/name32; 3D diagnostic prints usage not reference's format. Alpha134
retained/not recounted. Next tracker/upload real context and bounded 3D ordering
probe; no canonical/full-DLL/runtime/independent claim.

Latest: BATCH_20_REVIEW.md. New scratch/wavelet_setup_family adds target-backed
setup/semantic/clamp bodies;fresh baseline_jpeg_l9ul11wd compiles but zero new
matches. Clamp79vs79 fails bytes+9,Setup220vs246,Loader509vs537;alpha134 strict
retained, not duplicated. IMPORTANT target clamp uses MIN(width,height), unlike
modified reference MAX. test_image_setup.c32-bit passes nonsquare/DXT clamp,
semantic bounds,dim offsets,2D/volume/cube selection,usage and tracking mocks.
Next actual creator/tracker/upload+SDK ABI definitions, not tiny extern-context
variant grinding. Prefix incomplete; no canonical/independent/full-DLL claim.

Latest: BATCH_19_REVIEW.md. New scratch/wavelet_loader_family uses actual
target-backed mip/face/buffer/upload flow and13-case dispatcher, not WASM/GLM
broken body. Fresh baseline_jpeg_tz30ko5k compiles:loader507vs537, privateouter
1436vs1471; no new match. Alpha134 strict body retained, no duplicate credit.
test_image_wavelet_loader.c32-bit passes mip order,6-face allocation/reverse
free,cube-mip skip,volume selection,picmip cutoff. GPU/setup mocked, all tested
levels width1 so no compressed/Huffman proof. Prefix not complete GfxImage;
source upload interface SUPPORTED, historical mip type needs confirmation.
Next actual setup/upload definitions+COM signatures and dispatcher boundaries
inside caller group, not register wrappers. Prior link/helper/table proofs fixed.

Latest: BATCH_18_REVIEW.md. Helper replay now integrates saved compiled table
proof (shared verify_object/recheck_packet), no rebuild. Genuine partial
source DLL link_probe_wavelet__wtd6zwl passes. check_wavelet_link.py rechecks
linked134-byte helper/all4 actual symbol bindings and all49,152 data bytes.
Not retail layout, matched decoder, runtime or V4. Packet wavelet_link_checked.json.
PINNED loaderF380: ECX header,EAX bytes-per-pixel; stack image/data/D3Dformat.
Source Mac r_image_load_obj includes WASM new/copy/delete path absent from
Windows target, so do NOT bulk-use that body as historical/TU context. Full
caller/setup roles and exact instruction sites in BATCH_18. Next target-backed
loader/setup/upload family; preserve matched helper/table/probe objects.

Latest: BATCH_17_REVIEW.md. verify_wavelet_initializers.py builds genuine typed
WaveletHuffmanDecode arrays from reference constants (NOT retail extraction),
fresh baseline_wavelet_data_al1cp9w1:all49,152 compiled data bytes match. Packet
wavelet_initializer_packet.json pins sources/header/image/object/symbol ranges;
provenance acceptance and link ownership remain. Do not add data to .text.
Direct-state helper probe baseline_jpeg_2px9pg4r adds zero matches (decoder162,
target168); alpha134 still matches and fixtures pass. check_wavelet_delta.py
replayed green; integrate separate compiled table proof before flipping its
older compilation flag. Next real loader/refill/generic caller context, not
more type-only variants. JPEG85/29,608B and whole-DLL incompleteness unchanged.

Latest: BATCH_16_REVIEW.md. New proprietary wavelet alpha-delta candidate134B
from scratch/wavelet_delta_order fresh baseline_jpeg_1v2df6oy. Target extent
old120 omitted14-byte tail; actual RET10d35/padding to10d40 pinned. Reproduce
check_wavelet_delta.py: both checkers, all4 operand bindings, negative wrong
decoder address and32-bit synthetic delta/wrap/guards fixtures pass. Generic
decoder169vs168 and outer1459vs1471 remain DEFER; pinned callee destination
is NOT matched callee closure. JPEG85/29,608B unchanged. Preserve this source
and work separately on actual loader/refill/generic caller context, not wrappers.

Latest: BATCH_15_REVIEW.md. Four preserved wavelet helper/TU probes compile,
zero matches; all attempts/lengths and actual byte-refill evidence recorded.
Generic DecodeValue169 vs target168 is NOT a match; real image-loader and
separate alpha-delta helper context remain needed. Expanded32-bit synthetic
ordinary/escape Huffman tests pass. check_wavelet_tables.py proves all three
complete reference tables/49,152 DATA bytes at10182988/10186988/1018a988, no
endian swap required. wavelet_table_packet.json records hashes; not compiled
initializer, approved provenance or .text progress. Do not repeat those probes.

Latest execution: BATCH_14_REVIEW.md. Extra GLM engine TU omitted-tail probe19
comparisons finds zero; f380 drafts have uninitialized height, incorrect mip
condition and cube-face count plus omitted setup call. Preserve, do not integrate.
Separate scratch/wavelet_reference whole decoder source compiles fresh in
baseline_jpeg_ayessvg1, zero matches (target1471 vs obj1509, full boundary pinned).
Its REVIEW.md records exact helper/register/TU differences and types;32-bit
small-image fixture passes, explicitly no Huffman-table or compressed proof.
Next build target-backed generic refill/Huffman/alpha helpers with actual
image-loader caller context; no naked/register glue. JPEG85/29,608B unchanged.

Latest: BATCH_13_REVIEW.md. Batch omitted-tail discovery adds nine distinct
complete JPEG bodies/4,035B without recompilation, including fast DCT516 and
free_pool263. check_jpeg_boundaries.py now13 bodies/5,902B; integrated dependency
replay85 funcs/29,608B,42 callee sites,87 complete data sites,zero unresolved
direct relocs. Source natural-order320B at0x10191200 pinned and bound. Prior65,
both32-bit fixtures pass; transform fixture adds fast DCT zero/DC/ramp checks.
discover_jpeg_boundaries.py is discovery-only (10 rows include one duplicate);
never auto-count its candidates. Move to larger engine/TU and indirect/link
ownership work; no canonical/independent/V4 claim and full JPEG still unfinished.

Final BATCH_12 packet supersedes intermediate totals:76 funcs/25,573B,36 callee
sites,86 complete source-data sites,ZERO unresolved direct relocations. Actual
selected32-bit scan/BGR fixtures and prior65 regression pass. check_jpeg_dependencies.py
validates original BGR overlay plus scratch/jpeg_inline_bits and substitutes
fresh jcphuff baseline_jpeg_yd16dq0p (six/1,219B, all five prior retained). Its
__forceinline emit_buffered_bits yields target emit_eobrun183 while retaining
the separate45-byte helper. No assembly/retail bytes used; historical hint
spelling unproven. Indirect ABIs, independent review, full library and V4 remain.

Latest: BATCH_12_REVIEW.md. Dependency replay now integrates four audited full
boundaries (including initial_setup516, old510):75 funcs/25,390B,32 callee sites,
86 data sites,one unresolved emit_eobrun call.74 funcs/25,131B have no unresolved
direct sites. Both32-bit source fixtures and prior65 regression pass. Reproduce
check_jpeg_dependencies.py (32-bit fixtures need approved sandbox escalation).
emit_eobrun's actual difference is inlining emit_buffered_bits' loop, not its
Boolean type or extent. Keep jpeg_bgr authoritative; separate inline experiment
results and provenance recorded in its overlay. No DLL link/identity yet.

Newest: BATCH_11_REVIEW.md. check_jpeg_boundaries.py proves three omitted-tail
inventory corrections from existing fresh BGR objects: make_odither_array114,
select_ncolors234, update_box1003. Both checkers and source data bindings pass.
Supplemental jpeg_boundary_packet.json adds3/1,351B: combined74/24,874B distinct
JPEG candidates. The71-function dependency graph is unchanged; integrate these
explicit extents before reporting updated closure. Actual remaining helpers:
emit_eobrun and initial_setup. Four-TU /TP bool probe baseline_jpeg_75ziqfw7
retains23/5,662B but adds zero; do not repeat or replace authoritative jpeg_bgr.

Latest: BATCH_10_REVIEW.md. Target BGR configuration gives fresh
`baseline_jpeg_ux9623q1`:71 dual-checker functions/23,523B (all previous65 retained).
Repro `check_jpeg_dependencies.py`:26 callee-shape sites,83 complete data sites,
7 unresolved calls to5 helpers;65 functions/22,140B have no unresolved direct
relocs. Source/retail RGB priority table [1,2,0] checked at0x101911f0. Both actual
selected-overlay32-bit scan and BGR pixel fixtures pass. Packet saved at root
and run/dependency_packet.json. Preserve earlier overlays; no fresh full sweep
unless inputs change. Indirect ABIs/independent acceptance/V4 remain unfinished.

Newest: BATCH_9_REVIEW.md and `jpeg_dependency_packet.json`. Repro
`check_jpeg_dependencies.py`:65 dual-checker functions/21,167B, including fresh
per_scan_setup415 from same-TU jutils context (`baseline_jpeg_uztgv3j1`). Four old
jdinput bodies replaced, not double-counted.114 relocation sites:23 callee-shape,
83 complete source-data,8 unresolved helper calls.59 functions/19,868B have no
unresolved direct relocations; indirect ABIs/independent review still pending.
Eight remaining helpers and exact differences are listed in BATCH_9. Preserve
all older overlays/objects; the context TU must not also link standalone jutils.

Latest/highest yield: BATCH_8_REVIEW.md. Target JPEG callbacks at cinfo+24/+28
and byte-boolean virtual-array layout are documented in preserved scratch
overlays. Fresh corrected-layout JPEG run `baseline_jpeg_1k8utuqs`: 26 matches
/11,114B; earlier-range hashed object recheck `baseline_jpeg_7lz18xli` adds
42/10,976B. Combined68/22,090B, shape candidates only, not canonical progress.
`jpeg_allocator_packet.json` replays four matching allocation bodies844B with
all direct bindings/slop tables and 32-bit fixtures (GCC needs -malign-double).
Those four and the transform packet overlap the68: never double count them.
Authoritative full-range dual-checker replay: `baseline_jpeg_j88osvbx`,64/20,752B.
Four strict-only/1,338B cases fail the original referee's E9-ModRM masking bug;
BATCH_8 lists exact addresses. Fixtures reproduce it; do not count those four
as dual-checker passes or silently replace the track's approved referee.

Highest-yield latest work: BATCH_7_REVIEW.md. Fresh historical JPEG batch
`baseline_jpeg_27xofqtz`: 43 TUs compile, four strict matches/5,553 bytes.
`jpeg_transform_packet.json` rechecks float DCT4,405 and integer DCT814 with all
constant bindings, original referee, negative binding and 32-bit fixtures.
Replay `check_jpeg_transforms.py`, not the full sweep. Two allocator matches167B
each still need callee/source review. Fast DCT516 vs target507 is deferred.
Source/license provenance is recorded in BATCH_7; no library source copied to
canonical. Account these library bytes separately from the 16 engine candidates.

Newest: BATCH_6_REVIEW.md. World bounds69 now matches in fresh combined
`material_verify_e3jlgrpg` (14 functions/425B), plus delayed Begin/Issue183B gives
16 clean matching candidates/608B. `verify_material.py` includes the world fixture.
`baseline_n_t3on9j` fresh-built 36 extra GLM TUs/82 comparisons, zero matches;
reuse its objects for near-miss analysis. Delayed End seven compiler variants
all deferred in `material_verify_delayed_8pk6tt61`; no need to repeat that probe.

Latest engine addition: BATCH_5_REVIEW.md and `verify_delayed.py` cover the delayed
drawing family. Begin92 + Issue91 match, End107 remains DEFER against object97.
Packet `material_verify_delayed_lv4p1bcv/packet.json` includes original referee,
strict bindings, negative wrong-global test and 32-bit C89 host fixtures. Combined
clean candidate totals are 15 matching functions /539 bytes; no independent
acceptance. Do not count the End draft or silently repair original crash paths.

1. Independently review the thirteen clean candidates; expand genuinely related renderer
   source families from the recovery snapshot, pin their extern bindings/signatures
   and correct names using the Mac naming/type oracle. Do not redo the completed
   79-function compilation unless inputs/toolchain/checker change.
2. Tackle larger dependency/TU clusters, not just trivial accessor counts. Rank by
   recoverable bytes, verified callees/types and integration usefulness.
3. Review external bindings/data for the two resolved CRT blocks. Do not re-derive
   their documented boundaries or chase the nonexistent _strcats mismatch.
   Seven previously excluded C rows were false positives from comments mentioning
   assembly; six now match in baseline_pn934zlj, __crtExitProcess remains deferred.
   Genuine SDK assembly is accounted separately in BATCH_4_REVIEW.
4. Audit DLL link requirements early: original section/data/import/export/relocation
   layout and linker settings. Use a clearly separate source-built link probe;
   matching .text shapes alone cannot establish whole-file SHA identity.
5. Promote into the release monorepo only after owner approval and independent
   fresh proof. Preserve Claude's client work and GLM's modified manifest.

Toolchain: pinned container image
`sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694`.
Local DirectX headers and x86 import-library linking pass with MSVC 7.1/linker
7.10.3077 (link_probe_gopi_uz_). Historical SDK provenance and runtime remain
unverified. No SDK installation was performed.

## Do not repeat past mistakes

No retail-byte wrappers, stale-object credit, unrestricted prefix matching,
invented extern signatures, ABI changes for a counter, or bulk canonical imports.
Legacy matcher paths are redirected only in memory. All reconstruction changes
stay in Codex's workspace. Generated objects/run folders are ignored, not release
artifacts. Preserve per-source flags, full TU context, dependency hashes and
explicit symbol bindings. CRT/source/engine accounting must remain separate.
