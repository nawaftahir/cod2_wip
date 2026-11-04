# Region D: 0x453dc0 - 0x47c650 (Q3-core run, brush.cpp .. z.cpp)

37 rows, 17 files, no gaps or overlaps (checked against the inventory: 418 functions, 0 LIB).
Per row tag: PINNED rows 284 functions (136 with their own file's assert, the rest between pins of
the same file), SUPPORTED rows 129, HYPOTHESIS rows 5.

## New files found in the gaps (all fit the sorted Q3-core order)
- `mru.cpp` 0x46bcd0 (between map and points): Q3 MRU.CPP, same function order, 'File%lu' x4.
- `vertsel.cpp` 0x475190 (between select and win_dlg): Q3 VERTSEL.CPP, same order and strings.
- `win_main.cpp` 0x479560 (between win_ent and win_qe3): FindReplace, CMyColorDialog, DoMru,
  MFCCreate, registry/window-state helpers, Sys_UpdateStatusBar.
- Spelled lowercase because every pinned Q3-core file is lowercase in retail (`.\win_ent.cpp`,
  `.\brush.cpp`) while Q3 has `Win_ent.cpp`, `Brush.cpp`, `MRU.CPP`, `VERTSEL.CPP`, `Win_main.cpp`.
- Not present (no matching code): parse.cpp, radbsp.cpp, win_cam.cpp, win_xy.cpp, win_z.cpp,
  fnmatch/lbmlib/mathlib, brush_primit.cpp (unless the brush tail below is it).

## Boundary calls
- **brush.cpp tail 0x45f6a0-0x45f8b0 (HYPOTHESIS).** Five functions, no strings or asserts:
  0x45f6a0 snapped brush centre (EBX=brush, EDI=out; callers MainFrm x3, brush 0x45f240),
  0x45f720 recursive walk of an entity's brushes that frees and rebuilds a field (callers TexWnd 0x44171e
  and an inventory-missing fn at ~0x45f7b0 that calls it 3x), 0x45f7e0 loops g_SelectedFaces calling
  brush 0x45a830 (callers CamWnd, XYWnd, TexWnd), 0x45f830 vec3 lerp (EAX/EDX/ECX, **no callers at all**),
  0x45f860 per-axis vec3 compare with epsilon (only caller brush 0x454f30). Q3 CSG.CPP starts with
  Brush_Scale, which matches none of these. Could also be csg.cpp's head or a missing file sorted
  between brush and csg. I put it in brush.cpp because its callers are mostly brush.cpp.
- **drag.cpp start 0x4608a0**: AxializeVector, byte-checked against the Q3 body.
- **drag.cpp end**: Drag_MouseMoved/Drag_MouseUp (0x4623e0, 0x462760) continue drag past the
  order.txt end (0x4623d6). Then header code to 0x462ff0.
- **entity.cpp start 0x464bb0**: ValueForKey(epair_t *&, key) = first function of Q3 ENTITY.CPP.
  The string header code before it (0x464b10-0x464bb0) goes to eclass.cpp.
- **map.cpp start 0x467df0**: NormalFileWrapper's virtual comes before CheckForTinyBrush,
  Map_BuildBrushData and Map_FindClass (Q3 order). MemoryFileWrapper's virtual (0x46bbf0) sits at the
  map tail, where Q3 has MemFile_fprintf. So the wrapper classes are map.cpp code.
- **map/mru 0x46bcd0**: 0x46ba10 and 0x46ba50 use the prefab-stack globals that only map.cpp pinned
  functions use, so they stay in map. MRU starts at CreateMruMenu.
- **qe3 end / select start 0x46e4a0**: ParseHex (0x46e3f0, missing from the inventory) is called by
  the missing ParseNum at ~0x46e460 (calls at 0x46e46b/0x46e480). Then clearSelection, the first
  function of Q3 SELECT.CPP.
- **win_dlg/win_ent 0x476dd0**: 0x476d00 has the AboutDlgProc shape (WM_CLOSE and IDOK both call
  EndDialog(h,1)), and AboutDlgProc is the last proc in Q3 WIN_DLG. 0x476dd0 = FieldWndProc (calls
  AddProp), the first body in Q3 Win_ent.cpp. 0x476d70 (IDOK/IDCANCEL EndDialog) is position only.
- **win_ent/win_main 0x479560**: EntityWndProc's jump tables run to 0x479480, then CTabCtrl inlines.
  FindReplace (0x479560) is Q3 Win_main.cpp's second function (QE_ExpandBspString is gone).
- **win_main/win_qe3 0x47a3c0**: Sys_MarkMapModified ('%s *') is the first function of Q3 WIN_QE3.CPP.
- **z.cpp start 0x47aea0**: Z_Init. It is missing from the inventory but the bytes store z.origin = 0, 20, 46
  and z.scale = 1, exactly as Q3.
- **After z, 0x47c4e0**: this is FixWindowsDesktop, so **src/universal/assertive.cpp starts at
  0x47c4e0, not 0x47c650** (link/order.txt). It is the radiant variant without EnumThreadWindows.
  0x47c5c0/0x47c620 are recursive deleting destructors called only from assertive 0x47c760.
  0x47c560/0x47c580 (missing from the inventory, no callers) save and restore the cwd into 0x1141f78,
  which 0x47d4b0 just past assertive also uses.

## Header code found (goes to the earlier file's range)
| addr | what | why |
|---|---|---|
| 0x462b10 | idList<int>::Resize | util_list.h assert 'size > 0'; also called from splines 0x49b7a0 |
| 0x462bf0 | idList<int>::RemoveIndex | util_list.h assert 'index >= 0' |
| 0x462cc0, 0x462d10 | idPointListInterface::selectPointByRay (float x6 wrapper, vec3 version) | Q3 splines.h inline body, bestd = 8.0 |
| 0x462e60 | idPointListInterface::selectPoint | index range check, single/toggle, Append |
| 0x462f20 | idPointListInterface::isPointSelected | loop over selectedPoints |
| 0x462f60, 0x462fa0 | idList<int>::Remove, Append | call RemoveIndex / Resize |
| 0x464b10, 0x464b30 | CSimpleStringT::operator+= | already in data/auto_funcs.tsv |
| 0x464b50 | CSimpleStringT::AppendChar | called by both +=, PrepareWrite + AtlThrow(E_INVALIDARG); lib also calls it |
| 0x46bb70 | CSimpleStringT::GetAt | `0 <= i <= GetLength()` else AtlThrow(E_INVALIDARG) |
| 0x46bc50 | CMapStringToString::SetAt | operator[] then CString assign (afxcoll.inl) |
| 0x474d40 | CArray<SelFace,const SelFace&> ctor | vtable 0x54f83c; called by the dynamic initializer at 0x526d20 |
| 0x474d60, 0x474f10 | CArray<SelFace>::SetSize, SetAtGrow | callers select.cpp |
| 0x474fa0 | SerializeElements<SelFace> | CArchive::Write, 12-byte elements |
| 0x475090, 0x4750c0, 0x475170 | CArray<SelFace> vtable functions / free helper | classes.tsv |
| 0x475120 | CPtrArray::GetAt-style inline (4-byte elements) | AfxThrowInvalidArgException; lib x5 call it |
| 0x479480, 0x4794f0, 0x479510 (missing from the inventory) | CTabCtrl::GetCurSel / SetCurSel / InsertItem | SendMessage 0x130b / 0x130c, TCIF_TEXT |
| 0x479530 | CTabCtrl ctor | CWnd::CWnd + vtable 0x52e664 |
| 0x479540 | CTabCtrl vtable function (scalar deleting dtor) | classes.tsv |
| 0x479990 | CMyColorDialog scalar deleting dtor | auto_funcs.tsv (the class itself is win_main.cpp code) |
| 0x4794a0, 0x4794e0 (missing from the inventory) | vec3 compare (ECX/EDX) and a `[eax+0x790]` getter | probably inlines; unconfirmed |

## Things that break or stretch the stated facts
- **Register-argument inlines.** Several header inline members take `this` in a register: selectPoint and
  isPointSelected use ESI/EAX, CTabCtrl::GetCurSel uses EAX. RULES.md says plain /O2 keeps
  non-static and `inline` functions on the stack.
- **A register-argument function with no caller.** 0x45f830 uses register arguments but has no call
  site or address reference anywhere. Plain /O2 drops unreferenced statics.
- Both fit the open LTCG question in RULES.md, so the brush tail placement is especially weak.
- **Cross-file inline in the later direction.** The 0x479c00 DoMru body contains 'This will lose changes
  to the map', which is Q3's ConfirmModified in WIN_QE3.CPP, a later file.
- **OUTLIER 0x46eca0** (inside select.cpp) carries only `.\XYWnd.cpp`. It is called by select x6 and
  drag x5, sits between select pins, and stays in select.cpp. 0x46ea90 and 0x4739d0 (select) and 0x45b660
  (brush) also carry an inlined XYWnd assert.
- **Inventory holes** (code missing from functions_cod2radiant.json): ~0x45f7b0, 0x46bd70,
  0x46dfc0..0x46e280, 0x46e3f0, ~0x46e460, 0x4749a0, 0x474b70, ~0x476d50, ~0x476db0, 0x479480..0x479520,
  0x47aea0, 0x47c560, 0x47c580, 0x47c5b0, 0x47c610.
- **Bogus inventory entry.** 0x476433 starts inside RotateDlgProc 0x4763e0 (sizes overlap).
- **Proposal C** has 0x453d70-0x453dc0 as brush.cpp (HYPOTHESIS), so the brush start may move earlier
  than this region's 0x453dc0.
