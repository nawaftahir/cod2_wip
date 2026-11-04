# Dialog completion review

ScaleDialog is Codex's complete-file metadata finish of the previously accepted
three game routines / 103 B. The only build change is /GR for its named retail
RTTI; /GX is not required and no EH code is emitted. Separate generated deleting
destructor 0x43c740 / 33 B MATCHes; the implicit five-byte class destructor jumps
to the real CDialog destructor and the deleting helper directly calls CDialog,
as retail does. The retail contiguous range 0x43c710..0x43c7c0 contains 136 B
of routine code and 40 B of padding. No extra game bytes are credited.

Full retained manifest:

| File | Retail start | Bytes | Role / source |
|---|---|---|---|
| ScaleDialog | 0x43c710 | 36 | Constructor |
| ScaleDialog | 0x43c740 | 33 | Generated deleting destructor; AUTO |
| ScaleDialog | 0x43c770 | 61 | DoDataExchange |
| ScaleDialog | 0x43c7b0 | 6 | GetMessageMap |
| NameDlg | 0x424090 | 183 | Constructor |
| NameDlg | 0x424150 | 33 | Generated deleting destructor; AUTO |
| NameDlg | 0x424180 | 25 | DoDataExchange |
| NameDlg | 0x4241a0 | 6 | GetMessageMap |
| NameDlg | 0x4241b0 | 5 | OnOK |
| NameDlg | 0x4241c0 | 26 | OnInitDialog |
| CString header | 0x402740 | 3 | Conversion to const char pointer; equal shared clones, no game credit |
| NameDlg shared | 0x40a890 | 65 | Implicit destructor; inventory places shared body in dlgcamera |
| NameDlg EH | 0x525450 | 8 | Unwind CDialog base |
| NameDlg EH | 0x525458 | 11 | Unwind caption CString at +0x70 |
| NameDlg EH | 0x525463 | 11 | Unwind name CString at +0x74 |
| NameDlg EH | 0x52546e | 10 | Constructor EH handler |

NameDlg adds five game routines / 245 B. Its generated code is separately
verified: 33-byte deleting helper, shared 65-byte destructor and 40 B of EH
handler/cleanup code. The additional emitted CString conversion header body
(3 B) separately MATCHes 0x402740; identical clones exist, so this does not
claim unique historical TU ownership or add a ledger row. The 28-byte FuncInfo has three unwind records / 24 B;
all states and code pointer bindings are verified. Main interval is 336 B,
278 B of routine code and 58 B padding. No duplicate AUTO row is needed.

`test_dialog_completion.py` checks every game row with the unchanged referee,
all locally emitted source symbols, 86 vtable slots for each class against real
CDialog inheritance, complete RTTI hierarchy and base offsets, actual type_info
vtable binding, inherited runtime class, empty message maps, constructor data
bindings, generated helpers, EH tables and retail padding. Scale has no emitted
EH handler. Shared MFC/CRT code remains library accounting. Existing small-dialog
checks independently verify Scale's float defaults and DDX bindings.

Correct message maps (the original worker report had wrong addresses): NameDlg
0x545ab4 -> parent 0x52cae4 / entries 0x545abc; ScaleDialog 0x548444 -> same
CDialog parent / entries 0x54844c. Vtables: NameDlg 0x54595c; Scale 0x5482ec.
These are target evidence for tests, never hardcoded source addresses.

FILE VERIFIED is normalized source/code/metadata agreement. Absolute image
placement remains PENDING; whole-executable SHA and GUI boot are unfinished.

GDI correction: archive wingdi.obj independently reproduces 0x505804 / 42 B
(CGdiObject::Detach) and 0x50582e / 22 B (CGdiObject::DeleteObject). The latter
actually calls the former and imports GDI32 DeleteObject at IAT 0x528198;
wingdi.obj has the agreeing __imp__DeleteObject@4 relocation. Both the library
catalog and durable override are corrected. This resolves TexEdit's library
identity blocker; it does not reconstruct its missing CTexWnd caller group.
Evidence: test_gdi_bindings.py and build/gdi-reviewed.log. Do not regenerate the
whole library table to make this focused correction.

Commands: make gate; test_game_ledger.py; test_dialog_completion.py [scale|name];
test_small_dialogs.py; test_gdi_bindings.py; RADIANT_CI_NO_NOTIFY=1 tools/ci_local.sh.
Private proposal logs: .agents/codex/scratch/scale_complete and
.agents/gemini_review/scratch/namedlg_review. Final merged checks run on main.
