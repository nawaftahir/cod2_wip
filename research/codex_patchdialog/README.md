# Patch inspector takeover, 2026-11-01

Codex took over the parked Gemini draft without changing the worker tree.
The accepted subset uses stdafx.h and one target-pinned CPatchDialog declaration
(size 0x320). It contains fifteen game routines / 1,391 B. Two real registry
routines in win_main.cpp add 260 B. Both files remain PARTIAL.

The original PatchDialog inventory has 28 entries / 2,793 B. Of those, 23 /
2,594 B are game routines; the other 199 B are the 34-byte deleting scalar,
89-byte CTextureLayout lifetime helper and three SDK entries / 76 B. Eight game
entries / 1,203 B remain absent from canonical source, including three verified
bodies held with their unmatched dependency. Nothing gets game credit merely
for being a scalar, SDK inline, out-of-range initializer or BinDiff pair.

## What changed

The real 141-byte SaveRegistryInfo and 119-byte LoadRegistryInfo follow both
retail and the Q3/Kisak reference flow. They use the exact CoD2 registry key.
Load queries and closes the handle even if RegOpenKeyExA fails, as retail does.
The draft instead used a Quake 3 key and added a new early return. These are
behavior changes that relocation masking alone would not establish.

Using the real Load body also recovers the 121-byte DoPatchInspector: ordinary
LTCG gives the size pointer its observed EAX argument without an ABI annotation.
The full regression then exposed AdvCurve's old bool/const BYTE*/DWORD
FUN_0047a140 declaration. win_main.h now supplies the actual shared
BOOL/void*/long declaration to both callers. The callback must bind the real
SaveRegistryInfo instead of an unrelated unresolved symbol.

The message map now preserves retail's VSHIFT-before-HSHIFT contributor order.
The held draft's auto_inline suppression, duplicate CTextureLayout view and
unverified raw patch layout are not shipped. Full normal-source candidates,
proper shared-header proposals and actual trial output remain preserved under
.agents/codex/scratch/patch_takeover. The source and helpers are ordinary C++;
no assembly, retail-address loads, fake callees or replacement stubs are added.

## Measured hard remainder

- UpdateRowColInfo 0x424d50: best 199/199 B, 98%, first differing byte +0xaf.
  The last integer addition/load uses ECX where retail consumes EAX. Normal
  typed arrays, flat coordinate access, live reads, compound index assignment,
  unsigned index and a proposed globals-prefix context were tested. Do not
  repeat those variants. The two selection callbacks (10 B each) and
  GetPatchInfo (321 B) match only with this real body present; all four remain
  held together. Removing the body changes the callers' normal calling context.
- OnApply 0x424e30: best 208/213 B, first difference +0x11, retained in scratch.
  The full class fixes the earlier invalid reduced-class experiments, but the
  index/store ordering still differs. No near-match is canonical.
- UpdateSpinners 0x424f10 / 277 B and OnDeltaposSpin 0x424a50 / 40 B both match
  with the real Patch_SetTextureInfo candidate present. That helper is
  262/261 B, 81%, first difference +0xf: its rotation/shift/scale callees remain
  ordinary unresolved declarations, so the three calls retain extra stack
  arguments. The needed real callees are 0x432430 / 416 B, 0x4326b0 / 336 B,
  0x432800 / 328 B. The helper preserves the target assertion at Pmesh.cpp:5336;
  its candidate, callers and result are saved, not accepted.
- OnBtnPatchreset 0x424920 / 133 B: normal implicit lifetime context gives
  168/133 (+0x60); an explicit destructor gives 132/133 (+0x69), changes its
  helper to 96/89 B, and moves the scalar/vtable contributor to the wrong TU.
  That proposal is rejected. Keep the real CTextureLayout declaration/source
  ownership and solve its normal compiler/caller context. Do not restore the
  worker's per-function noinline pragma.

Kisak's later-target reference preserves a nested qv.texCoord spelling. Neither
qv.texCoord nor activeTexCoord occurs in the CoD2 image, so that shape is only
a type hypothesis here. Do not invent qv or the full QEGlobals object from it.
The proposed global prefix was an experiment, not a confirmed whole type, and
is not shipped. Resolve the real shared types/callees before another sweep.

## Proof and remaining limits

    python3 tools/verify.py --all
    python3 research/codex_patchdialog/test_partial.py
    python3 research/gemini_review/test_game_ledger.py
    python3 tools/meter.py --gate
    python3 tools/file_ledger.py

The partial proof checks the actual game/scalar code, 86-slot vtable, full RTTI,
all 14 message entries, imports/literals and the new bound registry calls.
Missing callbacks/callees and unbound globals are explicitly reported rather
than treated as valid bindings. Global lifetime routines at 0x526b90 (24 B)
and 0x527030 (11 B) are checked separately with global-object-qualified map lookup;
local _$E1/_$E2 names repeat between TUs and the LTCG map misattributes their
object names. Lookup pins the real global object and constructor/destructor. They do not add game credit. The core
compiler ledger records the unique 34-byte scalar separately.

Full SDK emission/EH inventory, all remaining game/helper bodies and real shared
global bindings are still required for FILE VERIFIED. Image placement, whole
executable SHA and boot remain pending. BinDiff setup, input hashes, useful and
rejected pairs are documented in research/codex_refdiff.
