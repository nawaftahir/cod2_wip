# Radiant ownership - 2026-11-01

Codex owns reconstruction, the former Gemini backlog, shared types/build/layout,
verification and main integration. Gemini is parked for quota. The browser worker owns FindTextureDlg.cpp only
on web/reconstruction; see TASK_WEB.md. Codex retains all other source. Preserve every existing worker tree and draft.

Use .agents/codex, branch agent/codex. Main lanes/BOARD.tsv is authoritative:
49 cheap-lane and 41 hard-lane files belong to Codex; one cheap file belongs
to the browser worker; eleven earlier done
entries keep their historical owner marker. The former 45-file reserved queue
remains in lanes/GEMINI_QUEUE.tsv as the ordered backlog, not an active worker.

Current primary TU: PatchDialog.cpp. Fifteen routines / 1,391 B pass; eight
original game entries / 1,203 B plus helpers/global bindings remain. The two
registry dependency routines in win_main.cpp add 260 B. That file is also
PARTIAL. The actual blocking addresses, byte differences, real caller/callee
experiments and retained candidates are in research/codex_patchdialog/README.md.
Do not repeat them or restore rejected optimizer/ABI/stub workarounds.

Use the real BinDiff comparison cached under .agents/codex/scratch/bindiff_takeover
and KisakCOD/iw3xo sources as evidence. The unchanged linked-executable referee
is the authority; similarity is not accepted coverage. KisakCOD has no Radiant
executable here. No assets, binaries, exports or analysis projects go into Git.

Every canonical checkpoint requires full regression, the game-ledger audit,
relevant bindings and every existing complete-file proof. Fourteen files are
FILE VERIFIED; the new patch/registry subsets do not increase that count.
Game matches/bytes never decrease; same-offset bytes remain report-only.

Codex preserves safety refs, integrates through tools/land.sh where its scope
fits, and otherwise performs owner review and actual merged-tree CI before the
standing authorized push. Keep RADIANT_CI_NO_NOTIFY=1. Never reset newer/dirty
workers. No notifications, external servers or other tracks are authorized.
