# Codex: merging cheap-agent work

You own the `codex` files in `BOARD.tsv` (see `../CODEX_HANDOFF.md`) **and** you are the integrator.

## Merge a delivery
1. `git -C .agents/<agent> log --oneline main..HEAD` and read `lanes/reports/<agent>.md` on that branch.
2. Review the diff: only the claimed file, `ledger/*.tsv` and the report; real readable C/C++; names backed by
   evidence; asserts on retail lines; no asm, byte arrays, fake callers or wrappers.
3. `tools/land.sh <agent>`. It drops deferrals with fewer than 8 recorded tries, reruns the referee on the
   agent's tree, rejects any false MATCH or out-of-scope file, merges, pushes and runs `tools/ci_local.sh`.
4. Update `lanes/BOARD.tsv` (status `merged` or `partial`, owner), run `lanes/claim.sh --done <file>` if the
   file is finished, commit `lanes: <file> merged (N match)`.
5. Partial file with real leftovers? Leave status `partial`; the next `claim.sh` hands it out again.

## Gate (corrected 2026-10-28)
- Matched functions and matched bytes may never drop (`make gate`).
- **Whole-file same-offset bytes are report-only** until the layout is complete. They move whenever code is
  added in front. A function that matches 100% inside the linked exe is credited even if that number dips.
  The helpers deferred for "same-offset regression" (0x47c4e0, 0x47c560, 0x47c580 ...) should be re-landed.

## Escalate to Claude (write `research/codex_notes.md`)
Wrong file boundaries or order, wrong flags or library mapping (like the `__rmdir`/DeleteFileA case), or
any meter going down that you can't explain.
