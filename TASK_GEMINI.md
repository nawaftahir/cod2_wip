# Gemini parked - Codex owns the backlog

The owner stopped Gemini for quota on 2026-11-01 and assigned its remaining
45-file queue and all drafts to Codex. No Gemini agent or process is active.
Keep .agents/gemini, branch agent/gemini and its uncommitted source preserved;
do not reset or synchronize it. Current work and evidence live in .agents/codex.

PatchDialog is still the primary TU. Its passing subset and two registry
dependencies are accepted as PARTIAL; real type/callee/lifetime dependencies
remain. See TASK_CODEX.md and research/codex_patchdialog/README.md.
lanes/BOARD.tsv records exclusive Codex ownership; lanes/GEMINI_QUEUE.tsv keeps
the former backlog order. Work progresses one proper TU at a time.
