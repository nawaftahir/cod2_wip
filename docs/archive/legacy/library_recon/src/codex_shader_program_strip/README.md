# Varying pruning and program lookup

Five complete readable definitions, 643 target instruction bytes:

| Method | Target address | Bytes |
|---|---|---:|
| CBaseProgram::GetPool | 1006c34c | 27 |
| CBaseProgram::GetArgument | 1006c367 | 27 |
| CBaseProgram::GetInstruction | 1006c382 | 27 |
| CProgram::Origin | 10086c88 | 33 |
| CProgram::StripVarying | 10086f48 | 529 |

Clean V2 matches complete SDK/source/retail bodies, bounds, relocations and
bindings, including negative tests. Private V3 retains all 578 preceding
matches and accepts 583. The integrated CPU fixture compares 1,284 complete
shader/error/constant-table outputs, with 954 successes and 330 failures in
each profile. This is integration coverage, not direct execution of every
getter or GPU/whole-file certification. Fresh full aggregate accepts all643
disjoint bytes (../../scratch/codex35_program_strip/aggregate.log).

Proofs and build instructions: `../../scratch/codex35_program_strip/`.
The declarations are pinned access prefixes, not historical allocation sizes
or original private SDK header names. No retail code bytes or opaque-library
implementation is embedded in this source.
