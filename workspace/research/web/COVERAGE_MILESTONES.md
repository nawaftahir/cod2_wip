# CoD2Radiant game-code milestones — November 1, 2026

All figures are source-backed matches under the unchanged original MSVC 7.1
canonical referee, **not** bytes of the complete PE image.

| Metric | Verified | Total | Coverage |
|---|---:|---:|---:|
| Game function bytes | 73,024 | 699,591 | **10.44%** |
| Game routines | 646 | 3,578 | **18.05%** |
| Complete translation units | 26 | 102 | **25.49%** |

The **15%** threshold is 104,939 game-code bytes: **31,915 more** needed.
The **20%** threshold is 139,919: **66,895 more** needed.

## Latest confirmed retail coverage checkpoint

The canonical [MSVC 7.1 full gate](https://github.com/nawaftahir/cod2radiant/actions/runs/41338323137) verified **646/646 accepted game functions**, **4/4 compiler functions**, zero regressions, and 26/102 fully verified TUs.

| Next goal (game-function count) | Exact matches needed | Remaining |
|---|---:|---:|
| 20% | 716 / 3,578 | **70** |
| 25% | 895 / 3,578 | **249** |

From the prior 629-game-function checkpoint, this web-only sweep accepted 17 additional original routines / 1,739 original game-code bytes. The latest 8 accepted since 638 were `OrientationPlaneToLocal` (109 B), two scaled orientation-plane routines (118 B and 116 B), `AngleDelta` (23 B), `ClampChar` (16 B), `ClampShort` (24 B), `OrientationPosToLocalScaled` (274 B), and `MatrixTranspose` (118 B). Experimental mismatches from `I_strncpyz`, `OrientationConcatenate`, `OrientationPosToWorldScaled`, and the `math_matrix` sweep have **not** been counted. Verified code-function coverage is not full executable placement or PE SHA equality.

The coverage figures above are *confirmed CI*, not the stale committed `ledger/meter.json` snapshot.

## Historical checkpoint and experiments

## New accepted source in this batch

`src/universal/win_common.cpp`:
`Sys_DirectoryHasContents` at retail `0x004984f0` is **222/222 B MATCH**,
using the CoD2Rad Windows implementation as behavioral reference.
The canonical file now has **8 matching functions / 481 B** but remains
**PARTIAL** (3 remaining original routines not exact).
- [Exact isolated proof](https://github.com/nawaftahir/cod2radiant/actions/runs/41327853915)
- [Passing canonical gate](https://github.com/nawaftahir/cod2radiant/actions/runs/41328043797): 629/629 game routines

The following experiments did **not** pass and have **no accepted bytes**:

| Candidate | Compiled / retail bytes | Evidence |
|---|---|---|
| Sys_ListFilteredFiles | 433 / 428 | [run](https://github.com/nawaftahir/cod2radiant/actions/runs/41328345205) |
| Sys_ListFiles | 668 / 645 | [run](https://github.com/nawaftahir/cod2radiant/actions/runs/41328561961) |
| Sys_RemoveDirTree | 427 / 397 | [run](https://github.com/nawaftahir/cod2radiant/actions/runs/41328745098) |
| TestStringClass | 3610 / 2967 | [run](https://github.com/nawaftahir/cod2radiant/actions/runs/41328965492) |
| Six idStr members | mismatches / not linked | [run](https://github.com/nawaftahir/cod2radiant/actions/runs/41329146489) |

The large texture-vector inverse was also checked, but its prior owner
already documented multiple nonmatching near-reconstructions. It is
not relabelled or credited.

## High-impact unfinished original source regions

Retail inventory indicates large **unverified** (not yet reconstructed)
game-code byte pools in `Pmesh.cpp` (~79,525), `MainFrm.cpp` (~53,993),
`brush.cpp` (~47,013), `XYWnd.cpp` (~40,458), `select.cpp` (~27,202),
`com_math.cpp` (~20,864) and `com_files.cpp` (~14,350).
These require original instruction-derived implementations and caller/data
proofs; blindly copying Q3Radiant, KisakCOD or iw3xo is insufficient.

Whole-executable placement, complete PE hash equality, and GUI boot remain
**PENDING**. No masks, referee, or acceptance thresholds were changed.
