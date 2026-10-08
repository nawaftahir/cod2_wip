# MarkVarying source-lifetime experiments — 2026-10-02

Historical scratch experiments; newer strict clean integrations are described
below. A diagnostic section match alone still awards no source credit.
Compiler/flags are inherited from the pinned program-flow build. compile.sh
builds four FLOW_POINTER_SCOPE alternatives and an explicit-token-local form.

Scope0/1 produce606/614; scope2 produces612/614 with a prologue mismatch.
Scope3's indexed per-component access produces609/614 with matching prologue.
FLOW_TOKEN_LOCAL=1 produced609/614, first difference+88. That revision's
source hash is recorded in probe_flow_token.json; earlier scope probes predate
the added token-local conditional and are historical diagnostics, not fresh
proof for the updated source file. All probes award zero credit.

PINNED from full SDK/source disassembly: the five missing bytes correspond to
five masked-opcode comparisons using EAX's five-byte immediate encoding rather
than the SDK's six-byte ECX encoding. Later branch offsets consequently differ.
The non-per-component input-pointer load also precedes the zero-input branch
in the source but follows it in the SDK. This is evidence for further bounded
source lifetime/guard experiments, not evidence that source matching is
impossible. No padding, volatile workaround or ABI change is warranted.

The parent ten-method flow draft has a separate1284-case full-output CPU proof.
Do not borrow that result for these modified MarkVarying alternatives: they
have discovery diagnostics only, no independent CPU or accepted byte proof.
On resumption, verify fresh source/object hashes before comparing candidates.

## New solved source groups

compile_opcode.sh/compile_helper.sh tested actual opcode expression, input-index
and helper control-flow forms. Direct token-mask expressions correct the five
EAX/ECX encoding differences; indexed inputs put the pointer load after the
empty-input guard. MarkVarying614 matches. Helper form9 (initial invalid-index
return, then recursive relative traversal) reproduces IsVarying59, including
the target's common return epilogue. Moving MarkVarying alone to a TU produced
603; compiling the two actual matched definitions together restores614.
The separate clean varying module now passes V2, V3/577 retaining575,1284 full
CPU comparisons and aggregate PASS. These673 bytes are genuinely accepted.

compile_strip.sh tested ordinary output counting, guarded/do-loop alternatives
and a source union representing the target's low20 token-count field. The
unguarded ordinary for-loop and indexed compaction reproduce StripUniform408.
Its separate clean module passes V2, V3/578 retaining577 and1284 CPU outputs;
aggregate acceptance is pending. StripVarying519/529 remains unmatched.

The redundant dead-code empty-instruction guard was removed after target
control-flow verification: source1191 versus target1202 remains unmatched.
Explicit-reference early return did not fix its helper's94-byte register swap.
compile_reference.sh tested the independently pinned Origin33 helper
(10086c88) and conditional-expression contexts. /Ob1 and /Ob2 leave an actual
call, producing Reference85/94 and RemoveDeadCode1178/1202. Explicit forceinline
restores94/94 and1191/1202 but neither matches; it is not an accepted solution.
Explicit reference-tail while-loop forms also remain94/94 with register gaps.

compile_varying.sh solved StripVarying529 with repeated arguments[index]
accesses in the relative-chain traversal. Both input-buffer forms then match;
the cached next-pointer forms remain519/529. The new clean strip cohort also
includes the independently pinned three27-byte getters and Origin33, totaling
643 bytes. V2, private V3/583 retaining578 and1284 integrated CPU outputs pass;
aggregate acceptance is pending. Scratch section matches alone never count.

compile_dead.sh batches real reverse-loop bounds, output-pointer guard/lifetime,
indexed destination compaction and pool-flag short-circuit expressions.
Eight variants remain1189..1198/1202, unmatched; no credit or impossibility
claim. These candidates have no fresh behavior proof. Read their recorded
source/object hashes before repeating any unchanged experiment.

Every old diagnostic object/probe corresponds to the source revision at its
build, not automatically the current mutable flow.cpp. probe_pruning_0/1 were
generated after a subsequent source edit and have unproven source-revision
association; do not use their recorded source hash as compilation provenance.
Fresh strict integration packets, not these diagnostics, establish coverage.
