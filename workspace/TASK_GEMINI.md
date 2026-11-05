# Gemini (local worktree `cod2_wip/.worktrees/gemini2`, branch `radiant/gemini2`)

Your lane, the loop and the rules are in `workspace/TASK_WEB.md` (lane "Gemini",
0x43f8a0..0x453660: common/texturevecs, TexWnd, Undo, VehicleDlg, VertEditDlg, Winding, XYWnd, ZWnd).
Read that file and `workspace/OFFSET_PLAN.md` first.

You can run the tools locally, so use them instead of waiting for CI:
- `git merge radiant/main` before you start.
- `python3 tools/show.py <addr>`: retail code for one function.
- `make try S=workspace/src/radiant/<file>.cpp A=<addr>` (add `--symbol` via tools/verify.py for new functions).
- `make build && python3 tools/drift.py --tu radiant/<file>.cpp`: retail size vs ours per function.
- `make gate` must pass before you commit. Logs go to /tmp, not build/ (root-owned).
Commit on `radiant/gemini2` (identity as configured, short messages, no Co-Authored-By). Push your
branch when the gate passes; Claude merges it. Write a short report per file in
`workspace/lanes/reports/gemini2.md`: functions added, sizes fixed, matches, blockers with evidence.
