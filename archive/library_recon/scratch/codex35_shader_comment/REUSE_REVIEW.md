# Reviewed proof reuse — 2026-10-04

New snapshot reviewed_inputs.json pins36 cohort states and the full verifier,
SDK/header/compiler/host-package/two-image/anchor environment closure.
SHA d6ce6478d0162b0c9973048bb42fb997d81731b1f33d213bfed1d05a8b560657.
It was sealed only from completed cold aggregate17239 PASS/exit0, after the
independent36-pin-set/109-packet/14688-identity posthash. Old stale snapshot
was not modified. Driver changes only the selected snapshot path/hash.

All36 current cohort states reproduced. Wrong certificate, wrong state,
unknown cohort, simulated accepted-source digest mutation and changed
environment tests reject. No canonical source was mutated for those tests.
The first test used relative directory paths and failed the state equality
assertion because state keys pin absolute paths. Corrected tests use the
same absolute paths as the production driver; no verifier gate was changed.

Guarded aggregate12321 completed PASS/exit0, exactly36 historical cohort
reuses, same353882/1089680=32.475773% accepted total. Post-completion review
again passed36 states/environment,109 packet sets,14688 identities and anchor.
These are historical source/CPU proofs, NOT fresh builds or fresh CPU tests
for reused cohorts. Global accounting/binding/boundary/negative/regression/
CPU packet and input gates still execute; direct324 parser packet also checked.
No new source bytes or whole-file identity are claimed from proof reuse.

Replay: python3 tools/check_ten_percent.py --reuse-reviewed.
Closure/input changes reject or require a fresh cohort replay; omit the flag
for a cold audit. Never seal a snapshot from a partial, failed or stale log.
