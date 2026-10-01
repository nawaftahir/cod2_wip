# Shared shader-constant upload draft — DEFER

The upload TU receives no source coverage. Do not import `set_typed.cpp` into
a release tree. Twelve independently certified helpers have been separated
into `target/src/codex_shader_constants/`, with their own proof and link.

`set_typed.cpp` is a readable target-backed generic family with nine Set
specializations and 27 Read helpers. It compiles in pinned MSVC 13.10.4035.
`probe.py` compares entire original SDK sections, including relocation field
layout. The latest source/object hashes and first differences are in
`probe.json`. A shape match is not a binding/identity or accepted-source proof.

Bounded work performed:

- Initial `/O1 /Oy- /hotpatch /MT /Gy` batch: all nine Set methods differ.
- Corrected source-class-dependent count scaling and scalar/vector/matrix
  copy paths using the target decompiles; `/Ob2` did not resolve the family.
- Replaced wrapper calls with confirmed direct indexing expressions; 18
  helper sections now match shapes, but ambiguous template identities are
  not assigned and receive no credit.
- Corrected reverse padding's separate padding/copy destination pointers,
  and scoped copy indices/pointers to their actual lifetimes.
- Tested equivalent conditional count clamping. All nine Set bodies still
  differ. Latest raw scalar Set is 644 vs 671 bytes, first difference +8.

Next: resolve the remaining source expression/lifetime shape and verify
behavior against authentic SDK methods before more compiler trials. The
matrix Set sizes still differ materially; they are not merely register
near-matches. Float-to-int C conversion emits a runtime call in this context;
the target has an x87 control-word sequence. That is not proof that source
reconstruction is impossible or that `/GL` is needed. No assembly workaround
or fabricated flags/provenance is supplied.

The CConstant declaration is an observed access prefix only, not a complete
allocation layout. Do not construct SDK instances with this declaration.
Field access facts come from target Set decompiles at 0x1007e699–0x10080425;
template names/section extents come from the hash-pinned original SDK archive.
Read bounds deliberately preserve the target's inclusive Rows/Columns tests;
do not "fix" them while seeking original binary identity.

## 2026-10-01 continuation

The prior interpretation of the fifth template option was wrong. It is
**PointerArray**, not transpose: original Read sections explicitly load the
selected matrix pointer. Direct target code at 0x1007fae3 and the original
SDK typed sections confirm this. Class 2/3 controls orientation independently.

The draft now handles pointer-array input, both fixed 4x4 transpose fast paths,
and conversion dispatch outside the value loop. Boolean-to-integer/float
conversions normalize nonzero input. These are target-backed corrections, not
proof of a matched Set body. Latest default Set sizes are 640/671, 749/770,
734/758, 753/817, 964/1005, 1115/1173, 1009/1082, 1227/1288, 1009/1082.
All nine still differ; no upload method is promoted.

23 Read sections match shapes in this draft; four matrix linear-read sections
still differ in expression/register order. The eleven unambiguous complete
read bodies and the 18-byte shader-version routine are certified separately.
Twelve scalar-template shapes have multiple possible retail placements and
are not independently named or counted from this draft.

`/Oi` did not fix the upload family. Bounded `/G5`, `/G6`, `/G7`, `/GB`
comparisons also left all nine Set methods unmatched. Their diagnostic JSON
preserves then-current hashes; do not pair older objects with changed source.
No broader compiler sweep or compiler-impossibility claim is warranted.

Target float-to-integer conversion saves/sets the x87 control word **outside**
its value loop, converts through a float temporary, then restores the saved
word. A normal C++ cast currently emits a runtime helper. `/QIfist` alone is
not evidence for the target sequence: Microsoft documents its rounding-mode
dependence at https://learn.microsoft.com/en-us/cpp/build/reference/qifist-suppress-ftol.
No synthetic assembly or historical-source claim has been introduced.

The metadata draft preserves token high-bit skipping and shader-comment
length rules. Shader version matches and has a clean independent source file;
FindShaderComment and GetShaderSize still differ and receive no credit.
`test_reads.cpp` covers the accepted read helpers and version query only,
not Set/upload behavior, game boot, or GPU operation.
