# Renderer roadmap: readable source to the exact retail DLL

Owner direction, 2026-10-21: use gfx as the sole renderer workspace and make
whole-file identity the main objective now, not a sequence of coverage targets.
This supersedes the old40%/45% execution priorities. Source coverage remains
an honest secondary diagnostic; it must not be inflated or discarded.

## The finish line

Build readable reconstructed source with the pinned original toolchain and
dependencies. The complete resulting gfx_d3d_mp_x86_s.dll must have SHA256:

    4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6

Then smoke-test it with the1.0 client and legally supplied game files. Matching
functions or gameplay alone is not completion. This reconstructs source that
produces the retail bytes; it does not prove the lost developer files' wording.
No retail-code arrays, dummy callbacks, padding stand-ins or post-link copying
of retail bytes may substitute for source. Existing authored assembly stays
separately accounted; changing the main meter does not turn it into C++.

## Current evidence, not a release claim

Current source wave:target/work/proof/material_commands_checkpoint.json; previous coverage gain:
target/work/proof/material_pass_checkpoint.json; previous accepted SDK receipt
target/work/proof/sdk_checkpoint.json. Previous source commit
47b747c. Readable source is target/work/src; some functions are still unmatched
drafts. All1286 protected source/library extents survive (433 prior SDK/runtime
extents,67471 bytes; these are not authored game source).
Accepted authored C/C++:102322/253580 game bytes,40.350974052%. This is not a
whole-DLL percentage. The inventory denominator is SUPPORTED, not definitive.

| Whole-file component | Retail | Current candidate |
| --- | --- | --- |
| File length |1851392 bytes |1638400 bytes |
| Named exports |GetRefAPI only |159 temporary exports; GetRefAPI absent |
| API table |108 slots,98 written callbacks,10 initial zeros |54 callback slots have accepted implementations; other slots are not yet byte-verified |
| .text virtual length |1089680 |894562 |
| .rdata virtual length |595105 |593215 |
| .data virtual length, including zero-initialized storage |6086100 |6084500 |
| .reloc virtual length |95704 |85708 |
| Whole SHA |Anchor above |NOT matched |

Sizes identify missing contributors; they do not tell us to add filler. Callback
counts are not source coverage or evidence that the current DLL can be loaded
by the game. Latest detailed measurements:target/work/layout/current.json.

2026-10-23 structural gain: restored the actual2399596-byte normal frame and
its initialization, separate from the debug frame. This reduces the .data
size gap to768 bytes without fillers. Render-command startup now initializes
its debug block and both existing tess index-pointer fields. Its real caller
in R_Init is pinned, but the full R_Init body is still absent. Outdoor global
ownership and bounds/mapping/trace source are restored; only the175-byte trace
adds accepted coverage. None of this closes the structural checkpoint below.
The next window wave restores creation, refresh choice and parameter setup in
r_window.cpp with the shared36-byte PC record. The genuine AdjustWindowRectEx
call closes one missing import; IsWindow and ShowWindow still need real source
closure. Refresh choice adds131 verified C++ bytes. All79 fixtures pass without
new roots/assembly/flags. Hardware/device creation still prevents full startup
closure; do not mistake these connected helpers for a complete R_Init or API.
The device wave then restores the real AA/presentation/retrying device helpers
in r_device.cpp: all three match, adding350 C++ bytes and retaining every old
extent. All80 fixtures pass. No new assembly, flags, exports or globals. This
closes those helper bodies, not the missing higher device/resource/init graph.
The resource wave restores dynamic buffer pools, full particle geometry and the
complete261-byte resource initializer, reusing existing cache/target helpers.
It fixes the shared static-buffer allocator's union/struct linker-name mismatch
without aliases or duplicate bodies; its old222 bytes still match. Two new
constructors add258 verified C++ bytes. All83 fixtures pass. Resource startup,
particle creation and pool initializer are not yet credited matches, and higher
device/video/registration/startup/API closure remains mandatory work.
Video/aspect and monitor fallback source are restored; monitor fallback adds132
verified C++ bytes with all84 fixtures passing. Aspect storage remains unmatched
and reuses the existing assembly-bearing rounding helper without C++ credit.
Startup still needs actual image/material initialization and the light_dynamic
definition registration, not assumed reload/material calls.
The image/light wave restores all ten builtin branches, water/outdoor creators,
Image_Register and packed light loading/registration. It adds the actual260-byte
light registry and a shared definition header; the .data size gap is512 bytes.
All88 fixtures and all1270 old extents pass. NO new V2 bytes are claimed: these
nine source functions still need matching. Real image/material initialization,
final registration and higher startup/API remain open, not replaced by stubs.
Real image initialization now connects picmip, renderer-dependent builtin
publication,16 live sampler bindings and the existing raw programmable image.
It adds no globals or fake backend state; new layout asserts pin all consumed
shared fields. These two source bodies have no new V2 byte credit. Material
initialization/shader-source preload and the higher startup/API still remain.
Shader-source preload now uses the existing cache and original VC7.1 std::sort.
It adds83 verified comparator C++ bytes and13 matching library bodies/2696 bytes,
kept strictly separate. All90 fixtures and all1284 extents pass. Material file
loading/registration and its full initializer still need source closure before
the higher device/startup/API can be connected. No missing-function stub links.
Following material/water fixup uncovered duplicate standalone water setup
storage disconnected from rg. Loading/shutdown now uses rg's pinned count/
16-record fields. All1284 matches survive. Removing the duplicate increases
the .data size gap to1600, correctly: the earlier512-byte gap was not ownership
or content proof. Do not put padding back merely to recover a size metric.
Material binary loading/fixup/registration now connects the actual shared
image/water/string/technique helpers, with77 focused routes and92 full fixtures
passing. All1284 extents survive; no new byte credit. Material_Init's actual
tables/raw setup, finalization and higher startup/API are still open.
Material_Init and its actual28+12 registration tables/raw helper are now
restored, along with R_InitSystems calling image/material/light setup and
resetting original water/fog/debug state. All94 fixtures and1284 protected
extents pass. Their dependency bindings remain unaccepted; no V2 gain is
claimed. Higher device/window startup, R_Init and the genuine API remain open.
Higher device/window startup and the actual AA/refresh/resolution retry ladder
are now restored in r_device.cpp, reaching real resources/systems, splash and
window publication. Both original-compiler waves retain1284 extents; all96
fixtures pass. Source is not byte-accepted yet. ShowWindow is genuinely imported;
only IsWindow remains missing, with no extra named imports. R_Init still needs
actual command callbacks, global setup/table ownership and the benchmark; the
API and structural checkpoint remain open. No source-coverage gain is claimed.
Material reload/picmip and cache command source now reuse existing image/hash/
cache state. Cache stats84B and white binding33B add117 accepted C++ bytes;
all98 fixtures and1286 protected extents pass, with two removal negatives.
Five of nine command source implementations exist; screenshot/sun pairs,
registration, the R_Init/benchmark chain and API still need real closure.

## Execution order

Owner clarification,2026-10-22: structure first. Defer the shader FP-status
instruction and outdoor rounding gaps; add no new authored assembly for them.
Recover actual TU/interface/global ownership, genuine storage, dependency
members and the real API graph before returning to per-body byte tuning.
Existing byte/binding/source gates remain regression guards, not the current
optimization target. Correct file size/order alone still cannot establish SHA
identity: missing code, initialized data and PE/debug metadata must also match.
Do not run additional local spelling/flag sweeps merely to increase coverage.

### Structural checkpoint before another function-tuning campaign

This is the owner's early structural gate, not a substitute for completing the
full reconstruction. It remains OPEN. The numbered execution steps below mix
structure and required source work; steps1-4 are not four purely preparatory
tasks followed by all reconstruction afterward.

1. Pin the retail input, compiler/linker, SDK/runtime versions and effective
   flags. Record unproved flag choices as unproved, not historical facts.
2. Establish source/TU boundaries, compatible shared interfaces, ownership of
   every required global/table/helper instance and justified object/library
   order constraints. No unexplained missing buffers, duplicate ownership or
   size-matching filler. Exact final offsets can still move as real code changes.
3. Restore genuine entrypoint/startup and the API59 interface/callback graph.
   Missing implementations and uncertain signatures are explicit work, never
   dummy callbacks, unresolved release links or a partial advertised API.
4. Reproduce the whole candidate build and account for all section contributors,
   imports, exports, relocations and metadata differences. Establish a repeat-
   link baseline now. Diagnose structural mismatches now, not at90% code.

Then complete remaining bodies and tune their generated instructions in
connected batches, retaining this structure and measuring whole-file drift
each wave. Source needed to establish the structure is reconstructed now.
Do not defer structural gaps merely because a source-coverage target was met.
Final placement and the exact SHA can only be certified once all contributors
also match; structure first is not a promise of a frozen final address map.

### Full execution sequence

1. **Preserve and replay the base.** Keep one source tree and one build. Local
   historical referee inputs keep their original hashes. Run both unchanged
   referees, all1286 protected extents and actual-source fixtures. Missing old
   research folders must not silently disable a gate. Never delete another
   agent's work or reset the owner's staged changes.

2. **Recover the real front door and callback graph.** Reconstruct API59's
   GetRefAPI and typed108-slot table from the primary initializer and confirmed
   caller signatures. The locally preserved oracle pins addresses, not every
   legacy name or signature. Inventory all98 actual callback slots, their source
   owners and missing helper chains. Implement missing real callbacks; never
   invent placeholder bodies to make the link pass. Replace temporary roots
   with real retention through this graph as each closure is complete. Final
   export table must contain exactly the retail GetRefAPI export.

3. **Recover whole-program structure alongside those chains.** Maintain the
   actual function set per TU, shared-helper instances, object/library member
   order, table/string ownership and per-TU flags. Use retail address ranges,
   real calls and Mac naming/type evidence; do not mechanically sort objects
   by a shared helper's earliest address. Each structural change must retain
   all accepted extents. Prior rejected material-order trials stay documented.
   Match connected API/caller groups rather than endless leaf spelling trials.

4. **Complete all real code and data contributors.** Missing engine source
   still has to be reconstructed; whole-file-first does not skip it. Reuse the
   exact VC7.1 runtime, Summer2004 SDK libraries and correct IJG source where
   applicable. Restore genuine dependency calls so the linker pulls the right
   library members; do not reverse library internals again for a progress meter.
   Recover typed globals, arrays, tables and initialization, including large
   zero-initialized state. No arbitrary bytes to imitate section sizes.

5. **Close exact layout and reproducibility.** Align function/data placement,
   literal pools, section RVAs/sizes, imports and hints, exports/ordinals,
   relocations, entrypoint/startup and PE/debug metadata. Compare a repeat link
   from identical inputs now, not only at the end. Record timestamps/debug-ID
   differences as real blockers. Investigate original toolchain behavior and
   flags; do not quietly normalize the hash or patch the output. Any finish-line
   exception needs the owner's explicit decision and is not SHA completion.

6. **Prove and release.** Fresh rebuild from the committed tree, full-file SHA
   equality, then real client boot/render/smoke checks. Save input/toolchain
   identities and commands. Only after that: owner review, release-tree promotion
   and later bug fixes/enhancements. No claim that this candidate is finished.

Steps2-4 overlap; step5 is measured during every wave, not postponed. The first
implementation priority is the real API/callback inventory and its missing
source closures, because it determines retention, custom calling conventions
and which library members must exist in the final file.

### Repeat-link evidence

The same-object relink31006 retained all820 accepted extents. Raw .text,
.data and .reloc hashes are unchanged; the whole-file SHA, .rdata hash and
debug records differ, and the PE timestamp changed. This establishes a real
metadata/reproducibility task before all missing source is recovered.
It does not establish that every changed .rdata byte is debug information.
Before report:target/work/proof/wholefile_before_relink.json; after report:
target/work/layout/current.json. No binary was patched or copied into place.

The callback inventory is target/work/layout/api_callbacks.tsv. It distinguishes
accepted bindings, masked-only candidates, unverified slots and unused zeros;
it must not call every unverified callback missing source.

## One renderer workspace

- Active source/tests/tools/proof/layout:target/work/.
- One pinned build:target/build/codex_boundsoutside_1016_02. The old name is
  retained for compiler-visible paths, not another workspace or dev/codex.
- Shared build headers:target/src/shims and target/src/opencod2/headers.
- Historical gate JSONs:target/work/proof/history, with original hash checks.
- Retail API oracle/inventory:target/work/proof/retail. Neither is code credit.
- Old exploratory entrypoints are archived in archive/legacy_entrypoints.
- Game binary and proprietary SDK/toolchain remain read-only external inputs;
  they must not be committed. This is not a claim to vendor those legally
  separate dependencies into gfx.

Build/check:sh target/work/tools/build.sh from gfx, or make verify from target.
Report:python3 target/work/tools/layout.py target/work/build/gfx.dll.
The source meter remains python3 target/work/tools/source_coverage.py.

## Deleting dev/codex

The maintained renderer build/gates/tests no longer need dev/codex. Its pinned
renderer API oracle was copied unchanged and independently checked against all
98 primary initializer writes and ten zero-initialized slots. No files outside
gfx were edited. Historical scripts in the archive are not active entrypoints.

**This is renderer-only clearance, not clearance for every dev project.**
claude_client/regions.py, classify.py and ghidra/names.py, plus their deepseek
counterparts, still reference codex/client/salvage_gemini/data/names_1.0.json.
Those tracks are outside this task and were not modified. Deleting codex would
break those tools unless their owner migrates the referenced data/paths first.
Archive the folder recoverably rather than permanently deleting it if unsure.
