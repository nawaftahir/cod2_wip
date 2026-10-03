# Vectorization helper reconstruction — 2026-10-03

Scratch helpers.cpp is a genuine four-function C++ TU, SDK member90
sections74/88/90/94. Initial SimplifyPredicates_IsEqual257/273 became275/273
after indexed input-stride expressions. Scoped shared return labels and a
single Boolean return did not match. IsConflicting155/165 became173/165 after
a pointer guard, then162/165 with a guarded counted do-loop and input locals.
Both stay scratch-only; equal size or plausible semantics do not count.

IsSameRegister117 matches; UpdateLinks initially229/229 differed at12.
Keeping the full instruction token in a local across the high12-bit guard,
then masking low20 bits, reproduces the entire229-byte body. No padding or ABI
change. Observed instruction24/28 remain opaque DWORD accesses.

Clean ../../src/codex_shader_vectorize_helpers/helpers.cpp contains only the
two completely matched definitions,346 instruction bytes. Fresh V2 checks
source/SDK/retail, exact boundaries, typed bindings and negatives. Private
V3 passes597 matches, retaining all595. Actual CPU fixtures pass1284 complete
shader/error/constant-table outputs (954 successful compiles and330 diagnostics
per profile). Input hashes were checked current. Aggregate inclusion pending.

The older combined aggregate process118170 disappeared without a PASS log;
no bytes were credited from it. A fresh combined replay now includes all3337
locally proven bytes above the last confirmed total337130. Expected340467 is
not accepted unless its actual terminal PASS proves disjoint coverage.
