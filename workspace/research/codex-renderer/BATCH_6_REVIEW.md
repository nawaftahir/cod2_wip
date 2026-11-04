# Renderer checkpoint 6 — 2026-09-26

## World bounds: genuine readable source match

`src/world_bounds.c` adds `R_GetWorldBounds` at 0x10001230, **69 bytes**.
GLM `src/tu/missing4.c` compiled to 71 bytes: separate absolute member offsets
missed the target's `add source,0x13c/0x148` followed by relative vector loads.
Using explicit vector-source pointers produces full normalized identity, without
assembly, byte emission, ABI changes or suffix/prefix shortcuts.

PINNED: world pointer at 0x101d1b9c; mins +0x13c, maxs +0x148; three raw DWORD
copies each. The global is reloaded before copying maxs. Supported name/signature
agrees with Mac `PC/gfx_d3d/r_bsp.c:78`. Same world binding as the sun override.

`python3 codex/renderer/verify_material.py` now fresh-builds fourteen functions
/425 bytes together. Latest passing packet: `material_verify_e3jlgrpg`.
All fourteen pass original referee and strict full-length/binding checks; five
host programs pass, including the added world-bounds fixture. Wrong-binding
negative test still passes. Together with the delayed packet: **16 matching clean
engine candidates /608 bytes**, pending independent acceptance. No V4 claim.

## Bounded delayed-drawing flags: no matching variant

`python3 codex/renderer/verify_delayed.py --optimization-probes`

Fresh single-container packet `material_verify_delayed_8pk6tt61` records:

| Additional flag after /O2 | End object bytes (target 107) |
|---|---:|
| /Og- | 180 |
| /Oy- | 100 |
| /Os | 94 |
| /Ot | 97 |
| /Ob0 | 97 |
| /G6 | 97 |
| /G7 | 97 |

All remain DEFER; no flag variant is credited. Begin92/Issue91 base builds
still match, negative wrong-global test and real 32-bit host fixture pass.
Move to TU/caller context if returning to End; do not repeat these isolated probes.

## GLM salvage sweep outside the original snapshot

`python3 codex/renderer/batch_existing.py --extra-tus`

Fresh run `baseline_n_t3on9j`: 36 readable source/flag jobs, 82 address-mentioned
comparison candidates. All compiled; none strictly matched. Address mentions
only select comparisons, never establish function names or signatures. All are
DEFER with source/dependency/object hashes and exact diagnostics. These were not
part of the earlier 78-file recovery packet. No blanket credit or canonical import.

The existing batch tool was extended instead of adding a second build framework.
The sweep exposed the useful world-bounds source fix above; other near misses
can be ranked from saved objects without repeating compilation. Excluded actual
assembly, preserved GLM/Claude files and kept all generated objects ignored.

## Next

Prioritize larger dependency families with confirmed prototypes, or reuse saved
near-miss objects for source-level fixes. Canonical integration still needs owner
approval and independent verification; full renderer source/data/link identity
and smoke remain incomplete.
