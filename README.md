# gfx — shared renderer reconstruction

Active work: [target/work](target/work/README.md). Read [rules](RULES.md).
Current progress and continuation: [PROGRESS.md](PROGRESS.md), the only live status log.
Execution plan: [whole-file retail reconstruction](WHOLEFILE.md).
Source, tests, layout tracking and proof are separated there; one build directory
is reused. Old scratch folders and archived builds are history, not active inputs.

Read the actual C/C++ in [target/work/src](target/work/src). Files may still
contain unmatched drafts; accepted bodies are identified by the binding proof.
This is also the source being developed for the final retail-identical DLL:
there is no separate complete "retail source" tree. Whole-file reconstruction
connects these same functions with their real callers, data and original
libraries. [src/tus.txt](target/work/src/tus.txt) lists compiled files in candidate
link order. `target/src/opencod2` is supporting reference/header material, not
evidence that the entire engine has been reconstructed. Current verified
counts and limitations are maintained only in PROGRESS.md.

Old `target/agent_*` folders and compiler debris were moved, not deleted, to
[archive/target_trials_20261021](archive/target_trials_20261021/README.md).
Do not run their build scripts. Required historical gate JSONs are now local
under target/work/proof/history. Shared headers remain under target/src.

Build and verify: `sh target/work/tools/build.sh`.
`make measure` is exploratory discovery, never whole-file identity or source coverage.
