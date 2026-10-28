# Current assignments (2026-10-28)

Paste the prompt into each tool, started in `~/cod2/test/dev/radiant`. Claude reviews both afterwards.

## Gemini (Antigravity)
Prompt:
> Read `lanes/CHEAP_AGENT.md` and follow it exactly. Your agent name is `gemini`.
> First finish `src/universal/com_files.cpp` (already yours, log in `gemini/PROGRESS.md`), and commit
> `lanes/reports/gemini.md` with it. Then run `lanes/claim.sh gemini` and take files one after another until the
> board has no open cheap files. Start each file with its hits in `research/q3sweep_game.tsv`.
> Work only in `.agents/gemini/`, commit there, write `lanes/reports/gemini.md`, never push.

## Codex
Prompt:
> Read `CODEX_HANDOFF.md` and `lanes/CODEX_MERGE.md` and follow them. Keep working your `codex` files in
> `lanes/BOARD.tsv` (AdvCurveDlg, CamWnd, cameratargetdlg first). Whenever `.agents/gemini` has new commits,
> review and merge them with `tools/land.sh gemini`, then update the board. Re-land the helpers you reverted
> for the same-offset dip (0x47c4e0, 0x47c560, 0x47c580). Push after each merge.

## Claude (review, when asked)
- `git log` since `9803e71`, every merge's diff, `lanes/reports/*`, `research/codex_notes.md`.
- Check: matches really verify inside the linked exe (`make verify`), code is real C/C++ in retail order,
  names have evidence, deferrals have 8 tries and a reason, the board matches reality.
