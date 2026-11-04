# Renderer checkpoint 3 — 2026-09-26

## Clean engine source

Added `src/model_bounds.c` and `src/fog_state.c` with target-backed behavior and
corrected names. Clean packet now contains **13 functions / 356 bytes**, seven
source files. Latest fresh combined build:
`material_verify_urxhq2dm/{packet.json,checks.log}`.

All thirteen match the original GLM relocation-normalized referee and stricter
full-length/site/binding checks. Five host fixture programs pass; wrong global
bindings are rejected. No independent acceptance, whole-track link or V4 claim.

| Target | Old GLM name | Corrected supported name | Pinned behavior |
|---|---|---|---|
| 0x1001d910, 77B | R_MarkFragments | R_ModelBounds | nullable bounds pointer; copies six float-width fields into two vec3 outputs; zeroes outputs on null |
| 0x1000bb10, 22B | R_ArchiveFogState | R_ClearFogs | zero 160 bytes at 0x101d616c, zero index at 0x101d620c |
| 0x1000bc40, 35B | R_SwitchFog | R_ArchiveFogState | two cdecl callback calls via file +0x10: (file,160,settings), then (file,4,index) |

Reference cross-checks: Mac `r_model.c:270` and `r_fog.c:11,66`.
Target callback ABI is confirmed by three pushed args per call and caller cleanup
of 24 bytes after both calls. The callback pointer is loaded again for the second
call; the host test changes it during the first call to verify that behavior.
The fog source keeps storage opaque until all per-field layouts are pinned;
it does not invent a complete GfxFog or MemoryFile struct.

## Full CRT blocks: inventory defects resolved, gates not weakened

### _output: 2,042-byte source-built block

`python3 codex/renderer/check_crt_block.py`

The source compiler emits **2,010 instruction bytes + eight switch-table pointers
(32 bytes)** in one COFF section. Target has the same adjacent code/table block;
next function begins at 0x100face0. Original inventory omitted the table.

All full-block bytes match after relocation normalization; relocation sites/types
also match. Every switch-table pointer resolves exactly to its same-function code
label. No ignored suffix, emitted bytes or source/binary patching. Positive and
wrong-table-destination fixtures pass. Evidence: `crt_output_block.json`.
Twenty-five external relocation sites still need binding review. Authentic source
remains `glm/crt71/output.c`, referenced locally, not copied into release source.
Update: checkpoint 4 binds five data sites; twenty external sites remain.

### _setlocale_get_all: complete 191-byte function

`python3 codex/renderer/check_crt_locale.py`

The second CRT DEFER was misreported as _strcats. **_strcats at 0x100f7b6a already
matches** in the fresh CRT batch. The real remaining helper, _setlocale_get_all,
was split by Ghidra into 35 bytes at 0x100f7cf3 and 156 bytes at 0x100f7d16.
The original ledger explicitly used a prefix match for its first 35 bytes.

Joining the contiguous ranges gives exactly the freshly compiled helper's 191
bytes, ending at the next function 0x100f7db2. Its allocation-prefix branches lead
into the second range. The complete body now matches instruction-aware relocation
normalization and full-length comparison. Correction exists only in the audit's
in-memory inventory view; original GLM database/ledger are untouched.
Evidence: `crt_locale_body.json`; external bindings remain unreviewed.

This resolves both prior CRT length DEFERs with target/source evidence. It does
not turn normalized matches into linked identity, nor excuse independent review.

## Work still required

Review external CRT bindings/data; examine larger renderer dependency families
and their types. Correction in checkpoint 4: seven excluded C rows contained
assembly mentions in comments, not real assembly; six now freshly match.
Pin DLL imports and begin a separate source-built link/layout probe. The actual
release still needs all engine source, data/link identity, whole-file SHA and smoke.

GLM and Claude files remain untouched. Goal remains active. Reusing existing
fresh objects across new boundary checks avoided a redundant full CRT recompilation.
