# Radiant ownership (2026-10-29)

The mandatory file-completion contract in CLAUDE.md applies to this role: one active TU,
complete routine/helper inventory, real metadata bindings and a full regression
before FILE VERIFIED. Partial checkpoints remain PARTIAL.

The owner assigned Gemini all easy files and Codex the hard files plus main-tree
integration. This split supersedes earlier single-file Gemini tasks and automatic
claim directions. Main lanes/BOARD.tsv records exclusive ownership; each worker
uses its private worktree. No worker edits another worker's assigned source.

| Worker | Scope | Task |
|---|---|---|
| Gemini | 49 easy-candidate files in lanes/GEMINI_QUEUE.tsv | TASK_GEMINI.md |
| Codex | 37 hard files in the codex lane; shared headers, dependencies, build/layout evidence and integration | TASK_CODEX.md |

Gemini follows its remaining queue and reports complete-file evidence.
TexEdit is a Codex-owned hard handoff; existing drafts are preserved. One TU at a time; one commit
per file; target 100% of each TU before calling it finished or moving on. Stop
cleanly for Codex to review a completed file or a documented hard-blocker
handoff, then resume after synchronization or dependency resolution. Never run
the resetting claim helper or synchronize over unmerged commits. A hard blocker goes into the
report with evidence; trying eight times is not a prerequisite to reporting it.

Codex takes over the remaining com_memory, com_shared, q_parse, xmodel_utils and
com_files work. The two temporary allocators are already matched. Codex completed ScaleDialog.cpp metadata. Its next primary file is RotateDlg.cpp,
whose incomplete scratch draft transferred from Gemini; independent reviews continue. com_memory remains partial pending
real registration/caller dependencies; do not repeat its matched allocator trials.
The remaining existing codex lane ownership is unchanged. A hard leftover in a
Gemini file is transferred only after a clean delivery and board update.

Codex checks each delivery, preserves a safety ref and lands through
RADIANT_CI_NO_NOTIFY=1 tools/land.sh gemini. Worker referee and merged-tree CI
must pass before push. Update the board, meter, report and handoff after landing.
Keep unrelated owner files and all worker drafts. Do not send notifications.

Only linked referee MATCHes count. Game matched functions/bytes never decrease;
whole-file same-offset is report-only. Report function %, game-byte % and
same-offset % separately. No fabricated attempts, source, provenance or ABI.

The owner resumed held-file completion. Eleven audited files are recorded in
ledger/files.tsv. TextureLayout and KeyValueSelect are complete; density/Pmesh
remainders transferred to Codex. Gemini continues its full reserved queue with
individual commits and batch review. Codex seeded hwndEnt[33] in win_ent.cpp;
Gemini must preserve that shared definition when reconstructing its methods.
