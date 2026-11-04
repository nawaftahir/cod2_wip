# Shader naming and diagnostics — 2026-10-03

Clean source: ../../src/codex_shader_program_diagnostics/diagnostics.cpp.
Four complete methods/506 bytes: SetName10086b14/106,
GetArgumentName1008b023/146, Error1008b0b5/133, Warning1008b13a/121.
No Vectorize or standalone helper draft is in the clean file.

Fresh V2 build session35419 ended PASS/exit0: exact complete source/SDK/retail
boundaries, typed callee/string/storage bindings, both referees and negative
tests pass. Original CRT snprintf87/vsnprintf86 are pinned dependency bodies
with SDK typed caller edges, whole-body identity and zero source credit.
Fresh V3 session90578 ended PASS/exit0:632 private linked source matches,
all628 preceding matches retained. The image links without/FORCE. Selector
removes269 distinct/289 physical source definitions; dependencies uncredited.
Fresh CPU session2219 ended PASS/exit0:1284 full-output original/source cases,
zero differences,954 successful compiles and330 diagnostics per side.
All three packet input sets independently rehashed current.

Historical draft SetName100/106 lacked the target's intrinsic strlen; explicit
intrinsic gives the exact106-byte body. The clean diagnostic-token access
is written directly in both methods: a source helper also emitted an extra
39-byte standalone body and was rejected by the exact four-definition gate.
An initial CRT edge-count assertion was corrected from four to the actual
three snprintf call sites. Every affected gate was freshly rerun afterward.

PINNED behavior: node kinds3/6/13 choose diagnostic tokens at10, through14
then10, or30; zero/null falls back to a null token. Error also setsD4=1.
SetName allocates before deleting the old name; allocation failure preserves
the old name. GetArgumentName preserves the target's exact formatting and
truncation behavior; reconstruction does not fix it.

The506 bytes are locally verified, NOT aggregate-accepted. The sole running
full audit43146 includes the earlier driver729 only. Confirmed coverage stays
345916/1089680 =31.744732% until terminal PASS. Once both disjoint gains are
aggregate-accepted,1547 further bytes are needed for32%. No whole-DLL/GPU claim.
