# Transform scheduling draft checkpoint — 2026-10-03

Status: **UNMATCHED / zero source credit**. This is readable target-backed C++
in an isolated scratch directory, not a clean accepted source module. Neither
body has passed V2, V3 or integrated CPU checks. The probe is discovery only.

Targets: Bubble100cbd29/1170 (SDK member91 section14) and
ReverseInsts100cbb1b/74 (section7), in gfx_d3d_mp_x86_s.dll1.0. SDK Summer2004
d3dx9.lib SHA256:
3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88.
Declarations reuse the previously proven transform prefix; names of opaque
fields are descriptive, not recovered historical header provenance.

## Actual latest replay

The compiler session87583 completed exit0. The following probe also completed
exit0, which means the diagnostic ran, NOT that its bodies matched:

    cd /home/nawaf/cod2/test/dev/gfx/target
    python3 scratch/codex35_transform_bubble/probe.py bubble.obj bubble.cpp

- Bubble: emitted body1157, target1170, first difference7, full equality false.
- ReverseInsts: emitted body73, target74, first difference18, full equality false.
- These numbers are body sizes, NOT a count of matched bytes or coverage.
- Source SHA256 ef7b6c95203483ebe039c94f8f3509fd0fc6c87dab9db408a8ae00e15115d5cd.
- Object SHA25683f071dfaf0b962c34999ff8a5dc0da9db2130aa45f401f1ab6103ef02313b70.
- probe_bubble.json SHA256b98d6b67cd3f36cb0cdc432704ac6b75233f9eeabdeb0863ceec61d644e9881b.
- baseline_1157.cpp SHA2562e8e3784b82df52866365cad8c476f7cec96c849e457ca7e0e37a4aed3477510.

Rebuild from gfx/, using the existing pinned compiler and SDK read-only mount:

    docker run --rm --network none -v /home/nawaf/cod2/test/dev/gfx/target:/work -v /home/nawaf/cod2/test/dev/sdk/sum2004:/dxsdk:ro -w /work sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 sh scratch/codex35_transform_bubble/compile.sh

Flags: /O1 /Oy- /hotpatch /MT /Gy /d2QIftol. Existing frozen full-section
probe is reused, hash-pinned, with source/object freshness checked. Do not
commit obj/, a DLL, the retail anchor or any SDK binary.

## PINNED target facts and corrected source mistakes

- Bubble is a thiscall method returning long, with one unsigned argument,
  ret4. Success returns0; no improvement/restoration returns1. No allocator
  call occurs in this body. Do not infer an allocation-failure branch here.
- Candidate range end is scan+1, without incrementing the persistent scan
  cursor. The initial draft accidentally used ++scan; it was corrected.
- CArgument offset54 is the temporary flag (prefix label firstRead), NOT
  lastRead at58. Both the setup and candidate tests now use54. Offset74 is
  the reference-instruction DWORD, represented by opaque60[5].
- Initial marker setup visits arguments[j] for j<readSize, NOT arguments
  indexed by the cluster read buffer. Preserve this observed target behavior;
  reconstruction is not permission to change the algorithm.
- Marker generation is CT offset48, argument marker30, instruction marker24.
  Candidate/cluster read buffers are CT opaque18/14; ordinary read metadata
  remains readCounts8, readStartsc and readArguments10.
- Predicate ancestry uses relative2 at14 and signed link at18. Candidate
  chain traversal stops at the cluster predicate or the unsigned sentinel.
- A blocked expansion continues at choose_direction, NOT restart: it must
  preserve the current marker generation and accumulated load delta.
- After the three range reversals, total-load and peak-load improvement tests
  decide success. Unsuccessful movement shifts the cluster and restarts. The
  rollback copies savedOrder40 to order3c and recalculates only if changed.
- Target Bubble stack allocation is0x54; the1157-byte draft uses0x4c. Stack
  lifetime/register/control-flow differences are unresolved. This is NOT
  evidence that matching source is impossible or that ABI changes are allowed.

## Attempts actually observed — no accepted bytes

1. Initial Bubble1160/1170, difference7; Reverse70/74, difference19.
2. Correct scan cursor: Bubble1161/1170, difference7.
3. Correct offset54 and positive flow-flag guarded body: Bubble1157/1170,
   difference7. Target loop instruction ordering improves, but no full match.
4. Delta declared at function top and explicit union-bound if/else: same1157.
5. Cached initial program pointer and reused step for post-move shift: same1157.
6. Latest function-scope locals instead of inner declarations: same1157. Its
   immediately preceding source is retained as baseline_1157.cpp. Earlier
   overwritten revisions do not have retained source-hash snapshots here.
7. Reverse initially decrements end in its indexed swap:70/74. Moving end
   decrement before the counted loop produces current73/74, difference18.
   Older independent-last-index74 forms differ24; read the frozen
   codex35_transform_order REPORT before repeating historical attempts.

Next bounded source experiment: guard the Reverse positive swap count before
decrementing end, then preserve the counted loop. This is a HYPOTHESIS, not yet
tested. For Bubble, compare exact local lifetimes and the guarded program/
instruction loads against the target before changing source. Do not add
padding, emit bytes, change layouts or relax full-body/binding gates.

## Aggregate and handoff

Confirmed accepted total remains344530/1089680 =31.617539%. The public-order
cohort962 has local complete proofs but is not aggregate-credited. Its only
live aggregate process328542/session88253 uses
../codex35_program_order/aggregate.log and remains running at this save. Only
terminal PASS permits345492/1089680 =31.705822%. Leave accepted inputs frozen.
The35% target and whole-file identity remain unfinished.

## Superseding checkpoint — 2026-10-03

The above replay/hashes describe the previous committed save, not current
source. Candidate-read marker now correctly compares candidate index, NOT the
original reference, to argument74. Corrected Bubble emits1160/1170, first
difference7, frame0x50 versus target0x54. Structured outer/inner loops and
split instruction/output locals still give1160. baseline_1160.cpp preserves
the preceding corrected source. Current Reverse emits74/74, difference24;
guarded do/while and countdown/index lifetime variants remain unaccepted.

Actual /G5,/G6,/G7 builds and probes complete successfully; all retain
Bubble1160/difference7 and Reverse74/difference24. The three separate
probe_bubble_G*.json packets and compile_cpus.sh record this attempted sweep.
Those historical packets pin source3d251e8b688648b7352669945079d10531506487c8b0d11ec8bc4aeae6c767e4,
not the current source; that exact intermediate source is not retained.
The current default probe pins source57267d3e7b870ca769161e4676c64420eb49b210813b41dcbfcb549628c44934.
Do not repeat it or treat equal lengths as proof. All source here stays
scratch-only, with zero credit and no V2/V3/CPU acceptance.

Public-order aggregate has since completed terminal PASS/exit0. Confirmed
total is345492/1089680 =31.705822%; no aggregate is live at this checkpoint.
Read ../codex35_register_pool/REPORT.md and ../codex35_pool_helpers/REPORT.md
for the next source group and honest local-gate failure.35% remains unfinished.
