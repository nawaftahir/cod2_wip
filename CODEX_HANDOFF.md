# Codex handoff: CoD2Radiant.exe (2026-10-27)

You are continuing Step 3 of `ROADMAP.md` (match the code, file by file). Read, in order:
`HANDOFF.md` (state, commands), `ROADMAP.md`, `RULES.md` (evidence-tagged facts), `AGENTS.md` (agent contract).
The goal is a **SHA-256 identical exe**. A function only counts when it matches **inside the linked exe**
at its place in its own file. Nothing you write should ever need to be moved or rewritten later.

## The track (don't deviate)
1. **Structure is fixed; don't change it.** `link/order.txt`, `data/file_map.tsv`, `data/tu_map.tsv` and
   `data/flags.tsv` are owner-only. Every function already has a file and a position. Put code exactly there,
   in `data/tu_map.tsv` order. Never create, rename or reorder files; never change flags. If the structure
   looks wrong, write it in your report with evidence and stop that file.
2. **One whole file at a time**, in the ROADMAP order: finish `src/universal` (com_files, com_shared,
   assertive, the rest), then splines, xanim (dobj, xmodel, xmodel_load_obj, xmodel_utils), script, then the
   editor files.
3. **Reference source first.** Engine files come from the verified server source
   (`../cod2engine/archive/lnxded-1.0/src`) through `research/libmatch/import.sh`, then get adjusted to this
   binary. Editor files use `../refrences/Quake-III-Arena/q3radiant` and `../refrences/iw3xo-radiant` as guides.
   Real readable C/C++ only: no asm, `_emit`, byte arrays, fake callers or wrappers.
4. **Assert lines are part of the binary.** `make show` prints each assert's line number. Each function must
   sit so its asserts land on those lines, and earlier code in the file must not shift them. Write a file top
   to bottom in address order.
5. **LTCG reality.** Files are separate `/GL` objects linked `/LTCG`, so inlining and register arguments
   depend on callers in *other* files. If a function only matches once a not-yet-written file exists, defer
   it with that reason (see `ledger/defer.tsv` examples). Never bend the code to force it.
6. **Judge with the tools only:** `make try S=<file> A=<addr>` per function, then `make verify` (every row,
   inside the linked exe) and `make gate` before each commit. Never mark anything matched that they don't
   call MATCH. Never lower a meter.

## Each commit
- One file (or a coherent part of one), plus its `ledger/matches.tsv` rows (and `ledger/defer.tsv` rows
  with best % and what differs).
- `make gate` green, `tools/ci_local.sh` run (it posts the numbers to Discord).
- Short message: `<file>: N functions match`. Identity Nawaf, no Co-Authored-By. Push to origin main.
- Chown Docker-written files back (see HANDOFF.md).

## Stop and report (don't guess) when
- a file's function list or order disagrees with retail,
- the build model (flags, `/GL`, link order) seems wrong,
- a meter drops or a previously matched row fails.
Write it in `research/codex_notes.md` with the addresses and evidence, then continue with the next file.

## Hand back
When you stop, update `HANDOFF.md` "State" (numbers from `make meter`), list finished and deferred files
in `research/codex_notes.md`, commit and push. Claude takes over from there.
