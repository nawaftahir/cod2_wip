# Checkpoint46 — throughput adjustment and shared referee investigation

2026-09-27. User requests larger divided worker assignments and faster progress.
`DEEPSEEK_CAMPAIGN_4.md` provides one bounded four-stage external campaign:
conversion(A), actual math dependencies(B), generator/callback reconciliation(C),
lightmap procedural helper(D). One combined return packet; blocked stages DEFER
without consuming the entire campaign. No workers share the same source TU.
This replaces isolated mission3 routing if not yet started; otherwise stageA
uses its completed evidence and proceeds without repeating it.

## Concrete separate work

Renderer_SubmitFrame10020d50's complete111-byte source already matches strict
checks and target-backed bindings, but originalreferee returns96 because its
raw scan condition `while i < size - 5` omits the FINAL5-byte E9 instruction.
Target tail displacement at+107 is81 02 00 00; object relocation placeholder
differs. Actual bound callee is10021040. No source body defect is demonstrated.

`python3 codex/renderer/referee_branch_probe.py` tests an instruction-aware
in-memory adapter using existing decoded-branch helper (no GLM edits):

| Function | Original | Proposed diagnostic |
|---|---:|---:|
| Submit10020d50 |96|100|
| EndFrame10021f90 |100|100|
| EndDebugFrame10022040 |100|100|
| BeginDebugFrame10021ff0 |100|100|

Synthetic tests include finaljump detection, avoiding opcode bytes inside mov
immediates, rejection of a changed unmasked byte, and PE absolute-field offsets.
Existing strict binding check remains essential: masking alone proves no binding.
Adapter rejects incomplete instruction decoding; mixed code/data sections need
explicit audited handling, not blindly applying it to all legacy inventory.

**DIAGNOSTIC ONLY**: no referee replacement or new111-byte credit. Independent
harness review and broader positive/negative regression are required before
changing any track's acceptance gate. The shared defect should be fixed once
and tested across affected functions, rather than source variants chasing a
comparison bug. No new compiler runs or infrastructure were needed.

Next: independent adapter review/expanded regression, separate submit behavior
fixture/AdvanceFrame dependency, and external campaign packet when returned.
Claims of relative speed versus Claude are not measured; do not promise a
completion date or inflate progress because the user understandably wants speed.
