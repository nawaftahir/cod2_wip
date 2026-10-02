# Uniform-output pruning — 2026-10-02

Active35% goal. StripUniform10087159/408 passes complete clean V2 with literal
SDK/retail/source bodies, bounds, fields and negative tests. Private V3 accepts
578 source matches retaining577;1284 full shader/error/constant-buffer CPU
outputs agree (954 successes and330 errors in each profile). All gates were
freshly executed. Fresh full aggregate PASS in aggregate.log accepts its408
disjoint bytes:336487/1089680 =30.879432%. Whole-file identity remains unproven.

Source: ../../src/codex_shader_program_pruning/pruning.cpp. Compiler4035 flags
/O1 /Oy- /hotpatch /MT /Gy /d2QIftol and pinned images are inherited from the
parent varying family. The source uses indexed counting/compaction and a low20
token-count bitfield. Removing an unnecessary outer zero-output guard avoids
the extra load/compare; the for-loop handles zero outputs naturally. A do-loop
counter variant did not match. No padding, volatile accesses or ABI change.

Selector verifies215 distinct source definitions/235 removed archive entries,
exact symbol sets, static callback ownership and unchanged parent sources.
SDK/data/dependency definitions receive no additional source credit.

The first linked checker wrapper selected the wrong inherited run because two
path replacements collided. It failed the owner gate honestly. The corrected
wrapper derives directly from the pinned flow checker with explicit new-run
and baseline paths; clean V2 and full V3 were genuinely rerun, not waived.
CPU proof was independently built from the correct new private libraries and
enforces the pruning.obj owner. Preserve complete hashes and all gates.

From gfx/target:

    sh scratch/codex35_program_pruning/build.sh
    python3 scratch/codex35_program_pruning/check.py --clean
    python3 scratch/codex35_program_pruning/check_link.py
    python3 scratch/codex35_program_pruning/run_clean_test.py

Compile_clean_test.sh builds both actual executable fixtures in the pinned CPU
image. Rebuild them after input changes before running the last command.
