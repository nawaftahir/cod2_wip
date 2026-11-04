# IDCT full-block checkpoint — 2026-09-27

Reviewed renderer subset61416/1089680≈5.64%. This is not whole-file identity,
link acceptance, game boot or completed JPEG reconstruction.

New accepted code898: start_pass1004c0e0/781 and jinit_inverse_dct1004c410/117.
The initializer was already a shape candidate, not already accepted code.
Do not count its bytes twice. Combined JPEG179shapes/178directclosed/58367bytes.

## Proof

check_jpeg_idct_block.py reuses the existing fresh pinned/O2/Gy decoder object,
hashes its full input set, and audits all816bytes: executable781, alignmentLEA3,
compiler-generated switchtable32. Only781counted as selector code. Original
referee100% on the fullblock with local inventoryextent816; shared inventory
untouched. Instruction-aware full site/type normalization agrees; no prefix
trimming, binary patch, register shim, compiler flag change or fabricated source.

All8tableentries land on actual instruction boundaries. Target's singleindexed
jump points at the exact table. Executable controls/RET and adjacent initializer
boundary pinned. Every local label, sixIDCTkernel destinations, two complete AAN
arrays and six scalar constants bound. Source arrays are128bytes(64INT16) and
64bytes(8doubles); shared data section also contains unrelated utilitydata, so
whole-symbol extents are checked without pretending it is one retail section.
Six prior kernel objects/source/headerinputs freshly revalidated against both
referees. Twenty distinct selector bindings reject+4; initializer callback also
negativechecked after selectorclosure. Complete selectedmemory/decoderinputs
rehashed after actualsource fixture execution.

## Regression and source behavior

Full existing dependency replay session3760PASS:178shape/176closed/57469bytes,
allprevious gates/negativechecks/expandeddecoderfixtures retained. Subsequently
block session47131PASS; jpeg_idct_block_packet.json records source/input/object/
checker/basepacket hashes. Combined credit depends on BOTH packets: basepacket
still honestly carries the unresolved initializer until this separate proof.
Do not read its old unresolved count as a failure of the independentlyclosedblock.

Native32-bit test_jpeg_allocators.c extended using actualmemory/controller/DCT
source and actualsixkernels: selection of all6methods, islowtable64entries,
fastscaled entries,floatfirstentry, cachedsame-method preservation, unneeded
component and missingquanttable skips. Allpass. GCC unused-static-declaration
warnings suppressed only in hostfixture, whose separatekernels include private
controller declarations; MSVC byte gates unchanged. No mocked selectorlogic.

Existing native target/source kernel differential also rerun:288cases,0 differing
bytes, explicitCW027F. This is not observation of original runtime controlword,
exhaustive behavior, full game execution or newextra codecredit.

Reproduce BATCH_52 fullcommand, then python3 codex/renderer/check_jpeg_idct_block.py.
Optional native differential: python3 codex/renderer/check_jpeg_idct_target.py.
Remaining format_message167 has two unbound sprintf calls; stillnotaccepted.
No worker/release/progressrepository edits, promotion or commits.
