# Region B: 0x410120 - 0x43f460

23 ranges. Every carved function in the region (`carved.tsv`, 1,072 of them, 541 missing from the Ghidra
inventory) sits inside a range, and every range starts at a carved function start. 16 of them are tagged LIB.

## Boundary calls

- **GfxWrapper end 0x410e32.** 0x410e00 is not in the inventory. It frees the DLL handle 0x59c4fc and clears
  refexport 0x59c300, the same globals the loader 0x4105f0 fills. Region A puts the file start at 0x4100c0.
- **KeyValueSelectDlg 0x410e40.** The ctor sets vtable 0x540fb4 (CKeyValueSelectDlg). The file name comes from
  the class; Q3 has no such file.
- **MainFrm start 0x4110b0, not 0x411210.** 0x4110b0 is the compiler-generated ~CPrefsDlg. Its only callers are
  the CPrefsDlg scalar dtor and the atexit code 0x526d20, and nothing in the region writes it. I put it at the head
  of the file that defines the global (g_Preferences, Q3 MainFrm.cpp:66). Region A does the same for
  ~CFindTextureDlg. Two more cases follow the pattern: ~CPatchDialog 0x4244b0 sits right before the CPatchDialog
  ctor, and ~CSurfaceDlg 0x43c7c0 right before the CSurfaceDlg ctor. This breaks the README rule ("header code
  goes into the earlier file"). If the owner wants the rule applied, move these three to the previous file's end:
  LstToolBar, PatchDensityDlg, ScaleDialog.
- **MainFrm tail to 0x41f669.** The last own function is 0x41e160. Its string '%s - active_brushes' 0x541558 is
  inside MainFrm's reversed block, and it calls MainFrm's 0x41d5e0/0x41d930. Everything after it up to MapInfo
  is header code, and I checked each one:
  - CString Trim/Find/MakeUpper: 0x41e1a0..0x41e430.
  - idList and splines.h inlines: 0x41e440..0x41f070. The splines.h path is `e:\trees\cod2src\radiant\../src/...`,
    so it was included from a radiant file.
  - vec3 and MFC inlines.
  - CMainFrame::SetActiveXY inline: 0x41f3c0, which writes +0x7e0.
  - CGdiObject and CFont dtors.
  - CImageList and AfxGetResourceHandle inlines.

  The RTTI order (CLstToolBar, idSplinePosition, CFont, CGdiObject, idInterpolatedPosition, CFrameWnd,
  CMainFrame) also puts these classes with MainFrm.
- **MapInfo end 0x420926.** After CMapInfo::OnInitDialog (0x41fb20) comes ATL header code: lstrcmpiWFake,
  CharLower/UpperWFake, ??_H. MFC library code calls it; no game code does.
- **UNKNOWN_00420930 (HYPOTHESIS).** This is the brush/patch `contents` / `toolFlags` line code:
  - 0x420930 writes the line, 0x4209a0 parses it. brush and Pmesh call both directly.
  - 0x420b30..0x420b90 are wrappers that nothing calls.
  - 0x420bb0 calls Com_BeginParseSession 0x494830.
  - 0x420be0 is an inlined Com_EndParseSession; it uses the q_parse string 0x5539cc.
  - Tables 0x53d944 (weaponClip/nonColliding/detail) and 0x53d964 (splitGeo).

  Its strings form their own block, 0x545448..0x5454d0. That block sits after .\MapInfo.cpp, which is the last
  string of MapInfo's reversed block, and before the mesh string. So it is not the end of MapInfo.cpp.

  Two open problems:
  1. ATL code sits on both sides of it (0x41ff00..0x420900 and 0x420c00..0x420dd0), so it could also be
     static code from a shared header.
  2. In CoD4 radiant the same functions also follow mapinfo (KisakCOD addresses 0x42f6a0/0x42f710). That
     supports a real file named between "MapInfo" and "mesh", but I found no name.
- **mesh.cpp (SUPPORTED content, name is a guess).** The function order matches
  `refrences/q3map/src/q3map/mesh.c` except PrintMesh, which is missing. Nine of the functions are not in the
  inventory or were unnamed. The name comes from that reference file and fits the sort order (MapInfo < mesh <
  ModelDlg). The directory is unknown: it could be under common/, like `\trees\cod2src\common\texturevecs.cpp`.
  There are no asserts, so there is no __FILE__ to check.
  - Start 0x420ee0 is LerpDrawVert. The unreferenced vec3 inlines at 0x420e00..0x420e90 before it go to the
    previous range.
- **ModelDlg start 0x422f00.** This is GetRuntimeClass, vtable slot 0, and it returns classCModelDlg 0x545930.
  Before it are the CStringArray inlines 0x422eb0..0x422ef0.
- **UNKNOWN_00425080 (Perforce).** RTTI StdClientUser sits between CPatchDialog and CPrefsDlg. A file named after
  the class would sort after ScaleDialog, so the name is something between "PatchDialog" and "Pmesh". "Perforce"
  is the obvious guess but nothing confirms it. Two calls:
  - I put the p4 API inlines (StrBuf, Error, ClientUser ctor/sdd) at 0x425080..0x425130 at the head of this
    file. PatchDialog cannot plausibly use them.
  - The CSpinButtonCtrl inlines at 0x425030..0x425060 stay with PatchDialog, their first user.
- **Pmesh start 0x425770.** It sits right after the last Perforce function, 'sync' 0x425630, and the 4-byte
  getter 0x425760. Pieces of evidence:
  - The 'lightmap_gray' and 'Brush_RebuildBrush: backwards' strings sit above .\Pmesh.cpp in Pmesh's block.
  - Q3 PMESH.CPP has Brush_RebuildBrush followed by Patch_Rebuild.
  - The tail 0x4393c0/0x439450 copies texture coords over patchMesh_t (+0x382f) and calls the Pmesh static
    0x4269d0.
- **PrefsDlg start 0x439740.** This is the CPrefsDlg ctor, vtable 0x5477e4, run from global init 0x5269e0. The
  22-byte color-byte inline at 0x439720 before it stays with Pmesh.
- **TextureBar starts 0x43f040, not 0x43f460.** 0x43f040 is the CTextureBar ctor, vtable 0x548c5c, which the
  CMainFrame ctor calls at +0x2b8. Region C starts at 0x43f460, so the two rows join there.
- **SurfaceDlg tail 0x43da00..0x43ec77.** SurfaceDlg's assert lines run in order: 130..368 up to 0x43d630, then
  620..660 at 0x43dff0/0x43e1f0, then CSurfaceDlg class methods up to 0x43eac0. The AMBIGUOUS rows are SurfaceDlg
  functions with an inlined brush.cpp static (lines 4163/4170). TerrainDensityDlg and TexEdit come after, by class.
- The .rdata file order confirms every range: vtables and string blocks run MapInfo, flag strings, mesh string,
  ModelDlg, NameDlg, NewProjDlg, PatchDensityDlg, PatchDialog, Perforce, Pmesh, PrefsDlg, RADEditWnd, Radiant,
  RotateDlg, ScaleDialog, SurfaceDlg, TerrainDensityDlg, TexEdit, TextureBar. So does the RTTI descriptor order.

## Wrongly tagged LIB (game code; please drop from lib_funcs)
- 0x411080 ~CLstToolBar (sets vtable 0x541134)
- 0x4110a0 CLstToolBar::OnParentNotify (message map 0x5412a4 entry)
- 0x422f60 ~CModelDlg (sets vtable 0x545684)
- 0x423eb0 CModelDlg handler (calls 0x423d20, then CDialog::OnOK)
- 0x43c2a0 CRotateDlg::OnOK (calls OnApply 0x43c2b0)
- 0x43e920 CSurfaceDlg handler

## LIB tags that hold (header inlines, not .cpp code)
- 0x41eed0 idInterpolatedPosition dtor
- 0x41f450, 0x41f480 CGdiObject/CFont dtors
- 0x41f560
- 0x420ce0

## Header code found (addr: what)
- 0x4110b0 ~CPrefsDlg (implicit); 0x411390 ~CTextureBar (implicit, from ~CMainFrame); 0x4244b0 ~CPatchDialog;
  0x43c7c0 ~CSurfaceDlg.
- 0x41e1a0..0x41e430: CStringT inlines (Compare, Find, FindOneOf, MakeUpper/Lower, Trim): 0x41e250 TrimRight,
  0x41e2e0 TrimLeft.
- 0x41e440..0x41f070: idList<T> (util_list.h) and idSplinePosition/idInterpolatedPosition inlines (splines.h).
- 0x41f080..0x41f290: vec3 sub/length, sqrtf wrappers, MFC CWnd/CRect inlines.
- 0x41f3c0: CMainFrame::SetActiveXY. 0x41f3e0: CWnd::SetFont. 0x41f5b0..0x41f660: CToolBar/CImageList/AfxGetResourceHandle.
- 0x41ff00..0x420900: ATL conversion helpers (*Fake functions, CAtlSafeAllocBufferManager, ??_H).
- 0x420c00..0x420dd0: CTempBuffer. 0x420e00..0x420e90: VectorClear/Copy/Add/Subtract/DotProduct/Length.
- 0x422eb0..0x422ef0: CStringArray GetSize/RemoveAll/ElementAt/Add.
- 0x423ec0..0x424020: CString ctor/copy/concat.
- 0x425030..0x425060: CSpinButtonCtrl SetRange/ctor/sdd. 0x425080..0x425130: p4 StrPtr/StrBuf/Error/ClientUser inlines.
- 0x4394f0..0x439720: vec2/vec3 inlines, sinf/cosf/floorf wrappers, VectorCompare-epsilon (0x439620), color-byte set (0x439720).
- 0x43be50..0x43c0b0: CString operator+, CWnd inlines. 0x43ec30..0x43ec60: small inlines.

## Breaks the facts
- **Duplicate header copies.** The vec3-length inline exists twice, byte-identical: 0x41f0a0 (MainFrm tail) and
  0x4396d0 (Pmesh tail); see data/duplicates.tsv. A guarded header compiled into one unit can emit a static only
  once, so two copies fit separate objects better.
- **Where header code lands.** It sits after the code of the file that uses it: splines and CString after
  MainFrm, CSpinButtonCtrl after PatchDialog. The implicit dtor of a file-scope global sits at the start of the
  defining file. Both fit per-file objects, not one big unit. This adds to the RULES "Open" item; it does not
  settle it.
