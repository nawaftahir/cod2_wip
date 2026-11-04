# Wavelet decoder source probe — DEFER, 2026-09-26

This is a modified byte-refill experiment, not the parent source below.
See ../../BATCH_15_REVIEW.md for this overlay's exact changes/run/failure.

Readable source copied mechanically from
refrences/cod2-mp-macho/PC/gfx_d3d/r_image_wavelet.c. This is community
reconstructed reference source, NOT recovered original source and NOT byte
proof. Removed unused imports.h; supplied only the required local types.
Original source comments/provenance retained. No canonical import approved.

PINNED target WaveletDecode accesses at0x10010d40 and helper instructions:
value ushort+0, bit ushort+2, data pointer+4, width int+8, height int+12,
channels int+16, bpp int+20, mipLevel int+24, initialization byte+28.
Huffman entries at0x10010c00 use signed shorts value+0 and bits+2, stride4.
Descriptive names agree with reference; historical spelling remains SUPPORTED.

Fresh baseline_jpeg_ayessvg1 compiles /O2 /Gy with the pinned MSVC image,
zero exact matches. Recorded source/header hashes and full command in inputs.json.
Objects: ReadDword26, AdvanceBits35, ReadBit1 88, HuffmanDecode9/10 both206,
DecompressLevel1509. Do not add any to progress. The target decoder's1471-byte
body ends RET0x100112fe, one CC then new code0x10011300; its extent is correct.
The next *inventory* entry is0x10011460 and skips intervening math functions.
Thus next-entry spacing is a search bound, NOT proof of function ownership.

PINNED target has generic Huffman helper0x10010c00 (table/extension width/bias),
not the reference's two specialized helpers. Bit advance/refill helper0x10010ba0
combines operations; its state arrives EAX and bit count DI. DecodeValue also
uses state EAX and stack arguments; outer decoder state arrives ESI, source/dst
on stack. Target alpha-delta helper0x10010cb0 is separate; reference inlines it.
These require genuine caller/callee TU reconstruction; no fastcall declaration,
naked glue, arbitrary register wrapper or standalone C ABI invented here.

Runnable32-bit fixture:
`cc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_wavelet_reference.c -o /tmp/codex_wavelet_fixture32`
then `/tmp/codex_wavelet_fixture32`.
PASS: type offsets,1x4 RGB->RGBA opaque fill,4x1 single-channel copy,
data pointer consumption and untouched output guards. Huffman arrays are clearly
labeled link-only zero stubs; these cases never use them. This is not compressed
wavelet validation or source/target equivalence. No table authenticity claimed.

Next: rewrite the helper cluster from target-evidenced operations, keeping
real Image_LoadWavelet caller in scope to obtain original compiler register
allocation. Only attempt source variants after pinning target Huffman tables.
