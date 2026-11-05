# Gemini: lane 0x43f8a0..0x453660 (worktree `cod2_wip/.worktrees/gemini2`, branch `radiant/gemini2`)

Read first: this file, `workspace/OFFSET_PLAN.md`, `workspace/TASK_WEB.md` (the loop), `RULES.md`.
Your last round (5 matches, texturevecs size hole, honest LTCG report) was good. Keep that style.

## Next work, in this order (do not skip ahead)
Status 2026-11-05 (`python3 tools/drift.py --tu <file>`):

| # | File | Functions | Matched | Missing | Goal this round |
|---|---|---|---|---|---|
| 1 | common/texturevecs.cpp | 4 | 3 | 0 | match the 4th (0x0043fbc0) -> first finished file |
| 2 | radiant/Undo.cpp | 30 | 5 | 25 (7,523 B) | every function present at retail size, front to back |
| 3 | radiant/TexWnd.cpp | 69 | 4 | 65 (10,792 B) | same; start with the 3 isolated matches you reported |
| 4 | Winding, ZWnd, VertEditDlg, VehicleDlg, XYWnd | | | | only after 1-3 |

A file is FINISHED when every function in it matches AND sits at its retail offset. Tell Claude in
your report; Claude moves it to `src/`. That is the only number that counts toward the exe.

## Strict rules (a commit that breaks one is reverted on review)
1. **Start every session with `git merge radiant/main`.** Never work on a stale base.
2. **One file at a time, front to back by address.** Do not open file N+1 while file N has a missing
   function you have not tried.
3. **Gate before every commit:** `make gate > /tmp/gate.log 2>&1` must exit 0, and matched rows must
   not drop. Commit only then. Logs go to /tmp, never build/.
4. **Size first.** For each function, the order is: exists -> retail size -> exact bytes. A function
   that is the right size but not yet matched stays in the file (no ledger row). A function whose
   size you cannot get within 3 bounded attempts goes to `workspace/drafts/<file>_<addr>.cpp` with its
   best size and first difference; then move on.
5. **No regressions, no exceptions.** If a new function makes any existing row fail, move it to drafts
   and record which row flipped (address, size, first difference). Claude handles caller/callee groups.
6. **Names and tags.**
   - SUPPORTED: a reference agrees (Q3Radiant, KisakCOD, the server source). Write the file:line.
   - PINNED: only with proof in the retail exe itself (a string, a vtable/RTTI name, an assert text).
   - UNNAMED with `FUN_<addr>`: everything else. Never name from a guess.
   - KisakCOD is CoD4: its names can be SUPPORTED, never PINNED; its struct layouts need retail proof.
7. **Struct fields and globals:** offsets from the retail code or a reference that agrees with it.
   Unknown global: `extern` declaration named `DAT_<addr>`, never a defined variable you made up.
8. **Real C/C++ only:** no asm, `_emit`, byte arrays, forced noinline, fake callers, hardcoded retail
   addresses as code, weakened masks. No empty or placeholder files.
9. **Touch only** your lane's files in `workspace/src/`, `ledger/matches.tsv`, `workspace/drafts/`,
   `workspace/lanes/reports/gemini2.md`. Never `tools/`, `data/`, `link/`, `src/`, other lanes.
10. **Commits:** one per finished function or per size-fixed group, message names the file and
    addresses. Push your branch at the end of each session (CI checks it). Never push `radiant/main`.

## Report format (`workspace/lanes/reports/gemini2.md`, newest on top, replace stale numbers)
```
## <date> <file>
before: <n> fns, <matched> matched, <missing> missing   after: <...>
matched: 0xADDR size name tag evidence
size-fixed (no match yet): 0xADDR retail/ours first-diff
drafts (blocked): 0xADDR best/retail reason
regressions seen: <row that flipped> when adding <addr>
gate: verify N/N, functions %, bytes %, same-offset %
```
Never report a number you did not measure in this session.

## Tools
- `python3 tools/show.py <addr>`: retail code, place in the file, decompile hint.
- `make try S=workspace/src/radiant/<file>.cpp A=<addr>`; new functions:
  `docker run --rm -v $PWD:/w -w /w -e RADIANT_IN_IMAGE=1 cod2-radiant-msvc71 python3 tools/verify.py <src> <addr> --symbol '<mangled>'`
- `python3 tools/drift.py --tu radiant/<file>.cpp` after a build: retail size vs ours per function.
- `python3 tools/pair.py <addr> '<symbol>'` (inside the image): retail and ours side by side.
