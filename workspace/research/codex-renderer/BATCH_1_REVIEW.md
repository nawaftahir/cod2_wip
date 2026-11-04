# Existing-source batch 1 and first clean source packet — 2026-09-26

Superseded by [BATCH_2_REVIEW.md](BATCH_2_REVIEW.md). The source hash below refers
to the original two-function revision, not the current three-function source.

## Reproducible work completed

`batch_existing.py` freshly compiled 96 ledger candidates in 91 source/flag
jobs in one pinned, network-disabled MSVC container. Inputs mounted read-only;
outputs isolated. Results: `baseline_w7psnpgf/results.json`.

First pass: 71 SHAPE_ONLY, 19 DEFER, 6 COMPILE_DEFER. A flag-parser test exposed
that `/Oy-` was omitted; corrected it and freshly rebuilt only the two affected
TUs (`tinyD.c`, `tinyH.c`). Both now shape-match; their results and full dependency
hashes are in `baseline_brlg4r7u/results.json`. The initial run recorded source
hashes but not all header hashes; it remains a diagnostic, not final proof.

Combined: **73 unique shape matches / 1,888 bytes**. This is NOT verified V2
coverage. Twenty-six first-pass shapes have no relocation bindings, but each still
needs source/ABI/boundary review. Six CRT-wrapper compilation failures need their
authentic CRT headers/flags. Other failures include altered lengths, shared-TU
boundaries, relocation differences and import-thunk handling.

PINNED denominator: the actual PE `.text` VirtualSize is **1,089,680** bytes
(`0x10a090`); raw size is 1,093,632. The old 1,091,728 denominator is incorrect.
Do not use function sums without deduplicating overlapping ranges.

## Clean candidate packet: material_queries.c

Source: `src/material_queries.c` (new Codex source; no GLM edits).
Source SHA-256: `a2f1f70ff48fc4640173ecba29ee87db84ac351e55ca077a167618021f55f22d`.
Container: `sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694`.
Compile: `cl /nologo /W3 /O2 /Gy /c src/material_queries.c /Fomaterial_queries.obj`.
Observed object SHA-256:
`b122c9d3f0092d6b37d70e8adf94665ad9bb533cb26f3f03295cc81742eb36eb`.

| Function | Address | Bytes | Binary-backed behavior |
|---|---|---:|---|
| R_GetMaterialName | 0x10017300 | 7 | stack argument; load its first dword into EAX; ret |
| R_GetMaterialSubimageCount | 0x10017310 | 16 | stack argument; zero-extend bytes at +15 and +14; multiply; ret |

Both objects have exact full function bytes, no relocation masking and no unresolved
bindings. Disassembly reviewed against source. Both target bodies end in ret;
the first is followed by INT3 padding, the second immediately by the next function
at 0x10017320. Explicit `/Gy` isolates the two object function sections.

Names and pointer-return semantics agree with
`refrences/opencod2/src/PC/gfx_d3d/r_material.c:455` and its subimage accessor.
This source uses opaque material pointers and only pinned offsets, not a guessed
complete Material struct. It preserves byte multiplication order seen in target.
PINNED API slots: GetRefAPI instruction 0x1001333d writes 0x10017300 to
0x1076a8b4 (slot 13); instruction 0x10013347 writes 0x10017310 to
0x1076a8b8 (slot 14). These are decoded target instructions, not just JSON names.

Recheck:

```sh
python3 codex/renderer/check_shape.py 0x10017300 codex/renderer/material_queries.obj _R_GetMaterialName
python3 codex/renderer/check_shape.py 0x10017310 codex/renderer/material_queries.obj _R_GetMaterialSubimageCount
```

Status: **REVIEWABLE**, 23 bytes of exact readable-source candidates. Not independently
approved, not canonical, not whole-track V3, not V4. No new binary-release percentage.

## Additional boundary/tool lesson

The refexport table at 0x1076a880 lies in virtual zero-fill, not on-disk initialized
data. GetRefAPI populates it at runtime. Do not try reading table slots as raw
file bytes. Legacy `rva2off` allows virtual-only offsets; raw range checks are
required. The two slot writes above are pinned; the rest of the exported JSON
remains an analysis aid until its writes are checked against GetRefAPI instructions.

## Next highest-value work

1. Independently review this clean packet, then expand material/API families.
2. Verify recorded globals/callees for the 73 shape candidates and resolve the
   failure classes in groups; do not endlessly tune isolated one-byte deltas.
3. Fresh-build authentic CRT sources using their recorded include paths/flags;
   keep CRT and engine byte accounting separate. No CRT redistribution assumptions.
4. Pin GetRefAPI import/export layouts and start the early source-built link probe.
   Header, data, import and relocation identity remain release requirements.

No Claude, GLM or release-monorepo files changed.
