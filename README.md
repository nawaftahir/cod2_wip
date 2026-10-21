# gfx — shared renderer reconstruction

Active work: [target/work](target/work/README.md). Read [rules](RULES.md).
Current progress and continuation: [PROGRESS.md](PROGRESS.md), the only live status log.
Execution plan: [whole-file retail reconstruction](WHOLEFILE.md).
Source, tests, layout tracking and proof are separated there; one build directory
is reused. Old scratch folders and archived builds are history, not active inputs.

Read the actual C/C++ in [target/work/src](target/work/src). Files may still
contain unmatched drafts; accepted bodies are identified by the binding proof.
Checkpoint221cfa5 preserves612 game bodies/107659 executable bytes including
assembly; authored C/C++ is99872/253580=39.385%. This is warm V2/V3 evidence,
not a whole-file match. Whole-DLL SHA is now the primary objective; source
attribution and every accepted extent remain protected. See PROGRESS.md.

Old `target/agent_*` folders and compiler debris were moved, not deleted, to
[archive/target_trials_20261021](archive/target_trials_20261021/README.md).
Do not run their build scripts. Required historical gate JSONs are now local
under target/work/proof/history. Shared headers remain under target/src.

Build and verify: `sh target/work/tools/build.sh`.
`make measure` is exploratory discovery, never whole-file identity or source coverage.
