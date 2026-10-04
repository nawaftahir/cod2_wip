# Unary/swizzle reconstruction continuation — 2026-10-04

Status: complete source drafts, all UNMATCHED; ZERO accepted bytes.
No new V2, V3, CPU or whole-DLL identity claim. Existing accepted source and
the353882-byte aggregate remain unchanged.

References are full target decompiles plus literal summer-2004 SDK COFF bodies:
SimplifyUnary1841 at1008d966, member90/section183;
PropagateSwizzles_Unswizzle755 at10089055;
CompactRegisters922 at10098c39. Headers reuse the existing target-backed
program/argument/instruction prefixes, not speculative allocation layouts.

Compiler:4035 in pinned image
sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131;
SDK mounted read-only. Flags /O1 /Oy- /hotpatch /MT /Gy /d2QIftol.
Fresh compile handles all terminated exit0. Diagnostic probe_*.json reuse
codex30_constants/probe.py, SHA
95d68413ad4582c5da798955cff7b5f18484aceaed538972efb4544f4529f0dc.
The packets record current source/object hashes and DISCOVERY ONLY status.
Objects remain local, uncommitted. Literal lengths do not count as coverage.

## Actual new source and bounded attempts

- unary.cpp reconstructs the entire unary optimizer: flag propagation,
  constant math/folding and domain errors, producer-chain simplification,
  reciprocal/exp simplification through multiplication, and final remapping.
  Initial1741/1841 became1737/1841 after preserving the cached low flag bits,
  literal float comparison orientation and correct constant-pool operand.
  Current first difference7; frame14h rather than24h, registers/control-flow
  and encoded branches still differ. No partial-match credit.
- unary_remap.cpp normalizes the incoming argument ID in place and obtains
  the output pointer first. Still1737/1841, firstdiff7. Do not repeat.
- registers_cleanup.cpp reuses the existing complete CompactRegisters draft
  with one genuine shared cleanup path.929/922 firstdiff36. Unsigned retained
  count in registers_unsigned.cpp gives the same outcome.
- registers_group.cpp tests the original compaction draft with actual
  RemapArguments224, CompactArguments249 and CompactPool_End161 bodies in
  the same TU. The retained dtor32 and these callee bodies reproduce complete
  masked bytes but are already accepted elsewhere, so get ZERO extra credit.
  CompactRegisters remains933/922 firstdiff36. This real caller/callee test
  does not prove matching is impossible; it rules out that specific grouping.
- unswizzle.cpp reconstructs the full alias-ring search, ancestor validation,
  distance scoring, best-vector selection and copy-instruction fallback.
  An initial redundant validation form853/755 was removed; the retained
  direct found-component control flow is757/755 firstdiff7, frame44h vs3ch.
- unswizzle_control.cpp uses target comparison orientation, link-before-
  relative capture and early success-copy handling.756/755 firstdiff7,
  frame40h vs3ch; remaining register/stack/branch differences are genuine.
  Equal or nearly equal length does not establish matching bindings or bytes.

## PINNED facts worth keeping

SimplifyUnary AddArgument loads the constant-pool ID from this+78h. In this
verified access prefix that is poolIds[1], NOT poolIds[0] at74h. The initial
draft operand was corrected before any acceptance request. Original Error
sites push instruction->node(+3ch), program this and exact code/string pairs:
4002/indefinite logarithm,4003/imaginary square root,
4005/indefinite arcsine,4006/indefinite arccosine. Return values are ignored.

The unswizzle helper treats argument+34h (named origin in the reused prefix)
as the next link of its alias ring. It compares writer index against insertion
index and intentionally skips score contribution when writer==0, not~0u.
Fallback uses AddInstruction(identity token,~0u,~0u), Instance(original),
AddArgument(pool ID at88h,register counter,component,0.0), preserves parent
link/relative fields, splices the alias ring, then moves the new instruction.
Do not silently add bounds guards or repair these literal behaviors here.

Next useful action: inspect complete remaining register/CFG differences, not
another broad random flag sweep. These are source-backed drafts suitable for
continuation, not clean/canonical source or reconstructed historical TU proof.

## Pool-type experiment and SDK shortcut checks

PINNED SDK CPool::Initialize at100cb92a has the signature
?Initialize@CPool@D3DXShader@@QAEJPBDKII@Z: name is const char*, flags is
unsigned long. Its target-backed prefix stores them at0 and4 respectively.
unary_pool.cpp and unswizzle_pool.cpp change only those two declarations in
the preceding complete drafts. Fresh pinned-image compiles exited0; current
probe_unary_pool.json and probe_unswizzle_pool.json record source/object
hashes. Unary remains1737/1841 and unswizzle756/755, first difference7.
No gain; do not repeat this exact correction as a matching experiment.
This does not prove CArgument::flags has the same type; do not change it
without independent target/type evidence. No clean source promotion.

PINNED summer-2004 d3dx9.lib carries348 .debug$S sections,1683 .debug$F and
21 .debug$T. Core shader members57,73,74,90 retain only small .debug$S build
records (160,158,155,157 bytes) and no .debug$T. The available type sections
are members210..224 and226..231; they do not provide the private shader
class type oracle sought here. Build-record presence is not source/flag proof.

Members210..223 contain Microsoft-prefixed zlib components. The current
codex35_sdk/discovery.json has ZERO retail placements for those members.
Eight exact version/error strings were also absent from the retail anchor:
1.1.3,1.1.4,1.2.1,deflate 1.,inflate 1.,incorrect header check,
invalid distance too far back,unknown compression method.
This is bounded evidence, not proof that every possible zlib implementation
is absent. Do not count unlinked archive code or mass-build zlib without new
target-backed placement/version evidence. Authentic CRT mass-build attempts
already exist in codex35_crt/REPORT.md; do not repeat them blindly either.

At the owner's checkpoint, all36 reviewed cohort pins/states, the complete
proof environment, audit hash and both new draft source/object hashes were
rechecked current. Accepted total remains353882/32.475773%; ZERO new bytes.
No fresh CPU/aggregate run was needed or claimed for these unmatched drafts.

## Continuation after db9a4ca: bounded byte-difference tests

All builds use the same pinned4035 image and base flags recorded above.
Fresh compiler batches18580,13070,84590 completed exit0. Hash-recorded
probe_*.json files are DISCOVERY ONLY, not V2 or source acceptance.

| Ordinary source experiment | Emitted / target | First difference |
|---|---:|---:|
| registers_inline_cleanup: error label inside first real failure block | 929 / 922 | 36 |
| registers_inline_order: obtain destination pointer before source ID | 934 / 922 | 5 |
| registers_inline_group: same cleanup with three actual callees | 927 / 922 | 36 |
| registers_inline_group_order: grouped plus pointer-load order | 932 / 922 | 5 |
| registers_uint_loop: unsigned loop index instead of unsigned long | 933 / 922 | 36 |
| registers_long_count: long retained count and unsigned loop index | 933 / 922 | 36 |
| registers_postincrement: increment retained count in input assignment | 933 / 922 | 36 |
| unswizzle_score: repeated target writer expression, inserted > at | 759 / 755 | 7 |
| unswizzle_parent: capture inner target parent before ancestry walk | 754 / 755 | 7 |
| unswizzle_alloc_failure: real shared allocation-failure return | 759 / 755 | 7 |

The grouped duplicate callee matches remain224,249,161 and dtor32; all were
already accepted elsewhere and receive ZERO new credit. Near-equal lengths
still differ in stack storage, register scheduling and branch encodings.

CompactPool_Process was freshly rebuilt directly from the unchanged complete
codex32_program_allocation/process.cpp with four extra flag tests. /G5 and
/G6 retain1715/1715 firstdiff1191; /G7 retains1715 but firstdiff851; /Og-
grows to3070/1715 firstdiff5. The two original SIB differences are not solved.
Packets probe_process_g5/g6/g7/ogoff.json record original source and each new
object hash; source_credit is0. No opaque source dependency was credited.
Do not repeat these exact forms/flag tests; they do not establish impossibility.

## Complete shader math source — checkpoint after db9a4ca

New ordinary C++ implements complete target scopes EmitSinCos2210 at1006edd4,
EmitPow1068 at100707c3 and EmitATan2/ATan2086 at1006fbf4:5364 candidate bytes.
Names/signatures, calls, constants and access prefixes were checked against
the target and summer-2004 SDK73. Read-only Ghidra exports are research inputs
under decomp/, never accepted source. No glm _emit transplant was used.
All new math drafts have ZERO byte-accurate source credit.

math.cpp/math.h are the frozen three-method behavioral baseline. The earlier
trig_ordered.cpp/trig.h are a separate frozen SinCos baseline. Existing accepted
CNode definitions are included by the declaration-only path. These headers are
verified access prefixes, NOT proof of complete compiler allocation layout.

| Fresh source experiment | Emitted / target | First difference |
|---|---:|---:|
| trig.cpp initial full SinCos | 2216 / 2210 | 27 |
| trig_ordered.cpp: target init/comparison/local ordering | 2216 / 2210 | 110 |
| trig_ordered_group: genuine EmitTemp28 in same TU | 2222 / 2210 | 110 |
| trig_tokens / grouped: explicit opcode locals | 2218 / 2210;2225 / 2210 | 28 |
| trig_fields / grouped: opcode bit fields | 2218 / 2210;2224 / 2210 | 26 |
| trig_counters, temp_after, long_total, long_initializer, int_initializer | 2216 / 2210 | 110 |
| grouped counters, temp_after, int_initializer | 2222 / 2210 | 110 |
| trig_post_initializer / grouped | 2217 / 2210;2223 / 2210 | 110 |
| math.cpp full Pow | 1081 / 1068 | 7 |
| math_group full Pow | 1080 / 1068 | 7 |
| math.cpp full ATan2 | 2097 / 2086 | 29 |
| math_group full ATan2 | 2090 / 2086 | 29 |
| math_delayed: native branch and opcode construction at first use | 2090 / 2086 | 68 |
| math_delayed_group ATan2 | 2083 / 2086 | 68 |
| math_power_scope / grouped Pow | 1073 / 1068;1072 / 1068 | 7 |

/Zc:forScope on grouped counters leaves2222/2210 first110. /Zc:forScope-
produced D4002 for unknown /Zc:-, so it did NOT test a supported disabled
for-scope setting. Duplicate EmitTemp28 is already accepted; zero new credit.
Probe packets are fresh-object diagnostic comparisons, not full V2 gates;
wrapper packets alone do not pin all included sources. Do not promote them.

PINNED math facts:

- SinCos uses pi3.1415927410125732 and period6.2831854820251465, target
  single-precision values promoted to double. Its reciprocal-period constant
  is0.15915493866300567 (IEEE3fc45f306446f9b4), not the mathematical reciprocal.
  Native flags200 use opcodes108/109; uniform flags100 use5034 with paired
  cosine/sine slots. Software uses27 temp arrays,15 initialized,16 emits.
- Pow checks all-base-zero/all-base-one before exponent handling; preserve
  these original shortcuts. Integer exponentiation, +/-0.5 and general
  LOG/MUL/EXP paths are present. EvalValue returns32-bit long, not the raw
  decompiler's uint64/out-EDX artifact. Baseline unsigned absolute-power
  arithmetic preserves the target wrapping bit path. The newer abs-intrinsic
  scope variant has the C INT_MIN ceiling; do not treat it as accepted proof.
- ATan2 handles null x as atan. Native paths use206 and10c. Software retains
  all48 temporary slots/39 initializations and39 instruction emissions,
  including unused23..25 slots. Last EmitInst flags are0, confirmed at the
  actual SDK tail; do not invent a missing argument from decompiled text.
- CCompiler one/zero index accesses are+20/+24, flags+14. Program accesses
  are flags+6c, cost+64 and constant label+78. These are target-backed access
  prefixes, not inferred full class size or newly reconstructed historical TU.

### Fresh behavioral fixtures and limitations

sincos_fixture_packet.json: PASS1284 cases, zero complete-output differences,
954 successful compiles and330 errors per executable. Link maps bind the
source method to trig_ordered.obj, not an SDK fallback.

math_fixture_packet.json: PASS1816 cases, zero complete-output differences,
1366 successful compiles and450 errors per executable. Includes pow variants,
atan/atan2, scalar/vector/paired SinCos and large angles. Link maps bind ALL
three methods to math.obj; the selector removes exactly those three SDK
definitions, leaving other SDK methods opaque and uncredited.

Both compare HRESULT, shader bytes, errors and constant-table output, with
two shader profiles and optimization on/off. Input mutation/freshness and
symbol-owner gates are enabled. At this checkpoint independent posthash
passed all24 identities in EACH packet. These runs are CPU-only, not GPU,
allocation-failure, exhaustive private-state, byte-match or whole-file proof.
New delayed/scoped/grouped variants have NOT had these CPU fixtures run.

Replay after freshly compiling the pinned baseline object:

```sh
python3 target/scratch/codex35_unary/select_math_dependencies.py
docker run --rm --network none \
  -v /home/nawaf/cod2/test/dev/gfx/target:/work \
  -v /home/nawaf/cod2/test/dev/sdk/sum2004:/dxsdk:ro -w /work \
  sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 \
  sh scratch/codex35_unary/compile_math_fixture.sh
python3 target/scratch/codex35_unary/run_math_fixture.py
```

Use the same commands with select_trig_dependencies.py, compile_trig_fixture.sh
and run_trig_fixture.py for the frozen standalone trig_ordered.obj baseline.
Source compile uses4035 in image17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131,
/O1 /Oy- /hotpatch /MT /Gy /d2QIftol; do not reuse stale objects after edits.

Next bounded work: SinCos's temp-init loop counter storage and first multiply
token construction; ATan2 delayed-group coefficient-local placement and
constant-fill loop storage. First differences can be branch displacements
caused by later length changes, not necessarily the originating mismatch.
Pow still differs in stack/register allocation, not merely its four-byte size
gap. Do not pad or break ABI to force counts. All original/fresh attempts stay
available to avoid re-running identical forms.

New fixture .py/.sh files changed the reviewed proof-tool closure. Old cache
load rejects as intended; no stale reseal or fresh aggregate claim was made.
After a genuine V2 gain, complete local gates and a reviewed cold aggregate
before updating that snapshot. Current accepted coverage remains353882/
1089680=32.475773%,27506 bytes short of35%. No live jobs at checkpoint.
