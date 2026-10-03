# Where to inspect renderer source

35% continuation is active. New clean argument_alloc.cpp passes V2,
V3/649 retaining647 and1284 CPU outputs. Its438 disjoint bytes await full
aggregate11516; duplicate destructor32 gets zero new credit.
New accepted clean source:
[register splitting and sequence tracing](target/src/codex_shader_register_split/register_split.cpp),
two complete definitions/807 bytes. Both referees, bindings, boundaries,
negative tests,644 linked matches retaining642 and1284 CPU comparisons pass.
Full aggregate at target/scratch/codex35_output_groups/aggregate.log
(session30276) completed terminal PASS/exit0. Coverage is352015/32.304438%.
Earlier audit8482 exited1 at a legacy self-call-mask diagnostic assertion; its
failure log is preserved and no bytes were accepted from that failed replay.
Older statements saying no audit is live are superseded by this continuation.

Further clean source:
[output grouping, dot-product reduction and literal remapping](target/src/codex_shader_output_groups/output_groups.cpp).
All three complete functions/2468 bytes pass byte/binding/boundary,
V3/647 retaining644 and1284 full CPU gates with current input hashes.
They are now aggregate-accepted, together with the807 register/sequence bytes.

Latest accepted checkpoint: **352,015 / 1,089,680 =32.304438%**. Full audit30276
completed PASS/exit0 at `target/scratch/codex35_output_groups/aggregate.log`.
All32 cohort verifier pin sets and96 authoritative packet input sets were
independently rehashed current after completion. New clean source/evidence is
saved in `aaa0e28` and `99900f3`; unmatched drafts remain
scratch-only. The32% goal is reached, not whole-DLL checksum identity.

The current buildable renderer working tree is [`target/verified/src/`](target/verified/src/).
`gfx_d3d/` contains renderer C++; `universal/` contains shared engine C++.
`tus.txt` selects the files built by `target/closed.mk`; `roots.txt` lists interim
export roots. The linked `build/v/gfx.dll` is a diagnostic source-only DLL,
not a reconstructed retail DLL or a release artifact.

For a concrete readable example, start with
[`R_RegisterDvars` in `gfx_d3d/r_dvars.cpp`](target/verified/src/gfx_d3d/r_dvars.cpp):
its 4,046-byte function is accepted by the current binding verifier. Most other
files contain a mixture of accepted functions and drafts; the directory name
does **not** certify every line or function in it.

Other code in the same source files is draft and must not be described as
verified. JPEG source-backed proofs remain in `../codex/renderer/` snapshots,
not yet consolidated into this tree. Two separately verified small source
files in `target/src/codex/` also need integration into the closed build.

The current cross-tree, address-deduplicated source lower bound is **352,015 /
1,089,680 = 32.304438%** (2026-10-03), confirmed by a fresh full aggregate
replay. The owner reinstated **35%** after the earlier above-30% checkpoint;
**29,373** further verified instruction bytes are required for35%.
The requested32% checkpoint is reached. Whole-DLL checksum identity is still
unfinished.

Latest clean source is
[`codex_shader_program_order/program_order.cpp`](target/src/codex_shader_program_order/program_order.cpp):
eight complete definitions/962 bytes, final clean byte/binding proof,622 linked
matches retaining614, and1284 integrated CPU comparisons pass with current hashes.
Its complete generated virtual tables add no code credit. Terminal PASS/exit0 at
codex35_program_order/aggregate.log now includes these962 bytes in the total.
Additional candidate source is
[`codex_shader_pool_helpers/pool_helpers.cpp`](target/src/codex_shader_pool_helpers/pool_helpers.cpp):
four complete helpers /424 bytes pass clean V2 and1284 full CPU comparisons.
V3 now passes626 linked matches retaining all622 after the missing metadata
dispatch was supplied using existing full proof tools against the new image.
They are now aggregate-accepted: the full replay completed terminal PASS/exit0
at codex35_pool_helpers/aggregate.log. The subsequent four-cohort audit below
also completed PASS/exit0; no aggregate is currently running.
Its REPORT records the historical failures, resolved gates and exact replay.
Larger register-pool methods remain scratch drafts and are not counted.
Latest separate clean candidate is
[`codex_shader_program_drivers/drivers.cpp`](target/src/codex_shader_program_drivers/drivers.cpp):
Link91/Optimize638 pass full byte/binding/boundary proof,628 linked matches
retaining626 and1284 full CPU outputs. Their729 bytes are accepted by terminal
PASS/exit0 at codex32_program_drivers/aggregate.log and included above.
Three newer clean files are codex_shader_program_diagnostics/diagnostics.cpp
(506 bytes), codex_shader_special_literals/special_literals.cpp(520 bytes),
and codex_shader_swizzle/swizzle.cpp(536 bytes). All have complete local byte,
binding,linked-regression and1284-case CPU proofs with current hashes; their
1562 bytes are now aggregate-accepted. A fourth clean source file,
codex_shader_argument_helpers/argument_helpers.cpp, adds seven complete533-byte
methods passing V2,V3/642 retaining635 and1284 full CPU cases with current hashes.
IsCombine35 is excluded as duplicate prior ownership. Terminal PASS/exit0 at
codex32_argument_helpers/aggregate_resume.log accepts all2,095 new disjoint
bytes. The confirmed32.003891% replaces the earlier pending estimate.
Allocation/phase drafts are kept separately in scratch/codex32_program_allocation.
The preceding transform885, driver1129 and predicate573 cohorts ARE now included
by terminal PASS/exit0 at codex35_predicate_order/aggregate.log.

New clean candidates are `target/src/codex_shader_program_varying/varying.cpp`
(two methods/673 bytes; V2,577 linked matches retaining575,1284 full CPU
outputs and full aggregate pass; included in the total) and
`target/src/codex_shader_program_pruning/pruning.cpp` (408-byte StripUniform;
clean V2,578 linked matches retaining577 and1284 full CPU outputs pass).
The pruning408 bytes are accepted in the total by a fresh full aggregate PASS.
`target/src/codex_shader_program_strip/strip.cpp` adds five clean methods/643
bytes passing V2,V3/583 retaining578 and1284 integrated CPU outputs; fresh
full aggregate accepts them. No dynamic execution of every getter is claimed.
`target/src/codex_shader_program_sort/sort.cpp` adds complete HeapSort279,
passing clean V2,V3/584 retaining583 and1284 full CPU outputs; aggregate pending.
`target/src/codex_shader_program_duplicates/duplicates.cpp` adds three complete
methods/681 bytes, clean V2,V3/587 retaining584 and1284 full CPU outputs.
`target/src/codex_shader_instruction_duplicates/instructions.cpp` adds three
complete methods/1106 bytes, clean V2,V3/590 retaining587 and1284 CPU outputs.
The current full aggregate includes these2066 pending bytes; no extra percentage
until it passes. Every source/proof input hash was checked current.
The new predicate pair is separated in target/src/codex_shader_predicate_merge/:
226 complete bytes, clean V2,V3/592 retaining590 and1284 full CPU outputs pass;
all recorded hashes are current. Aggregate inclusion is pending.
The new pool/predicate/swizzle module is separated in
target/src/codex_shader_program_coalesce/:699 complete clean V2 bytes,
V3/595 retaining592 and1284 full CPU outputs pass with current input hashes.
Its CPU harness count assertion was fixed and all affected gates replayed.
Aggregate inclusion is pending. The separate vectorize-helper module adds346
complete V2 bytes,V3/597 retaining595 and1284 full CPU outputs. Its two unmatched
helper drafts and coalesce Vectorize near-match remain excluded. Combined
aggregate includes3337 pending bytes, not yet accepted; its older interrupted
replay supplied no PASS. Cleanup816 passes complete V2,V3/599 retaining597 and
1284 actual full CPU outputs; ordering660 passes V2,V3/603 retaining599 and
1284 full CPU outputs, all hashes current. Both await aggregate inclusion.
The terminal PASS/exit0 aggregate at codex35_vectorize_helpers/aggregate.log
now accepts the3337 bytes from sort, both duplicate families, predicate,
coalesce and helper modules. Older pending statements above describe the
pre-PASS checkpoint. Cleanup816/order660 still await the next full replay.
Read HANDOFF.md before resuming.
New clean source modules codex_shader_transform_order/transform.cpp (nine
complete methods/885 bytes) and codex_shader_transform_driver/driver.cpp
(complete Apply1129) pass clean V2,private V3/612 and613 retaining all prior
matches, and1284 full CPU outputs each. All input hashes are current; these2014
bytes are not yet included in the confirmed aggregate above. The live cleanup/
ordering replay completed PASS/exit0 and now includes1476 accepted bytes, not
these new transform modules. Latest full log is codex35_program_cleanup/aggregate.log.
codex_shader_predicate_order/predicate.cpp adds complete573 bytes, clean V2,
V3/614 retaining613 and1284 full CPU outputs with current hashes. Its aggregate
acceptance remains pending too;2587 new transform/comparator bytes are not yet
included in the confirmed percentage.
The duplicate read/write scratch source adds zero coverage: all four methods
were already accepted in the earlier program module. CompactOutputs stays
scratch-only because actual source/object comparisons still differ.

The preceding clean module is
[`target/src/codex_shader_compiler/`](target/src/codex_shader_compiler/):
eight complete source methods / **757 instruction bytes**; 556 private linked
matches with all 548 retained, and **20,355** complete original/clean-source
CPU comparisons. Full aggregate replay passes. The larger evaluator and
matrix-layout drafts stay in scratch and are not counted.

Earlier scratch checkpoint:
[`target/scratch/codex35_expression/`](target/scratch/codex35_expression/)
has five complete source drafts covering 8,102 target instruction bytes.
All 1,284 CPU shader-compilation comparisons pass. The isolated 309-byte
clipping method plus its already-counted 28-byte temporary callee pass strict
scratch V2; its clipping method is now accepted through the clean module below.
The other four drafts remain uncounted. See HANDOFF.md for current work.

Latest accepted clean module:
[`target/src/codex_shader_compiler_clip/`](target/src/codex_shader_compiler_clip/)
contains all nine compiler/clipping methods. Clean V2 and full-link V3 pass
(557 matches, all556 retained);1284 complete CPU shader-output comparisons and
the full aggregate replay pass. Only309 new disjoint bytes count; the prior757
are retained. This is not whole-file identity. The old eight-method module is
history, not an additional TU to link alongside this replacement.

The new readable type/diagnostic module is separated in
[`target/src/codex_shader_compiler_types/`](target/src/codex_shader_compiler_types/).
Its two complete methods pass clean byte/binding proof (411 instruction bytes;
52 table bytes excluded),559 private linked source matches retaining557,
and1284 complete shader-output CPU comparisons. The restarted full aggregate
replay passed, so its411 disjoint code bytes are included in the total above.
The program cohort is separated in
[`target/src/codex_shader_program/program.cpp`](target/src/codex_shader_program/program.cpp):
12 complete methods /2663 instruction bytes pass clean byte/binding proof,
571 private linked matches retaining559,1284 integrated full-output CPU
comparisons and the full disjoint aggregate. Its bytes are included above.
The unmatched optimizer stays in scratch. No whole-DLL SHA claim.

The newest accepted clean source is
[`target/src/codex_shader_program_flow/flow.cpp`](target/src/codex_shader_program_flow/flow.cpp):
4 complete methods /945 bytes pass clean V2,575 linked matches retaining571,
and1284 integrated CPU comparisons. Its full aggregate replay passes;
these945 disjoint bytes are included above. Six larger byte-mismatched flow
methods remain in scratch, despite passing the public CPU corpus.
Interpolation variants in `target/scratch/codex35_lerp/` remain unaccepted scratch.

The preceding clean module is
[`target/src/codex_shader_preprocessor/`](target/src/codex_shader_preprocessor/):
25 complete bodies / **2,199 instruction bytes**; 548 private linked source
matches with all 523 retained, and **12,259** complete-output CPU comparisons.
Full aggregate replay passes; unmatched drafts remain in scratch at zero credit.

The preceding clean module is
[`target/src/codex_shader_lexer/`](target/src/codex_shader_lexer/): seven complete
source methods / **1,037 instruction bytes**; 523 private linked source matches
with all 516 retained, and **9,976** complete-output CPU comparisons.

Two new clean modules passed per-function proof, private linked regression,
CPU comparison and the full aggregate audit, adding 2,679 disjoint code bytes:

- [`target/src/codex_shader_assembler/`](target/src/codex_shader_assembler/):
  14 complete source definitions / 1,517 bytes; 505 linked source matches with
  all 491 retained; 1,440 full-output original-SDK CPU comparisons.
- [`target/src/codex_shader_support/`](target/src/codex_shader_support/):
  11 complete definitions / 1,162 bytes; 516 linked source matches with all
  505 retained; 3,584 combined CPU comparisons. It supplies actual allocator
  and diagnostic bodies, not just declarations or opaque library objects.

The preceding clean module is
[`target/src/codex_shader_nodes/`](target/src/codex_shader_nodes/): 72 complete
SDK node methods, **4,783 instruction bytes**, 491 accepted private linked
source matches with all 419 previous retained, and **10,496** complete-output
SDK/source CPU comparisons. Full typed vtables are checked but not counted.

The preceding clean module is
[`target/src/codex_shader_instructions/`](target/src/codex_shader_instructions/).
Four completed SDK methods add **613 instruction bytes**, retain all 415
previous linked source matches and accept 419, with **10,285** CPU comparisons
against the original SDK. The full aggregate replay passed and includes the
preceding parser and shader-read checkpoints: **319,623 bytes / 29.331822%**,
still **7,281 bytes below exactly 30%**. Read `HANDOFF.md` for current
status rather than treating the historical breakdown below as current.

Two further clean files in `target/src/codex_libraries/` reconstruct 25
instruction predicates/getters (**1,438 bytes**) and 12 native shader-constant
callbacks (**360 bytes**). `shader_build.mk` compiles the actual clean paths.
The private closed link accepts **400 source matches**, retaining every one
of the preceding 363; the CPU predicate/getter fixture passes **361,654**
original-SDK comparisons. These are SDK-derived source, not new rendering
logic. The instruction declaration is only a confirmed five-word prefix,
not a complete allocation layout. Conversion drafts receive no credit.

The complete four-function SDK error-lookup source family is separated in
[`target/src/codex_libraries/`](target/src/codex_libraries/), with a real
`build.mk` compiling these clean files directly. It contributes **116,123
instruction bytes**; tables are fully checked but excluded. The new wide
name and two description functions add **67,696 unique instruction bytes**.
This is reconstructed SDK-derived C++, not new game renderer logic or
Microsoft's historical source. The private closed link preserves every
previous source match and accepted 363 at that checkpoint after source-proven disambiguation;
**426,244** SDK-reference behavior comparisons pass. Read the manifest and
`HANDOFF.md` for the narrow ASCII/UTF-16 placement/table proof.
Canonical source and the release tree remain unchanged.

The initial reconstructed SDK error-name lookup is separated in
[`target/src/codex_libraries/dxerr9_name.cpp`](target/src/codex_libraries/dxerr9_name.cpp).
Its manifest explains the source and exact compiler. The private no-FORCE
link preserves all 359 existing accepted source functions, adds this helper,
and passes 106,560 reference-library behavior comparisons. The source proof
matches the full 72,524-byte section and all 8,899 relocation bindings;
**48,427 instruction bytes** are credited, with **24,097 table bytes excluded**.
This is reconstructed SDK-derived C++, not historical Microsoft source or
new rendering logic. It is not yet integrated into Claude's canonical tree.

Of the current total, **51,318 CRT C bytes** and **3,431 CRT
assembly bytes** are from authentic VC7.1 source in the pinned compiler image,
rebuilt and checked separately at `target/scratch/codex_crt13/`,
`target/scratch/codex_crt14extra/`, and `target/scratch/codex_crt14asm/`.
The additional original `input.c` proof is in `target/scratch/codex15_crtinput/`.
The 16% batch proof is in `target/scratch/codex16_crt/`; it contributes
85 new disjoint original CRT functions / 13,375 bytes after deduplication.
The 17% batch in `target/scratch/codex17_crt/` adds 41 further disjoint bodies /
9,176 bytes. The CRT19 batch adds another 16 C bodies / 2,751 bytes and four
original MASM procedures / 1,749 instruction bytes. CRT35 surveys 358 further
original C files in both thread modes and adds 29 disjoint bodies / 3,004 bytes.
The full packet includes older dependency bodies; they are not counted twice.
Tables and overlapping
earlier proofs are excluded. The original-source dependency remains external to this repository.
This is a toolchain dependency, **not**
newly recovered game-authored renderer code; do not redistribute Microsoft's
source in `cod2engine/`. Another **11,003 bytes** of renderer/engine source
gains live in private linked scratch (`codex_merged_12`, `codex_moretu15`,
`codex_cohort13`), **not** `verified/src/`. The accepted scratch adds two
capability-check functions (300 bytes), with no source-match losses. Of the
private gain, 468 bytes require the private `_atoi` thunk/C-string verifier
correction awaiting Claude's independent review.
Another **587 unique game-authored bytes** are in the readable private
`target/scratch/codex15_drawgroups/gfx_d3d/r_splitscreen.cpp` cohort. Its build
preserves all canonical matches; the narrowly scoped one-past-array binding
correction in `tools/codex15_bindcheck.py` still needs independent review
before integration. Scratch snapshots are not certified whole files.

The six fully verified drawgroup functions now have an unchanged, separated
source copy in [`target/src/codex_drawgroups/`](target/src/codex_drawgroups/).
Its manifest explains the proof and pending integration. This copy is not
added to the canonical TU list, and adds no duplicate coverage.

The audit counts 73,123 JPEG, 41,307 closed-tree, 3,434 STL, 1,190 standalone,
2,661 independently proven engine, 11,003 private linked, 6,478 live canonical gains,
587 private drawgroup, 51,318 CRT C, 3,431 CRT assembly and 117,921 reconstructed SDK
instruction bytes. All target ranges are disjoint; opaque SDK/runtime library
bytes, unmatched drafts, and whole-file identity are excluded. Reproduce:

```sh
cd gfx/target
make -f closed.mk SRCDIR=verified/src B=build/v verify
make -f closed.mk SRCDIR=scratch/codex_cohort13 B=build/codex_cohort13 verify
sh scratch/codex_crt13/build.sh
sh scratch/codex_crt14asm/build.sh
sh scratch/codex_crt14extra/build.sh
make -f closed.mk SRCDIR=scratch/codex15_drawgroups B=build/codex15_drawgroups verify
sh scratch/codex15_crtinput/build.sh
sh scratch/codex16_crt/build.sh
sh scratch/codex17_crt/build.sh
sh scratch/codex19_crt/build.sh
sh scratch/codex19_dxerr/build.sh
sh scratch/codex25_dxerr/build.sh
sh scratch/codex35_crt/build.sh
mkdir -p scratch/codex35_crt/obj/prior19
cp -a scratch/codex19_crt/obj/. scratch/codex35_crt/obj/prior19/
python3 scratch/codex35_crt/check.py
sh scratch/codex35_sdk/build.sh
python3 scratch/codex35_sdk/check.py
python3 scratch/codex35_sdk/check_link.py
python3 scratch/codex35_sdk/run_test.py
cd ../..
python3 gfx/tools/check_ten_percent.py
```

The requested 35% checkpoint is still **51,067 bytes away**. This
percentage is source instruction coverage including external library source,
not completeness or a working replacement DLL.

`HANDOFF.md` documents the clean-library module, CRT19 MASM rebuild command and private
compiler-cache extraction. The aggregate replays source byte/binding and
linked regression checks; the behavior fixture's cached result has complete
input/output hashes. Rerun `scratch/codex19_dxerr/run_test.py` to execute it.

There is **no clean, complete release renderer source in `cod2engine/` yet**.
The release requires integrating the proven source, resolving the remaining
functions, a whole-DLL SHA-256-identical rebuild, and runtime smoke checks.
The owner controls commits and the eventual release-tree promotion.
