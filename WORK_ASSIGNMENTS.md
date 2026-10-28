# Radiant coordination

The owner resumed work under lanes/BOARD.tsv, lanes/CODEX_MERGE.md and
lanes/CHEAP_AGENT.md. Those lane contracts supersede older manual-only, no-land,
no-push and narrow TexWnd directions. Codex integrates main and has explicit
permission to push after merges. Workers never push or write another worktree.

Codex owns the board's codex files, with AdvCurveDlg.cpp, CamWnd.cpp and
cameratargetdlg.cpp first. Gemini finishes com_files.cpp/.h, then takes one
cheap-lane file at a time through lanes/claim.sh. TexWnd.cpp is Codex-owned;
report its real filesystem caller dependency rather than editing it as Gemini.

A worker delivers source, ledger/matches.tsv, ledger/defer.tsv and its
lanes/reports/<agent>.md. Keep drafts in private scratch and stop after the
committed delivery until it is merged. Do not claim another file while new
commits remain above main: claim.sh may otherwise replace an unmerged branch.
Report net new rows against the starting main revision, actual percentages and
precise deferred mismatches. Existing matches are baseline coverage.

Codex preserves a safety ref, checks scope and call/data bindings, and runs
RADIANT_CI_NO_NOTIFY=1 tools/land.sh <agent> for a clean committed delivery.
The lander verifies the merged tree before push and preserves rejected or
newer worker work. It never hard-resets a worker. Restore unrelated saved owner
changes afterwards, update the board, and push the board checkpoint too.

The referee remains authoritative. Matched game functions and bytes may never
drop; whole-file same-offset bytes are report-only until layout is complete.
No asm blobs, fake callers, invented ABI changes or lowered comparison masks.
Only evidence-backed globals, strings, types and library identities may ship.
The corrected deletion binding remains _remove / DeleteFileA, not _rmdir.
