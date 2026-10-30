# TexEdit continuation checkpoint

TexEdit remains PARTIAL, not accepted source. Main has 533/533 game matches,
61,404 / 699,591 game B (8.78%), 14.89% functions, 11/102 fully audited files,
48 unverified bodies, one order warning and no failures. Whole-image SHA and
GUI boot remain pending. This checkpoint adds no coverage.

The real source cohort is preserved under
`.agents/codex/scratch/finish_texedit/candidate/`, with `probe.py`, actual trial
logs `cohort-v1.log` through `cohort-v6.log`, and original/actual disassembly.
Canonical experimental bodies were returned to scratch after the bounded run.
No referee, comparison mask, flags, ledger credit or ABI annotation changed.

## Actual linked results

Six game routines in TexEdit match: constructor 0x43ee70 / 31 B, destructor
0x43eec0 / 87 B, map getter 0x43ef20 / 6 B, CtlColor 0x43ef30 / 40 B,
OnChange 0x43ef60 / 132 B, OnCreate 0x43eff0 / 68 B. Total: 364 game B.
Generated scalar 0x43ee90 / 33 B matches separately. These are draft results,
not a full-file audit or new accepted matches.

The real CTexWnd class declaration replaces the worker's bare class model.
Its runtime record and constructor pin size 0x100, embedded CTexEdit at 0x50,
CButton at 0xac and range flag at 0xfc; CTexEdit size is 0x5c. The CMainFrame
runtime record pins size 0x7e8; UpdateFilter reads its style field at 0x7a0.
Other MainFrame bytes remain explicitly opaque, with no invented member names.

Two supporting TexWnd routines now match: comparison callback 0x4405d0 / 31 B
and SortTextures 0x4405f0 / 27 B. The comparator needed ordinary local texture
pointers before comparing their name pointers at offset 4; the original nested
cast expression had different register loads. No full texture layout is claimed.

UpdateFilter 0x442d60 remains 239/242 B, 73% normalized equality, first +0x20
(the conditional displacement reflects a later three-byte size difference).
Retail reloads the CString length after reading the parent window style; the
candidate preserves the earlier length. Register allocation and the string
pointer reload around SetTimer also differ. The real OnChange caller now has
the required EDI/ESI register context without invented calling conventions.
This does not establish why UpdateFilter's later code differs.

## Bounded trials; do not repeat blindly

1. Reference-shaped filter logic; extern globals and nested comparator casts:
   seven TexEdit routines and sorting match; filter 239/242; comparator differs.
2. Real primitive/CString global definitions and ordinary comparator locals:
   comparator now exact; filter unchanged.
3. Reference's non-const CurrentStyle getter: unchanged.
4. Proper CMainFrame pointer type for the existing shared parent, consistently
   in definition/use: unchanged; restored the existing parent declaration.
5. Byte flag represented as char instead of bool: unchanged; restored bool.
6. Ordinary local variable for the style before its two comparisons: unchanged.

No compiler-impossibility or missing-caller conclusion follows from these tests.
Next resolve the actual register/CSE context and data ownership, then run the
full TexEdit vtable/RTTI/message map, CFont lifetime/EH and import-binding audits.
The sorted-array extent is not pinned; an unknown-bound extern stays in scratch.
CString global initialization/cleanup also needs its own target proof before
any definition can enter canonical source. Do not invent the array capacity or
claim the whole TexWnd file complete from these three routines.
