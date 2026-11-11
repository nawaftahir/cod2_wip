# Radiant: resume here (Claude is the only worker; web and Gemini lanes are closed, 2026-11-10)

After /clear: read this file, then `workspace/OFFSET_PLAN.md`. Update this file before ending a session.
Worktree `cod2_wip/.worktrees/claude`, branch `radiant/claude`. Run shell via a script file and
`wsl.exe bash -l <script>` (PowerShell mangles `$`). Logs in /tmp. Before a clean gate, chown and clear
`build/obj` and `build/src` with the alpine docker one-liner (build/ is root-owned).

## State (clean gate, 2026-11-11)
855/855 rows, 23.90% game functions, 12.85% game bytes, same-offset 1.508%.
`src/`: CapDialog, DialogThick, LstToolBar, EditWnd(+.h), RADEditWnd (FILE LEDGER 5 VERIFIED / 102).

## Done 2026-11-11
- drift.py pairs `??_G` AUTO rows with the class's `??_G` (4b2b0af3). With it, the five files above
  show one constant offset per file (retail spacing), all rows matched; moved to `src/`.
- FindTextureDlg: spacing equal too, but its file audit cannot bind callee 0x00473940 (FindReplaceTextures,
  not written yet). Stays in workspace until that callee exists.
- PINNED (retail call scan + EH stubs): for NameDlg, DlgEvent, NewProjDlg, ScaleDialog, TextureLayout the
  `??_G` calls a class destructor that retail placed right after its FIRST USER in an earlier file, not in
  the class's own file: ~CNameDlg 0x40a890 after dlgcamera 0x40a790; ~CDlgEvent 0x409cb0 after dlgcamera
  0x409be0; NewProjDlg dtor 0x417cc0 and ScaleDialog dtor 0x418eb0 in MainFrm (users 0x417b50, 0x418d40);
  TextureLayout dtor 0x4249b0 after PatchDialog 0x424920. Ours emits `??1` inside the class file (80 B gap
  in NameDlg) because those users do not exist yet. Fix: class in a header, write the user function in
  the earlier file. Not linker ICF: 46 duplicate groups in retail are raw-byte identical and kept apart.

## Order of work
1. **NameDlg + DlgEvent via dlgcamera:** write dlgcamera 0x409be0 (195 B, uses CDlgEvent) and 0x40a790
   (250 B, uses CNameDlg), move both class declarations to headers. Then both files can go to `src/`.
2. **Finish the small files:** NewProjDlg/ScaleDialog (need MainFrm users), TextureLayout (PatchDialog
   0x424920), then mru, texturevecs (0 missing), UNKNOWN_00408f20, TexEdit, PatchDensityDlg,
   TerrainDensityDlg, points, KeyValueSelectDlg, DialogInfo. Check each with `drift.py --tu`.
3. **First file:** AdvCurveDlg 0x004015a0 (draft in workspace/drafts) and its tail placement.
4. **Big files front to back:** CamWnd, MainFrm, Pmesh, XYWnd, ... one file per session, size first.
5. Re-test `/OPT:REF /OPT:NOICF` once a region's callers exist.

## src/ rule (owner, 2026-11-10)
A file enters `src/` when all its functions match and their spacing inside the file equals retail.
Absolute placement is reported separately.

## Cost rules
One file per session, then update this file and /clear. Batch functions per build (about 2 min each).
Max 3 attempts per function, then draft and move on. Never retry what OFFSET_PLAN lists as tried.
Unmerged lane leftovers are in `workspace/drafts/` and `workspace/lanes/reports/`.
