# MarkVarying source-lifetime experiments — 2026-10-02

Unaccepted scratch only; no additional source coverage or clean-file edits.
Compiler/flags are inherited from the pinned program-flow build. compile.sh
builds four FLOW_POINTER_SCOPE alternatives and an explicit-token-local form.

Scope0/1 produce606/614; scope2 produces612/614 with a prologue mismatch.
Scope3's indexed per-component access produces609/614 with matching prologue.
FLOW_TOKEN_LOCAL=1 still produces609/614, first difference+88. The current
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
