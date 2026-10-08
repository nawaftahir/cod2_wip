# Duplicate arguments — 2026-10-02

Fresh complete clean source: ../../src/codex_shader_program_duplicates/duplicates.cpp.
All three symbols were absent from existing REVIEWABLE packets before drafting.
CompareValue100864e9/79; CompareRegister10086538/142;
RemoveDuplicateArguments10094810/460. Total681 instruction bytes.

V2 REVIEWABLE681: complete typed SDK/source/retail proof, full bounds,
bindings and negative tests. V3 PASS587 retains all584 preceding matches.
Actual fresh CPU fixture PASS1284 complete outputs:954 successes and330
errors per profile. All recorded input hashes were checked current.
Aggregate acceptance is pending; opaque SDK/CRT definitions add zero credit.

Initial optimizer source already had460 bytes but differed at277: pool-ID
comparison operands were reversed. Matching their source order solves it.
CompareRegister requires the actual ordered else-if chain (including signed
link18); independent if-return statements emitted142 bytes with different
return-block positions. CompareValue's shared less/greater return paths
reproduce the complete79-byte body. Other ordinary equivalent conditions
gave79 or85 bytes with real opcode/branch differences, not accepted matches.

Both comparators are originally private SDK symbols. The initial selector
correctly refused them. The new selector extends the existing exact callback
contract: full literal79/142 bytes, no relocations, symbol ownership, bounds
and storage classes must agree before rebinding them to genuine source.
It checks224 distinct source definitions/244 removed SDK entries. No SDK
instruction, retail binary or post-link code patching is used.

Algorithm: two in-place O(n log n) index sorts plus linear merge/remap scans;
O(argumentCount) scratch indices. Target error and ownership behavior is
preserved rather than enhanced. No stability or every-path execution claim.

From gfx/target:

    sh scratch/codex35_program_duplicates/build.sh
    python3 scratch/codex35_program_duplicates/check.py --clean
    python3 scratch/codex35_program_duplicates/check_link.py
    python3 scratch/codex35_program_duplicates/run_clean_test.py

Compile both real CPU fixtures with compile_clean_test.sh in the pinned CPU
image after any input change. Probe files are discovery diagnostics only.
