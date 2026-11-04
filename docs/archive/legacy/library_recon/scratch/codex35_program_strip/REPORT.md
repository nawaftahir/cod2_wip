# Varying pruning and lookup integration — 2026-10-02

Active goal: 35% independently verified source instruction coverage.
Five clean definitions total 643 bytes: StripVarying529, GetPool27,
GetArgument27, GetInstruction27 and Origin33. Complete V2, private V3/583
retaining578 and 1,284 integrated full-output CPU comparisons passed. No
Fresh full aggregate PASS in aggregate.log accepts all643 disjoint bytes:
337130/1089680 =30.938441%. No whole-file identity or GPU certification.

PINNED: keeping repeated `arguments[index]` accesses rather than a cached
`next` pointer reproduces the target's reloads and 529-byte body. Both tested
input-buffer expressions then match. This is ordinary source reconstruction,
not padding or an ABI/compiler workaround. Getters return null out of bounds;
Origin preserves an invalid index or missing origin. Their actual symbols,
target addresses and complete sections are checked independently.

The selector requires 220 distinct source definitions and 240 removed SDK
archive entries, exact symbol sets and the parent's static callback ownership.
Previous accepted source and dependency archives remain unchanged. Original
SDK/CRT dependencies and data receive zero additional source credit.

The first CPU ownership check honestly failed because default /OPT:REF removed
unused getter definitions from the test executable. Both actual CPU fixtures
were rebuilt with /OPT:NOREF, preserving every definition for the unchanged
owner gate. All 1,284 output comparisons then passed. This does not assert
that every getter was dynamically exercised. No fake reference marker was
added and no failed gate was waived. Clean V2 and V3 were refreshed after the
fixture build-script change to preserve current input hashes.

From gfx/target:

    sh scratch/codex35_program_strip/build.sh
    python3 scratch/codex35_program_strip/check.py --clean
    python3 scratch/codex35_program_strip/check_link.py
    python3 scratch/codex35_program_strip/run_clean_test.py

Rebuild the two fixtures using compile_clean_test.sh in the pinned CPU image
after modifying actual compile inputs. The complete checks inherit pinned
tools from the prior cohorts, not weaker new comparison implementations.
