# Gemini renderer worker: SCENE_01

Work only in `/home/nawaf/cod2/test/dev/gfx/worktrees/gemini` on branch `workers/gemini-gfx`.
The primary Codex workspace is `/home/nawaf/cod2/test/dev/gfx`. Read its RULES.md and your local
MISSION.json first. The base is871d13e; this is a separate source checkout,
not another full build. Shared reference links are outside your checkout in
../glm, ../refrences, ../cod2engineold and ../sdk; treat all as read-only.

## Deliver real matching source

Own target/work/src/gfx_d3d/r_scene.cpp. Work on these five existing bodies as
one connected cohort: R_GetClearColor156B, R_AddClearCommandsForFrameBuffer97B,
R_RenderSceneDepth442B, R_RenderSceneFullbright451B and
R_RenderSceneDebugShader217B. Addresses and baseline SHA are in MISSION.json.
The1363B is a target scope, NOT promised progress. Target bytes outrank Mac and
opencod2/Kisak references. Reconstruct/match the actual C/C++ and live call order;
a function list, parser, copied reference file or triage-only report is not the
requested result. Do not rewrite the rest of the TU or erase accepted bodies.

Use the existing target/work/tests/test_scene_modes.py. Expand it only for a
real behavior you recover. Preserve live world/command-count reads and exact
command order; the existing tests deliberately mutate callback state. Keep
existing public signatures, struct fields, diagnostics and data ownership.
No assembly additions, byte arrays, post-link fixes, new roots/exports, guessed
constants or weakened gates. A near match or native test pass is not V2.

## Isolation and cost

Do not edit the primary tree, root src/ snapshots, shared headers, tools,
profile.mk, tus.txt, link order, verifiers, other TUs or another worker's files.
Do not delete folders or install another SDK/compiler. Original VC7.1/Summer2004
inputs already exist. Never copy game binaries or build directories into git.

There is ONE whole-DLL build owned by Codex. Do not run build.sh, pb.sh, make,
or a whole-link Docker job from this checkout. Native source fixtures are fine.
analysis/live_primary_build is a READ-ONLY view of the coordinator's changing
build: it describes the primary source, never proves your edited candidate.
Compare its SHA before/after any baseline analysis and discard a racing read.
Request a serialized integration/build slot in REPORT.md after a meaningful
source cohort is ready. No independent build is being hidden or duplicated.

## Procedure

1. Run pwd and git branch --show-current; confirm this checkout and worker
   branch. Confirm your source hash matches MISSION.json before the first edit. Read
   the five retail bodies and the actual callers/callees, then the current source.
   Use the pinned retail at ../cod2engineold/binaries/windows/1.0/ from this root's
   parent reference link. Local analysis map paths are in analysis/.
2. Edit only the assigned bodies in your own TU. Batch real changes. Run
   `python3 target/work/tests/test_scene_modes.py` from this checkout.
3. Bound a nonproductive compiler/source hypothesis: log exact changes, evidence
   and results, then move to another member of this cohort. No endless scalar
   spelling variations or unsupported claims that the compiler makes it impossible.
   DEFER only the specific body/fact you cannot prove; retain real source work.
4. Write REPORT.md listing source changes, exact commands/results, target address
   and size for each body, remaining first mismatch/binding blocker, attempts not
   to repeat, and whether a fresh original-toolchain integration gate was run.
   If none was granted, label the packet DRAFT_FOR_INTEGRATION, not MATCH/REVIEWABLE
   or a percentage gain. Never manufacture proof or report another build as yours.
5. Export only your owned source/test delta to scene_candidate.patch:
   `git diff 871d13e -- target/work/src/gfx_d3d/r_scene.cpp target/work/tests/test_scene_modes.py > scene_candidate.patch`.
   This works before or after a worker commit. Do not
   include setup files or the shared-build link. You may commit those owned changes
   on your worker branch with the configured identity. Do not merge or push.
   Return the report and patch paths to the owner/Codex for the actual gate.

## What the maps mean

analysis/retail_functions.tsv covers the inventoried retail entries plus extra
verified starts. NO_SOURCE_OWNER and candidate ownership are intentionally
honest; this is not proof of every lost PC TU boundary. The inventory can also
understate an extent; actual verified bytes take precedence. Queue sizes include
aliases/dependencies and are NOT source-coverage percentages. Complexity is a
scheduling estimate. A zero-open direct-call rank ignores indirect/data/import
bindings; inspect actual referee reasons. Only the coordinator updates coverage.

The copied analysis maps describe a completed primary build, which may include
newer primary work than your base commit. They are analysis references, not
proof that your checkout reproduces that build. The live primary image is never
your candidate. For baseline disassembly only, run from your target/ directory:
`python3 ../tools/fdiff.py R_RenderSceneDepth 0x10024a90 ../analysis/live_primary_build`.
