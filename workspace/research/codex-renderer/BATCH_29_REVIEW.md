# Renderer checkpoint29 — real 2D/cube upload source, 2026-09-26

Bounded volume mip probe scratch/wavelet_volume_mip replaces explicit&31 with
byte casts in shift expressions, attempting target low-byte codegen. Fresh
baseline_jpeg_ocqsxcwv compiles but357vs348 (worse than356), DEFER. Fixture passes
valid mip7; shifts>=32 are not claimed portable C behavior. Probe preserved and
NOT used as preferred source. No fabricated custom ABI or marker variants.

New scratch/wavelet_all_upload instead extends preserved row_step with actual
2D/cube LockRect/copy/UnlockRect source, including original logs and retry loops.
SDK d3d9.h1196/1197 confirms texture methods,1399/1400 cube methods; signatures
are stdcall and agree with target slots19/20. Minimal LockedRect intPitch0/ptr4,
8 bytes on32-bit. Type3 uses texture branch; every other mapType uses cube
branch, as target does (no new guard). Face passes directly, no mapping invented.

PINNED target EA20 actual complete body472 bytes, final RET1000ebf7 and8CC to
EC00. Inventory459 cuts before last retry load/test/branch and epilogue, so cannot
be used as full-body gate. Target stores mip inEDI,consumesDI low16 then CL low8
for shifts,passes EDI to COM; format/source remain stack. WidthEDX,formatEAX,
stackheight/source/pitch/bits feed matched row-copyE900. Lower source signature
is structural C interface; target register ABI must arise from shared TU context.

Fresh pinned /O2 /Gy baseline_jpeg_d157pax8 compiles:2D/cube484vs actual472,
volume356vs348, bothDEFER. No new matching credit. Generic discovery still uses
legacy459; direct strict test used verified472 memory-only override and failed
length. Shared lower helpers/source remain available for complete TU review.

Runnable check:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_all_upload.c -o /tmp/cod2_all_upload`
then `/tmp/cod2_all_upload`.
PASS actual 2D and all6 cube face paths against correctly typed stdcall mocks;
two LockRect/UnlockRect attempts each; arguments/8-byte LockedRect layout;
3x2 pitched row data with untouched padding; all four logging messages; reuses
actual volume retry/log/stride/mip tests and memory/creator checks. FILE logging
uses tmpfile on host. No GPU/Wine/retail runtime proof. Source expressions remain
ordinary C; no claim of historical exact types or independent acceptance.

Next reconcile both actual upload callers/shared helpers and natural scalar/TU
context; retain lower matched sources and audited mixed-section gates. No need
to install SDK or invent a new toolchain: checked local SDK signatures suffice
for minimal typed COM calls. Standard stdio/memcpy and existing fixtures reused.
No canonical import, full-file SHA or target release claim.
