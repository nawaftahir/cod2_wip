# Renderer: existing source to the retail-identical DLL

Owner direction, 2026-10-21: reach40% actual C/C++ first, then45%, then keep
going to complete source reconstruction AND a SHA-256-identical retail rebuild.
Assembly, library internals and imported-but-unmatched code do not advance the
C/C++ meter. This plan supersedes the earlier mixed-source40/45% milestones.
The current active goal is40%;45% and the remaining roadmap follow it.

## What is already here

You are right: we already imported renderer source from OpenCoD2. Re-copying
it is not progress. `target/src/opencod2/` contains60 C/C++ files plus headers
and imports; the active `target/work/src/` contains73 C/C++ files. Those counts
describe files present, not files verified or the historical retail file set.
The active header tree still uses imported OpenCoD2 types. This is not a
project starting from an empty source directory.

OpenCoD2's local README explicitly calls its reconstruction incomplete. Its
Mac-derived source, porting changes and ABI wrappers are useful research, not
proof of Windows1.0 behavior or bytes. Use the existing implementation first;
derive the necessary differences from the target, not another plausible rewrite.

The difficult part is the build's whole-program optimization: a function's
machine code can change when its callers, helper copies or file order change.
Order matters, but it is not the only remaining problem. Wrong PC structures,
different token parsers, source control flow and data bindings also occur.

## Honest starting point

Cold checkpoint: `target/work/proof/dx7_checkpoint.json`.

| Measure | Verified state |
| --- | --- |
| Accepted game executable bytes, including assembly |107350/253580=42.334% |
| Authored C/C++ after non-inlining guards |99563/253580=39.263%; current source attribution receipt in target/work/proof/source_coverage_current.json |
| Latest accepted source addition |7 C++ bodies/1712 bytes beyond602-body checkpoint |
| Regression protection |817 source/library address-extents |
| Cold replay |422 input hashes unchanged; warm/cold bind and cmp identical |
| Behavior checks at checkpoint |45 fixtures plus separate PDB-string fixture pass |
| Retail whole-file SHA |NOT matched |

The denominator253580 is the existing SUPPORTED game inventory, not every byte
in the DLL. Whole-file layout includes libraries, data and metadata separately.
The40% threshold is101432 executable C/C++ bytes:1869 further bytes are needed.
The45% threshold is114111:14548 further bytes are needed. source_coverage.py
excludes whole containing bodies for authored assembly, pins its source-bearing
files and requires memory assembly helpers to remain out of line. Its scope is
the maintained source, not internal implementation of original compiler/SDK
dependencies. Those dependencies and C/C++ intrinsics are not authored assembly.

## One active workspace

- Edit only `target/work/src/`; keep its original `tus.txt` order and
  `profile.mk` exceptions until evidence supports a gated structural change.
- Tests: `target/work/tests/`. Tools: `target/work/tools/`.
- Tables, object/library order and section reports: `target/work/layout/`.
- Accepted evidence: `target/work/proof/`. Failed trials: one entry in
  `target/work/ATTEMPTS.md`, not another copied source tree.
- Build only with `sh target/work/tools/build.sh`; reuse its ONE build directory.
- All18 `target/agent_*` workspaces and compiler debris are now in
  `archive/target_trials_20261021/`. They were moved, not deleted.
- `target/src` still supplies compatibility/OpenCoD2 headers. Historical JSON
  under `target/scratch` is used by regression gates. They are not active
  reconstruction workspaces, but cannot yet be deleted wholesale.
- `dev/codex/` is not an active renderer source tree, but historical checker
  imports and pinned API evidence still reference it. Before removal, migrate
  the exact required dependency subset, preserve hashes, update imports and
  replay affected checks. Do not move/delete other tracks or clone all of it.

## Fast execution loop: cohorts, not endless spelling trials

1. Reuse the existing source and current build reports. For each candidate,
   identify its exact retail boundaries, real callers/callees and data tables.
   Use Mac symbols for names/types and PC bytes for the final answer.
2. Select a caller/helper group with the largest plausible accepted-byte gain
   for the fewest edits/builds. Treat masked matches with unresolved bindings as
   blocked, not completed. Existing `tools/ready.py`, cmp/bind and regression
   reports are enough; do not build another dispatcher or parser framework.
3. Compare structure first: functions defined by each TU, static/inline helper
   copies, real calls versus expansion, compiler flags, PC field offsets,
   table ownership and CRT/library references. Test a common cause on its group.
4. Make the smallest evidence-backed C/C++ change. Test the actual source with
   the existing fixture; extend that fixture only for new behavior or a gap.
5. Build once, reuse the fresh objects for all comparisons, run both unchanged
   referees and the817-extent ratchet. Measure accepted C/C++ delta and layout.
6. Keep only gains with no accepted regression. A promising failed trial stays
   an uncredited draft. At most3 builds for one unchanged hypothesis; switch
   groups unless new binary/caller evidence justifies continuing. Do not spend
   another session permuting a one-instruction register tie.
7. Save a checkpoint after a meaningful accepted cohort, not every spelling
   change. Cold rebuild at major milestones or structural/toolchain changes,
   rather than after every small source edit. No duplicate full builds.

The tools automate comparisons, binding checks and regressions. They do not
automatically infer missing source or establish that an imported function matches.
No new service, agent fleet or paid infrastructure is required for this loop.

## Next work, in priority order

1. **Keep the C/C++ meter reproducible.** Run source_coverage.py after each
   accepted build. Any changed assembly-containing source requires re-review;
   unknown authored assembly fails the counter. Keep the31 excluded bodies in
   a separate ledger. Preserve the supported denominator and its uncertainty.
2. **Audit TU structure against the existing imported source and PC calls.**
   Find missing/extra helpers and incorrect ownership before more small-loop
   rewrites. Keep a short mismatch list, not an assumed historical link order.
3. **Material parser closure.** Existing source covers conditions, cached state
   maps, DX7 options/samplers/stages and pass loading. Some parents already
   match raw bytes but are blocked by helper bindings. Work on the complete
   condition/state-map group and sampler/argument group, not isolated wrappers.
   Count their complete verified executable extents only when bindings close.
4. **Image/render-target closure.** Fullscreen accounting149 blocks the existing
   render-target initializer2102 and related callers. Fix the group without
   sacrificing the two accepted160-byte cookie initializers. Rejected width-
   switch/noinline trials lose those initializers and add no accepted body;
   do not repeat them without new evidence.
5. **Next independent groups.** Rank the remaining portal clipping, model/skin,
   shader-state setup and image-loading groups from fresh reports. Prefer a
   shared cause that unlocks several functions. Their current drafts are NOT
   credited just because source exists or tests pass.

These are opportunities, not guaranteed byte gains or a promise that these
five items alone reach45%. Re-rank after each accepted cohort; the objective is
accepted C/C++ bytes per build/token, not completing a favorite function.

## Complete route to100% and release

| Stage | Work and exit condition |
| --- | --- |
|40% checkpoint |At least101432 C/C++ executable game bytes, unchanged source-attribution and regression gates, reproducible proof checkpoint |
|45% checkpoint |At least114111 C/C++ executable game bytes, assembly attribution complete, both referees/regression green, cold receipt saved |
|Remaining game source |Apply the cohort loop to every remaining game body; complete PC types, real bindings and ownership; no unknown-function stubs credited |
|Whole-program structure, in parallel |Recover necessary TU/function set, shared-helper copies, link/library member order, data contributions, strings and per-TU flags; gate each structural change immediately |
|Exact image reconstruction |Resolve addresses, code padding/alignment, static data, relocations, imports/exports, CRT startup and PE/debug metadata; remove temporary retention exports using real callers |
|SHA finish |Build from the maintained C/C++ tree with pinned original compiler/SDK/library inputs; entire DLL SHA equals4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6 |
|Runtime and release |Smoke-test with the1.0 client and legally supplied assets, verify a fresh checkout rebuild, write license/provenance/build docs; owner reviews release-tree promotion and commits |

Use the pinned Summer2004 SDK and original VC7.1 libraries, plus the correct
upstream IJG source where needed. Do not reverse third-party library internals
again merely to inflate a game-source percentage. Library and game coverage
remain separate; all linked bytes still matter to the final SHA.

Exact PE/debug metadata is an unresolved build-reproducibility problem, not
something to wave away after code recovery. Test repeat-link determinism and
retail metadata requirements alongside source work. Do not silently redefine
the finish line to a normalized hash, copied retail bytes or post-link patches.

## Updates, cost and limits

Report accepted C/C++ bytes/percentage and delta first; assembly separately.
Also report regressions, whole-file same-offset measurement and SHA equality
as distinct facts. Current same-offset reports come from the diagnostic build
and include headers/data/debug; they are not a release-build source meter.
Give builds/time and token cost only when measurable; never invent usage figures.

No new agents unless authorized, no repeated full source copies, no background
build left unidentified in a handoff, no push without "push it", and no release
promotion before owner review. Current work continues unless the owner pauses it.
No reliable release date follows from current coverage; compiler/layout and
metadata blockers must be resolved before estimating the remaining schedule.
