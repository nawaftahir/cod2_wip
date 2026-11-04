# Renderer checkpoint 21 — source texture creation, 2026-09-26

CORRECTION (checkpoint22): the claimed 3D usage diagnostic below was an erroneous
stack trace. After three saved registers and one pushed description, target
[esp+1c] is original stack+12, FORMAT. This accounts for the entire mismatch.
The two matched bodies remain valid; old full-family fixture/packet is superseded
by checkpoint22, which tests and verifies the corrected three-body family.

New scratch/wavelet_create_family preserves setup_family unchanged and adds
three genuine C creator bodies to the caller TU. No register wrappers, retail
arrays, canonical import or historical-source claim. Existing build/check tools
are reused; no new dependency or build framework.

Fresh pinned MSVC7.1 /O2 /Gy run: baseline_jpeg_cgedw3d1. Compilation succeeds.
Image_Create2DTexture1000ce80 matches113 bytes; Image_CreateCubeTexture1000cf90
matches119 bytes. Both original referee and strict checker agree. RET plus
inter-function CC padding audited separately (15 and9 bytes, not credited).
New232 .text bytes are REVIEWABLE, not independently accepted or whole-DLL proof.

Reproduce: `python3 codex/renderer/check_image_create.py`.
The replay pins fresh source/header/object/toolchain hashes, all nine instruction
operand bindings across the two bodies, full compiled error strings, and rejects
deliberately wrong device binding. Packet: image_create_packet.json.
Fixture test_image_create.c runs32-bit C89 with warnings-as-errors and actual
source bodies against stdcall recording COM methods: low16 dimension truncation,
image fields/texture output, levels/usage/format/pool, cube mip capability on/off,
all failure-path varargs and stdcall error-description return. It is a mock-device
test, NOT Wine/Direct3D runtime proof. Synthetic wavelet tables are unused mocks.

PINNED device pointer101d1bf8; COM CreateTexture/Volume/Cube vtable byte offsets
5c/60/64. Signatures agree with local dxsdk/Include/d3d9.h454-456; COM stdcall is
required. Target error helper100efe3c ends100f23ca RET4, confirming stdcall rather
than cdecl; local DxErr.h46 independently supports HRESULT-description WINAPI.
Descriptive Renderer_ErrorDescription is not a claim about the exact historical
SDK symbol/version. Error100138c0 uses caller cleanup and plain RET1001392f.
Those error bodies remain unmatched extern dependencies, not dependency closure.

PINNED image category byte30 and name pointer32, agreeing with Mac common_types.h.
Prefix remains a research type; full struct provenance/allocation not accepted.
Target creator failure messages reload dimensions from image fields. The target
3D message prints usage, NOT format: modified community r_image.c prints format
incorrectly. Cube error uses effective levels, not original requested count.
No null-device guard added: community guard is absent from the target.

3D130vs130 remains DEFER: first strict byte discrepancy+95 PE1c COFF18 (dimension
reload register/order). No acceptance based on equal length. Setup229vs246,
loader507vs537, outer1436vs1471, generic169vs168 and refill105vs87 remain deferred.
Alpha134 strict match retained in this object; no duplicate accounting. Original
helper/table/source-only link proof remains unchanged.

Next reconstruct tracker/upload dependencies in the real group; a bounded 3D
error-expression ordering probe may be justified, but do not invent ABI wrappers
or grind unbounded variants. Whole-DLL source/layout/identity/runtime and
independent acceptance still incomplete. JPEG85/29,608 bytes unchanged.
