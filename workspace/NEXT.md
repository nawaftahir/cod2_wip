# Radiant: resume here (Claude is the only worker; web and Gemini lanes are closed, 2026-11-10)

After /clear: read this file, then `workspace/OFFSET_PLAN.md`. Update this file before ending a session.
Worktree `cod2_wip/.worktrees/claude`, branch `radiant/claude`. Native Linux shell since 2026-11-13
(no more `wsl.exe`/PowerShell): `make -C cod2_wip/.worktrees/claude gate` directly; the docker socket is
only reachable outside the agent sandbox. Logs in /tmp. Before a clean gate, clear `build/obj` and
`build/src` (chown first with the alpine docker one-liner if a container left them root-owned).

## State (clean gate, radiant/main 39d9c8a4, 2026-11-16)
1112/1112 rows, 1112/3582 = 31.04% game functions, 18.95% game bytes (132,573 B), same-offset 1.766%,
emit-order warnings 18. FILE LEDGER 7 VERIFIED / 102 (audited set; other src/ files have no audit yet).
- 2026-11-16 merge: lanes front/editor-*/engine-* + the 11-15 uncommitted batch (cmdlib, q_shared,
  com_shared, win_qe3, Pmesh, CommandsDlg, EntityListDlg, ZWnd, win_common -> src/universal).
- Deferred tie: Face_WriteMaya 0x00454250 matched on 40463185, 99% after the 11-15 batch (first diff
  +0x358, sizes equal). Re-test when brush.cpp is worked.
- test_dialog_batch.py: CDlgEvent passes allow_generated_elsewhere (its dtor now sits in dlgcamera, as retail).

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
1. **NameDlg + DlgEvent via dlgcamera:** **DONE** (`CDlgCamera` in `workspace/src/radiant/dlgcamera.{h,cpp}`,
   `0x409be0` / `0x40a790` / `0x40a8e0` matched; `NameDlg.cpp` + `DlgEvent.cpp` + headers verified with
   `drift.py --tu` and promoted to `src/radiant/`).
2. **Finish the small files:** TextureLayout DONE 11-16 (PatchDialog OnBtnPatchreset 0x424920 + ~CTextureLayout
   0x4249b0 matched first try; callee 0x432f60 named Patch_ResetTexturing(float,float,int), SUPPORTED by Q3).
   Gate: 1114 rows, 31.10% fns, 18.98% bytes, same-offset 1.766%. NewProjDlg/ScaleDialog next: MainFrm users
   0x417b50 (366 B, '.prj', Com_GetExtensionSubString eax-CC) and 0x418d40 (364 B, 'scale', OnlyPatchesSelected;
   CScaleDialog built inline: CDialog(0x91) + three 1.0f). file_ledger audits DlgEvent/TextureLayout only once
   NewProjDlg is in src/ too (test_dialog_batch groups them). Then mru (done -> `src/`), KeyValueSelectDlg (done -> `src/`), points (done -> `src/`),
   texturevecs (blocked on `com_math.cpp` `Snap` `0x489940`), UNKNOWN_00408f20 (blocked on `qe3` `0x46d3d0`
   / `dvar` `0x48f7c0`, `0x4910d0` / `FS_InitFilesystem` `0x4820a0`), TexEdit (blocked on `TexWnd::UpdateFilter`
   `0x442d60`), PatchDensityDlg, TerrainDensityDlg, DialogInfo. Check each with `drift.py --tu`
   (blocked-file details in `workspace/drafts/front_blocked_small_files.md`).
3. **First file:** AdvCurveDlg 0x004015a0 (blocked after 3 tries + `/Ob1` diagnostic; see
   `workspace/drafts/AdvCurveDlg_004015a0.cpp`: `/Ob2` `/LTCG` inlines `FUN_00401cd0` -> 511/453 B;
   `noinline`/`/Ob1` switches `0x4015a0` to custom `esi` CC and breaks `OnOK` / `0x401b80..0x401c20`).
4. **Big files front to back:** CamWnd, MainFrm, Pmesh, XYWnd, ... one file per session, size first.
5. Re-test `/OPT:REF /OPT:NOICF` once a region's callers exist.

## src/ rule (owner, 2026-11-10)
A file enters `src/` when all its functions match and their spacing inside the file equals retail.
Absolute placement is reported separately.

## Cost rules
One file per session, then update this file and /clear. Batch functions per build (about 2 min each).
Max 3 attempts per function, then draft and move on. Never retry what OFFSET_PLAN lists as tried.
Unmerged lane leftovers are in `workspace/drafts/` and `workspace/lanes/reports/`.
