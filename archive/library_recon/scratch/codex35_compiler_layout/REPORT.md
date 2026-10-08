# Matrix-layout reconstruction draft — 2026-10-02

Two actual C++ methods are authored from complete typed SDK member 73
instructions: IsRowMajor (target 404 bytes, retail 1006D5D9) and
IsColumnMajor (406 bytes, retail 1006D76D). They are not accepted source.

`layout.cpp` gives complete 372/376-byte source sections, first differences
at +7. `layout_pointer.cpp` tests outer/inner pointer induction instead of
indexed arguments and gives 361/362 bytes, also first differences at +7.
`layout_cached.cpp` then tests the target operand order and per-pass cached
argument/label arrays: 391/387 versus 404/406, first differences +7/+12.
All three source/SDK diagnostic packets preserve their source and object hashes.
No source/compiler/TU impossibility claim; no fabricated ABI or marker code.

The indexed source passes 32,768 full original/source output comparisons
(both predicates in every row, 65,536 method invocations), with correct map
ownership checked. Tests cover numeric template codes 0..3, dimensions 0..7,
label flags, differing registers, direct/indexed layouts, instruction owners
and reversed argument lists. The constructor and every other retained SDK
method remain original dependencies, with zero source credit. Pointer-variant
behavior has not been separately certified. Neither draft gets any percentage.

PINNED logic: non-template-2 Row returns rows == 1; Column returns rows > 1.
Template 2 returns zero for a zero row*column product. Row first examines
strided column groups, then contiguous row groups; Column reverses the passes.
A mismatch in the **first** pass returns one, not zero. A mismatch in the
second returns zero. Matching both passes returns one. Do not simplify this
into conventional row-major/column-major detection: the original outputs
confirm that unusual return rule. Comparisons use label flag 40h to select
array/component offset tests, otherwise compare instruction +48h.

Reused access prefixes: argument register +4, array +Ch, component +10h,
instruction +48h; program label pointers +10h, argument pointers +14h;
label flags +4. No historical semantic names beyond typed SDK symbols and
no complete allocation-layout claim.

Replay from `gfx/`:

    docker run --rm --network none -v "$PWD/target:/work" -v "$PWD/../sdk/sum2004:/dxsdk:ro" -w /work sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 sh scratch/codex35_compiler_layout/compile.sh
    python3 target/scratch/codex35_compiler_layout/probe.py layout.obj layout.cpp
    python3 target/scratch/codex35_compiler_layout/select_dependencies.py
    docker run --rm --network none -v "$PWD/target:/work" -v "$PWD/../sdk/sum2004:/dxsdk:ro" -w /work sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 sh scratch/codex35_compiler_layout/compile_test.sh
    python3 target/scratch/codex35_compiler_layout/run_test.py

The cached-array/operand-order attempt above is already performed; do not
repeat it. Next inspect whether original inline accessor boundaries explain
the target's separately reloaded inner argument arrays. This is a hypothesis,
not historical provenance or permission to invent callees. The target allocates
24/20 bytes of locals; current source uses fewer. No volatile fields, fake calls or padding locals
may be introduced merely to force register or frame selection.
