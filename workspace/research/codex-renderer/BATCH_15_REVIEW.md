# Renderer checkpoint 15 — target-backed wavelet helpers/tables, 2026-09-26

Continued the full image/wavelet cluster, not a new leaf-count goal. Original
scratch/wavelet_reference remains unchanged. Four separately preserved helper
probes all compile fresh /O2 /Gy with pinned MSVC; **zero byte matches**:

| Overlay / fresh run | ReadBits | DecodeValue | DecompressLevel |
|---|---:|---:|---:|
| wavelet_cluster / baseline_jpeg_sq8pw9fr | 64 | 193 | 1606 |
| wavelet_byte_reads / baseline_jpeg_zhy7n383 | 105 | 169 | 1665 |
| wavelet_value_order / baseline_jpeg_r9z89q6r | 105 | 169 | 1665 |
| wavelet_flag_call / baseline_jpeg__7w4jics | 105 | 169 | 1685 |
| Target complete bodies | 87 | 168 | 1471 |

Each run records exact commands, whole local source/header hashes and fresh
object hashes. None is canonical or a successful match. Keep all snapshots
unchanged; no progress based on similar lengths. The first overlay replaced
two specialized decoders with target-observed generic DecodeValue and ReadBits.
Its memcpy word load was a deliberately tested formulation, NOT target evidence.

PINNED correction from target0x10010ba0/10010c00: refill assembles four byte
loads, starting byte3/byte2 then byte1/byte0, rather than a single dword load.
The byte-read overlay expresses this as nested shifts/ORs, with no assembly.
Its DecodeValue instructions exactly agree through offset0x49 but diverge in
16-bit sum/register scheduling and extended-value calculation/callee context.
The full target168-byte extent is sound. Register/prologue mismatch is NOT
proof of an impossible C formulation, LTCG, or permission to invent an ABI.

The target computes the escaped value before its refill call. Explicit source
reordering was tested, as was the target's first needs-mip-delta flag path
(capture low bit, then call ReadBits1); neither probe produces a byte match.
The outer target also calls distinct alpha-delta helper0x10010cb0; drafts still
inline that loop. Real Image_LoadWavelet caller/register context remains absent.
Do not force-register/naked glue or keep modifying source without this context.

## Complete source-table evidence

`python3 codex/renderer/check_wavelet_tables.py`

PASS: all4096 entries of each table, **49,152 data bytes** total, agree directly
with source initializers in refrences/cod2-mp-macho/rodata.c:

- waveletDecodeBlue at0x10182988.
- waveletDecodeRedGreen at0x10186988.
- waveletDecodeAlpha at0x1018a988.

wavelet_table_packet.json records anchor/source/table hashes, entry counts,
escape counts and signed-short bit lengths. Reference byte representation is
already little-endian; swapping each short does NOT match. These are read-only
reference comparisons, not retail-extracted generated arrays, compiled typed
initializers or approved redistributable source. Do not add49,152 to .text
coverage or treat the whole source rodata dump as approved canonical material.

## Runnable source fixtures

test_wavelet_reference.c can select WAVELET_SOURCE at compile time. All three
later helper drafts pass32-bit fixtures using WAVELET_CLUSTER_TEST: earlier
small-image/offset checks, ordinary Huffman value42 consuming3 bits,9-bit escape
returning-255,10-bit escape returning-510, and bit/pointer advancement including
cross-byte boundaries. The4096-entry custom test table is synthetic and explicit;
the three outer Huffman arrays remain clearly labeled unused link-only stubs.
This is not compressed image validation or target behavior equivalence.

Reproduce the newest source test:
`cc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter -DWAVELET_SOURCE='"scratch/wavelet_flag_call/j_wavelet.c"' -DWAVELET_CLUSTER_TEST codex/renderer/test_wavelet_reference.c -o /tmp/codex_wavelet_flag32`
then `/tmp/codex_wavelet_flag32`.

Next: reconstruct the separate alpha-delta helper, retain target byte-refill
expressions, and include genuine image-loader caller context before another
compiler search. Typed Huffman initializer compile/binding proof can reuse the
confirmed source values after provenance review. No new code-match credit;
JPEG85/29,608B and whole-DLL incompleteness remain unchanged.
