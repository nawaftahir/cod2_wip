# Renderer checkpoint 10 — target BGR configuration, 2026-09-26

## Six more library source matches /2,356 bytes

The target quantizer RGB priority table at0x101911f0 contains [1,2,0], while
the reference's green/red/blue priority was [1,0,2]. Target nearest-color
arithmetic also doubles component2 rather than component0. Together these
support target BGR byte order, not default RGB.

Preserved source overlay `scratch/jpeg_bgr` changes RGB_RED2/RGB_BLUE0 in
jmorecfg.h, retaining RGB_GREEN1 and RGB_PIXELSIZE3. The callback, byte-boolean
and jdinput utility-context changes remain. No prior overlay/proof input edited.

Fresh `baseline_jpeg_ux9623q1`:43 TUs compile, **71 distinct functions/23,523B
pass both strict checker and original referee**. All65 prior matches retained;
the dependency checker asserts this regression gate every replay.

| New target | Source symbol | Bytes |
|---|---|---:|
| 0x1004bb80 | ycc_rgb_convert | 286 |
| 0x10050280 | h2v1_merged_upsample | 327 |
| 0x100503d0 | h2v2_merged_upsample | 555 |
| 0x10056a90 | median_cut | 357 |
| 0x10056e10 | find_nearby_colors | 452 |
| 0x10056fe0 | find_best_colors | 379 |

Four known strict-only legacy-referee masking cases remain excluded. New library
configuration matches do not establish every remaining routine or its ABI.

## Dependency and fixture replay

`python3 codex/renderer/check_jpeg_dependencies.py`

Latest `jpeg_dependency_packet.json` and the run's `dependency_packet.json`:
71 byte replays, pinned image, source/header/object hashes, source-scoped callee
maps, complete raw-backed data proofs and prior65-match retention. The source
RGB_order initializer's exact12 bytes are separately checked against [1,2,0]
and retail0x101911f0. No inferred table values or masked binding acceptance.

Direct relocation accounting:26 source-shape callee sites,83 complete source-data
sites,7 unresolved call sites. **65 functions/22,140B have no unresolved direct
relocations.** Indirect callback ABI/semantic and independent review remain.

Seven unresolved sites refer to only five remaining helpers:
emit_eobrun0x10047b70, initial_setup0x1004cfa0, select_ncolors0x10055960,
make_odither_array0x10055d80, update_box0x100566a0 (three call sites).
No progress credit for any of those helpers without an exact match.

The selected overlay's jdinput source passes the existing32-bit scan-layout
fixture. New `test_jpeg_bgr.c` links real jutils support and tests actual selected
jdcolor source: neutral gray, positive-red chroma, positive-blue chroma, channel
order, integer rounding and clipping. Expected BGR triples are [128,128,128],
[128,37,255], [255,84,128]. This supplements instruction equality, not game smoke.
The reference table builder used to prepare fixtures still has the old-referee
masking DEFER; fixture execution does not override that gate.

## Next

Investigate the five remaining helper/TU differences; byte-sized boolean is not
proof of original bool-vs-char semantics for every unmatched function. Review
indirect layouts and table ownership per JPEG module. Then integrate approved
source/data/link requirements, not just counters. Custom engine remains16/608B,
separate from library accounting; no canonical promotion or whole-DLL identity.
