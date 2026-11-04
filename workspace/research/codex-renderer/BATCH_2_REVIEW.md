# Renderer checkpoint 2 — 2026-09-26

## Fresh clean source packet

Six candidates, **95 code bytes**, are now in the clean Codex tree:

| Source | Functions | Target ranges |
|---|---:|---|
| src/material_queries.c | 3 | 0x10017300 (7B), 0x10017310 (16B), 0x10017320 (37B) |
| src/renderer_state.c | 3 | 0x1000c8d0 (6B), 0x1001d8f0 (15B), 0x1001d900 (14B) |

All six were freshly compiled together at `/O2 /Gy` with pinned MSVC 7.1.
All six pass the original relocation-normalized GLM referee (paths redirected
in memory) AND the stricter decoded-instruction / exact-length check.
All four relocation sites have explicit target-backed binding checks; a deliberate
wrong binding is rejected. Host behavioral assertions pass for all six functions,
including nonzero boolean normalization and refraction disable/flag cases.
This is **REVIEWABLE**, not independent integration approval or complete-track V3/V4/V5.

Replay: `python3 codex/renderer/verify_material.py`.
Initial combined fresh packet: `material_verify_he1rk87i/{packet.json,checks.log}`.
The verifier now also persists the original referee outputs on subsequent runs.
Objects live only in isolated verifier output folders, never canonical.

### Pinned facts

- Refraction dvar-pointer global: 0x101ce708; current int at pointee +8.
- Material technique-set pointer at +0x38; technique pointer at set +0x58;
  refractive flag is bit 0 of technique byte +4. Return uses AL only.
- Minimum-spec image-memory scalar: signed-int source agrees with opencod2;
  binary loads a dword at 0x101d0a78 into EAX.
- Precache-error flag: byte at 0x101d4d02; setter normalizes int to 0/1;
  getter returns a full-EAX int normalized to 0/1.
- State signatures/behavior cross-checked in opencod2 `r_image.c:128` and
  `r_model.c:179`. Target instructions, not its structural offsets, are authoritative.

The source hash in BATCH_1_REVIEW belongs to the earlier two-function revision.
The latest source hashes/objects are recorded in each fresh `packet.json`.

## CRT recovery and bounded failure work

- `baseline_p9txpec2`: 90 CRT candidates, 41 distinct source/flag builds;
  **88 shape matches / 14,752 bytes**, two DEFERs. Uses existing `crt_gfx.py`
  reproduction flags, not an unsupported claim of exact historical build flags.
- `baseline_9tqw8c6g`: all six previously failing CRT wrappers compile and shape-match
  with proper CRT headers/defines; **765 bytes**. They are CRT-related source,
  not six new renderer-engine functions. No source modifications required.
- `baseline_s6wi07wo`: six format-check leaves match with a bounded `/O1` probe.
  Binary `xor eax,eax; inc eax` return-1 pattern led to the probe; do not alter
  return types or ABI to repair the prior `/O2` length differences.
- Seven CRT ledger rows were excluded by the conservative inline-assembly filter;
  examine those separately as authentic library assembly, not invented C.
- CRT `_output` still DEFER: target inventory body 2010 bytes vs object section
  2042 bytes. Local labels were incorrectly treated as additional functions;
  COFF Type=0x20 now distinguishes functions. The remaining size/data-boundary
  discrepancy needs code/table evidence, NOT prefix acceptance.
- Correction in checkpoint 3: the second DEFER is `_setlocale_get_all`, split
  into 35+156 bytes by Ghidra. `_strcats` at 0x100f7b6a already shape-matches.

COFF type handling follows Microsoft's format specification:
https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#type-representation
The changed classifier helper has runnable synthetic function-vs-label tests.

## Client/renderer interface packet

`python3 codex/renderer/pin_refapi.py` regenerates `refapi_pinned.json` directly
from decoded GetRefAPI stores. It checks the initial import-copy/export-zeroing
instructions and API-version comparison against the anchor.

PINNED: import base 0x101d49c8, **169 slots**; export base 0x1076a880,
**108 slots = 98 populated + 10 zero**; API version **59 (0x3b)**.
Each populated slot includes its instruction address and exact target VA.
Names remain SUPPORTED reference labels, not recovered type signatures.
Some exported destinations are Ghidra labels rather than inventoried functions;
the packet records this instead of fabricating boundaries or dropping real exports.

The table is initialized at runtime in BSS, not raw file data. This packet gives
the client worker a binary-backed interface map without touching the client tree.

## Next work

Combined diagnostic inventory across the recorded runs: **173 unique shape
matches / 17,687 non-overlapping code bytes** out of 186 audited candidates.
That is 1.623% of the corrected `.text` denominator, NOT verified reconstructed
source progress. Most remaining historical claims, all bulk bindings, complete
data/link layout and the whole-binary checksum still require verification.
The six clean candidates overlap this inventory; do not add their 95 bytes again.

1. Independent review of the six clean candidates; no canonical edits before approval.
2. Review source/ABI/bindings for the recovered engine families. Prioritize meaningful
   dependency groups over adding tiny-function counts.
3. Investigate remaining CRT body/data boundaries and caller/callee groups with
   recorded flags. Do not rerun successful sweeps or accept prefix matches.
4. Recover import signatures and prepare the source-built DLL link probe. Whole-file
   identity still requires data, relocations, imports, exports and header/layout proof.

GLM's manifest and Claude's client source were left untouched. No retail binaries,
new SDK installations, Discord infrastructure or canonical imports were added.
