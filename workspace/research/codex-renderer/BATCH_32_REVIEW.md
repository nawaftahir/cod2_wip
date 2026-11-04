# Renderer checkpoint32 — genuine bitmap-loader source, 2026-09-26

New scratch/wavelet_bitmap_loader extends preserved dxt_loader. BitmapF5A0 is
now a real static C body instead of an extern;13-format dispatcher reaches real
bitmap/DXT/wavelet source. This is source-group breadth, NOT byte-match progress
or a complete original image subsystem. Lower external error/allocator/global
dependencies and exact historical source/TU provenance remain unresolved.

PINNED targetF5A0:setup header width/height/depth/flags,usage0;6cube faces else1;
format16 temporary allocation from already reduced image width*height*4;
coarse-to-fine mip OR-dimension count unless flags2;loop stops at currentpicmip;
format16 expands3source bytes into4destination bytes preserving first3 and alphaFF;
other formats use input directly. Volume pathEC00;2D/cubeEA20 with cube mip
capability skip. Advance data by width*height*bytesPerPixel for every face,
including skipped cube levels. Free converted buffer if nonnull at end.
No added null-allocation guard, corrected alpha interpretation or depth multiplier
that would change original behavior. Mac/WASM wrappers and altered generic upload
functions remain excluded from target body reconstruction.

Fresh pinned /O2 /Gy baseline_jpeg_e3mllafh compiles:Bitmap487vs527DEFER,
DXT342vs331,2D/cube453vs472,volume356vs348. Dispatcher raw344vs legacy261 needs
complete code/table audit. verify_image_family.py --run that saved run passes
8 retained bodies/1141 .text bytes, no regressions among those eight. No new
credit, independent acceptance or full-track regression claim.

Runnable check:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_bitmap_loader.c -o /tmp/cod2_bitmap_loader`
then `/tmp/cod2_bitmap_loader`.
PASS actual Image_LoadFromData format2->Bitmap->Setup->Create2D->Upload2D->row
source with mock COM:2x2 BGR input becomes exact four-byte pixels withFF alpha;
one16-byte temporary allocation/free with guards intact; pitched GPU destination
padding unchanged. Format1 direct4-byte path produces same output without another
temp allocation/free. Reuses existing all-upload/volume/memory/creator checks.
Only single-level2D format1/2 newly exercised; no bitmap cube/volume/malformed
input, realGPU or retail-runtime equivalence claim. Source tests are not matching.

Next audit dispatcher complete code/table boundaries and full actual image-loader
TU shapes now that missing callees exist. Keep unresolved body differences honest;
do not force registers/change ABI just to match. Existing stdlib/fixtures reused;
no new framework/toolchain dependency. No canonical or whole-file identity claim.
