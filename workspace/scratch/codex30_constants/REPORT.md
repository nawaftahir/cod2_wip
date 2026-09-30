# Shared shader-constant draft — DEFER

No source coverage is credited. Do not import this TU into a release tree.

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
