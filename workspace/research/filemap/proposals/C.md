# Region C: 0x43f460 - 0x453dc0

11 ranges, 10 files plus the head of brush.cpp. Inventory functions in the region: 249 (5 LIB). Of the 244 non-LIB:
PINNED 48 (46 PIN plus Undo_Undo/Redo, which push Undo.cpp and an inlined entity.cpp path), SUPPORTED 184, HYPOTHESIS 12
(header-code candidates whose file is only implied by position). Two more HYPOTHESIS functions (0x453d70, 0x453da0)
are not in the inventory.

## Sort key
`common/texturevecs.cpp` sorts by file name with case and directory ignored:
TexEdit (0x43ee90, CTexEdit) < TextureBar < **TextureLayout** (new, 0x43f710) < texturevecs < TexWnd < Undo < VehicleDlg <
VertEditDlg < Winding < XYWnd < ZWnd, then brush.cpp. Nothing from Q3's TextureLoad, ToolWnd, WaveOpen or VERTSEL
appears in the slots where those names would sort. The win_* files are in the lowercase run (win_dlg 0x475cc0), so none
fall here.

## Boundary calls
- **0x43f710 TextureBar | TextureLayout.** 0x43f6f0 is slot 89 of the CTextureBar vtable (0x548c5c), so it stays in
  TextureBar. It is also referenced from a second vtable near 0x530ef8, so it may be an MFC inline virtual. The CTextureLayout
  constructor at 0x43f710 is the first CTextureLayout function. The class has no DECLARE_DYNAMIC (vtable slot 0 is lib code).
- **0x43f8a0 TextureLayout | texturevecs.** 0x43f8a0 is TextureAxisFromPlane (it reads the base-axis table at 0x53db0c). It
  takes register arguments (ecx=normal, edi/esi=outputs) and is called from texturevecs 0x43fb2b, Pmesh 0x437a3a and brush
  0x45eccb. KisakCOD texturevecs.cpp puts Ed_Normal_Calc first, followed by Ed_texturevecs with the normal/xv/yv asserts on
  lines 46-48. Retail 0x43f9f0 pushes lines 0x2e/0x2f/0x30, the same numbers. SUPPORTED, not PINNED (KisakCOD placed this
  file by inference too).
  Note: Pmesh.cpp comes before texturevecs, yet calls this static with register arguments. That only works with a forward
  `static` declaration (from a header) or LTCG. It adds one more case to RULES "Open (evidence)".
- **0x4405b0 texturevecs | TexWnd (unsure).** 0x4405b0/0x4405c0 are an unreferenced implicit ctor/dtor of a type with a
  CString at +0x10 (this in esi/ecx). A CString type cannot come from common/ code. 0x4405d0 is a qsort comparator
  (_stricmp on ->name) used by 0x4405f0, which sorts the array at 0x1234d70 (count at 0x1234d6c; pinned TexWnd code makes
  15 references to these globals). If 0x4405b0/c0 are classed as header code, the README rule would move them to the end of
  texturevecs, and TexWnd would start at 0x4405d0.
- **0x4431f0 TexWnd | Undo.** The last CTexWnd method is 0x443140. After it, 0x443170-0x4431df is header code (below).
- **0x445050 Undo | VehicleDlg.** Undo.cpp ends in Q3 order: RedoAvailable 0x445020, then UndoAvailable 0x445030. 0x445050 is
  CVehicleDlg::GetRuntimeClass (IMPLEMENT_DYNAMIC at the top of the file).
- **0x4460e0 VehicleDlg | VertEditDlg.** This is CVertEditDlg::GetRuntimeClass. 0x446030-0x4460d8 before it is header code.
- **0x447a50 VertEditDlg | Winding.** 0x447a50 is Plane_Equal (flip negation, double dist at +0x10), followed by
  Plane_FromPoints and Point_Equal. Q3 Winding.cpp starts with the same three functions, then Winding_BaseForPlane (the
  0x447c60 pin). The function before the boundary, 0x447690, is a pinned CVertEditDlg method.
- **0x4493f0 Winding | XYWnd.** This is CXYWnd::CreateObject; IMPLEMENT_DYNCREATE comes before the ctor, as in Q3 XYWnd.cpp
  line 114. 0x4493c0 and 0x4493d0 just before it are header code.
- **0x453660 XYWnd | ZWnd.** This is CZWnd::CreateObject. The XYWnd tail follows the Q3 order through AreaSelectOK
  (0x4532a0). 0x4532c0/0x4532f0 are CXYWnd forwarders to g_pParentWnd (key handlers). 0x453300-0x453652 is a header-code
  cluster.
- **0x453d70 ZWnd | brush (HYPOTHESIS).** The CZWnd methods end at 0x453d60 (Q3 ZWnd.cpp ends with OnKeyUp; CoD2 adds
  0x453d30/0x453d60). Two unreferenced allocators follow: new(0x28) zeroed, and new(0x48) zeroed. They do not fit CZWnd.
  The first brush.cpp pin (0x453dc0) asserts line 54, and Q3 Brush.cpp has Brush_Alloc at line 46, so I put them at the
  head of brush.cpp. They could also be header code, which would put them at the end of ZWnd.
- The TextureBar range starts at the region edge (0x43f460). The file itself starts earlier (CTextureBar methods from
  0x43f120, maybe 0x43f040); that call belongs to the previous region.

## Header code found (addr: what, reason)
- 0x43f6f0: forwards to a virtual (`jmp [eax+0x168]` with a WORD argument widened). It sits in two vtables, so it is likely
  an MFC inline virtual.
- 0x4405b0 / 0x4405c0: implicit ctor/dtor of a struct holding a CString at +0x10. Unreferenced.
- 0x443170: `mov eax,[eax+0x7a0]; ret`. Register argument, unreferenced, owner unknown.
- 0x443180: CWnd::ShowScrollBar inline (calls ::ShowScrollBar(m_hWnd, ...)).
- 0x4431a0: `mov [eax+0x50],ecx; ret`. Register-argument setter, unreferenced.
- 0x4431b0: CRect::SetRect inline (calls ::SetRect(this, l, t, r, b)).
- 0x4431d0: CPoint/CSize(int, int) ctor.
- 0x446030: cdecl comparison of two CString refs, returning `_mbscmp(...) != 0` (CString operator!=).
- 0x446050: CStringT::Compare (already in data/auto_funcs.tsv).
- 0x446070: lib_funcs.tsv names it `?Invoke@XAccessible@CWnd...`, but the code is `push ebp; mov ebp,esp; pop ebp; jmp
  _mbscmp`. 0x442d50 has the same label. Both look mislabeled (the relocation mask made them collide). It is likely a CStringT
  inline.
- 0x446080: CSliderCtrl::GetRangeMax inline (SendMessage 0x402). The lib's CSliderCtrl::GetRange calls it.
- 0x4460a0: SendMessage(hwnd, 0x41a, 0, eax). CWnd-control inline with a register argument.
- 0x4460c0: float lerp `(1-t)*a + t*b`. cdecl, unreferenced.
- 0x4493c0: placement `operator new(size_t, void*)` (returns its 2nd argument).
- 0x4493d0: the C++ `float fabs(float)` overload.
- 0x453300: a CString member returning a CString (Left/Mid shape). MFC library code calls it 12 times, so the linker kept this
  unit's COMDAT copy.
- 0x453360: CString operator== (`_mbscmp == 0`).
- 0x453380: calls virtual slot 10 with (0,0,0). 0x453390: CWnd::OpenClipboard inline.
- 0x4533a0 / 0x4533b0: CWaitCursor dtor/ctor. These are afxwin2.inl inlines, tagged LIB because they byte-match the library copy.
- 0x4533d0 (2D dot, ecx/eax), 0x4533e0 (zero 4 dwords, eax), 0x4533f0 (float to int via x-0.5), 0x453410 (compare 4 floats,
  ecx/edx), 0x4534a0 (null-safe getter, ecx): register-argument leaves, so probably game-header `static inline` functions.
- 0x453460 / 0x453480: the `float floor/ceil(float)` C++ overloads (they call 0x4da7f0 on a double).
- 0x4534b0 / 0x453610: ctors of a {int, CString, int} struct (ebx/esi argument). 0x453530, 0x453540, 0x453640: zero-inits.
  0x453560: copy-out, called by CXYWnd. 0x4535d0 / 0x4535e0: setters. 0x4535f0 / 0x453600: empty functions.
- 0x453580: CPoint(DWORD) ctor (MAKEPOINTS form). 0x4535a0: CWnd::GetCapture inline. 0x4535b0: CPoint::operator==.

## Other findings
- **The inventory misses many functions here.** A padding-start scan finds about 150 candidates (a few are jump tables). Real
  misses include:
  - pinned TextureBar 0x43f5d0
  - the GetRuntimeClass/GetMessageMap of every class (0x4428c0, 0x4429e0, 0x445050, 0x445290, 0x4460e0, 0x446400, 0x449450,
    0x4496a0, 0x4536b0, 0x453710)
  - Undo_RedoAvailable/UndoAvailable
  - about 45 CVehicleDlg button handlers (0x445510-0x446010)
  - Winding_Free 0x447f50, RemovePoint 0x448020, IsHuge 0x448190
  - most of the XYWnd tail (0x452900-0x4530f0)
  - the CZWnd ctor 0x4536c0
  The file map is unaffected, but anything that counts functions (queue, meter) undercounts this region.
- **Unreferenced functions are kept:** 0x4405b0/c0/f0, 0x440610, 0x443170-0x4431d0, 0x4460c0, all the Winding_* functions
  nobody calls, 0x453d70/0x453da0. This fits "no /OPT:REF".
- **0x451eb0 (tu_map OUT q_shared.cpp) is an XYWnd function.** It works on the view axes at +0xa4/+0xa8 and contains an
  inlined q_shared static (assert at line 0x615, 'plane != out'). XYWnd 0x451e00 and brush call it. It stays in XYWnd; this
  is not a range break.
- **Dynamic initializers** for the global CVehicleDlg and CVertEditDlg live outside the file ranges, at 0x526a50 and
  0x526a30 (they call the ctors 0x445060 and 0x4460f0, then atexit).

## Open questions
1. Is 0x4405b0/0x4405c0 (CString-holding implicit ctor/dtor) TexWnd's own type, or header code that belongs to the end of
   texturevecs?
2. Are 0x453d70/0x453da0 brush.cpp's first functions, or header code at the end of ZWnd?
3. How is TextureAxisFromPlane, a static in texturevecs, called with register arguments from Pmesh, which comes earlier in
   the unit? (Same question as the RULES LTCG item.)
