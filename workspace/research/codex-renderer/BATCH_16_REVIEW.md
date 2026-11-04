# Renderer checkpoint 16 — full alpha-delta helper, 2026-09-26

## New complete engine/codec source-body candidate:134 bytes

Source scratch/wavelet_delta_order/j_wavelet.c implements the target's separate
alpha-delta helper, rather than retaining the reference's inlined/guarded loops.
The ordinary all-channel branch appears first, as in the target. The alternate
branch processes channels then inserts opaque alpha. The original unguarded
do-loop behavior is preserved; zero/negative counts are not silently repaired.

PINNED target0x10010cb0 complete body is **134**, not inventory120. Inventory
stops inside its opaque-alpha write. Actual RET at0x10010d35 is followed by
ten CC padding bytes to the next outer-decoder entry0x10010d40.

Fresh baseline_jpeg_1v2df6oy contains the full134-byte Wavelet_ApplyDelta body.
Both strict checker and original referee match with audited extent only in
memory. Both caller sites bind generic decoder0x10010c00 and alpha table
0x1018a988 exactly, including source relocation addends. A deliberately wrong
decoder destination is rejected. **The generic decoder itself is still169
versus target168; a pinned call destination is not dependency closure.**

Reproduce: `python3 codex/renderer/check_wavelet_delta.py`.
wavelet_delta_packet.json records whole source/header/object identities, command,
boundary/binding diagnostics, negative check and actual32-bit fixture invocation.
check_wavelet_tables.py also rechecks all three source tables/49,152 data bytes;
compiled initializer/provenance acceptance is still not claimed.

The earlier source branch ordering in wavelet_delta_call gives helper116 and
outer1459 in fresh baseline_jpeg_k9xrhz4i, no match. Moving equal-channel branch
first naturally adds target loop alignment and yields exact134 with no emitted
bytes, assembly or register wrapper. The outer remains1459 versus1471 and is
DEFER. The reference and all prior probe overlays are preserved unchanged.

## Source fixtures and next work

Bounded follow-up wavelet_int_bits changes private refill count from short to
int and removes the caller cast; target instructions use full-register count
arithmetic but historical source type is unproven. Fresh baseline_jpeg_3w4l552h
adds no match: refill105, decoder169, outer1459, alpha134 unchanged in length.
The alpha body still passes the strict full134-byte check; no second credit.
Its32-bit full synthetic fixture passes. Preserve authoritative delta_order;
do not repeat this type-only probe or infer impossibility from it.

Expanded test_wavelet_reference.c tests the real source helper with an explicit
synthetic Huffman entry(value1,bits1): two RGB->RGBA blocks, opaque alpha write,
single-channel increments including255->0 wrap, pointer/bit advancement and
output guards. Ordinary/escape generic-value and small-image tests also pass.
No fake retail Huffman or game-smoke claim. WAVELET_DELTA_TEST selects this
synthetic table; other modes retain link-only zero stubs for unused paths.

Next reconcile generic decoder/refill code generation and real Image_LoadWavelet
caller context; do not count similar sizes or force register bindings. Original
134-byte matched candidate stays authoritative while hypotheses are separate.
No canonical promotion, independent acceptance or whole-DLL identity; JPEG
85/29,608B is unchanged and separate from this proprietary codec candidate.
