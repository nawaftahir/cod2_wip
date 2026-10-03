# Instruction-transform helpers — 2026-10-03

Clean source ../../src/codex_shader_transform_order/transform.cpp supplies
nine complete methods /885 instruction bytes from SDK91. Read117, Write105,
UpdateRead64, UpdateWrite38, CompareLoad71, CompareIndex26, RemoveDuplicates70,
RecalculateLoad285 and Reduce109. All full source/SDK/retail bytes, typed
bindings, boundaries, negative tests and referees pass in clean V2.

Read/write four bodies and duplicate removal/reduction matched the first source
build. Indexed output-count lifetimes and tag-first comparison reproduce the
complete285-byte load calculation; an else-chain reproduces CompareLoad71.
CompareIndex26 initially loaded the reversed operand; a<b / a>b reproduces it.
SDK RemoveDuplicates's complete caller and ABS32 relocation select100cbbac,
not the existing global comparator at100865c6. Its complete literal26 bytes
and no-relocation section are independently checked. No duplicate address credit.

Reduce109 ends with a backward branch to popedi/popesi/ret102..104. The exact
name, full109-byte body, jump destination and decoded epilogue are checked;
no truncated tail or generic branch waiver. ReverseInsts remains scratch-only:
72,73,74,75-byte endpoint/loop alternatives never fully matched74. Current
independent-last-index form74 differs at24. No ReverseInsts source credit.

The first build had a wrong generated clean-source path and stopped before
proof. The initial boundary check rejected Reduce's shared return. The first
CPU runner still asserted4 rather than9 owned methods; fixed to actual9 with
249 distinct replacements/269 removed entries, no weakened ownership gate.
Driver work in this same scratch directory invalidated the helper input hashes:
the checker pins all sibling C++/Python/shell files, not only clean source.
Driver source/tools were moved intact to sibling codex35_transform_driver,
then clean V2 and V3 were genuinely rerun. Freeze every pinned input during checks.

Final private V3 passes612 source matches, preserving603. Actual original/source
CPU fixtures pass1284 complete outputs (954 successful compiles,330 diagnostics
per profile); all input hashes checked current. Public API corpus is not
exhaustive internal-branch or allocation-failure execution. Aggregate pending.
Use build.sh, check.py --clean, check_link.py, compile_clean_test.sh and
run_clean_test.py. Opaque SDK dependencies receive zero source credit.
