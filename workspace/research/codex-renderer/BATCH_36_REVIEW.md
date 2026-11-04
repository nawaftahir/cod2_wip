# Renderer checkpoint36 — actual reload/release caller source, 2026-09-26

New scratch/wavelet_reload_group extends path_formatter with actual Image_Release
and Image_Reload definitions; file helper becomes static because genuine caller
now exists. This is real target-backed context, not invented caller glue.
TargetD450 independently confirmed calls C910 then FA40; failure calls error
100138c0(1,"failed to load image '%s'",image->name32).

PINNED release C910 tracks byte12:0/1/4 do not subtract global accounting,
allother unsigned categories subtract cardMemory16/20 from globals101d0a74/78.
If texture4 nonnull, COMIUnknown::Release slot2 (byte8), then clear texture and
both per-image memory values. If texture NULL, cardMemory is NOT cleared;
mapType0 is always written. Target has no null-vtable/function guard despite
modified community r_image.c adding one; candidate does not copy that guard.
Release ABI unsigned32 return stdcall(void*), result unused.

Fresh pinned /O2 /Gy baseline_jpeg_234kei0o compiles:File242vs240DEFER,
Release84vs87DEFER,Reload44vs42DEFER. Source context improves file prior252 but
equal/near sizes never acceptance. Six discovery matches include already-proven
creators because this run's interval startsC910 (previousE840excluded them).
No new credited matches. Eight prior1141bytes retained by group replay;header,
dispatch and path formatter separately reverified through configurable checker.

Runnable test:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_reload.c -o /tmp/cod2_reload`
then `/tmp/cod2_reload`.
PASS actual release accounting/COM/null-texture behavior; successful reload
through real file->header->dispatcher->Bitmap->Setup->COM-mocked creation/upload;
failed missing-file reload releases prior texture and passes exact name/error
arguments. Expected fatal engine-error call is a returning recording mock;
test is not proof of real fatal engine handling or GPU/filesystem runtime.
Reuses all existing path/file/bitmap/upload/memory/creator checks.

Verifier path_formatter.main now accepts explicit savedrun/fixture, like existing
dispatch verifier. Fixture hash list includes transitive path fixture for reload
tests; original default runs remain unchanged. Root packets describe latest
explicit snapshot checked, not canonical acceptance. No new framework/dependency.

Next inspect complete body discrepancies/caller context and original struct
zeroing idioms before any bounded source probe. CRT strict-only86 remainsDEFER
under checkpoint35; do not silently count it. No independent/canonical/V4 claim.
