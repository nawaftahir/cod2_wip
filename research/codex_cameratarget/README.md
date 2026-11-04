# Camera-target dialog

Reference: refrences/Quake-III-Arena/q3radiant/cameratargetdlg.cpp and .h.
Retail evidence: 0x402940 constructor uses dialog 183, int at 0x70, CString at
0x74; DDX at 0x402a20 binds radio 1367 and text 1033. Message map at 0x53d8b4
contains command 0x80b3 to the empty handler at 0x402a60. RTTI names the class.
All five dialog game bodies match (212 B). Generated scalar destructor and
CString/header methods are not added to game coverage. Their final physical
contributor order is not established by these matches.

The constructor initially failed CALLEE: data/lib_funcs.tsv falsely named
0x4ff4c3 CObject::GetRuntimeClass. Target instead dereferences its result as an
IAtlStringMgr and calls slot 3, then adds the 16-byte CStringData header.
The actual MSVC71 strcore.obj exports the matching AfxGetStringManager getter;
a runtime-class record is metadata, not that virtual interface. The persistent
library override corrects it. No verifier rules or masks changed.

/GX is needed for the target's construction cleanup; /GR emits the original
CCameraTargetDlg RTTI. Only this TU's row is added to flags.tsv. Run the pinned
image from this tree:

    python3 research/codex_cameratarget/test_dialog.py

This checks live RTTI, map parent/entries/callback, constructor vtable, empty
string and actual string-manager/SetString call bindings. Standard ledger and
compiler regression checks still apply. Proof logs and the bounded first-TU
trials stay in scratch/codex_1028_cameratarget and scratch/codex_1028_registry_group.
