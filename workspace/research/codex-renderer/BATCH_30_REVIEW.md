# Renderer checkpoint30 — shared upload context and cheap group replay, 2026-09-26

New scratch/wavelet_private_upload changes only2D/cube helper linkage to static
in real caller group; source signatures unchanged. This tests natural MSVC
interprocedural argument allocation rather than forced register wrappers.
Fresh pinned /O2 /Gy baseline_jpeg_6t3n_63q compiles;2D/cube453vs472DEFER,
volume356vs348DEFER. Target2D uses ESIimage,EDI mip,EBXface; private candidate
uses ESIimage,EBXmip and other allocations, so static linkage alone is inadequate.
No historical TU/provenance or compiler-impossibility conclusion follows.

32-bit actual source full-upload test passes using explicit private overlay:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter '-DIMAGE_CREATE_SOURCE="scratch/wavelet_private_upload/j_wavelet.c"' codex/renderer/test_image_all_upload.c -o /tmp/cod2_private_upload`
then `/tmp/cod2_private_upload`.
Test selection is now overrideable; original default all_upload source preserved.
NoGPU/runtime or source/retail equivalence claim from mocks.

Added verify_image_family.py for cheap hashed-object replay across snapshots.
It reuses the mixed-switch verifier and existing strict/original referees; no
fresh compile, new framework/dependency, or source rewriting. It checks all219/
187/274 section bytes and bindings for mip/slice/rows; creator complete strings;
full boundaries and pinned bindings for3 creators,chain andalpha. Original source/
header/toolchain/object identities are verified before comparisons. Writes a
run-local image_family_replay.json, leaving earlier accepted snapshot packets alone.

`python3 codex/renderer/verify_image_family.py` and
`python3 codex/renderer/verify_image_family.py --run codex/renderer/baseline_jpeg_t8vfcrgk`
both PASS8 matching bodies/1,141 .text bytes,0 lost matches among these eight.
This is a GROUP replay, not whole-track regression or1,141 NEW bytes; all were
previously proven separately. It does not count tables/alignment, run behavioral
fixtures, establish dependency closure or independently accept source. The
alpha dependency remains unmatched generic decoder; creator error bodies also
unmatched. Other unmatched functions intentionally outside these eight checks.

Next actual upload scalar/local/TU context and deeper image-loader dependencies,
not repeated changes solely to get a counter. Group replay now makes retained
proof checks cheap and deterministic. No new credited matches, canonical/V4 claim.
