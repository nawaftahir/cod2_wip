# Renderer checkpoint33 — real file caller matches dispatch/header, 2026-09-26

New scratch/wavelet_file_loader preserves Bitmap group and adds actual file
loader/header-check source. Dispatcher becomes static behind genuine caller;
compiler naturally emits target EAXimage/ECXheader/EDXdata without any register
wrapper, forced calling convention or source-level assembly. This is concrete
evidence for missing real caller context, not a general compiler excuse.

Fresh pinned /O2 /Gy baseline_jpeg_87hqwidm compiles: Image_CheckFileHeaderF2A0
67-byte full body matches. Image_LoadFromDataF900261 code plus3LEA alignment+
13*4jump table =316-byte full section matches. Only328 NEW .text bytes credited;
52 table bytes separately verified. File loader243vs240 remainsDEFER; its printf/
format/file callbacks are extern source interfaces, not matched dependencies.

`python3 codex/renderer/check_image_dispatch.py` PASS strict complete261/67 code,
original full316/67 referee comparisons, actual13 jump bindings/13 direct callee
bindings, complete jump table and header diagnostic strings, negative wrong
binding tests and32-bit actual source file fixture. Three dispatch callees are
PINNED target destinations but their bodies remain unmatched. Symbol binding
proof is not dependency closure. image_dispatch_packet.json pins all inputs and
six transitive fixture hashes; no independent acceptance/V4/runtime claim.

Reusable mixed-switch verifier now handles explicit known callee REL32 bindings
as well as local DIR32 jump addresses, verifies every whole-section byte after
actual relocation and restores memory-only inventory extent. Existing slice/row
checker replay remains green; object/source/GLM inventory never edited.

PINNED FA40 file flow:64-byte path "%s%s%s","images/",name32,".iwi";
negative format result prints error; read callback101d4afc(path,&file),free
callback101d4b00(file), regardless of incorrect Ghidra legacy RI labels.
Missing file<0 does notfree; length0 prints/frees; flags&3 sets noPicmip11 before
validation. F2A0 checks literal bytes'I','W','i', unsigned version5; errors report
unsigned byteversion (255 is not -1), returnsbyteBool. Dispatcher input starts
at file+28. No invented minimum-file-length check: target reads header fields
for nonempty input without one. Preserve original behavior, fixes come later.
Format helper10060c10 and Print10061c80 descriptive source declarations agree
with int variadic Com_sprintf and void Com_Printf reference interfaces; custom
format-helper target register context remains unresolved and is not forced.

File fixture tests five error cases: formatting/missing/empty/magic/version255,
callback counts/free ownership and diagnostics; successful IWi v5 format2 loads
through real dispatcher/Bitmap/setup/creator/upload/row source to exact BGRA
output, then frees file. Allocator/filesystem/COM/format/print are explicit mocks,
not real FS/engine/GPU. Earlier actual Bitmap/upload/memory/creator fixtures reused.
verify_image_family.py --run87hqwidm retains all8 prior bodies/1141code, no recount.

Next reconcile file-loader format-helper context and remaining image setup/
loader/upload bodies, now with their real callers present. No canonical tree
promotion, release identity or whole-track regression claim. Minimal existing
tools and fixtures reused; no extra toolchain/framework installed.
