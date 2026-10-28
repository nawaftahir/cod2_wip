# Gemini assignment

Read WORK_ASSIGNMENTS.md, RULES.md and AGENTS.md first. The owner's newer
coordination contract takes priority over old automatic fleet instructions.
Work ONLY in /home/nawaf/cod2/test/dev/radiant/.agents/gemini, branch agent/gemini.
Do not edit the root main checkout or another agent's worktree.

Own src/universal/com_files.cpp and src/universal/com_files.h. Reconstruct the
remaining functions in their retail source order, with real caller/callee groups.
Start from this consolidated baseline: 383 game matches / 48,845 bytes (6.98%),
plus two compiler helpers / 35 bytes. com_files already has 38 verified rows;
re-read the actual ledger before selecting work. Fifteen of your sixteen additions are
already represented; FS_Remove is withheld. Preserve verified code rather
than redoing it.

Use existing research/codex_notes.md for attempted approaches and known blockers.
Do not restore your previous _rmdir implementation of FS_Remove: that binding
was rejected by direct API inspection. Report shared metadata problems to Codex;
work on another remaining function while the overseer resolves them.

Run make try for each proposed function and make gate for the batch. Keep drafts
in scratch. Never add unmatched bodies to src. Commit a coherent verified batch
with only your source/header and local ledger/report files. Do not push or run
tools/land.sh. Put the commit hash, source/byte gains, same-offset measurement,
exact test results and unresolved blockers in REPORT_GEMINI.md. The owner will
pass that file to Codex for independent verification and integration.

Your next action is to inspect the remaining com_files addresses and reconstruct
one real caller/callee batch, not write another plan or repeat old matches.
