# Instruction ordering reconstruction — 2026-10-03

Clean source: ../../src/codex_shader_instruction_order/order.cpp.
SDK member90 sections6/99/100/101, retail respectively:
CompareDependency100865e0/59; MarkParents100896fc/78;
ComputeDependency1008974a/128; recursive ReorderInstructions100897ca/395.
Total660 complete instruction bytes; no table or dependency credit.

MarkParents78 matched the first real four-definition source build.
CompareDependency59 initially differed at32: the signed-score else-if chain
and reversed unsigned tie-comparison expression reproduce its entire body.
ComputeDependency128 initially differed at56: compare tag against the observed
field, not the reversed operand expression. ReorderInstructions392/395 became
exact395 by keeping its parent-index pointer and score initialization scoped
before the callee's marked count. No padding, ABI or invented historical-TU claim.

Clean V2 proves full source/SDK/retail equality, typed bindings, decoded bounds
and negative tests. Legacy raw self-call scores94/97 are retained for MarkParents
and ReorderInstructions; decoded relocation normalization100 and complete typed
proofs pass. Literal self-call targets still must bind to the correct function.
Private selector checks240 source definitions /260 removed original entries.
SDK-private CompareDependency is externally rebound only after literal59-byte
equality, both exact bounds, zero relocations and storage-class proof. No
unreviewed private callback or ABI is accepted.

Private V3 passes603 matches retaining all599. Actual fresh original/source CPU
fixtures pass1284 full outputs:954 successful compiles and330 diagnostic cases
per profile. All recorded input hashes are current. These public API cases do
not establish every internal branch or allocation-failure behavior. Full
aggregate credit and whole-DLL/GPU certification remain unclaimed.
