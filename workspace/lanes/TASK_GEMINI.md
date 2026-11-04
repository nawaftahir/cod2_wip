# Gemini Flash worker: queue (separate from the web lane)

You work only in `.agents/gemini2/` (branch `agent/gemini2`). Never push, never touch `main` or any
other worktree. The web lane owns FindTextureDlg, EntityListDlg, TextureBar, VertEditDlg, vertsel, ModelDlg,
MapInfo, win_dlg, PrefsDlg and eclass; never edit those.

## Read first (in this order)
1. `CLAUDE.md` (the track contract; rules you must follow)
2. `workspace/lanes/CHEAP_AGENT.md` (the per-function loop and the "never" list)
3. this file

## Your files, in order (one at a time, finish or record blockers before the next)
1. `src/radiant/draw.cpp`       12 functions  (no reference; work from `make show`)
2. `src/radiant/csg.cpp`        12 functions  (Q3Radiant `CSG.CPP`)
3. `src/radiant/qe3.cpp`        25 functions  (Q3Radiant `QE3.CPP`)
4. `src/radiant/Undo.cpp`       30 functions  (Q3Radiant `Undo.cpp`)
5. `src/radiant/Winding.cpp`    24 functions  (Q3Radiant `Winding.cpp`)
Q3Radiant sources: `../../../refrences/Quake-III-Arena/q3radiant/` (read-only).
Function list and order: `data/tu_map.tsv` rows for the file. Free wins first: rows of
`workspace/research/q3sweep_game.tsv` for your file compile byte-identical from Q3Radiant.

## Loop per function
`make show A=<addr>` -> write it in the file at its slot -> `make try S=<file> A=<addr>` (max 8 distinct tries)
-> MATCH: add a `ledger/matches.tsv` row; else a `ledger/defer.tsv` row with best % and first differing byte.
Before each commit: `make verify` must report 0 failures and must not lose any existing row.
Commit: `git add <file> ledger/matches.tsv ledger/defer.tsv workspace/lanes/reports/gemini2.md`, message `<file>: N match`.

## Hard rules
Real readable C/C++ only: no asm, `_emit`, byte arrays, `__declspec(noinline)`, fake callers, hardcoded retail
addresses, invented struct fields. Do not edit tools/, data/, link/, Makefile, flags or other src files.
Asserts on their retail lines. Names only with evidence, else `FUN_<addr>`.

## Report (what the owner reads)
Keep `workspace/lanes/reports/gemini2.md` updated after every commit with exactly:
- file, functions matched / total, bytes matched
- each deferral: address, best %, first differing byte, what it needs
- the last line of `make verify`
- anything that looked wrong in the layout (file boundaries, flags)
