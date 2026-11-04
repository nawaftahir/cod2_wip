# Renderer checkpoint31 — genuine DXT loader/caller source, 2026-09-26

New scratch/wavelet_dxt_loader preserves private_upload and replaces only the
DXT extern with actual static loader source. Dispatcher now calls a real body in
the shared group. No browser wrappers/debug logs from modified community
r_image_load_obj.c, no guessed allocator or custom register wrappers.

PINNED F7B0 target/Ghidra and independently agreeing reference operations:
setup from original header dimensions/flags,usage0; cube faces6 else1;
mipCount1 when flags2, otherwise grow dimension1 by2 while smaller than ANY of
width/height/depth; traverse coarse mipCount-1 down to current image picmip0;
clamp shifted width/height1; volume invokesEC00,othersEA20 except cube skips
higher mips when capability101d496b isfalse; source always advances per face
by ceil4(width)*ceil4(height)*bytesPerBlock, including skipped cube uploads.
Do not invent an extra depth multiplier in this target loader's data advance.

Fresh pinned /O2 /Gy baseline_jpeg_fvsjzfck compiles. DXT342vs target331DEFER;
2D/cube453vs472,volume356vs348 remainDEFER. Shared caller definition alone did
not change upload sizes. verify_image_family.py --run codex/renderer/baseline_jpeg_fvsjzfck
passes all8 previously matched bodies/1141 code bytes,0 lost matches in that set.
No new credited match, historical TU claim or whole-track regression claim.

Runnable source test:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_dxt_loader.c -o /tmp/cod2_dxt_loader`
then `/tmp/cod2_dxt_loader`.
PASS8x8DXT1 payload passed through REAL setup,creator,loader,upload and row-copy
source against mock COM creation/locks. Per-face/per-mip marker bytes verify
source consumption and coarse-to-fine ordering:4 ordinary uploads,24 cube uploads
when cube mips supported,6 finest-level face uploads when unsupported while data
for skipped levels is still consumed. Existing actual upload/volume/memory/creator
fixtures reused. NoGPU; onlyDXT1,noPicmip/malformed/volume-DXT case claims.

Next implement real BitmapF5A0 including target format16 BGR expansion and temp
allocation/free, then reconcile loader/setup/upload caller group. All13-format
dispatcher still contains externBitmap; do not count this as complete image loading
or release reconstruction. Standard-library and fixture reuse kept work minimal.
