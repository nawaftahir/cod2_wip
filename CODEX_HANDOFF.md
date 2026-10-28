# Codex handoff: CoD2Radiant.exe (2026-10-28)

## Camera-window setup checkpoint

Ten camera-window routines now match in retail source order: 569 B, including
factory/runtime metadata, constructor/destructor, message-map getter, real window
procedure, class registration, friend setter, close handler and camera defaults.
Stock game gate: 407/407, 50,836 / 699,591 B (7.27%), same-offset 26,210 B
(1.461%, +358 over e76fe1a), compiler helpers 2 / 35 B, zero failures,
unchanged 50 unverified bodies and one order warning. /GX /GR apply to this TU.

The class extent is pinned to its factory's 0x168 allocation and runtime record.
Storage at +0xec..+0x11b and +0x12c..+0x137 stays explicitly undecoded; accepted
routines do not access it. Camera motion/rendering and shared globals remain open.
Live checks prove factory/class size, getters' different data targets, 19 message
entries, actual callback, literals, imports, and AfxRegisterClass call identity.
AfxRegisterClass's 16-byte EH cleanup has a separate map label ($L197921): the
inventory includes it in 257 B, while Linked.code reports the 241-byte main body.
The research check compares all 257 linked bytes and callees, including cleanup.
No verifier, mask, function inventory or game accounting rule was changed.

## Camera-target checkpoint

The next editor file, cameratargetdlg.cpp, now has all five dialog game routines
matched: 212 B. Source follows the Q3 class and target IDs/field offsets. The
scalar destructor and CString header bodies are excluded from the new game count.
The shared getter at 0x4ff4c3 is AfxGetStringManager (strcore.obj), confirmed by
its archive export and original constructor's IAtlStringMgr::GetNilString flow.
Per-TU /GX and /GR reproduce target EH and CCameraTargetDlg RTTI.
Local stock try/gate/accept and structural/accounting tests pass: 397 game rows,
50,267 / 699,591 B (7.19%), 25,852 same-offset B (1.441%, +319 over b550929),
2 compiler helpers / 35 B, zero failures, unchanged 50 unverified bodies / 1 warning.
Shared header contributor order and full binary SHA remain unfinished.

## Integrated overseer checkpoint

Combined Gemini 754c328 and Codex 419dd20: 392/392 game matches,
50,055 / 699,591 game bytes (7.15%), 2/2 compiler helpers / 35 B.
Whole-file same-offset 25,533 / 1,794,048 (1.423%): +242 from main 747a45c.
Net new source: nine functions / 1,210 bytes. Zero failures, unchanged fifty
unverified bodies and one order warning. Full SHA and GUI boot remain unfinished.
Independent integration logs: .agents/overseer/build/{gemini-review-gate,
combined-review-gate,combined-review-tests}.log. Gemini strings/statics/searchpath
bindings and editor preset tables/import bindings pass separate live-image checks.
See SHARED_UPDATES.md for Gemini's now-resolved deletion-library blocker.

## Overseer checkpoint (menu/color batch)

Codex owns AdvCurveDlg.cpp and shared metadata; Gemini owns com_files.cpp/.h.
See WORK_ASSIGNMENTS.md; its no-push/manual-integration contract supersedes the
older worker directions below. Gemini has delivered 754c328 for independent review.

This editor batch adds six functions / 772 game bytes: popup-menu helper, three
preset handlers and two color dialogs. Local result: 389/389 game matches,
49,617 / 699,591 B (7.09%), two compiler helpers / 35 B, 25,744 same-offset B
(1.435%, +453). Zero failures; 50 unverified bodies and one order warning remain.
Preset tables retain retail order and contents; tests check their actual pointers.
Five library identities are corrected with archive and import evidence, including
0x4dad56 = _remove (unlink.obj), whose __unlink wrapper jumps to _remove.
Gemini should implement FS_Remove with remove(), never _rmdir().
make try (all six), gate, accept, library/model/lifetime/accounting tests and
local CI passed. Proof logs: scratch/codex_1028_advcurve_menu/accepted_*.log.
Whole-file identity and GUI boot remain unfinished.

## Resumed checkpoint

The owner resumed work after the documented pause.
Private worktree: `.agents/codex`, branch `agent/codex`; main and foreign tracks
are untouched. The eighteen-function batch below is included in the checkpoint
commit `AdvCurveDlg: 18 functions match`; its parent is `3330005`.

- 383/383 linked ledger matches; 48,845 / 699,591 game bytes (6.98%).
- Whole-file same-offset: 25,291 / 1,794,048 bytes (1.410%) after restoring
  the real global dialog instance (-38 from the preceding checkpoint).
- AdvCurveDlg: 39 matched functions / 3,447 bytes, ten leading function starts
  at exact retail virtual addresses. This does not imply unmasked file identity.
- New batch: 18 functions / 1,305 bytes, including OnInitDialog, its actual window
  callback, selection helpers, boolean queries and color/alpha/text accessors.
- Seven selection records and seventeen subclass records are reconstructed in
  original data order, before the existing three-control table.
- Stock make try, gate, accept, both model tests and local CI passed; zero
  failures, the existing fifty unverified bodies and one order warning remain.
- The approved global-instance change verifies two compiler helpers / 35 B
  separately through ledger/compiler.tsv; game coverage remains 383 / 48,845 B.
  Repeated-name function boundaries are fixed; masks and per-function checks are unchanged.
- Full-file SHA identity and GUI boot are still unverified.

The owner selected retail-file order after the two-counter question. Continue
this first retail TU; report same-offset changes rather than discarding correct
source solely for incidental layout fluctuations. The eighteen-function batch raised both meters; the subsequent global-lifetime
change adds the real instance and two compiler matches while moving offsets by -38. The approved first-TU /GX /GR, function ordering and four library
corrections are already committed; no further owner-file changes are included.
No per-function byte/callee predicates or comparison masks were changed. Never push without
"push it"; the older push and universal-files-first instructions below are
superseded by the owner's current directions.

The eighteen-function checkpoint has been reviewed. Its proof logs are under
`scratch/codex_1028_advcurve_selection/accepted_{try,gate,accept,ci}.log`.
Then continue `src/radiant/AdvCurveDlg.cpp`, with the remaining handlers; global lifetime is now reconstructed and independently
checked by research/codex_lifetime/test_lifetime.py. The 0x4015a0 edit body
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
