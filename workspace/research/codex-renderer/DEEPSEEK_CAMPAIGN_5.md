# Campaign 5 — authentic CRT C cohort, one combined review

Own only `codex/renderer/scratch/deepseek_crt_5/`. Read root and renderer
contracts, NEXT_SESSION.md, batch_existing.py, verify_authentic_crt.py and
check_crt_block.py. Codex owns JPEG and renderer commands; do not touch those
sources or any earlier worker folder. No canonical edits or commits.

Goal: close a substantial library-source cohort instead of retrying Mission 4's
blocked math/cubemap code. CRT means the compiler's C runtime library, which is
also present in the target DLL. Keep its coverage separate from engine C and
assembly; report source redistribution uncertainty rather than copying SDK files
into the release tree. Read-only local inputs are allowed.

## A — batch reproduction and triage

Start with the90 authentic-C candidates recorded in baseline_p9txpec2/results.json.
Verify source/header/object/toolchain hashes before reuse. Use the existing
compiler orchestration and original recorded flags; compile each distinct
source/flags combination once, not once per function. Reproduce all candidates
under both referees. Inspect complete bounds, not just inventory lengths.
Do not replace vendor source with decompiler pseudocode or assembly wrappers.
SDK-origin assembly is out of this campaign's new-byte accounting.

## B — dependencies and data

Group actual calls into connected source families; prioritize the largest
already-matching C bodies with the fewest unresolved dependencies. Verify
relocation site/type equality, callee symbol+addend binding, initialized data,
and Win32 import destinations against the target. A target address or plausible
name alone does not prove a binding. Reuse check_crt_block.py's existing evidence
where valid; never silently copy its diagnostics as a new proof.

Investigate all90 candidates once. Allow at most three new evidence-backed
experiments per shared mismatch family; then record DEFER and move to the next
independent family. Do not spend the campaign on one formatting/allocator edge.
Do not weaken the original referee to accept its known branch-mask disagreements.

## C — combined validation and delivery

For each proposed match: fresh/reproducible object, full-boundary evidence,
both referees, every binding checked, every bound symbol tested with a deliberately
wrong address and rejected. Use small actual behavioral tests for the source
families being proposed, with boundary/error cases; distinguish mocked OS
services and host behavior from actual original-DLL runtime proof.

Deliver one REPORT.md+packet.json with per-address MATCH/DEFER, source and all
input hashes, commands/logs, pinned image, object hashes, dependency/data proofs,
actual test execution, retained regression, and unique reviewable bytes.
Separate already-accounted CRT proofs, genuinely new proofs, engine C and
assembly; do not add these to Codex's engine/JPEG counter yourself.

Stop after one bounded pass over the cohort. Zero new bytes is acceptable when
supported by specific evidence, not guessed compiler-impossibility claims.
Return the combined packet to Codex for independent review.
