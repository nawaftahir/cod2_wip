# Renderer checkpoint27 — genuine volume-upload caller, 2026-09-26

New scratch/wavelet_volume_upload preserves previous source and adds actual
volume upload source, with logging, lock/unlock retry loops and sliced row copies.
Row and source-slice helpers become static because this real caller uses them;
natural MSVC interprocedural code generation improves context, no ABI wrappers.

PINNED local SDK d3d9.h1297/1298 LockBox/UnlockBox stdcall signatures, device
volume-texture slots19/20; d3d9types.h1740 D3DLOCKED_BOX layout: RowPitch int0,
SlicePitch int4,pBits pointer8. Target1000ec00 independently agrees.
Source debug pointer101ce7ec reads int+8; log FILE*10764584; retry int1076a830.
Target calls fprintf100f6d05 and fflush100f6c3d for each attempted call with exact
literal strings. Use standard stdio interfaces, not copied CRT implementation.
Full target disassembly shows NO assignment retry=0 between lock and copy;
Ghidra decompile spuriously shows one. The candidate does NOT insert it.

Target widths/heights/depths unsigned16 at24/26/28, shifted by mip low5 bits
and clamped1. Source sliceE840 gets formatECX,widthEAX,heightEDX. Row-copyE900
gets formatEAX,widthEDX, stackheight/source/rowPitch/destination. Volume upload
copies depth slices, incrementing source by sourceSlice and destination by
SlicePitch. Ignore LockBox HRESULT exactly as original; no new safety behavior.

Fresh pinned /O2 /Gy baseline_jpeg_668lqodd compiles; chain135 retains discovery
match. Slice187 raw section vs target135 code; Rows270 raw vs target226 code;
volume356vs348. All remain DEFER pending complete code/table/ABI comparison.
Caller context improves prior slice227/row282, not an acceptance criterion.
Discovery excludes creators, no claim they regressed or were reverified here.

Runnable check:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_volume.c -o /tmp/cod2_volume`
then `/tmp/cod2_volume`.
PASS actual volume source against stdcall mock methods: two lock attempts/two
unlock attempts; exact parameters/struct layout; row padding/slice stride for
2x2x2 data; emitted and flushed diagnostic text; high mip7 clamps dimensions1;
debug-off and null-log path. Reuses memory/creator fixture. Real GPU/error handling,
all formats and original-runtime equivalence are NOT proven by these mocks.

Additional full187-byte slice-section discovery with memory-only extent override
prints original-referee100%. This is not yet credited: strict code/table boundary
and actual local relocation bindings still need the same audit as EF40.

Next audit187-byte slice COMDAT135 code plus switch tables; then row270 section
vs226 code. Do not equate raw section lengths with code lengths, as EF40 taught.
Then add2D/cube upload and reconcile the real shared caller group. No canonical,
independent acceptance or whole-DLL claim; no new credited matches this checkpoint.
