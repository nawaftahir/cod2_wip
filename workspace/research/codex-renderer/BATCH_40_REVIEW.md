# Renderer checkpoint40 — actual image-loading entry source, 2026-09-26

New scratch/wavelet_load_entry preserves image_alloc (not failed/rejected hash
experiments) and adds actual10AB0 Image_Load entry. Names beginning'$' delegate
to builtin108A0; ordinary names allocate category3 and call real matched file
loader; returnNULL on failure,allocatedimage on success. No new cleanup behavior
or synthesized builtin implementation. Builtin remains an explicitly unmatched
extern source-level interface supported by target and reference roles.

PINNED entry10AB0 receives nameEAX,semanticECX,trackEDX, saves semantic intoEBX.
Builtin108A0 therefore sees nameEAX,semanticEBX,trackEDX; first white/black branch
pushes track,semantic,category1,name toCC10. Do not claim builtin receives ECX
semantic after internal string comparison overwrites it. Standard C interface
of three args is a supported source declaration, NOT a custom target ABI wrapper.

Fresh pinned /O2 /Gy baseline_jpeg_kt0uomxd compiles:Image_Load55vs43DEFER.
Real builtin definition/caller context still absent; no compiler excuse or forced
registers. Eight prior/1141 matches retained via group replay, no new credit.
Matched file/header/dispatcher/formatter snapshot evidence preserved separately.

Runnable check:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_load_entry.c -o /tmp/cod2_load_entry`
then `/tmp/cod2_load_entry`.
PASS'$white' builtin delegation args/return with explicitmock;ordinaryname real
allocation->file->header->dispatcher->Bitmap->Setup->creator->upload source
against allocator/file/COM mocks;category3/semantic/track,name string/47-byte
allocation;missing-file returnsNULL without deleting registry allocation. Test
confirms both attempted allocations remain registered, preserving target behavior.
Earlier actual source allocator/reload/file/memory/upload checks reused. Builtin
graphics and actual engine/GPU runtime remain untested/unreconstructed.

Next actual builtin108A0 and its procedural source dependencies, verifying
constants/pixels/callee signatures before implementing; then the entry can have
genuine missing caller/callee context. Do not copy modified community builtin
pixels or comments blindly. No new framework/dependency, canonical, independent
acceptance or whole-file identity claim.
