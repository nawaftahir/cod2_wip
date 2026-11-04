# Renderer checkpoint 13 — batch full-body recovery, 2026-09-26

Reused the existing fresh, hash-checked JPEG objects rather than recompiling
or modifying source. discover_jpeg_boundaries.py searches only known JPEG
entries with omitted extents of1..64 bytes, bounded before the next inventory
entry. Both checkers must match the COMPLETE source function. It reports
discovery-only candidates; it does not change GLM inventory or certify boundaries.
Ten discovery rows include one duplicate AC-first result from the two source
overlays: nine distinct functions/4,035 bytes, not ten progress entries.

Target instruction review confirms complete RET-terminated bodies:

| Address/helper | Old inventory | Full body |
|---|---:|---:|
| 10046000 validate_script | 961 | 967 |
| 10047ec0 encode_mcu_AC_first | 495 | 506 |
| 1004ada0 consume_data | 549 | 552 |
| 1004afd0 decompress_data | 409 | 417 |
| 1004d880 set_bottom_pointers | 157 | 160 |
| 10051ae0 h2v2_fancy_upsample | 293 | 296 |
| 100532c0 jpeg_fdct_ifast | 507 | 516 |
| 100556f0 free_pool | 260 | 263 |
| 10055c10 create_colorindex | 347 | 358 |

Explicit terminal RET/padding proofs are now in check_jpeg_boundaries.py,
13 supplemental bodies/5,902B total including the prior four. set_bottom_pointers
ends directly at0x1004d920 with zero padding; its complete source body still
ends RET. Three other padding endpoints lack inventory entries, so no historical
callee name/signature is claimed from alignment. All full bodies pass both
checkers with asserted extents held only in memory.

## Integrated replay

`python3 codex/renderer/check_jpeg_dependencies.py`

PASS: **85 distinct JPEG source-body candidates/29,608B**.
42 CALLEE-SHAPE-SUPPORTED sites,87 COMPLETE-SOURCE-DATA-SUPPORTED sites,
**zero unresolved direct relocations** across all85. Both source32-bit scan and
BGR fixtures pass, all prior65 baseline matches retained. Fresh forced-inline
jcphuff replaces its old object; its506-byte AC-first helper is separately
full-body replayed, not double-counted from both overlays.

AC-first added an external jpeg_natural_order reference. Complete320-byte
initializer (64 zigzag indices plus16 safety entries) from jutils included in
the actual jdinput TU matches target0x10191200. Operand S+addend is checked;
no guessed table content. Reuse that owning TU at link time rather than also
linking a duplicate standalone jutils object.

check_jpeg_transforms.py still proves the original5,219 float/slow transform
bytes and now runs the real fast-transform source alongside them in the32-bit
zero, constant3/DC192 and signed-ramp/DC-sum fixture. It passes. Fast516-byte
identity is proved in the boundary/dependency packet, not falsely attributed
to the earlier two-transform identity packet.

No canonical source promotion, independent acceptance, indirect callback ABI
review or whole-DLL identity. No overall completion percentage from these
library candidates. The batching removes repeated compiler guesswork without
weakening the byte gates.

Next: apply the same boundary inspection to larger recovered engine/TU groups;
review actual indirect interfaces and collect source/data/link ownership. JPEG
unmatched functions and legacy-referee defects remain;85 functions are not the
entire library. Do not redo the43-TU sweep without changed inputs.
