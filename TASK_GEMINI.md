# Gemini: easy-file queue (2026-10-29)

The owner assigned you all easy files; Codex takes the hard files and integration.
This task supersedes the previous instruction to finish the five memory blockers.
Your reserved queue is lanes/GEMINI_QUEUE.tsv: 68 files, in priority order.
Ownership in lanes/BOARD.tsv is authoritative. Work only in .agents/gemini on
agent/gemini; never push, merge main yourself, reset a branch, or run claim.sh.
Codex syncs your clean worktree after each reviewed delivery. Your first file,
src/radiant/EditWnd.cpp, is already reserved. No extra permission is needed to
advance within this queue. Work on one TU at a time, preserving retail order.

## Completion requirement

Complete each assigned file at 100% before calling it finished or moving to
the next file. Every inventoried game routine and every game-code byte in
that TU must pass the unchanged linked referee. A few matching bodies, an
object-only match, a normalized near-match or a function count alone is not
file completion. Do not change inventory, ownership, masks or compiler flags
to manufacture 100%. Library/compiler/header routines keep separate accounting.

If an evidence-backed hard dependency prevents 100%, keep the file explicitly
PARTIAL and hand the exact blocker to Codex. Preserve all passing source and
private drafts. Do not quietly skip it, invent code, or claim it is complete.
Codex will resolve the dependency or transfer the hard remainder before you
continue. Checkpoints inside a file are welcome; the completion target stays 100%.

## Start here

1. src/radiant/EditWnd.cpp: start with its two Q3 object candidates (110 B).
2. src/radiant/RADEditWnd.cpp: start with its two candidates (142 B).
3. src/radiant/TexEdit.cpp: start with its two candidates (108 B).

Those are object-side candidates, not current linked matches. Look them up in
research/q3sweep_game.tsv and verify with make show / make try in this build.
Then take the small dialogs in the queue: RotateDlg, NameDlg, DialogInfo,
LstToolBar, CapDialog, DialogThick, ScaleDialog, NewProjDlg and the following
entries. Use the queue's reference field and the track's read-only references.

## Work and delivery

- Read lanes/CHEAP_AGENT.md for the source/referee rules. This explicit queue
  replaces its automatic claim step and single-file stop instruction.
- Take free/reference-backed bodies first. Keep real classes, message maps,
  globals, assertions, literals and source order; do not invent layout or names.
  For a missing source file, create only its existing mapped path from
  link/order.txt; do not create alternative TUs or move file boundaries.
- Make real, distinct source trials. If a dependency, shared layout, compiler
  flag or cross-file caller blocks progress, record the address, real best
  percentage, first differing byte, candidate path and required dependency in
  your report. Work on other independent routines in that same file, then
  hand a genuine hard blocker to Codex rather than silently moving files.
- Eight tries is a ceiling, not a quota. Do not run eight identical attempts.
  A blocked report is enough to hand work back; ledger/defer.tsv requires eight
  genuine recorded trials. Never fabricate, pad or reconstruct trial logs.
- Keep only linked MATCH bodies in src/. Drafts stay in scratch. No regression
  from 454 game rows / 55,823 B, compiler 2 / 35 B, or 48 unverified bodies.
  If main advances, use the newer integrated baseline. Same-offset is report-only.
- Commit one file at a time, with its actual ledger changes and your report.
  Keep checkpoints on the current branch; do not reset, synchronize or claim
  over unmerged commits.
- Commit a verified checkpoint whenever useful, keeping unfinished files
  labeled PARTIAL. Complete the current file before moving to the next. Stop
  cleanly for review after a completed file, or a documented hard-blocker
  handoff. Run make verify for the complete checkpoint. Report
  baseline versus new matches, game-function %, game-byte %, whole-file
  same-offset %, and exact commands. Codex reviews, lands, pushes and syncs you.
  Resume the same unfinished file after Codex resolves its blocker, or the
  next queue entry after Codex accepts the completed file. Never run claim.sh.

## Boundaries

All queue files are reserved to you. They contain easy candidates, not a promise
that every remaining routine is easy. Codex takes hard leftovers after your
reviewed handoff and updates ownership before editing them.

Do not touch com_memory.cpp, com_shared.cpp, q_parse.cpp, xmodel_utils.cpp or
com_files.cpp: their remaining blockers now belong to Codex. All existing codex
lane files, shared headers, tools, flags, data tables and link order also belong
to Codex. For a required declaration/layout change outside your TU, report the
exact dependency; do not edit another file or force an ABI to imitate LTCG.
No asm, byte arrays, fake callers, wrappers, noinline tricks or mask changes.

## Completion evidence for every file

In lanes/reports/gemini.md include: source path, starting main SHA, reference
source and target evidence, inventory game-function/byte totals, exact matched
totals, each MATCH address/size/symbol, actual commands/results, and any excluded
non-game routines with the existing classification. Report all four separately:
TU game-function %, TU game-byte %, project game-function %, project game-byte %.
Also report project whole-file same-offset %. The last value is not a reason
to revert correct matching source. A fully matched TU does not imply full exe SHA.

For COMPLETE: zero remaining game routines, 100% TU game bytes, full regression
green, no increased unverified code, real readable source in its original file
and order, assertion coordinates/literals/callee bindings intact. Codex reviews
these claims independently and lands/pushes only verified work.

## Full assigned queue

This is the complete file list, in order; the matching TSV is
lanes/GEMINI_QUEUE.tsv. Baseline counts are from the 454-row main checkpoint.
Every row has the same target: 100% of its inventoried game routines and bytes.
Board totals describe mapped routines; existing compiler/header/library
classifications stay separate and must be listed explicitly in the report.
The reference candidates are hints, not credited linked matches.

| Order | Assigned source file | Baseline matched / functions | Inventory bytes | Q3 candidates |
|---|---|---:|---:|---:|
| 1 | `src/radiant/EditWnd.cpp` | 0 / 7 | 182 | 2 |
| 2 | `src/radiant/RADEditWnd.cpp` | 0 / 6 | 353 | 2 |
| 3 | `src/radiant/TexEdit.cpp` | 0 / 7 | 397 | 2 |
| 4 | `src/radiant/RotateDlg.cpp` | 0 / 11 | 1502 | 2 |
| 5 | `src/radiant/NameDlg.cpp` | 0 / 6 | 278 | 1 |
| 6 | `src/radiant/DialogInfo.cpp` | 0 / 8 | 332 | 1 |
| 7 | `src/radiant/LstToolBar.cpp` | 0 / 5 | 75 | 0 |
| 8 | `src/radiant/CapDialog.cpp` | 0 / 6 | 111 | 0 |
| 9 | `src/radiant/DialogThick.cpp` | 0 / 5 | 126 | 0 |
| 10 | `src/radiant/ScaleDialog.cpp` | 0 / 4 | 136 | 0 |
| 11 | `src/radiant/NewProjDlg.cpp` | 0 / 4 | 180 | 0 |
| 12 | `src/radiant/DlgEvent.cpp` | 0 / 4 | 208 | 0 |
| 13 | `src/radiant/TextureLayout.cpp` | 0 / 6 | 339 | 0 |
| 14 | `src/radiant/PatchDensityDlg.cpp` | 0 / 6 | 422 | 0 |
| 15 | `src/radiant/TerrainDensityDlg.cpp` | 0 / 6 | 422 | 0 |
| 16 | `src/radiant/KeyValueSelectDlg.cpp` | 0 / 5 | 458 | 0 |
| 17 | `src/radiant/ZWnd.cpp` | 0 / 26 | 1552 | 4 |
| 18 | `src/radiant/PatchDialog.cpp` | 0 / 28 | 2793 | 3 |
| 19 | `src/radiant/win_main.cpp` | 0 / 21 | 3498 | 3 |
| 20 | `src/radiant/win_ent.cpp` | 0 / 23 | 9585 | 3 |
| 21 | `src/radiant/FindTextureDlg.cpp` | 0 / 16 | 1046 | 1 |
| 22 | `src/radiant/EntityListDlg.cpp` | 0 / 22 | 1480 | 1 |
| 23 | `src/radiant/TextureBar.cpp` | 0 / 15 | 1608 | 1 |
| 24 | `src/radiant/mru.cpp` | 1 / 16 | 2055 | 1 |
| 25 | `src/radiant/Radiant.cpp` | 0 / 15 | 2465 | 1 |
| 26 | `src/libs/cmdlib/cmdlib.cpp` | 0 / 40 | 3505 | 1 |
| 27 | `src/radiant/ModelDlg.cpp` | 0 / 24 | 4295 | 1 |
| 28 | `src/radiant/MapInfo.cpp` | 0 / 30 | 4585 | 1 |
| 29 | `src/radiant/z.cpp` | 0 / 8 | 5635 | 1 |
| 30 | `src/radiant/Undo.cpp` | 0 / 30 | 7580 | 1 |
| 31 | `src/radiant/SurfaceDlg.cpp` | 0 / 45 | 9048 | 1 |
| 32 | `src/radiant/filtersettings.cpp` | 0 / 74 | 11209 | 1 |
| 33 | `src/universal/assertive.cpp` | 8 / 35 | 5253 | 0 |
| 34 | `src/xanim/xmodel.cpp` | 0 / 31 | 1850 | 0 |
| 35 | `src/script/scr_memorytree.cpp` | 0 / 21 | 5332 | 0 |
| 36 | `src/radiant/UNKNOWN_00408f20.cpp` | 0 / 4 | 153 | 0 |
| 37 | `src/radiant/points.cpp` | 0 / 7 | 1433 | 0 |
| 38 | `src/radiant/CommandsDlg.cpp` | 0 / 16 | 1515 | 0 |
| 39 | `src/universal/win_common.cpp` | 0 / 11 | 1951 | 0 |
| 40 | `src/radiant/GfxWrapper.cpp` | 0 / 31 | 3126 | 0 |
| 41 | `src/radiant/VertEditDlg.cpp` | 0 / 21 | 6334 | 0 |
| 42 | `src/universal/splines/math_quaternion.cpp` | 1 / 4 | 539 | 0 |
| 43 | `src/universal/UNKNOWN_00494480.cpp` | 0 / 3 | 816 | 0 |
| 44 | `src/radiant/UNKNOWN_00425080.cpp` | 0 / 22 | 1655 | 0 |
| 45 | `src/zlib/inflate.c` | 4 / 8 | 1750 | 0 |
| 46 | `src/radiant/win_qe3.cpp` | 4 / 23 | 2628 | 0 |
| 47 | `src/radiant/VehicleDlg.cpp` | 0 / 77 | 3696 | 0 |
| 48 | `src/radiant/PrefsDlg.cpp` | 0 / 10 | 7543 | 0 |
| 49 | `src/radiant/draw.cpp` | 0 / 12 | 2150 | 0 |
| 50 | `src/radiant/vertsel.cpp` | 0 / 8 | 2272 | 0 |
| 51 | `src/common/texturevecs.cpp` | 0 / 4 | 3319 | 0 |
| 52 | `src/radiant/win_dlg.cpp` | 0 / 19 | 4848 | 0 |
| 53 | `src/universal/UNKNOWN_004985d0.cpp` | 0 / 16 | 196 | 0 |
| 54 | `src/radiant/UNKNOWN_00420930.cpp` | 0 / 29 | 1202 | 0 |
| 55 | `src/universal/linearmapping.cpp` | 0 / 6 | 2119 | 0 |
| 56 | `src/radiant/csg.cpp` | 0 / 12 | 3984 | 0 |
| 57 | `src/radiant/eclass.cpp` | 0 / 25 | 6910 | 0 |
| 58 | `src/radiant/map.cpp` | 0 / 53 | 15674 | 0 |
| 59 | `src/universal/splines/util_str.cpp` | 12 / 23 | 5842 | 0 |
| 60 | `src/radiant/qe3.cpp` | 0 / 25 | 6362 | 0 |
| 61 | `src/radiant/mesh.cpp` | 0 / 16 | 8113 | 0 |
| 62 | `src/universal/splines/math_angles.cpp` | 4 / 12 | 1269 | 0 |
| 63 | `src/universal/splines/math_matrix.cpp` | 6 / 10 | 1405 | 0 |
| 64 | `src/zlib/deflate.c` | 13 / 17 | 5938 | 0 |
| 65 | `src/xanim/xmodel_load_obj.cpp` | 0 / 16 | 7366 | 0 |
| 66 | `src/radiant/drag.cpp` | 0 / 17 | 9922 | 0 |
| 67 | `src/universal/splines/math_vector.cpp` | 2 / 33 | 2742 | 0 |
| 68 | `src/universal/g_vehicle_path.cpp` | 0 / 27 | 7880 | 0 |
