# gfx — shared renderer reconstruction

Active work: [target/work](target/work/README.md). Read RULES.md and HANDOFF.md.
Execution plan:40% C/C++, then45% and the retail SHA: [ROADMAP.md](ROADMAP.md).
Source, tests, layout tracking and proof are separated there; one build directory
is reused. Old scratch folders and archived builds are history, not active inputs.

Read the actual C/C++ in [target/work/src](target/work/src). Files may still
contain unmatched drafts; accepted bodies are identified by the binding proof.
Current cold checkpoint:609 game bodies/107350 executable bytes including
assembly; current authored C/C++ coverage is39.263% after non-inlining guards
and source attribution. The owner's milestone is40% C/C++ first, then45%,
not mixed source/assembly coverage. See HANDOFF.md for proof scope.

Old `target/agent_*` folders and compiler debris were moved, not deleted, to
[archive/target_trials_20261021](archive/target_trials_20261021/README.md).
Do not run their build scripts. Historical proof paths in `target/scratch/`
and shared headers in `target/src/` remain required by the current build/gates.

Build and verify: `sh target/work/tools/build.sh`.
`make measure` is exploratory discovery, never whole-file identity or source coverage.
