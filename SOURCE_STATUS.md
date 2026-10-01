# Where to inspect renderer source

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

The current cross-tree, address-deduplicated source lower bound is **324,406 /
1,089,680 = 29.770758%** (2026-10-01), confirmed by a full aggregate replay.
The current requested checkpoint is strictly above 30%; **2,499 more
instruction bytes** are required. The previous 35% goal was cleared by the owner.

The newest clean module is
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

The requested 35% checkpoint is still **68,935 bytes away**. This
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
