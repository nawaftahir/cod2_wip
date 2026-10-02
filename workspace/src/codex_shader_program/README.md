# Shader program source checkpoint

`program.cpp` contains twelve source-backed methods: setup/copy, remapping,
compaction, read/write analysis and two deleting helpers. Clean V2 proves2663
instruction bytes with complete bindings and negative tests. The integrated
public CPU fixture passes1284 complete shader-output comparisons.

Aggregate-accepted:571 private linked matches retain all559 previous matches;
1284 integrated CPU outputs and the full disjoint coverage replay pass.
The former four failures were missing zero-credit SDK destructor locators,
now checked explicitly. See `../../scratch/codex31_program/REPORT.md`.
The unmatched Optimize definition is absent from this clean file. External
SDK methods and access-prefix declarations are not reconstructed-body credit.
