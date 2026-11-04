# Renderer checkpoint26 — upload helper source, 2026-09-26

One bounded tracking experiment scratch/wavelet_tracking_loop uses advancing
card-memory pointer/do-loop and switch(track) cases0/1/4. Fresh pinned
baseline_jpeg_m80op9h_ compiles: tracking175vs200 stillDEFER; source32-bit memory
fixture passes. Creator362 and chain135 retained in discovery, not recounted.
Do not accept it or continue speculative loop variants without stronger context.

New scratch/wavelet_upload_helpers preserves memory_clamps, adds target-backed
slice-sizeE840 and row-copyE900 readable C. Uses standard memcpy rather than
handwritten REP instructions. Functions currently external to keep them emitted;
historical static/caller TU integration remains unresolved, no custom ABI wrapper.
Fresh pinned /O2 /Gy baseline_jpeg_qm8omcnn compiles. SourceSlice227vs target135,
RowCopy282vs target226 raw section lengths: DEFER, not byte-match progress.
These include switch tables; audit actual code/data extents and real upload caller
context before tuning. Discovery intervalE840..11300 excludes creator addresses;
its single135-byte chain match does NOT imply creator regressions.

PINNED target E840 differs from card-memory EF40 for format16: source slice
uses THREE bytes/pixel, card-memory and row copy use FOUR. Preserve this target
behavior, do not "fix" it to make functions agree. Slice additionally supports
47/4b/72 four-byte and50 two-byte; row copy does not handle those formats.
Row copy15/16 four-byte,17/33 two-byte,1c/32 one-byte; DXT1 blocks8,DXT3/5
blocks16, row step4. Unknown format returns without touching output. When pitch
equals source row size, copy all ceil(height/rowStep) rows contiguously; otherwise
advance source by rowBytes and destination by pitch, preserving pitch padding.
Ghidra's explicit word/byte loops are compiler-inlined memcpy, not source provenance.

Runnable check:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_upload_rows.c -o /tmp/cod2_upload_rows`
then `/tmp/cod2_upload_rows`.
PASS actual-source one-byte pitched rows, untouched pitch padding, incomplete
5x5DXT1 blocks, tight5x5DXT5 bulk copy, four-byte format16 row copy vs three-byte
source slice, unknown format unchanged output. Reuses all memory/creator mock
checks through configurable test entry; no new test framework/dependency.
No actual COM lock/unlock, logging/retry behavior or GPU runtime yet.

Next E840/E900 complete boundary/caller audit, then actual SDK upload bodies
EA20/EC00 (logs and retry global must be retained). Existing accepted creator,
mip/chain and alpha/table/link packets remain authoritative; no new matches this
checkpoint, no canonical/independent/whole-DLL claim.
