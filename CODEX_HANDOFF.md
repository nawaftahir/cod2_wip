# Codex handoff: CoD2Radiant.exe (2026-10-28)

## Resumed checkpoint

The owner resumed work after the documented pause.
Private worktree: `.agents/codex`, branch `agent/codex`; main and foreign tracks
are untouched. The eighteen-function batch below is included in the checkpoint
commit `AdvCurveDlg: 18 functions match`; its parent is `3330005`.

- 383/383 linked ledger matches; 48,845 / 699,591 game bytes (6.98%).
- Whole-file same-offset: 25,329 / 1,794,048 bytes (1.412%), +195 this batch.
- AdvCurveDlg: 39 matched functions / 3,447 bytes, ten leading function starts
  at exact retail virtual addresses. This does not imply unmasked file identity.
- New batch: 18 functions / 1,305 bytes, including OnInitDialog, its actual window
  callback, selection helpers, boolean queries and color/alpha/text accessors.
- Seven selection records and seventeen subclass records are reconstructed in
  original data order, before the existing three-control table.
- Stock make try, gate, accept, both model tests and local CI passed; zero
  failures, the existing fifty unverified bodies and one order warning remain.
- Full-file SHA identity and GUI boot are still unverified.

The owner selected retail-file order after the two-counter question. Continue
this first retail TU; report same-offset changes rather than discarding correct
source solely for incidental layout fluctuations. The latest batch raises both
meters. The approved first-TU /GX /GR, function ordering and four library
corrections are already committed; no further owner-file changes are included.
No verifier predicates or comparison masks were changed. Never push without
"push it"; the older push and universal-files-first instructions below are
superseded by the owner's current directions.

The eighteen-function checkpoint has been reviewed. Its proof logs are under
`scratch/codex_1028_advcurve_selection/accepted_{try,gate,accept,ci}.log`.
Then continue `src/radiant/AdvCurveDlg.cpp`, especially the genuine global
instance/lifetime accounting and remaining handlers. The 0x4015a0 edit body
and its two callers still have a calling-context mismatch; bounded plain-TU
and noinline trials failed and remain in scratch. Do not repeat them blindly.
The registry load caller at OnCreate and several remaining MFC bindings also
need direct evidence. Read HANDOFF.md and research/codex_notes.md for details.

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
