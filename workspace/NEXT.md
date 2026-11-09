# Radiant: resume here (Claude is the only worker; web and Gemini lanes are closed, 2026-11-10)

After /clear: read this file, then `workspace/OFFSET_PLAN.md`. Update this file before ending a session.
Worktree `cod2_wip/.worktrees/claude`, branch `radiant/claude`. Run shell via a script file and
`wsl.exe bash -l <script>` (PowerShell mangles `$`). Logs in /tmp. Before a clean gate, chown and clear
`build/obj` and `build/src` with the alpine docker one-liner (build/ is root-owned).

## State (clean gate, radiant/main 51c8f389)
855/855 rows, 23.90% game functions, 12.85% game bytes, same-offset 1.508%. `src/` empty.

## Order of work
1. **Fix the drift tool's blind spot.** AUTO rows (`??_G` deleting destructors, 33 B) count as missing
   because they have no ledger row. Retail shape: calls the class destructor, tests bit 0, calls
   operator delete. Pair them by class/position, or add them to `ledger/compiler.tsv`. Eleven small
   files show exactly one such gap: FindTextureDlg, DlgEvent, NewProjDlg, ScaleDialog, DialogThick,
   LstToolBar, CapDialog, NameDlg, RADEditWnd, EditWnd, TextureLayout. CHECK our map has them.
2. **Finish the small files:** those eleven, then mru, texturevecs (0 missing), UNKNOWN_00408f20,
   TexEdit, PatchDensityDlg, TerrainDensityDlg, points, KeyValueSelectDlg, DialogInfo.
3. **First file:** AdvCurveDlg 0x004015a0 (draft in workspace/drafts) and its tail placement.
4. **Big files front to back:** CamWnd, MainFrm, Pmesh, XYWnd, ... one file per session, size first.
5. Re-test `/OPT:REF /OPT:NOICF` once a region's callers exist.

## Open decision (owner)
An absolute retail offset needs every byte before the file to be right, so strictly no file except
the first can enter `src/` until the exe is nearly done. Proposal: a file enters `src/` when all its
functions match and their spacing inside the file equals retail; absolute placement is reported
separately.

## Cost rules
One file per session, then update this file and /clear. Batch functions per build (about 2 min each).
Max 3 attempts per function, then draft and move on. Never retry what OFFSET_PLAN lists as tried.
Unmerged lane leftovers are in `workspace/drafts/` and `workspace/lanes/reports/`.
