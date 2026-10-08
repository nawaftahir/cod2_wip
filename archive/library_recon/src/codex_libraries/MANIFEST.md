# Verified reconstructed library source

## Four-lookup source module — 2026-09-30

The complete name/description lookup family is now separated here:

| File | Target symbol / entry | Instruction bytes | Verified table bytes, excluded |
|---|---|---:|---:|
| `dxerr9_name.cpp` | `_DXGetErrorString9A@4`, `0x100cc81b` | 48,427 | 24,097 |
| `dxerr9_name_w.cpp` | `_DXGetErrorString9W@4`, `0x100de367` | 48,462 | 23,943 |
| `dxerr9_description_a.cpp` | `_DXGetErrorDescription9A@4`, `0x100efe3c` | 9,617 | 1,880 |
| `dxerr9_description_w.cpp` | `_DXGetErrorDescription9W@4`, `0x100f2b25` | 9,617 | 1,880 |

All four files are readable reconstructed C++, not historical Microsoft source.
Each complete COFF section, every string initializer, local branch/table target,
relocation site/type and binding matches the target. Wrong-target and corrupted
byte tests reject; the original masked referee returns 100% for every section.
The three new files add **67,696 unique instruction bytes**; the family totals
116,123 instruction bytes. Table data is compiled and verified, not discarded
from the binary; it simply earns no instruction coverage.

`build.mk` compiles these four clean files as non-LTCG objects using the
hash-pinned MSVC 13.10.4035 compiler and `/O1 /Oy- /hotpatch /MT`.
It is used by `target/scratch/codex25_dxerr/link.mk` before the existing
`closed.mk`. The resulting private link retains all 359 baseline source
matches and the previous 360-match checkpoint, with 363 source matches now.
Claude's canonical files and standard referee are unchanged. Do not add
these functions to the engine `/GL` TU list.

The description code layouts are identical after relocation masking. Their
ASCII/Unicode initializers uniquely distinguish the two placements; the wrong
width is tested and rejected. Their code stops before embedded tables at
offset 9,617. `check_link.py` supplies those two source-proven placements/code
extents to the unchanged standard binder and independently verifies every
linked lookup's complete section and initializer. Raw standard output is
retained separately; no table CALLs or table bytes count as source instructions.

Proof/rebuild: from `gfx/target`, run
`sh scratch/codex25_dxerr/build.sh` for a fresh module/renderer build, full
source checks, linked regression and behavior fixture. The fixture passes
**426,244** comparisons against authentic SDK lookups: 106,561 distinct
boundary/random inputs tested across all four functions. Replays:
`python3 scratch/codex25_dxerr/check.py`,
`python3 scratch/codex25_dxerr/check_link.py`;
`python3 scratch/codex25_dxerr/run_test.py` reruns behavior.
The external compiler cache is unchanged from the preceding checkpoint.

### Initial ASCII-name proof (retained)

`dxerr9_name.cpp` reconstructs the complete SDK-derived
`DXGetErrorString9A(HRESULT)` lookup as readable C++.
It is not a claim to have recovered Microsoft's historical source file.
HRESULT values and returned names come from the supplied authentic SDK
lookup; alias grouping and source order are confirmed by the target bytes.
This folder does not contain copied Microsoft CRT or compiler sources.

- Source SHA-256: `5d6e13837b2dc528a26aa06ac6c7723f0b778805f1a8353398e1bee895257dcf`.
- Target entry: `0x100cc81b`, `_DXGetErrorString9A@4` (stdcall).
- Build: MSVC `13.10.4035`, `/O1 /Oy- /hotpatch /MT`, Windows SDK headers.
- Complete matched section: 72,524 bytes; code: **48,427**; tables: 24,097
  verified but excluded from instruction coverage.
- Proof: `../../scratch/codex19_dxerr/check.py` + `packet.json`.
  Every relocation site/type and all 8,899 bindings are checked; mutations
  and incorrect targets fail. The original masked referee reports 100%.
- Private closed-link regression: `check_link.py` / `link_packet.json`;
  all 359 prior source matches retained, this lookup added, no `/FORCE`.
- Behavior: 106,560 comparisons against the authentic SDK library pass.
- Build/replay from `gfx/target`: `sh scratch/codex19_dxerr/build.sh`.

These exact source copies are separated from scratch and integrated into
the private clean-module build, not Claude's canonical TU list.
A standalone non-LTCG object is required with this compiler/flags;
do not compile it with the renderer's `/GL` flags and presume equivalence.
The source-only test DLL is not the retail checksum-identical renderer.
Promotion into `cod2engine/` remains owner-controlled.

## Shader helper cohort — 2026-09-30

| Clean file | Complete source methods | Instruction bytes |
|---|---:|---:|
| `instruction_predicates.cpp` | 25 predicates/getters | 1,438 |
| `shader_native_constants.cpp` | 12 native/raw callback specializations | 360 |

These are readable reconstructed SDK-derived C++, not historical Microsoft
source. `shader_build.mk` compiles both clean paths separately using the
hash-pinned 13.10.4035 compiler, `/O1 /Oy- /hotpatch /MT`, without `/GL`.
The private `scratch/codex35_sdk/link.mk` includes both recipe files.
Original headers, archives and compiler files remain external dependencies.

`CInstruction` declares only the target-confirmed five-word prefix: token,
input count/pointer, output count/pointer. It is NOT the full historical
class size or allocation layout. Do not allocate, construct or destroy SDK
objects with this view. The TU provides only the 25 fully proved methods.
The shader callbacks cover vertex/pixel native and raw inputs only, forwarding
the original device slot, arguments and result; conversion drafts are excluded.

The source objects match complete typed SDK sections and retail bodies, with
no masked fields. The original referee returns 100%. First-byte and final-byte
mutations fail. Identical callback code is named using original relocations
in `CConstant::Create` at `0x1008085f`, not an arbitrary identical-code hit.
That 664-byte opaque identity carrier receives zero source credit, and wrong
callback targets are rejected. All 37 source intervals are disjoint.

`scratch/codex35_sdk/check.py` / `packet.json` record source/object/compiler,
header/archive, complete body/boundary and callback identity evidence.
`check_link.py` / `link_packet.json` retain every one of the previous 363
private source matches and accept **400**, without `/FORCE`; all 37 new
linked bodies match retail. Standard binder and canonical files are unchanged.
The CPU fixture passes **361,654** predicate/getter comparisons against the
authentic SDK. It tests no GPU or game boot and does not validate the remaining
class layout. Whole-DLL SHA identity is still pending.

Build from `gfx/target`: `sh scratch/codex35_sdk/build.sh`; replay with
`python3 scratch/codex35_sdk/check.py` and `check_link.py`.
For the existing fixture use `python3 scratch/codex35_sdk/run_test.py`;
fresh fixture compilation uses `compile_test.sh` inside the pinned compiler
container with the SDK mounted at `/dxsdk`. See the scratch report for commands.
