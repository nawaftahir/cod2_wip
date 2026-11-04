# Renderer checkpoint 20 — real image setup helpers, 2026-09-26

scratch/wavelet_setup_family extends the preserved caller draft with target-backed
Image_Setup, Image_PicmipForSemantic and Image_ClampPicmip source. No canonical
import, assembly, register glue or accepted progress based on source size.

PINNED setup0x1000ee30 uses byte semantic+10/noPicmip+11, two-byte picmip+8,
dimensions unsigned-short+24/+26/+28. Prefix now includes the independently
supported intermediate fields to obtain those offsets; it remains an incomplete
GfxImage, not an allocation type for live engine objects. Header/struct fixture
assertions catch layout mistakes on32-bit host.

PINNED semantic helper0x1000d090:2/5 read int101d0a68,3 read101d0a6c,4 read
101d0a70; unknown semantic clears both bytes. Recognized semantic uses platform1
picmip2 and clamps platform0 to0..3. Source globals use descriptive semantic
names, not unverified CVar identities.

PINNED clamp0x1000edc0 uses the **MINIMUM** of width and height, not maximum,
and searches levels3..0. DXT1/3/5 require block4, others block1. It clamps both
picmip bytes. The modified reference r_image_load_common.c uses maximum and
therefore cannot serve as a byte/behavior oracle. Target setup loads height into
EAX and width into EDX before the helper; its comparison selects the smaller.
Do not change this back merely to agree with reference comments.

Setup writes noPicmip from flags&3, resolves/clamps picmip, shifts/clamps each
dimension to at least1, and selects cube before volume before2D. The mip-count
argument is(flags>>1)&1. Pool1 is passed. Original usage forwards to2D/volume;
cube path uses0, as seen in its target creation call. Tracking gets original
dimensions, not reduced values. Lower creator/tracker definitions remain extern
source-level interfaces supported by reference types and target argument roles;
their custom target ABI is NOT reproduced by an ordinary external cdecl call.
Historical exact scalar types/whole GfxImage still require integration review.

Fresh pinned /O2 /Gy baseline_jpeg_l9ul11wd compiles all source:

| Function | Object | Target |
|---|---:|---:|
| PicmipForSemantic | 84 | 66 |
| ClampPicmip | 79 | 79 |
| Setup | 220 | 246 |
| LoadWavelet | 509 | 537 |
| DecompressLevel | 1436 | 1471 |

**Zero new byte matches.** Clamp's equal length still fails strict bytes at+9
(target74,objectba). Alpha134 retains strict complete-body match, not counted
again; original accepted candidate and partial link source stay unchanged.
No compiler-impossibility conclusion or type/ABI workaround inferred.

## Runnable source check

`cc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_setup.c -o /tmp/codex_image_setup32`
then `/tmp/codex_image_setup32`.

PASS: field offsets, negative/high/unknown semantic clamps;16x2 ordinary image
picmip limited to1 by its smaller dimension; same16x2 DXT limited to0 by block4;
volume/cube selection and original dimension tracking; usage forwarding vs
cube0; flags2 forcing noPicmip and one-level argument. These nonsquare cases
explicitly detect the reference's max-dimension error.

Real setup/semantic/clamp source is exercised; GPU creation/tracking are explicit
recording mocks, while unused loader/upload paths fail if entered. No D3D/COM
runtime, exhaustive malformed dimensions or source/retail equivalence claim.

Next implement actual creator/tracker/upload dependencies using verified SDK
vtable ABI and target operations; reconcile full caller/TU contexts and source
types. Do not endlessly tune current small helpers against extern-only callees.
Whole-DLL identity and independent acceptance remain incomplete; JPEG85/29,608B
and matched proprietary alpha134 are unchanged.
