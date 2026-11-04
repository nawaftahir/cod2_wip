# Varying propagation reconstruction — 2026-10-02

Active owner goal35%; confirmed lower bound336079/1089680 =30.841990%.
This new673-byte pair has clean V2, private V3/577 matches retaining575 and
1284 integrated complete shader-output CPU comparisons and a fresh full
aggregate PASS. Its673 disjoint bytes count. Remaining SDK functions are
zero-credit dependencies.31% needs1722 more bytes;35% needs45309.

- IsVarying:10086f0d/59, actual early-invalid-return recursive C++ definition.
- MarkVarying:1008d61e/614, actual opcode expressions and indexed input loops.

Source is ../../src/codex_shader_program_varying/varying.cpp. The methods are
compiled together with pinned4035 compiler and /O1 /Oy- /hotpatch /MT /Gy
/d2QIftol. Index/opcode variants in ../codex35_program_lifetime supplied the
whole614-byte match, but moving MarkVarying alone to a TU produced603 bytes.
Including the genuinely source-matched59-byte helper restores614. Its body
is an optimized loop with no self-call relocation. No ABI changes or padding.

The selector checks214 distinct source symbols/234 removed archive definitions,
including retained parent bodies and duplicate archive definitions. Exact
symbol sets, map ownership, complete boundaries/bindings and negative tests
are retained. CPU fixture checks both method owners and full shader/error/
constant-buffer outputs:954 successes and330 errors, zero differences.

From gfx/target:

    sh scratch/codex35_program_varying/build.sh
    python3 scratch/codex35_program_varying/check.py --clean
    python3 scratch/codex35_program_varying/check_link.py
    python3 scratch/codex35_program_varying/run_clean_test.py

The clean fixture executables must be freshly rebuilt after input changes via
compile_clean_test.sh in the pinned CPU image, not merely replayed with new hashes.
Inherited runner metadata now records the actual run_clean_test.py entrypoint;
no nonexistent run_test.py marker was added. An initial audit expected-address
assertion was corrected from the independent clean packet before replay; the
earlier process was terminated deliberately, not restarted for a timeout.
aggregate.log preserves the corrected PASS. No whole-file identity/GPU claim.
