# Renderer checkpoint34 — matched genuine path formatter, 2026-09-26

New scratch/wavelet_path_formatter preserves file_loader and replaces the path
formatter extern with actual static variadic C source using va_list/_vsnprintf.
PINNED target10060c10 passes EDI destination,ESI size,stackformat and va_list
pointing to original stack+8 to CRT100f61b9. It then writes destination[size-1]=0
and returns with EAX untouched from CRT. Despite Ghidra void declaration, int
result is consumed/tested by file callerFA40. No buffer-size guard added because
target has none; valid call size64. Source interfaces independently supported
by intCom_sprintf declarations, not conflicting void declarations in other refs.

Fresh pinned /O2 /Gy baseline_jpeg_f2h112qr matches Formatter26-byte fullbody,
RET60c29 plus6CC to60c30. Compiler naturally chooses ESI/EDI fixed arguments in
same caller context even for this variadic function; no forced ABI or assembly.
NEW26 code bytes only. File loader252vs240 remainsDEFER (worse than prior243);
do not promote the group simply because one lower function matches.

`python3 codex/renderer/check_image_path_formatter.py` PASS both referees, sole
CRT binding100f61b9, wrong-binding rejection and full boundary; reuses dispatch
checker with explicit new savedrun/fixture. Header67/dispatch261 retained and
fulljump/data/bindings reverified. image_path_packet.json embeds their source/
object/toolchain/fixture identity proof. Root image_dispatch_packet.json records
the most recently checked explicit run; default oldrun still supported.

Source test_image_path_formatter.c uses a clearly labeled host CRT adapter,
not a copied/matched authentic _vsnprintf implementation. It exercises actual
formatter result forwarding and forced final-byte termination even when adapter
leaves a non-NUL truncation byte, with surrounding guards. It reuses full real
file/bitmap/upload/memory/creator source error/success fixtures. Valid sizes only;
no portable claim for size0 or negative sizes. CRT100f61b9 remains an unmatched
dependency; historical CRT truncation/runtime behavior not proven by adapter.

Group replay8/1141 retained, no duplicate credit. Existing switch/dispatch proofs
and source snapshots preserved. Next reconcile file/remaining loader/setup/upload
context and genuine CRT dependency; do not endlessly tune local register shapes.
Standard va_list/CRT used, existing verifier/fixtures reused, no new dependency.
No canonical, independent acceptance, real-runtime or whole-file identity claim.
