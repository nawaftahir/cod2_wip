# Renderer checkpoint 14 — larger image/wavelet cluster, 2026-09-26

Checked the cached36-extra-TU/82-candidate run baseline_n_t3on9j for omitted
tails:19 bounded object-function comparisons (extensions1..64 bytes before
next inventory entry), zero dual-checker matches. Source and object hashes
checked per comparison; no recompile or progress count. This does not prove
all possible compiler contexts fail, and unchanged GLM source remains untouched.

Inspection finds real flaws in GLM f380/f380tu drafts for0x1000f380:
height h is read before initialization; mip-count loop uses AND instead of the
target's OR; cube-image path uses2 buffers instead of target6; source omits the
Image_SetupFromFile call at0x1000ee30. The family mixes contradictory declarations.
Do not repair one instruction at a time on top of these drafts or infer their
comments/names as valid type evidence. clustbx's scene-model label also describes
image loading, not model validity. Retain for history, not source integration.

Started separate readable-source wavelet cluster in scratch/wavelet_reference.
See its REVIEW.md for target-backed field offsets, helper operations/register
context and exact DEFER. Fresh pinned build baseline_jpeg_ayessvg1 compiles one
source TU; no match. Target complete decoder1471 versus source1509 is a genuine
difference, not another truncated boundary. Target generic Huffman/refill and
alpha-delta helper organization differs from the reference source. Register
allocation needs real image-loader caller context; no ABI workaround written.

New test_wavelet_reference.c passes on32-bit host: struct offsets, small-image
channel copy/opaque alpha insertion, data advancement and output guards. Zero
Huffman tables are explicit link-only stubs for unused paths, NOT retail data.
It does not establish compressed decoding semantics or byte identity.

Next: reconstruct the real wavelet helper/caller TU from pinned target operations
and reference types, account all three Huffman tables, then compare full bodies.
JPEG packet remains85/29,608B as BATCH_13; no new match credit here. Whole-DLL,
independent review and canonical integration remain unfinished.
