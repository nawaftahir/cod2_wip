# Predicate ordering — 2026-10-03

Complete ComparePredicate1008661b/573, SDK90 section7, reconstructed as readable
C++. It aligns predicate-chain depths, compares argument lifetime intervals,
then orders output senses and instruction indices. Observed chain14/sense18
and instruction34 accesses reuse previously pinned prefixes.

The first562-byte source body reproduced all instructions before the interval
return branches, then differed315: combined Boolean sense tests merged return
blocks at the end. Nested sense tests and explicit final else reproduce every
byte of the573-byte body without ABI, padding or assembly workarounds.

Fresh clean V2 passes full source/SDK/retail body, boundaries, typed binding,
negative tests and referee100. The SDK callback is private; selector admits
source metadata rebinding only for its exact name/predicate.obj,573 literal
bytes, both complete bounds, zero relocations and original/source storage-class
proof. Other callback gates remain unchanged.251 source definitions replace
271 SDK entries. Private V3 passes614 source matches, retaining all613.
Actual fresh CPU fixtures pass1284 complete outputs (954 successful compiles,
330 diagnostics per profile). All input hashes are current. Aggregate inclusion
remains pending; no whole-DLL/GPU or exhaustive internal-branch claim.
