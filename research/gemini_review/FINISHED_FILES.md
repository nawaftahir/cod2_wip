# Finished-file checkpoint

Eleven translation units pass the full normalized code/helper/metadata audits.
`python3 tools/file_ledger.py` reruns every complete-file proof and writes
`ledger/files.tsv`; it rejects stale source verification or a failing audit.
The table covers all 102 game TUs in retail link order. VERIFIED is the track's
normalized source/code/metadata milestone. Image placement is separately PENDING;
whole-program SHA identity and boot have not been established.

Newly completed here: KeyValueSelectDlg, CapDialog, DialogThick, LstToolBar,
TextureLayout, EditWnd and RADEditWnd. Existing complete ScaleDialog, NameDlg,
NewProjDlg and DlgEvent are rechecked against the same fresh linked image.

KeyValueSelect has three authored routines / 360 B. An implicit destructor
matches its retail ESI-entry routine / 65 B; the proposed explicit empty
virtual destructor was the wrong source form. Its generated scalar / 33 B
and constructor EH code / 40 B are separate. No caller stub, ABI annotation
or noinline attribute is needed. Both imported SendMessage calls, security
cookie, 86 vtable slots, complete RTTI, messages and two HWND array bindings pass.

The real HWND array belongs in win_ent.cpp. GetEntityControls 0x476f10 writes
at 0x11299b0 and stops after 0x84 bytes (33 controls); key/value fields are
indices 27/29. Q3's later EntTab index 33 / EntLast 34 is not present in this
retail loop. entityw.h preserves the proven control indices and 33-entry count;
all 132 initial bytes and actual pointer bindings are checked. Gemini must keep
this shared definition when later reconstructing the remaining win_ent methods.

CapDialog's previously omitted 0x408010 / 13 B is an unreferenced string-length
routine. Plain C++ returning strlen emits every byte; name stays FUN_00408010
(UNNAMED). Two earlier loop forms and real outputs are saved, not repeated.
The added game ledger gain is three KeyValue methods / 360 B plus this / 13 B.
Existing destructor rows are unchanged; no new generated helper gets game credit.

The three small dialogs needed the real C++ exception/RTTI feature context.
/GX /GR preserves all old game rows and makes their generated scalars MATCH,
including real destructor callee identity; the previous noinline workaround
is not restored. Their complete type hierarchies, 86/86/92 vtable slots,
message callbacks and defaults pass. No EH code is emitted for these simple
classes, but /GX still matters to SDK preprocessing and code generation.

The common MFC header frame profile is now explicit in stdafx.h. Two independent
retail header bodies need frame omission: CSpinButtonCtrl's scalar / 30 B
and CObject::operator delete / 14 B. /Oy on the entire Rotate TU fixes the
former but breaks its ctor and DDX; that experiment is rejected. A PCH with
different flags warns C4653 and ignores the consumer flags, also rejected.
Compiling the real MFC headers with the measured frame setting and restoring
/Oy- for game bodies matches both helpers while retaining every game row.
The source uses normal MSVC optimization pragmas to model this measured
context; this does not claim the historical project used those exact pragmas.
Uniform stdafx.h inclusion prevents conflicting SDK inline contexts across TUs.
The editor default enables /GX /GR; every current authored routine retains MATCH.
/GX also avoids the ATL no-C++-exception fallback emitted by the old Scale flags;
atldef.h's _CPPUNWIND branches independently explain that extra helper.

TextureLayout's formerly mismatched Spin member is now verified completely:
78 virtual slots, constructor, SetRange, scalar and imported destructor, full
RTTI/base offsets, runtime-class name/size/schema/base and both Create methods.
Its shared destructor / 89 B and two EH groups / 58 B also match. The slot-77
CreateEx wrapper 0x4f56b7 / 55 B is bound to CSpinButtonCtrl; its previous
CToolBarCtrl alias was wrong. The target vtable and SDK export pin the correction.

EditWnd and RADEditWnd now share their identical declaration in EditWnd.h.
Their existing class metadata audits are extended to the factory and member
unwind code: Edit factory cleanup 0x524e40 / 10 B + handler 0x524e4a / 10 B;
RA ctor cleanup 0x524fc0 / 8 B + handler 0x524fc8 / 10 B; RA destructor
cleanup 0x524b50 / 8 B + handler 0x524b58 / 10 B. Each EH group has a 28-byte
FuncInfo and one 8-byte unwind record. Additional CRect/CWnd SDK header bodies
are separately verified and excluded from game credit; equal clones do not
claim unique historical ownership. The CObject delete binding is checked too.

All original/failed variants and actual outputs are retained in
.agents/codex/scratch/finish_files. No retail-byte patching, asm, fake caller,
forced noinline, invented register convention or comparison-mask change.
