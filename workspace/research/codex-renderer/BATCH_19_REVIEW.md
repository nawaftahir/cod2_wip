# Renderer checkpoint 19 — genuine loader/dispatch TU draft, 2026-09-26

## New readable target-backed caller family, still DEFER

scratch/wavelet_loader_family adds Image_LoadWavelet and Image_LoadFromData to
the real decoder source, instead of importing the broken GLM/WASM body. Target
instruction/decompile evidence fixes image vs header inputs, bytes-per-pixel vs
D3D format, three signed header dimensions, OR mip-count loop, six cube faces,
previous/destination buffer tracking and upload selection. No new/copy/delete
adaptation, naked glue, forced registers, byte emission or canonical edits.

Source behavior mirrors target: setup with header flags and usage0; BGR expands
three channels to four-byte output; allocate one full-size buffer per face;
walk coarse-to-fine mips while checking the image's actual picmip each iteration;
decode every face even when cube higher-mip upload is skipped; use volume upload
for mapType4; free original allocations in reverse order. Header format dispatch
uses all13 target cases and their confirmed format/stride constants.

Type/evidence limitations: GfxImagePrefix is only the confirmed mapType/texture/
picmip prefix, not a complete engine struct or allocatable engine object.
GfxImageFileHeader agrees with target signed dimension loads/header+0x1c payload
and independent reference layout. Source-level setup interface agrees with
r_image_load_common.c's flags/usage/format declaration and target call operands.
Upload source interfaces agree structurally with KisakCOD r_image.h and target
operand roles; exact historical CoD2 mip parameter signedness/type is not
established merely by the16-bit target consumption. Treat this interface as
SUPPORTED research, never canonical acceptance. The draft's extern calls are
ordinary source-level calls, NOT a claim that target custom register ABI is
cdecl. Real setup/upload definitions must be reconstructed in the tested group.

Wavelet_DecompressLevel is static in this experiment so the actual loader call
can inform private compiler register allocation. It is a bounded TU hypothesis,
not evidence of historical unity builds or permission to remove public APIs.
The target decompile corpus identifies this loader call but is not exhaustive
proof of all binary references.

Fresh pinned /O2 /Gy baseline_jpeg_tz30ko5k compiles the complete draft:

| Function | Source object | Target complete body |
|---|---:|---:|
| Wavelet_ReadBits | 105 | 87 |
| Wavelet_DecodeValue | 169 | 168 |
| Wavelet_ApplyDelta | 134 | 134 |
| Wavelet_DecompressLevel | 1436 | 1471 |
| Image_LoadWavelet | 507 | 537 |
| Image_LoadFromData | 364 | target code/data boundary needs review |

No new byte matches. The134-byte alpha body still passes the strict full-body
check in this larger object; no duplicate progress credit. Original accepted
candidate/probe inputs stay unchanged. Do not treat smaller object lengths as
better reconstruction. All attempts and source/header/object hashes are saved.

## Runnable32-bit source-flow check

`cc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_wavelet_loader.c -o /tmp/codex_image_loader32`
then `/tmp/codex_image_loader32`.

PASS: image-prefix/header offsets and28-byte header;1x4 single-channel image
reconstructs three mips with expected coarse-to-fine samples; one allocation
and reverse free; cubemap allocates/frees all six faces while hardware flag0
uploads only six final mips; volume path selects three3D uploads; picmip above
the available range still frees allocations without uploading.

Setup/uploads are explicit host mocks; Huffman arrays are unused zero stubs
because every tested level has width1. This is source control-flow validation,
not actual GPU/COM/ABI execution or compressed-image/retail behavior equivalence.
Bitmap/DXTC mocks fail if accidentally entered; this fixture does not validate
their actual implementations or every dispatcher case.

Next: reconstruct target setup246 and actual upload-helper source in the same
caller family, pin remaining mip-type and COM signatures using binary/SDK
interfaces, and review switch/table boundaries before comparison. Do not add
extern register wrappers to force the caller's current507-byte object to match.
JPEG85/29,608B and matched alpha134 remain unchanged. Whole DLL not complete.
