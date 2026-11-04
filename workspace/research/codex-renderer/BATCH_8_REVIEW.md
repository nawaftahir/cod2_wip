# Renderer checkpoint 8 — JPEG layout / callbacks, 2026-09-26

## Root cause: target-modified JPEG common prefix

PINNED on target instructions: allocation callback at cinfo+24, one size argument,
cdecl caller cleanup4. Free callback at cinfo+28, pointer and size arguments,
cdecl caller cleanup8. Sites and exact source modifications are documented in
`scratch/jpeg_callbacks/MODIFICATIONS.md`. Names target_alloc/target_free are our
descriptive names, not purported historical identifiers.

The overlay preserves the original library files and notices; only jpeglib.h and
jmemmgr.c change. All source/header hashes and commands are recorded. The IJG
release-6b README was added unmodified from the local Quake III reference.
No reference workspace or release-monorepo file was edited.

Fresh one-TU run `baseline_jpeg_a1_gw6ay` gives four exact allocation bodies:
alloc_small325, alloc_large185, alloc_sarray167, alloc_barray167 = **844 bytes**.
Fresh full-overlay run `baseline_jpeg_2cyt2ouy` preserves both transform matches
as well: six matches /6,063 bytes. No allocation stubs or byte patches.

## Allocation-family proof

`python3 codex/renderer/check_jpeg_allocators.py`

`jpeg_allocator_packet.json`: four full-length strict matches AND original
referee, all direct callee bindings and two complete slop-table initializer
proofs. Tables at 0x101910dc=[1600,16000], 0x101910e4=[0,5000]. Wrong-callee
negative test rejects a shifted alloc_small address.

32-bit host fixtures assert callback offsets24/28 and both pool-header sizes16,
alignment, small/large allocation, row/block arrays, pool lifetime isolation and
balanced allocation/free byte accounting. GCC -m32 alone gives four-byte double
alignment and a 12-byte pool header; **-malign-double** is necessary for this host
fixture to reproduce the relevant MSVC ABI. Do not weaken the layout assertions.
Helper init/free routines used by fixtures are not thereby claimed byte-matched.
Host execution is not game/Wine smoke.

## Second root cause: byte-sized JPEG boolean layout

Target virtual-array fields: b_s_open byte at +0x22, next pointer +0x24,
backing-store record +0x28. Stock int boolean places these later. A separately
preserved overlay `scratch/jpeg_callbacks_bytebool` changes only jmorecfg.h's
boolean typedef to unsigned char in addition to the callback changes.

PINNED: field widths/offsets above. Exact historical spelling and validity of
this typedef for every unmatched routine remain unproven. Do not replace all
remaining behavior with inferred code or call the entire library reconstructed.

Fresh jmemmgr-only run `baseline_jpeg_9pcipvfj`: eight matches/1,351 bytes,
including four new virtual-array/I/O helpers. Fresh 43-TU run
`baseline_jpeg_1k8utuqs`: **26 matches/11,114 bytes**, zero compile failures.

## Broader discovery without recompiling

Earlier JPEG TUs occur below the original 0x10050000 discovery start. Reusing
the same fresh objects across 0x10047000..0x10050000 finds **42 additional
matches/10,976 bytes** in `baseline_jpeg_7lz18xli`. Combined: **68 distinct target
functions/22,090 bytes**, no duplicate-address candidates in these results.

The batch tool now supports --recheck-run and explicit bounded --start/--end.
It checks pinned toolchain identity, all reference dependency hashes and every
reused object hash before comparing. No fresh-build claim is made for rechecks.
Full-range replay also checks the original GLM referee for every strict match.

Latest authoritative replay `baseline_jpeg_j88osvbx`: **64 functions/20,752B
pass both checkers**. Four strict-only candidates/1,338B remain DEFER at the
original-referee gate: jdcolor build_ycc_rgb_table195 at0x1004bab0,
jdmarker get_interesting_appn326 at0x1004ec80, save_marker622 at0x1004edd0,
jdmerge build_ycc_rgb_table195 at0x10050080. The old referee falsely masks four
bytes after E9 ModRM in `81 E9` (sub ecx,imm32); its printed raw target/object
windows agree but normalization substitutes AA on the target side only.
`audit_legacy.py` reproduces this bug with synthetic bytes; `check_shape.py`
has the corresponding instruction-decoder negative fixture. No GLM matcher edit
or unilateral referee promotion. Keep64 dual-checker passes and4 strict-only
cases separate until the harness is independently reviewed.

These are source-shape candidates, not 68 independently accepted functions. Many
external/direct and indirect bindings, source layouts and semantics remain to be
reviewed. The six stronger transform/allocation proofs overlap this total and
must NOT be added again. Custom engine source remains separately16/608B.

## Next high-yield work

Review JPEG candidates by TU/callee closure from the full-range replay packet;
pin shared tables/callback layouts once, then reuse the proofs. Investigate the
remaining fast-DCT516/507 mismatch and missing inventory ranges. Preserve both
overlays and all fresh objects rather than overwriting proof inputs. No canonical
promotion, rebuilt renderer DLL, V4 checksum equality or V5 smoke yet.
