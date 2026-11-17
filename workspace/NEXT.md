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

## 2026-11-17 round 4 (clean gate 63404c52)
1453/3582 = 40.56% game functions, 23.45% game bytes (164,096 B), same-offset 1.809%, 0 failing.
- Merged: filtersettings +43 (assert forwarders), VertEditDlg +9, entity/map/qe3 +12 (copystring), TexWnd +7 /
  SurfaceDlg +1, InitCull/AreaSelectOK/0x45ebc0, Winding BaseForPlane + Clip (operand order rule).
- GraphGetValueFromFraction 0x4832c0 flips with the function SET; merging more lanes has restored it every
  time. Workflow: on a flip, merge the next ready lane and re-gate before bisecting. Owner did not take a tie list.
- Next clusters: MainFrm filter callees 0x41c440..0x41d400 (callers now exist), Brush_BuildWindings 0x45a220,
  Eclass_ForName 0x464770, Cam_MouseMoved 0x404dc0 (drag 0x4623e0), PrefsDlg as a whole class.

## 2026-11-17 round 3 (clean gate, 68936968)
1374/3582 = 38.36% game functions, 22.08% game bytes (154,516 B), same-offset 1.751%, emit-order 12, 0 failing.
- Merged: dobj +6, Winding +5 / brush +2, dvar +2, CamWnd +10, entity +29 (new file), map +5 (new file).
  SL_IsLowercaseString named from the retail dobj assert text.
- Lesson (lane C): self-contained bodies get retail register conventions without callers; the real blocker
  is an UNWRITTEN CALLEE with a register/stdcall convention. Land callee clusters first.
- GraphGetValueFromFraction 0x4832c0 flips (79%) when some bodies are added; blocks InitCull 0x405220,
  0x45ebc0, 0x4532a0, others. Radiant has no tie list (tools change = owner review). Opus lane on root cause.
- Proposals for owner: tu_map moves for com_files tail 0x482440..0x482970 and CamWnd tail 0x4075c0..0x407f60
  (helpers, not that file's code); 0x4a1170 -> dobj; 0x449760 size 159 -> 160; DVAR_CHANGEABLE_RESET value.
- p4api (110 KB, VC6 prebuilt lib) is missing: Perforce FTP has r14+ only; need an old p4api.zip from the owner.

## 2026-11-17 round 2 (clean gate cbafb09d)
1315/3582 = 36.71% game functions, 21.23% game bytes (148,586 B), same-offset 1.745%, emit-order 12, 0 failing.
- Lanes: Pmesh +5, brush +6, XYWnd +27 (CXYWnd layout 0x120), select +12 / drag +1, g_vehicle_path +8.
- Recurring LTCG tie: GraphGetValueFromFraction 0x4832c0 (com_math) flips when new bodies are added
  (0x42b810, 0x45ebc0, 0x4532a0 all deferred for that). Candidate for data/ties.
- Main limit now: callees with LTCG register args whose callers are unwritten (Winding 0x447f60, Pmesh
  0x439620, ExpandBounds 0x487d50 callers, FUN_004267d0). Write callee+callers as clusters.
- AngleNormalize180: full g_vehicle_path draft gives 3 out-of-line calls, com_math callers still inline it.
- g_vehicle_path: 0x492130 matched only with params declared (src, dst): order is HYPOTHESIS.
- XYWnd 0x449760: masked bytes equal but tu_map says 159 B, built is 160 B -> check the inventory row.

## 2026-11-17 late state (clean gate after lanes A-D, radiant/main)
1256/3582 = 35.06% game functions, 20.74% game bytes (145,141 B), same-offset 1.722% (down from 1.776%:
new bodies shift later code; report-only), emit-order 13, 0 failing.
- Lanes merged: A scr_memorytree +14 (3,627 B), B assertive +16 (702 B), C q_parse +3 (486 B, uses the real
  I_strncat), D com_shared/q_shared +4 (1,070 B).
- Review debt: assertive.cpp has invented names (SymNode, HashNode, StrTable, HashString, MapParseError,
  ReadMapLine, SkipMapLines; rows tagged UNNAMED) -> rename to FUN_/UNKNOWN_ before src/. Lane B added
  `/GX` for assertive.cpp in data/flags.tsv (evidence: retail Intern has an SEH frame) -> owner review.
  MemoryNode tail field is HYPOTHESIS. scr_memorytree uses 30 `#line` directives for retail assert lines.
- Blockers, root cause = missing callers (both PINNED by retail call counts):
  1. Hunk_SetDataForFile 0x48a170: LTCG inlines Hunk_FindDataForFileInternal into its assert. With the 4 xmodel
     callers enabled it still inlines, and 5 xmodel rows flip -> reverted. Next: com_memory TU flags/order.
  2. AngleNormalize180 0x487300: 6 retail call sites, 3 in g_vehicle_path VP_UpdatePathFollower 0x4939a0;
     g_vehicle_path.cpp is a stub. Next lane: g_vehicle_path (generated_src has the whole file).
- D's asm defers: Com_Memcpy/Com_Memset/Com_Prefetch/fill helper are Q3 inline asm; outside the x87
  exception -> needs an owner ruling.
- Next lanes: g_vehicle_path, assertive rest (ParseMapFile 0x47ca40), Com_ParseExt 0x495060, MT_NodeInfoString
  inlining (blocks 4 scr_memorytree rows).

## 2026-11-17 state (clean gate after lane rounds 1+2)
1219/3582 = 34.03% game functions, 19.90% game bytes (139,256 B), same-offset 1.776%, emit-order 14, 0 failing.
- Round 1 merged: MainFrm +52 (bodies now in retail order), scr_stringlist +26, com_files +2.
- Round 2 merged: I_strncpyz + 5 FS callers + Dvar_SetBool row fix (a2), com_math +13 via x87 asm helpers
  in com_math.h (b3), xmodel_load_obj +6 (d2). 21 stale defer rows dropped.
- REFEREE CHANGE (announce): tools/verify.py banned_sources() now skips com_math.h, the one file allowed to
  hold the owner-approved x87 asm helpers (CLAUDE.md exception 2026-11-16).
- Not merged: radiant/claude-a (dvar, evidence-free defers), radiant/claude-b (defer-only), claude-c splines
  draft (unverified).
- Lane brief for workers: workspace/drafts/LANE_BRIEF.md.
- Next blockers, by payoff:
  1. Hunk_SetDataForFile 0x48a170: retail takes type in eax and name in esi. Blocks 6 xmodel rows.
  2. AngleNormalize180 0x487300: inlined in ours, called in retail. Blocks AngleDelta, LinearTrackAngle,
     DiffTrackAngle.
  3. CopyStringInternal 0x489dd0: inlined only into FS_AddFileToList. Link order is untested.
  4. splines idList/idStr register helpers: do them together with their callers.
- Untouched engine TUs with a CoD2rev source: scr_memorytree (16), assertive (~26), q_parse, com_shared.
  Also the q_shared DEFERRED blocks (Com_DefaultExtension, I_strncat, ParseConfigStringToStruct), now
  unblocked by I_strncpyz.

## Hint source: dev/generated_src.zip (from the opencod2 author, 2026-11-17)
Machine-generated pseudo-C of CoD2Radiant 1.0 itself: 4,720 functions, every one tagged `// @ 0x<addr>`.
4,271 of them are on addresses in our tu_map, including 523 of our unmatched game functions.
- Names are HYPOTHESIS: 3,737 come from agents, and only 219 of 366 agree with our matched names.
- Better names come from rtti (667), mfc-msgmap (122) and eh-tables (161).
- Most useful: `__usercall arg@<reg>` annotations, which map the LTCG register conventions (e.g. CXYWnd::Paste
  takes arg_0 in edi), plus struct layouts in include/recovered_types.h.
- Use it as a hint like Ghidra: never ship a name or type on it alone, and confirm against retail via show.py.
  Unpack it to dev/refrences/opencod2_radiant_generated/ (read-only), never into the worktree.

## x87 helpers (PINNED 2026-11-16, ~/cltest/t.c compiled in cod2-radiant-msvc71)
MSVC 7.1 never emits `fsincos` from C: `/O2 /Oy- /Op` gives `_sin`/`_cos` + `_ftol2`; without /Op it gives
separate `fsin` + `fcos`; `/QIfist` turns `_ftol2` into `fistp`. Retail com_math/dvar have single
`fsincos` and bare `fistp`, so the original used inline asm helpers (opencod1 g_debug_mp.c documents the same
for `fistp`). Blocks ~20 com_math + 3 dvar rows. Needs the owner to amend the CLAUDE.md "no asm" rule for
these helpers only (proposed text in the 11-16 session report); agents may not edit CLAUDE.md.

## Operand order rule (lane e, 2026-11-17)
PINNED. MSVC 7.1 /O2 sorts the operands of commutative fadd/fmul/add into a canonical order, so source term
order does not matter. Every permutation of `a[0]*n[0]+a[1]*n[1]+a[2]*n[2]` gives the same code (scratch tests
in `~/cltest/e/*.c`, run with `~/cltest/e/cc.sh`, /O2 /Oy- /Op, no /GL). The order follows the identity and
first-reference order of the memory leaves, not the text:
- `g=n[0]; g=n[1]; g=n[2];` then the dot gives z,x,y. `g=n[2]; g=n[0];` gives x,z,y. An extra read of
  `n[3]` between them also flips it. Writes to unrelated globals change nothing (o.c, n.c, k.c).
- Spelling the same address another way makes a new leaf: `const float *n = p->normal;` versus
  `p->normal[k]` flips the order (p.c c2/c3).
- The /GL build hashes it differently from the scratch build, so test the real function with make try.
  The lever is the same: use a local pointer alias for a member array in one place, or drop it.
Results:
- Winding_BaseForPlane 0x447c60 MATCH: `normal = p->normal` alias for fabs/VectorMA/scale/cross, but
  `DotProduct(vup, p->normal)` for the dot.
- Winding_Clip 0x448280 MATCH (the integer `add ecx,eax` swap had the same cause):
  `const float *normal = split->normal;` before the j loop.
- Winding_PlanesConcave 0x4481e0 still 95%: aliasing did not fix it (defer row). Retail reloads normal2
  inside loop 2.
- Not tried yet, same lever: brush 0x45f860 `[ecx+esi]`.
- Round 5 (all MATCH, same lever, first try each):
  - Base/index swap: Patch_GetAxisFace 0x427290 `[eax+ebx]` needs `face_t *faces = b->faces;` in the
    loop, then `faces[i].w`. `(b->faces + i)->w` does not change it.
  - fmul operand order in an inlined cross: Patch_MeshNormals 0x425910 needs the index named once,
    `int k1 = (k + 1) & 7; Vec3Cross(around[k1], around[k], normal);`. Pointer aliases for the rows
    made it worse (96-97%).
  - Load order of integer leaves: ConsumeQuat 0x4aae50 copies to locals first, `iQ[0..2] = out[0..2];`
    then `temp = 1073676289 - iQ[2]*iQ[2] - iQ[1]*iQ[1] - iQ[0]*iQ[0];` (the unused-looking iQ[4]
    is the hint). Stepwise `temp -=` on iQ gives 99%.
  - Register choice: DObjSetLocalTagInternal 0x4a6ff0 builds the child pointer in the same variable,
    `rotTrans += boneIndex;`, not a second `childRotTrans = &rotTrans[boneIndex]`.
  - Rule of thumb: when retail reuses one register for a value, use one variable; when it loads a
    leaf through a different base, give that base its own local.
- Still open: Winding_PlanesConcave 0x4481e0 (loop 2 x,z,y, 8 forms, 92-95%), Dvar_StringToValue
  0x48ca50 (epilogue order, `return value;` in the BOOL case no change).

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
