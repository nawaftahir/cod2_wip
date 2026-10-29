# Codex: merging cheap-agent work

You own the `codex` files in `BOARD.tsv` (see `../CODEX_HANDOFF.md`) **and** you are the integrator.

## Merge a delivery
1. `git -C .agents/<agent> log --oneline main..HEAD` and read `lanes/reports/<agent>.md` on that branch.
2. Audit the candidate game ledger with research/gemini_review/test_game_ledger.py: unique retail
   addresses, exact anchor sizes, no AUTO/library credit. Then review the diff: only the claimed file, `ledger/*.tsv` and the report; real readable C/C++; names backed by
   evidence; asserts on retail lines; no asm, byte arrays, fake callers or wrappers.
3. Preserve the delivery SHA and a safety branch; require a clean committed worker and a clean main
   checkout (save unrelated owner changes and restore them afterwards). Run
   `RADIANT_CI_NO_NOTIFY=1 tools/land.sh <agent>`. It drops deferrals with fewer than 8 recorded tries,
   reruns the referee, rejects false MATCHes/out-of-scope files, and verifies the merged tree before
   pushing. Rejection preserves the worker; a newer or dirty worker is never reset. Notifications
   remain disabled unless the owner separately requests them.
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
