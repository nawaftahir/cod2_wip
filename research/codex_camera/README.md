# Camera-target dialog complete-file audit

cameratargetdlg.cpp is FILE VERIFIED under relocation normalization. The
five existing game routines / 212 B remain unchanged. There is no new game
function or byte credit from this audit.

All 27 original in-range entries / 1,243 B are accounted for: five game
routines / 212 B, deleting helper / 33 B, and 21 ATL/MFC header routines /
998 B. The emitted source also has 29 SDK labels, including shared bodies
outside the contiguous interval. manifest.json records all original entries
and the representative for each emitted SDK label. Equal header copies do
not claim unique historical TU ownership or exact image placement.

The proof recursively checks 40 source/helper pairs with actual callee
bindings, all 86 virtual slots, the complete named RTTI hierarchy/base offsets,
the inherited CDialog runtime record and CWnd parent, command 0x80b3 callback,
DDX/default/empty-string bindings and all original interval padding. Source
sizeof 0x78 and member offsets 0x70/0x74 agree with the retail caller at
0x409ce0: after its 12-byte EH frame it reserves exactly 0x78 bytes and passes
the object at EBP-0x84. The one-byte empty callback is a real retail RET.

Constructor cleanup is separately checked: 0x5251a0 / 8 B and 0x5251a8 / 11 B,
handler 0x5251b3 / 10 B, a 28-byte FuncInfo and 16-byte unwind table. The
36-byte destructor has no additional EH contributor. The shared library,
header and generated routines do not add game coverage.

The audit also verifies complete memcpy/memmove archive sections at 0x4de280
and 0x4d7c40: 829 bytes each, all internal jump-table relocations and actual
linked callee identities. The inventory splits the memmove section, so a
prefix/function-boundary check alone was insufficient. Both complete sections
match the original libcmt.lib members; inventory and referee remain unchanged.
Library memcpy and memmove are distinct copies, not a reason to enable ICF.

Representative selection checks the whole callee graph; a five-byte JMP to
an unrelated routine is not a valid SDK match. The helper manifest was refined
with these checks before acceptance. No source body, optimizer attribute,
compiler flag, class view, callback placeholder or comparison mask changed.

Run inside the toolchain image:

```
python3 tools/verify.py --all
python3 research/gemini_review/test_game_ledger.py
python3 research/gemini_review/test_camera_complete.py
python3 tools/file_ledger.py
```

The file ledger now includes this proof, for 13/102 completed-file audits.
Game progress stays 548/548 / 64,638 B (9.24%), functions 15.32%, with zero
failures, 48 unverified bodies and one order warning. Absolute placement,
whole-executable identity and GUI boot remain pending. Actual discovery/trial
logs are preserved in scratch/finish_camera.
