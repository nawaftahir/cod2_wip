# Renderer checkpoint 9 — JPEG dependencies / TU context, 2026-09-26

## One additional source function, stronger cluster evidence

Fresh bounded TU experiment `scratch/jpeg_inline_utils`: preserves the callback
and byte-boolean overlay, then includes the original jutils.c definitions in
jdinput.c. This gives the compiler the utility bodies needed for normal inlining.

PINNED: target per_scan_setup has signed IDIV at 0x1004d258/0x1004d27b and no
external rounding-helper relocations. The previous source object called
jdiv_round_up twice. Fresh context run `baseline_jpeg_uztgv3j1` matches the entire
**415-byte per_scan_setup** at0x1004d1b0, plus the four prior jdinput matches.
No handwritten assembly, ABI change, invented callee or retail-byte patches.

Initial_setup remains DEFER: object516 versus target510. Including utilities is
not claimed to fix every helper or establish historical TU provenance. Never
link another standalone jutils object with this experimental TU without resolving
the duplicate definitions. Whole-DLL layout remains a separate unfinished task.

## Reproducible dependency replay

`python3 codex/renderer/check_jpeg_dependencies.py`

`jpeg_dependency_packet.json` independently replays strict shape and the original
referee across the existing64 candidates, replacing their old jdinput TU with
the freshly checked five-function context TU. **65 distinct functions/21,167B**
now pass both checkers. Four earlier strict-only cases remain excluded.

Before replay: toolchain identity, all source/header dependencies and actual object
hashes are checked. Function-name mappings are scoped to their owning TU; ambiguous
same-source destinations are rejected. No stale object credit or guessed externs.

Of114 direct relocation sites:

- 23 resolve to same-TU source-shape-matched callees, with addends checked.
- 83 have complete source-data-section equality at their actual retail locations.
  Only initialized, relocation-free, raw-backed data sections qualify; BSS and
  partial file-backed ranges are rejected. This includes80 float-DCT literal
  sites, two allocator slop-table sites and another library data site.
- Eight still unresolved, all direct calls to unmatched source helpers.

**59 functions/19,868B have no unresolved direct relocations.** That does NOT
establish every indirect callback ABI, source semantics, independent acceptance
or a complete linked dependency closure. Status names retain those limitations.

## Remaining direct helper calls (actual target destinations)

| Owning TU | Source symbol | Target | Target/object bytes in earlier saved TU |
|---|---|---|---|
| jcphuff.c | emit_eobrun | 0x10047b70 | 183/156 |
| jdinput.c | initial_setup | 0x1004cfa0 | 510/496; context variant516 |
| jquant1.c | select_ncolors | 0x10055960 | 225/234 |
| jquant1.c | make_odither_array | 0x10055d80 | 102/114 |
| jquant2.c | update_box | 0x100566a0 | 991/1003 |
| jquant2.c | median_cut | 0x10056a90 | 357/357, instructions differ |
| jquant2.c | find_nearby_colors | 0x10056e10 | 452/452, instructions differ |
| jquant2.c | find_best_colors | 0x10056fe0 | 379/379, instructions differ |

Equal sizes in the last three rows do not mean matches. Raw diff evidence was
inspected: register allocation, instruction ordering and arithmetic scheduling
still differ. Source-level/TU investigations remain valid; do not blame LTCG or
declare impossibility without bounded evidence.

## Host fixture

`test_jpeg_input.c` runs in a real32-bit C89 host build with -malign-double.
It asserts target-backed comps_in_scan+0x12c and MCUs_per_row+0x140 offsets,
then tests single-component and interleaved scans: MCU counts, rounded dimensions,
membership arrays, sample widths and nonzero last-row/column remainder behavior.
The dependency replay records its command/test hash and refuses a failed fixture.
Wrong-callee negative fixture and all65 byte replays pass. Not game/Wine smoke.

## Next

Prioritize these eight helper/TU gaps or library routines with unresolved indirect
layouts; reuse the source-data and callee evidence instead of re-deriving it per
function. Custom-engine candidates remain16/608B, counted separately. No canonical
promotion, full renderer build, whole-file SHA identity or V5 claim.
