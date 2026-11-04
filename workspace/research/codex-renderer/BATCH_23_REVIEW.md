# Renderer checkpoint23 — memory-accounting dependency source, 2026-09-26

New scratch/wavelet_memory_family preserves corrected creator source and adds
actual mip memory sizing, full mip-chain accounting and per-image platform
tracking. Existing compiler/referee and creator fixture reused, no new dependency.

PINNED target argument flow from full instructions:
tracking1000ca70: formatEAX, entry stack image+4/flags+8/width+12/height+16/depth+20.
After24 bytes of locals/saved registers, [esp+20] flags,[esp+24] width,
[esp+28] height,[esp+2c] depth. It passes flags and width on the stack toF020,
formatEBX,heightEAX,depthEDX. Memory helperF020 then passes height on the stack,
widthEAX,formatECX,depthEDX to single-mip EF40. No long-long arithmetic:
the Ghidra CONCAT44 pseudo-result reflects live depthEDX, not a64-bit return.
Do not copy that misleading decompile signature into source.

PINNED EF40 formats15/16/47/4b/72=4bytes;17/33/50=2bytes;1c/32=1byte;
DXT1 ceil4 blocks8bytes,DXT3/5 blocks16bytes; unknown format0. Target uses
arithmetic shift for (dimension+3)>>2, not an unchecked replacement by division.
F020 includes every shrinking mip until width/height/depth all<=1 unless flags2;
flags4 multiplies total by6. TrackCA70 writes cardMemory16/20 for both platform
picmips8/9, clamps reduced dimensions to1 unless flags1 bypasses reduction, and
adds to globals101d0a74/78 when unsigned track byte12>1 && !=4.

Fresh pinned /O2 /Gy baseline_jpeg_v9fqhj84 compiles. ZERO new matches:
mip-size219vs149,card-memory123vs135,tracking163vs200. Shape/context/complete
boundary analysis still needed; no compiler-impossibility claim. All three
creator362 bytes retain both-referee matches; alpha134 strict body retained,
not duplicate progress. Original source/helper/table/link proofs unchanged.

Runnable check:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_memory.c -o /tmp/cod2_image_memory`
then `/tmp/cod2_image_memory`.

PASS real memory source: ordinary1/2/4-byte formats, incomplete DXT blocks,
unknown format, mip chain75vs single64, cube sixfold count, picmip reduction,
both-platform flags1 bypass and tracking category0..255 accounting. Reuses actual
creator success/failure/stdcall COM fixture. GPU/error/upload implementations
remain mocks; no real runtime or exhaustive overflow/malformed-dimension proof.

Next review EF40 code/table extent before byte tuning:149-byte inventory may
include or omit switch data. Group static source/type/TU context remains research,
not historical provenance. Continue upload/row-copy dependencies after signatures
and SDK lock structures are verified. Whole-DLL reconstruction remains unfinished.
