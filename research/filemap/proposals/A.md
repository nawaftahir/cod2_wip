# Region A: 0x401000 - 0x410120

17 ranges. All of the region is covered. Function counts below are Ghidra functions only. Each range also holds code Ghidra missed (unlisted functions). The biggest is 4.8 KB of filtersettings handlers at 0x40e755-0x40fa50.

| tag | ranges | Ghidra fns (non-LIB) |
|---|---|---|
| PINNED | CamWnd, cmdlib, draw, filtersettings | 115 |
| SUPPORTED | AdvCurveDlg, cameratargetdlg, CapDialog, CommandsDlg, DialogInfo, DialogThick, dlgcamera, DlgEvent, EditWnd, EntityListDlg, FindTextureDlg, GfxWrapper (start) | 169 |
| HYPOTHESIS | UNKNOWN_00408f20 | 2 |

## New files in the region
- `radiant/CapDialog.cpp` (0x407f80): the class is CCapDialog. The Q3 file name is CapDialog.cpp.
- `radiant/filtersettings.cpp` (0x40ce20) is PINNED. `__FILE__` is `.\filtersettings.cpp`, all lowercase.
- `radiant/UNKNOWN_00408f20.cpp` sits between cmdlib and CommandsDlg (see below).
- `radiant/AdvCurveDlg.cpp`: the name comes from the registry key `Radiant::AdvCurveDlgPlace`. The class is `CAdvCurveEditDlg`, so `AdvCurveEditDlg.cpp` is equally possible. Either name sorts first, so the order does not change.
- `radiant/cameratargetdlg.cpp` and `radiant/dlgcamera.cpp` use the Q3 lowercase spellings.

## Boundary calls
- **AdvCurveDlg / cameratargetdlg = 0x402940**: this is the CCameraTargetDlg ctor. It is called from CDlgCamera 0x409ce0 (OnBtnAddtarget) and sets vtable 0x53d75c. The code at 0x4024b0-0x402930 is MFC header code (CSliderCtrl/CEdit/CButton ctors and scalar dtors, CMenu, small CWnd inlines). Under the "earlier file" rule it goes to AdvCurveDlg.
- **cameratargetdlg / CamWnd = 0x402ee0**: this is `CCamWnd::CreateObject` (IMPLEMENT_DYNCREATE, `new` + ctor 0x402f50, referenced from the runtime class at 0x53f11c). Q3 CamWnd.cpp starts with IMPLEMENT_DYNCREATE. The code at 0x402a70-0x402ec0 is CString header code.
- **The 37-function gap 0x4074f0-0x40818d is resolved.** It splits into:
  - 0x4074f0-0x4075bf: the last CCamWnd message handlers (message map 0x53f064..0x53f0f4).
  - 0x4075c0-0x407f7e: header code only (see the list below). It goes to CamWnd.
  - 0x407f80-0x40801d: CapDialog.
  - 0x408020-0x40818d: the start of cmdlib. It matches Q3 `libs/cmdlib/cmdlib.cpp` function for function: Error, Printf, ErrorNum, PrintfNum (handler pointers at 0x1233468..74), then the four Set*Handler functions (0x4080a0..d0, unreferenced), qblockmalloc, qmalloc, Q_filelength, SafeOpenWrite (0x408190) and SafeOpenRead (0x4081d0). After those comes the pinned SafeRead at 0x408210.
- **CapDialog / cmdlib = 0x408020**: Error() is the first function of the Q3 file. 0x408010 is a 13-byte strlen with its argument in eax and no references. Position puts it in CapDialog, but it could just as well be cmdlib's.
- **cmdlib / UNKNOWN = 0x408f20 (HYPOTHESIS for the exact address)**:
  - The CoD2 cmdlib also contains Q3 `common/cmdlib.c` code: qprintf, `_printf` (with "CoD2Map Process Server"), SetQdirFromPath, ExpandArg/Path/GamePath, copystring, I_FloatTime, Q_getwd (0x408ed0-0x408f10).
  - cmdlib's string literals sit in .rdata in exact reverse code order, from 0x53f4d4 (SafeOpenWrite) down to 0x53f2b4 (Q_getwd).
  - The strings of 0x408f50 ("fs_basepath", "fs_basegame", "fs_game", at 0x53f4d8..0x53f4ec) sit ABOVE cmdlib's block and below the CCommandsDlg vtable 0x53f4fc. Every other file in the region has its own contiguous .rdata block, and the blocks follow the file order. So 0x408f50 is a separate file between cmdlib and CommandsDlg.
  - 0x408f20 (a plain vprintf stub with 107 callers in universal/xanim code, so likely Com_Printf) and 0x408f40 (an empty function) have no strings. They go with the new file by meaning only.
  - The opencod2 cod2rad reconstruction puts an InitFileSystem in cmdlib.c. That is a guess in another tool, not evidence.
  - If files are sorted, the name falls between "cmdlib" and "CommandsDlg" (e.g. `com_*.cpp`). Nothing in the binary names it.
- **CommandsDlg / DialogInfo = 0x409640**: this is the compiler-made `~CDialogInfo` (called by scalar dtor 0x409760 and funclet 0x526d20). It sits at the top of the file, where Q3 defines `CDialogInfo g_dlgInfo;`, and ShowInfoDialog follows at 0x409690. The code at 0x4093a0-0x409630 (CString helpers, CListBox ctor/scalar dtor) is header code and goes to CommandsDlg.
- **DialogThick / dlgcamera = 0x409880**: `~CDlgCamera` for the global `g_dlgCamera`, matching the Q3 file start. `va()` from Q3 dlgcamera.cpp is not present.
- **dlgcamera / DlgEvent = 0x40bcf0**: the CDlgEvent ctor (vtable 0x53ff64). The code at 0x40bc30-0x40bcef is MFC header code (CComboBox/CScrollBar ctors and scalar dtors).
- **DlgEvent / draw = 0x40bde0**:
  - 0x40bde0 (called by Pmesh 0x42d720) and 0x40be30 (unreferenced) fill the vertex buffer 0x1129950 and flush it through `[0x59c45c]`, exactly like draw 0x40bf80..0x40c4a0. That is GL code, not dialog code.
  - The CDlgEvent message map getter 0x40bdd0 is DlgEvent's last function.
- **draw / EditWnd = 0x40c6b0**: `CEditWnd::CreateObject`. The last draw items are 0x40c620 (called only by draw 0x40c210) and 0x40c600 (an unreferenced vec4-set inline, which is header code).
- **EntityListDlg / filtersettings = 0x40ce20**: the CFilterSettings ctor (vtable 0x54048c), called by MainFrm and the dynamic initializer 0x526ad0.
- **filtersettings / FindTextureDlg = 0x40fc10**: `~CFindTextureDlg` for the global g_TexFindDlg, matching the Q3 file start. updateTextures follows at 0x40fc60. The code at 0x40fa50-0x40fc00 is header code (CString +=/Append, inlines called from MFC lib code, and CWnd::Default wrappers referenced from the CFilterSettings message map at 0x54083c/0x540854).
- **FindTextureDlg / GfxWrapper = 0x4100c0, not 0x410120**:
  - FindTextureDlg ends with DestroyWindow / OnSetfocusEditFind / OnSetfocusEditReplace (0x410090-0x4100b0), as in Q3.
  - 0x4100c0 (vsprintf + 0x47a5b0 with "%s") and 0x410110 (`jmp [0x5288e0]`) are only referenced as function pointers from GfxWrapper 0x4105f0.
  - Their "%s" (0x540fac) is the highest string of GfxWrapper's .rdata block. With strings in reverse order, that makes it the file's first string.
  - The proposal therefore adds row 0x4100c0-0x410116 to `radiant/GfxWrapper.cpp`. The owner of the next region should merge it.

## Header / compiler-made code found (addr: what, why)
- 0x402230, 0x402500: `jmp ??1CDialog` dtors. 0x402230 is called by MFC lib 0x4f3b09 and by EH funclets; it is likely CColorDialog's dtor, since 0x4021a0/0x402240 use CColorDialog.
- 0x402860: operator delete wrapper (39 callers from EH funclets).
- 0x402870/0x4028a0/0x4028d0: CSliderCtrl/CEdit/CButton ctors (CWnd ctor + vtable). Their scalar dtors are 0x402880/0x4028b0/0x4028e0.
- 0x4024b0, 0x4024d0, 0x4024e0, 0x4024f0, 0x402850: tiny virtuals referenced from 35 to 112 MFC vtables (CWnd inline virtuals).
- 0x402b30, 0x402be0, 0x402c60, 0x402c90, 0x402e20, 0x402e90: CString internals (CStringT ctor from `const char*`, string manager Release/Clone). They are called from nafxcw.lib too, so the COMDAT is shared with the library.
- 0x4075c0 Format / 0x4075e0 FormatV (calls _vscprintf + _vsprintf).
- 0x407690/0x4076a0: inline thunks to _vsprintf/_vscprintf. Already LIB.
- 0x407860: CStringT(const char*) with the resource-ID check.
- 0x407990: LoadString internals.
- 0x407a60/0x407aa0: AtlGetStringResourceImage (FindResource/LoadResource/SizeofResource).
- 0x407b00..0x407c40: ATL atlconv.h thunks.
  - 0x407b30 = _AtlGetThreadACPThunk (GetVersionEx, then installs 0x407ba0 or 0x407bb0 into g_pfnGetThreadACP at 0x5984fc).
  - 0x407ba0 = _AtlGetThreadACPFake (returns 3).
  - 0x407bb0 = _AtlGetThreadACPReal (GetLocaleInfo 0x1004).
  - 0x407b00/0x407c40 = W2A/A2W helpers.
- 0x4076e0, 0x407730, 0x40abc0, 0x40ac60, 0x40b780: idList<T> members. They use the `util_list.h` / `splines.h` index asserts with `e:\trees\...` and `e:\trees\cod2src\radiant\../src/universal/splines/splines.h` paths.
- 0x40af30, 0x40b010, 0x40b3e0: idStr (util_str.h) members.
- 0x40aaa0: idCameraDef::clear() (string "camera01", the splines.h inline). It is called from MainFrm, splines.cpp and dlgcamera.
- 0x40bb70, 0x40bbe0, 0x40af90: idCameraDef getEvent/getTarget-style inlines ("index >= 0 && index < events.Num()", "...targetPositions.Num()").
- 0x40b4d0..0x40bb00: idPointListInterface / idCameraPosition / idFixedPosition inline virtuals, dtors and scalar dtors (vtables 0x53f9d0, 0x53fa4c, 0x53f9f4, plus derived vtables at 0x5412f4/0x54134c).
- 0x407c60, 0x407c90, 0x407cb0, 0x407cd0, 0x407cf0, 0x407d10..0x407dd0, 0x407f40, 0x407f60, 0x40c600: q_shared-style vector inlines (Vec3Avg, VectorMA, Vec2/Vec3Set, FastSinCos, Vec3Add, Vec3Scale, Vec4Set).
- 0x407e00..0x407f30, 0x4076b0, 0x4076c0, 0x40fbe0..0x40fc00, 0x4100a0-style: CWnd inline wrappers (GetParent + FromHandle, CImageList FromHandle, AfxGetModuleState()->field, `Default()` with `ret 4/8/0xc`). The ones at 0x407f00/0x407f10 are targets in the CCamWnd message map.
- Implicit dtors appear at the first point of need:
  - ~CDlgEvent 0x409cb0 sits inside dlgcamera (OnBtnAddevent has a local CDlgEvent).
  - ~CNameDlg 0x40a890 sits inside dlgcamera (OnFileOpen).
  - ~CDialogInfo 0x409640, ~CDlgCamera 0x409880 and ~CFindTextureDlg 0x40fc10 sit at the top of their own files, where the global object is defined.

## Possible LIB mislabels (data/lib_funcs.tsv, owner to check)
The LIB byte matcher probably masks the vtable relocation. These three set game vtables:
- 0x402ff0 "LIB": `mov [ecx],0x53eb24; jmp ~CWnd`. This is `CCamWnd::~CCamWnd` (CCamWnd vtable).
- 0x40c750 "LIB ??1CObList": `mov [ecx],0x54012c; jmp ~CWnd`. This is `CEditWnd::~CEditWnd` (CEditWnd vtable).
- 0x40ba20 "LIB": `mov [ecx],0x53f9f4; jmp 0x40b930`. This is `idFixedPosition::~idFixedPosition` (it chains to ~idCameraPosition).

## Observations against or beyond the README facts
- **Each file has its own .rdata block, and the blocks follow the code's file order.** Inside a block there are vtables, then string literals in reverse code order, then the message map. This held for every file here (CamWnd, CapDialog, cmdlib, CommandsDlg, DialogInfo/Thick, dlgcamera, DlgEvent, draw, EditWnd, EntityListDlg, filtersettings, FindTextureDlg, GfxWrapper). It is a usable boundary tool: the first function of a file uses that block's highest string.
- **Strings from header inlines land in the block of the first file that uses them.** Examples: util_list.h asserts in the CamWnd area at 0x53d8ec; "camera01" in dlgcamera's block. With the implicit-dtor placement above, this suggests header and compiler-made code IS emitted near its first use in this binary. That partly contradicts the README note.
- **All the code here uses LTCG-style custom register conventions** (arguments in eax/ecx/edx/ebx, e.g. 0x407c60, 0x4076e0, 0x408d60).
- **Unreferenced functions are kept**, so the build is /OPT:NOREF. Examples: 0x408190, 0x4080a0..d0, 0x407f80, 0x408010.
- **Identical functions are not folded.** Several identical `jmp ~CDialog` dtors exist side by side (0x402230, 0x402500, 0x407fd0, 0x409830).

## Open questions
1. The name of UNKNOWN_00408f20 (Com_Printf stub + FS/dvar init/shutdown glue). It may also start at 0x408f50, if the vprintf stub 0x408f20 and the empty 0x408f40 belong to cmdlib.
2. AdvCurveDlg.cpp or AdvCurveEditDlg.cpp.
3. Whether 0x408010 (unreferenced strlen) is CapDialog's or cmdlib's.
