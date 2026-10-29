# Three-dialog delivery and RotateDlg checkpoint

Reviewed immutable Gemini delivery 965e352: NewProjDlg, DlgEvent, TextureLayout.
Game source: 11 routines / 627 B. Generated code is separate, never game credit.
Target code, SDK types and Q3 dialog sources agree; no source addresses or asm.

| File | Game routines / bytes | Generated scalar / shared destructor | Status |
|---|---|---|---|
| NewProjDlg | 3 / 147 | 33 B / 36 B at 0x417cc0 | FILE VERIFIED, normalized code/metadata |
| DlgEvent | 3 / 175 | 33 B / 36 B at 0x409cb0 | FILE VERIFIED, normalized code/metadata |
| TextureLayout | 5 / 305 | 34 B / 89 B at 0x4249b0 | PARTIAL: member SpinButton scalar differs |

NewProjDlg constructor EH: cleanup 0x525430 / 8 B and 0x525438 / 11 B,
handler 0x525443 / 10 B, FuncInfo 28 B and unwind table 16 B.
DlgEvent: 0x525500 / 8 B, 0x525508 / 11 B, 0x525513 / 10 B; same table sizes.
TextureLayout destructor: 0x524620 / 8 B, 0x524628 / 11 B, 0x524633 / 10 B.
TextureLayout constructor: 0x524a40 / 8 B, 0x524a48 / 11 B, 0x524a53 / 10 B.
Each TextureLayout EH table is 28 + 16 B. All code, states and cleanup bindings
agree. All three derived classes' 86 vtable slots, complete RTTI/base offsets,
inherited runtime class, message maps, constructor data and subobject type
bindings pass. Additional emitted source symbols are explicitly inventoried.

Correct padding totals include internal gaps: NewProjDlg interval 224 B has
180 B routine code / 44 B padding; DlgEvent 240 = 208 + 32 B;
TextureLayout 400 = 339 + 61 B. The worker only counted each final gap.
Message-map parents are actual CDialog 0x52cae4, not the report's 0x52e4f0.
Removed another proposed duplicate NameDlg AUTO catalog entry; TextureLayout's
scalar is verified separately without changing inventory or game accounting.

The shared CSpinButtonCtrl header constructor matches 0x425050 / 16 B;
SetRange matches 0x425030 / 30 B, including actual SendMessage import binding.
But its scalar in the retail member vtable is 0x425060 / 30 B, while the new
header body is 33 B: first difference +0x0 (extra frame setup). Thus
TextureLayout is NOT accepted as a full file. Its real helper contributor /
compiler context remains pending; do not force noinline or change masks.

A separate library alias is conclusively corrected: 0x4f56ee / 56 B is the
CSpinButtonCtrl destructor, not CDialogBar. Its vtable store names 0x52dfdc;
retail RTTI says CSpinButtonCtrl. Archive winctrl2.obj bytes and three named
calls agree outside stock relocation fields. This fixes RotateDlg's real
200-byte shared destructor at 0x416350 without modifying source or the referee.

Codex RotateDlg: six game routines / 498 B (constructor, DDX, map getter,
OnOK, OnInitDialog, ApplyNoPaint) MATCH. Generated scalar 34 B and shared
200-byte destructor MATCH separately. Four unmatched rotation handlers stay
in scratch with the real Select_RotateAxis body at its proper select.cpp
location; no empty replacement handlers ship. RotateDlg remains PARTIAL.

Three genuine caller/callee trials are saved in .agents/codex/scratch/codex_rotate.
V1: OnApply 488/475 B, first +0x6; spins 166/165 B, first +0x20;
Select_RotateAxis 243/248 B, first +0xc. V2 adds actual matrix and sin/cos
source: matrix helper 0x485040 / 107 B MATCHes; SinCosDegrees is 286/306 B,
first +0x3 (pointer arguments optimized into registers). It is not retained.
V3 corrects Select_ApplyMatrix's real six-parameter signature: OnApply
478/475 B, first +0x35; spins 164/165 B, first +0x20; Select_RotateAxis
252/248 B, first +0x18. The matrix helper still MATCHes in this caller cohort.

Required unresolved source context: Select_GetMid 0x470c50 receives origin in
EAX; Select_ApplyMatrix 0x470ce0 uses the flip flag in BL; matrix helper
0x485040 receives ESI. These are observations, not proof that any convention
is impossible in normal source. Actual GetBounds 0x470a50 follows list next
at +4, reads a definition pointer at +0x14, then its bounds at +0x20/+0x2c.
Do not use a guessed plain brush layout. No class/struct prefix guesses,
ABI annotations, fake callers or helper bodies were retained. The temporary
select.cpp and com_math.cpp edits are restored; all candidates remain in scratch.

Proof: test_dialog_batch.py, test_spin_binding.py, test_game_ledger.py and
make gate. Research branch-decoding checks use actual instruction boundaries
because an E8 in a MOV immediate is not a call; stock verifier/masks unchanged.
Whole-image placement, final SHA and GUI boot remain pending for every file.
