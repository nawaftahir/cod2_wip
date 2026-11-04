<!-- Generated from CLAUDE.md. Edit CLAUDE.md, not this file. -->

# CoD2 renderer 1.0

Read the parent cod2_wip/CLAUDE.md. This target is public source only; compiler,
SDK, retail anchors and generated objects/DLL/PDB files must never enter Git.
CI uses the private package pinned in toolchain/image.txt.

Work on gfx/<work> in cod2_wip/.worktrees/<work>. gfx/main is the confirmed
line at cod2_wip/gfx; merge only after the clean gate passes. Push only when
the owner asks. Never change another target or the release repository.

Read docs/STATUS.md, docs/KNOWLEDGE.md and docs/TRIED.md before any experiment.
Keep new failed attempts in docs/TRIED.md. Historical hashes and snapshots
remain immutable under workspace/work/proof. Do not repeat rejected probes.

src/ contains complete verified files only. Partial reconstruction is under
workspace/work/src. workspace/src contains compatibility/reference inputs.
The nested workspace layout preserves the already-tested compiler-visible
paths and TU/link ordering; do not reorganize it while matching functions.

make check runs a fresh build, byte and binding referees, all protected
extents, assembly attribution and verified-only src checks, then writes
build/meter.json. Never edit the measured meter. CI publishes it on gfx/main.
C/C++ game coverage excludes every assembly-bearing function in full; raw
same-offset equality and normalized whole-text matches are different meters.
Whole-file SHA equality followed by a smoke test is the finish line.

No copied retail bytes, emit wrappers, invented symbols/types or patches.
No source credit from a masked relocation match without bindings. Retain
every protected extent; do not invent a tie exception to accept a loss.

Keep one physical output directory: workspace/build/codex_boundsoutside_1016_02.
Never copy a build or delete through a symlink. No broad filesystem cleanup.
Use the configured Nawaf Git identity and no Co-Authored-By trailer.
