# Shared renderer handoff — 2026-09-30

Read RULES.md, CLAIMS.md, then this file. Target is readable source and whole-DLL
SHA identity, not a functioning substitute or a discovery percentage.

## Current checkpoint: 25% goal exceeded — 28.233151%

**Current replayed lower bound: 307,651 / 1,089,680 = 28.233151%**
(2026-09-30). The requested 25% floor is 272,420 bytes; surpassed by
**35,231 bytes**. Run `python3 gfx/tools/check_ten_percent.py` from the
workspace root. New instruction gain since 22.020685%: **67,696 bytes**.
No whole-DLL identity or renderer release is claimed.

**Clean-source integration:** `target/src/codex_libraries/` now contains
the complete four-function DirectX error name/description lookup family,
plus `build.mk`. The module compiles those clean paths directly as separate
non-LTCG objects with hash-pinned MSVC 13.10.4035 `/O1 /Oy- /hotpatch /MT`.
It is integrated into the private link by `scratch/codex25_dxerr/link.mk`,
not Claude's canonical TU list. `verified/src/`, `closed.mk`, the standard
binder and `cod2engine/` remain unchanged. Compiler/SDK/original Microsoft
source files stay external and are not committed.

New wide-name source: **48,462** instruction bytes; ASCII/wide descriptions:
**9,617 each**. Their complete sections match, including all **10,991
relocation bindings** and **27,703 verified but uncredited table bytes**.
The original referee returns 100%; full strings, code/table destinations,
sites/types, source/object/toolchain hashes and wrong-target/mutation tests
pass. These are reconstructed SDK-derived C++, not Microsoft's recovered
historical source or new rendering logic. Including the preceding ASCII-name
proof, the family totals **116,123 unique instruction bytes**.

**Method reuse:** prior shared-alias labels / actual SDK return-leaf ordering /
4035 compiler flags reproduced all three siblings on their first compile.
The oracle recovered 5,449 wide names and 656 descriptions of each width;
oracle observations alone are discovery, not source acceptance.

**New proof issue resolved:** description code is identical after relocation
masking; full ASCII/UTF-16 initializers uniquely distinguish placements and
reject the wrong width. Their genuine code ends in RET4 at **+9,617**, before
1,880 table bytes each. A full-section instruction sweep invents table CALLs
and extent failures. `check_link.py` checks every full linked section and
initializer, then refines ONLY these two source-proven placements/code extents
in `cmp_placed.json` and reruns the **unchanged** standard binder. Result:
**363 source matches**, all **359 baseline / 360 previous** retained. Raw
output is preserved separately (`bind_raw.json`: 361 source matches).
Independent review before canonical integration is still required; no broad
ambiguity, masking, binding or boundary exception was added to the referee.

**Behavior:** all four functions versus authentic SDK functions pass
**426,244 comparisons**, over 6,561 boundary/unknown inputs plus 100,000
deterministic random values. Renamed fixture objects are separate from the
normal clean-source/link objects. The aggregate checks complete cached-fixture
input/output hashes; `run_test.py` executes the fixture again.

From `gfx/target`, replay `python3 scratch/codex25_dxerr/check.py` and
`python3 scratch/codex25_dxerr/check_link.py`; fresh-build everything including
behavior with `sh scratch/codex25_dxerr/build.sh`. The wrapper restores
ownership only of its Docker-created private build output. The snapshot
must remain byte-identical to canonical source for this regression proof;
coordinate later canonical changes. Preserve earlier frozen packets.
See the clean `MANIFEST.md` and `scratch/codex25_dxerr/REPORT.md` for details.

**Next:** independent review, coordinate canonical module inclusion with
Claude, then target-backed game-renderer cohorts or genuine source-backed
library families. Don't add these lookups to engine `/GL` TUs or count opaque
D3DX library objects as recovered source. A 30% floor needs **19,253** further
unique bytes, not an achieved/promised checkpoint. Release-tree promotion
remains owner-controlled and needs whole-file identity/runtime checks.

## Historical checkpoint: 19% goal exceeded — 22.020685%

**Latest independently replayed state (2026-09-30): 239,955 / 1,089,680
= 22.020685%** source-backed instruction bytes. Run
`python3 gfx/tools/check_ten_percent.py` from the workspace root. The requested
19% floor is 207,040 bytes; this checkpoint exceeds it by **32,915 bytes**.
This supersedes the historical 17% snapshot below.

New unique credit since 17%: **52,927 bytes**. These are **48,427 bytes**
of reconstructed SDK-derived C++ (`DXGetErrorString9A`), **2,751 bytes / 16
complete original CRT C bodies**, and **1,749 bytes / four original MASM
procedures**. This is library-source progress, not newly reversed rendering
logic. Tables, alignment excluded by the procedure proofs, opaque library
objects and overlapping earlier proofs receive no credit.

**Clean new source:** `target/src/codex_libraries/dxerr9_name.cpp`, copied
unchanged from the accepted candidate. Its `MANIFEST.md` gives provenance,
compiler, build commands and coverage. This is readable reconstructed C++,
not Microsoft's recovered historical source. Original Microsoft CRT/compiler
files remain external build inputs and are not committed.

**Breakthrough, do not re-derive:** group HRESULT aliases sharing a returned
name under common switch labels, and order the shared return groups by the
original SDK's actual return-leaf relocation order. Numeric ordering and
COFF string-section ranking were not equivalent. Compiler **13.10.4035**
with **`/O1 /Oy- /hotpatch /MT`** produces the complete **72,524-byte section**:
48,427 code bytes + 24,097 verified, uncredited table bytes. The object proof
checks every one of **8,899 relocation sites/types/bindings**, internal
branches, complete source string initializers and wrong-binding negatives.
The original masked referee also returns 100%. This resolves the earlier
near-match `codex_dxerr_rebuild` DEFER; retain failed attempts, don't rerun
the same ordering/flag variants.

**Integration check:** `target/scratch/codex19_dxerr/link.mk` links the new
object with a private unchanged snapshot of Claude's canonical source,
without `/FORCE`. Standard `cmp.py` + `bindcheck.py` preserve **all 359**
baseline accepted source functions and accept the new helper (360 total).
Their 72,524-byte helper extent includes tables: only the separate 48,427-byte
code proof earns aggregate credit. SDK-reference behavior comparisons pass
for all 5,467 named cases and their neighbours, plus 100,000 deterministic
random inputs: **106,560 comparisons**. `check_link.py` pins inputs and outputs.
No canonical source or standard referee was edited.

**Avoid two resolved traps:** `/ML` on the standalone helper pulls LIBC into
the `/MT` renderer and loses 42 prior source matches; use `/MT` instead.
`closed.mk` does not track `XL` as a dependency: a changed helper object alone
does not trigger relinking. The private `link.mk` adds the explicit object
dependency; do not accept the earlier stale DLL experiment.

The private compiler cache is `target/scratch/codex19_dxerr/compiler/`.
It contains seven hash-pinned files from the official Windows Server 2003
SP1 DDK, not checked into Git. The complete ISO is currently cached at
`/tmp/cod2-dxerr-compiler.asMam8/ddk.iso`; its SHA-256 is
`7a27263e4c3c89dee113eba75dc9145bf7019b43a2c5e24bc9382dbde79f7f8b`.
`extract_compiler.py /path/to/ddk.iso` can recreate the cache without an
installation. See the packet for each compiler component hash.

**Replay/rebuild:** the aggregate replays all byte/binding and linked
regression checks. The behavior fixture is cached only with hashes of all
fixture inputs/outputs; rerun `run_test.py` to execute it again. From
`gfx/target`, `sh scratch/codex19_dxerr/build.sh` rebuilds the helper, fixture
and private whole link. CRT C: `sh scratch/codex19_crt/build.sh`; CRT MASM:

```sh
docker run --rm --network none \
  -v "$PWD:/w" -v /home/nawaf/cod2/test/dev/glm:/crt:ro -w /w \
  sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 \
  sh scratch/codex19_crt/compile_asm.sh
python3 scratch/codex19_crt/check_asm.py
```

The frozen CRT19 plan certifies 216 C bodies / 40,617 bytes before deduplication;
16 bodies / 2,751 bytes are new. Ten failed object variants remain rejected.
`_doexit` becomes provable through original `crt0init.c` data sentinels.
Compiler-generated INT3 tails in security/exit helpers remain DEFER; the
complete-body gate was not relaxed. Full original memcpy/memmove tables are
verified but excluded; strchr's leading shared return helper is source-proven,
and its 11 alignment NOP bytes are excluded. strcmp's inventory boundary
misses its final JMP; the full source proof includes it.

**Next work:** have Claude review this source/helper and its narrow private
proofs, then coordinate adding the non-LTCG helper with its exact compiler
to the canonical link. `verified/src/` remains Claude-owned; do not bulk-copy
the snapshot or count the helper twice. The next substantive work is
target-backed game-authored renderer cohorts, plus remaining library bodies
with recoverable source. Retain the existing private drawgroup and `_atoi`
binder-review tasks. The DLL is still a diagnostic build: **no whole-file
SHA identity, runtime release or complete clean renderer tree is claimed**.

## Historical checkpoint: 17% passed

**Verified state (2026-09-30):** `python3 gfx/tools/check_ten_percent.py`
passes with **187,028 / 1,089,680 = 17.163571%** unique, source-backed
`.text` instruction bytes. The 17% threshold is **185,246 bytes**, surpassed
by **1,782**. This includes **47,245 bytes of authentic VC7.1 CRT
source**, not newly reconstructed game code. No whole-DLL SHA match or
release-ready renderer tree exists. `gfx/target/verified/src/` is buildable
but contains both verified functions and drafts; do not promote whole files.

The new `target/scratch/codex17_crt/` cohort builds 121 original C files
under both ST and MT header configurations (242 objects). Its replay certifies
200 complete bodies / 37,866 bytes before deduplication; **41 bodies / 9,176
bytes are new**. All bindings, original data initializers, typed callbacks,
source/object/header hashes and wrong-binding negatives are checked. Twelve
source-proven code dependencies and 391 data proofs receive no extra credit.
Five nonmatching/unresolved variants remain DEFER. The audit also includes
Claude's current live canonical gains of 6,478 bytes, without double counting.

Fully verified drawgroup function source is copied unchanged into
`target/src/codex_drawgroups/`, separate from experiments. See its manifest:
this is a six-function source checkpoint, not a complete DLL or canonical
integration. Original Microsoft runtime source stays outside Git. The 19%
threshold is **207,040 bytes**: **20,012 additional unique bytes** are needed.

**First checks:** read `RULES.md`, `CLAIMS.md`, and `SOURCE_STATUS.md`;
replay the audit from the workspace root. `SOURCE_STATUS.md` gives the fresh
closed-link and CRT rebuild commands. Work in a private `target/scratch/`
directory; `verified/src/` is Claude-owned, and the owner controls commits
and promotion to `cod2engine/`.

**New accepted proof packets:** `target/scratch/codex15_drawgroups/` plus
`build/codex15_drawgroups/` preserve every live canonical match and add seven
bound functions (679 bytes); the delayed-drawing helper's 92 bytes were already
counted, so the unique renderer gain is **587 bytes**. Source is readable in
`gfx_d3d/r_splitscreen.cpp` and the no-argument overload in `r_rendercmds.cpp`.
Canonical source is unchanged. `tools/codex15_bindcheck.py` adds a tightly
pinned one-past-array binding exception with a wrong-target negative test;
Claude should independently review it before canonical integration. Do not
copy its exception broadly or weaken the standard referee.

`target/scratch/codex15_crtinput/` rebuilds original **input.c**, unchanged,
with `/O1 /D_MT`: **3,452 complete instruction bytes**, all 21 symbol bindings,
source-defined data, SEH table and wrong-binding negatives pass `check.py`.
The GLM inventory incorrectly reports 3,387 bytes and truncates the epilogue;
the full matched COFF section ends with RET, then two INT3 alignment bytes
before `_strlen`. The padding is excluded. `build.sh` is the repeatable winner;
other objects and `analyze.py` retain discovery evidence, not extra credit.
The `/D_MT` header choice disables ordinary ctype macros but keeps isleadbyte
inline. Original CRT source remains a non-redistributable toolchain input.

Rebuild the new source packets:

```sh
cd gfx/target
make -f closed.mk SRCDIR=scratch/codex15_drawgroups B=build/codex15_drawgroups verify
sh scratch/codex15_crtinput/build.sh
cd ../..
python3 gfx/tools/check_ten_percent.py
```

The standard drawgroup binder's false dx mapping is corrected only by the
private binder; the aggregate audit replays it and pins its exact inputs.
No source-match losses, retail bytes, `/FORCE` output, or duplicate functions
were credited. Today's material allocation, sun parser, cubemap call-ABI,
cell-register, and direct Buf_Read probes added **zero** bytes; retain them
as attempts and do not retry the same variants. Earlier entries below are
historical snapshots, not the current numerator.

**16% batch:** `target/scratch/codex16_crt/` fresh-builds 94 original CRT
source files under both single-thread and `_MT` header settings (188 objects).
This reuses the supplied library source instead of reconstructing library
functions by hand. `check.py` proves 141 complete source bodies / 25,076 bytes
before overlap removal; the aggregate accepts **85 new bodies / 13,375 bytes**.
The rest were already counted. See `packet.json` for source/object/header,
compiler-image, plan and checker hashes and per-function bindings;
`rejected.json` preserves 50 rejected object variants (not credited).
`REPORT.md` explains the protocol and remaining gaps in plain English.

The checker compares every instruction and relocation site/type, rejects
unresolved code/data identities, checks original initializers and their
pointer graphs, checks PE data-relocation fields and coherent COFF section
layouts, validates SEH labels against the same complete code bodies, and
executes wrong-binding tests. The 220 data proofs are dependencies, NOT
extra instruction coverage. Discovery results are never accepted directly.
Canonical `tools/bindcheck.py` and `verified/src/` are unchanged.

Replay the added packet with
`python3 gfx/target/scratch/codex16_crt/check.py`, then the aggregate audit.
For a complete rebuild use `sh scratch/codex16_crt/build.sh` from `gfx/target`.
The pinned `plan.json` is the reviewed candidate snapshot; do not overwrite
it with a broader discovery list without review. The two compile scripts
compare every built C source with the pinned compiler image's original.
Original CRT headers present in that image were also compared successfully.
COFF header build timestamps vary: the input.c audit pins the rest of that
object exactly and separately records its full fresh hash. No object or
retail bytes are modified; instruction/binding gates remain exact.

**Next agent:** independently review the private drawgroup correction and
the CRT16 checker, replay the aggregate, then coordinate canonical integration
with Claude. New renderer source is readable in the private `src`-shaped
drawgroup tree; CRT source remains in `glm/crt71` / the pinned toolchain,
not in release `cod2engine/`. Continue target-backed game-authored work after
review; do not describe the library gain as newly reversed rendering logic.
The owner has requested a scoped workspace checkpoint commit; release-tree
promotion remains owner-controlled.

**Next useful work:** build a target-backed, game-authored renderer TU/cohort
that closes under the pinned MSVC 7.1 `/GL` + `/LTCG` build **without
`/FORCE`**. Use the Mac 1.3 decompile for names/types and the target DLL
for final bytes, calls, constants, and bindings. Compare functions in a
batch, then certify only exact relocation-normalized bodies with correct
callee/data/import bindings and wrong-binding negative tests. Record source,
object, toolchain and referee hashes and target intervals; keep the gains
address-disjoint. A new percentage is justified only after a fresh link and
the independent audit both pass. Even 15% is only a source-coverage
checkpoint; whole-file SHA identity and smoke tests remain separate gates.

**Do not repeat or credit:** `codex_cohort15` added no bound match;
`codex_batch15_fresh` failed the no-`/FORCE` link; the three
`Image_Create*Texture` bodies were already counted; `codex_near.py` and
`/FORCE` links are discovery only. The generated `codex_dxerr_rebuild`
SDK-source variants are nonmatching and add **zero** bytes, despite finding
the matching DDK compiler. Do not copy proprietary CRT/SDK source into the
release tree or count opaque prebuilt library objects.

## Current checkpoint

2026-09-29 Codex DXerr source experiment: **DEFER, zero new coverage**.
`target/scratch/codex_dxerr_rebuild/` contains a readable generated C++
switch and SDK-library oracle/probe. The oracle recovered 5,467 named HRESULT
cases; their 3,688 distinct return strings account for every named literal
bound by the shipped `sdk/sum2004/Lib/DxErr9.lib` ANSI routine. Rebuilding
with the pinned compiler `/O1 /Oy-` gives a 72,504-byte COFF function with
8,899 relocations; the SDK original is 72,524 bytes with 8,899 relocations.
CodeView identifies the SDK object compiler as MSVC **13.10.4035**, while the
pinned compiler is **13.10.3077**. The source does not byte-match; no part of
this proprietary SDK routine is accepted as reconstructed renderer code or
included in the numerator. Do not credit the existing exact prebuilt SDK
object. The independent audit remains **153,960 / 1,089,680 = 14.128919%**.

Further bounded DXerr probe: Microsoft still serves the 3790.1830 DDK ISO at
`https://download.microsoft.com/download/9/0/f/90f019ac-8243-48d3-91cf-81fc4093ecfd/1830_usa_ddk.iso`
(SHA-256 `7a27263e4c3c89dee113eba75dc9145bf7019b43a2c5e24bc9382dbde79f7f8b`).
Its `X86DBINS.CAB` contains the matching **13.10.4035** compiler; it was
extracted only to `/tmp/cod2-ddk-4035.bAmnJA/ddkbin/` and not committed.
The ANSI error-name switch in `codex_dxerr_rebuild` now recovers **5,467**
named cases and all **3,688** named SDK string literals; `/O1 /Oy- /hotpatch`
rebuilds with the exact **8,899** relocation count but remains 18 bytes short
because three conditional branches differ. The 656-case ANSI description
switch likewise recovers all 625 named description literals and the exact
**1,051** relocation count, but none of the tested numeric, reverse, SDK
string-section, or original leaf-order source variants matches all 11,497
bytes. CPU `/G5`/`/G6`/`/G7`, default placement, and explicit unknown cases
were bounded negative tests. These generated SDK-derived drafts are not
historical source or release-ready; **do not count any bytes** without a
full source/object/target match and binding proof. Do not repeat the same
variants. The next coverage effort must return to game-authored renderer code.

2026-09-29 Codex follow-up toward 15%: independent replay
`python3 gfx/tools/check_ten_percent.py` **PASS 153,960 / 1,089,680 =
14.128919%** address-disjoint source-backed `.text` instruction bytes. The
+1,341 bytes since the 14% checkpoint are eight more exact original VC7.1
CRT C bodies, proven with their code/data/import bindings in
`target/scratch/codex_crt14extra/check_globals.py`. A fresh pinned-image
rebuild of that CRT cohort and the independent aggregate audit both pass.
There are **9,492 bytes** still needed for 15%; no new game-authored renderer
bytes, canonical source, release tree, or whole-file identity claim changed.
`codex_cohort15` and `codex_batch15_fresh` remain drafts: the former adds no
bound matches and the latter fails a no-`/FORCE` link. The three raw-matched
`Image_Create*Texture` functions were already counted in the earlier
independent engine packet; do not count them twice. DirectX `DxErr9.lib`
contains huge exact library routines, but the original historical SDK source
has not been recovered; its opaque bytes are excluded.

2026-09-29 Codex 14% checkpoint: independent replay
`python3 gfx/tools/check_ten_percent.py` **PASS 152,619 / 1,089,680 =
14.005855%** address-disjoint source-backed `.text` instruction bytes. The
7,946-byte gain since 13.276650% is entirely authentic VC7.1 CRT C source,
not newly recovered renderer-game code: 238 small-function bytes, 2,010
`__output` bytes, 2,064 `__woutput` bytes, 1,357 complete
`__convertcp`/`__crtCompareStringA` bytes, 707 leaf bytes, and 1,570
global-cohort bytes. Proof and replay scripts are in
`target/scratch/codex_crt14extra/`; build original source objects with
`cd gfx/target && sh scratch/codex_crt14extra/build.sh`, then run the audit
from the workspace root. The two large functions' GLM inventory size fields
truncate final instructions; the checker verifies complete 457/900-byte
COFF sections, relocations, SEH tables, bindings, and next-entry boundaries.
The 32-byte jump tables following `__output` and `__woutput` are excluded.
No canonical renderer source, release monorepo, commit, or whole-DLL SHA
claim changed. The next efficient task is a linked renderer-game cohort;
do not confuse the 14% source lower bound with 14% completion of the DLL.

2026-09-29 Codex follow-up toward 14%: independent audit still **144,673 /
1,089,680 = 13.276650%**; no new game-code bytes accepted. User allowed
three parallel workers but stopped them because usage was constrained and
their fresh no-`/FORCE` probes added zero verified bytes. Private scratch:
`agent_math14_base`/`agent_sun14` (Mac math and R_ParseSunLight variants),
`agent_image14_base`/`agent_image14_args` (Image_Setup/R_CellSurfaces),
`agent_cohort14_*` (backend groups and XSurfaceGetVerts), and
`agent_root_fog14` (R_SetFog source-order variants). All remain drafts.
`agent_root_linux14` compiled the completed Linux 1.0 `com_math.cpp` under
the renderer's MSVC link after one C++ overload fix and carrying the existing
GetRotatedBounds helper: no new exact bindings and 4,948 source bytes lost,
so **do not merge**. The authentic CRT survey in `codex_crt14extra` rebuilt
27 more C files and found 29 strict code shapes/2,141 possible bytes, but
callee/data bindings are not proved; `output.c` has a 2,010-byte code prefix
plus jump-table suffix whose boundaries/bindings still need certification.
The MASM scan also found `_memmove`/`_memcpy` prefixes with embedded tables;
these are discovery only, **zero coverage**. Do not include any of these
in the 14% numerator without a strict packet and audit replay. Remaining
gap is **7,883 bytes**.

2026-09-29 Codex 14%-attempt checkpoint: **144,673 / 1,089,680 =
13.276650%**, replayed by `python3 gfx/tools/check_ten_percent.py` (PASS).
This adds **2,144** disjoint source-backed bytes over the 13% checkpoint:
15 exact original VC7.1 CRT MASM bodies (**1,682** bytes, separately
accounted from C/C++ and game-authored source), plus three CRT C bodies
(**462** bytes) whose `_strcpy`/`_strcat` bindings are now pinned by that
MASM source. The 39 original assembly files were rebuilt in the pinned
image; Windows-case include aliases were checked byte-for-byte against
the image source. Replay `sh scratch/codex_crt14asm/build.sh`
from `gfx/target`, then the audit from the workspace root. No new
renderer-game source was verified. The remaining gap to 14% is **7,883
bytes**. Discovery-only `/FORCE` links of `r_loadworld_new`, `r_dpvs`,
and seven smaller renderer TUs yielded zero, 69, and 40 game-code bytes
respectively; none is accepted or canonical. Do not repeat those unchanged
ports. The next high-yield step is a source-backed game-code group with a
closed link, not a library-percent chase. Whole-DLL SHA identity remains
unproved; no commit or release tree change was made.

2026-09-29 Codex 13% checkpoint: **142,529 / 1,089,680 = 13.079895%**
address-deduplicated, source-backed `.text` lower bound, replayed by
`python3 gfx/tools/check_ten_percent.py` (PASS). This is **not** a rebuilt
retail DLL or 13% of game-authored renderer logic. The +10,111 bytes since
the preceding 12.152008% checkpoint comprise two source-linked capability
checks (300 bytes) in `target/scratch/codex_cohort13/` and 41 authentic
VC7.1 **CRT source** functions (9,811 bytes) in
`target/scratch/codex_crt13/`. The CRT source is an external proprietary
compiler dependency already in the pinned image, not source to copy into
`cod2engine/`. A fresh no-`/FORCE` cohort link, standard binder, corrected
private binder, and pinned CRT rebuild all passed. The CRT checker rejects
2,690 more shape-equal bytes because their bindings/extent are not proved.
The unmodified standard binder still differs from the private corrected
one by the previously documented 468-byte `_atoi`/literal issue. Only
`r_caps.cpp`'s two functions are new renderer-source matches; its remainder
and all other exploratory cohort TUs are drafts. No canonical source or
checker, retail binary, commit, or release tree was changed by Codex.

Replay from `gfx/target`:
`make -f closed.mk SRCDIR=scratch/codex_cohort13 B=build/codex_cohort13 verify`;
`sh scratch/codex_crt13/build.sh` (pinned image, authentic-source comparison);
from `gfx`, `python3 tools/check_ten_percent.py`. The CRT packet is
`target/scratch/codex_crt13/packet.json`, with source/object/checker hashes,
exact credited addresses, and wrong-binding negatives. The no-`/FORCE`
`r_model.cpp` port did not close; a separate `/FORCE` discovery build found
only 47 bytes and was not counted. The next source target is still the
large game-authored backend, not more CRT percentage padding.

2026-09-29 Codex follow-up: **132,418 / 1,089,680 = 12.152008%** private
address-deduplicated source audit (`python3 gfx/tools/check_ten_percent.py`
PASS); canonical
verifier accepts **131,950 = 12.109060%** (the remaining 468-byte gap is
the previously documented `_atoi`/literal checker correction). Relative to
the previous 130,979-byte checkpoint, six new disjoint standard-bound
functions add **1,439 bytes**: `R_FatalInitError` 66,
`RB_ScaleWorldMatrix` 131, `R_AddStaticModelToAabbTree_r` 489,
`SMC_ForceFreeBlock` 87, `SMC_GetFreeBlockOfSize` 221, and
`R_PickWaterFrequencies` 445. Their source is only in
`target/scratch/codex_moretu15/`;
no canonical source was changed. The linked standard verifier accepted all
six and retained all earlier source matches. Failed fog and sunlight parser
variants were reverted. The opcode-near ranker at
`target/scratch/codex_near.py` is discovery only and grants zero coverage.
Gap to 15%: **31,034 bytes**. Recheck with
`python3 gfx/tools/check_ten_percent.py` from the workspace root.
The discovery-only `codex_near.py --all` now lists just 31 unmatched
high-resemblance bodies totaling 9,743 target bytes. Even matching every one
cannot reach 15%; the next efficient move is a new buildable source cohort/TU
with target-backed dependencies, not more small source-order probes. The
older JPEG allocator/boundary/transform/color packets add no new addresses:
all of their function addresses already occur in the eleven JPEG packets
counted by the audit.

2026-09-28 follow-up: **130,979 / 1,089,680 = 12.019951%** on the private
source audit; canonical verifier still **130,511 = 11.977002%** until Claude
reviews the 468-byte `_atoi`/literal correction below. Fresh
`make -f closed.mk SRCDIR=scratch/codex_moretu15 B=build/codex_moretu15 verify`
and the private binding run both passed. `codex_moretu15` retains all prior
source matches and adds four disjoint, standard-bound helpers: XSurface
transform/rotate at 0x1002cd80/80 and 0x1002cdd0/71; bounds for model/static
at 0x1002bca0/13 and 0x1002bcb0/36. The audit script checks all four and no
source losses. The added `r_xsurface.cpp` and `r_surfbounds.cpp` contain other
unmatched drafts; do not promote either whole file. `GetRotatedBounds` in the
scratch `com_math.cpp` came from OpenCOD2 to close the source link, but does
not itself match the target. Scratch wavelet linked with **zero** new matches;
font/light/JPEG and three other missing TUs did not close without real engine
dependencies. Do not count or bulk-import them. Gap to 15%: **32,473 bytes**.

2026-09-28 Codex scratch checkpoint: **130,779 / 1,089,680 = 12.001597%**
disjoint source instruction bytes under `python3 gfx/tools/check_ten_percent.py`.
This is **not yet canonical**: the unchanged `tools/bindcheck.py` accepts
130,311 bytes (11.958648%). The extra 468 bytes are two genuine C++ source
functions, `Com_ParseIntOnLine` (84) and `ParseConfigStringToStruct` (384),
whose `_atoi` call needs a five-byte CRT thunk placed by its caller. The
private `target/scratch/codex_short_cmp.py` admits that 5-byte thunk without
an anchor search; private `target/scratch/codex_bindcheck.py` compares MSVC
`??_C@` string literals only through the first NUL, rather than through an
unrelated adjacent pointer table. The literal text is byte-equal in both
images. Private and canonical bound sets differ **only** by those two source
functions. Neither CRT nor SDK bytes are added to source coverage.

Fresh source link: `target/scratch/codex_merged_12/` →
`target/build/codex_merged_12/`; `make -f closed.mk SRCDIR=scratch/codex_merged_12
B=build/codex_merged_12 verify` passed the standard full body/binding run.
The private corrected run is `bind_literal.json`; inputs/checker hashes and
all exact gained intervals are enforced by `tools/check_ten_percent.py`.
Changed source files relative to `verified/src`: `universal/q_parse.cpp`,
`gfx_d3d/r_utils.cpp`, `gfx_d3d/r_rendercmds.cpp`, `gfx_d3d/rb_state.cpp`,
`gfx_d3d/rb_logfile.cpp`, `roots.txt`. The seven new backend-state matches
are 5,324 bytes; the parser call-boundary group adds 2,548 bytes; the
render-command/color group adds 724 bytes under the standard checker (plus
the 384-byte `_atoi`-dependent parse body under the private checker).

Claude next: inspect the exact two-line verifier delta against
`target/scratch/codex_bindcheck.py` and the 5-byte threshold in
`target/scratch/codex_short_cmp.py`, add a negative changed-literal test,
then rerun the full merged link. If sound, integrate only the source changes
and let the normal `verified/src` link establish no losses. Do not copy
`RB_ReleaseVertexDecl` from the scratch state file: it remains unmatched.
The `roots.txt` export of `RB_ChangeState_1` is an interim ABI constraint,
not a proven historical export. No canonical source or checker edits, commit,
push, retail-byte wrapping, or release claim were made by Codex.

Historical checkpoint below (superseded; do not add to the new total):

2026-09-28 integration audit: **at least 118,424 / 1,089,680 = 10.867778%**
unique, source-backed instruction bytes. Fresh closed-tree `make ... verify`
PASS. Its bindcheck prints 280 source rows / 42,193 B; four address aliases
duplicate 206 B, leaving 276 unique target intervals / 41,987 B. Independent
`tools/check_ten_percent.py` rehashes source/object inputs, excludes 284 B
unresolved from older JPEG packet, checks disjoint intervals, and counts a
conservative 71,813 JPEG bytes, 3,434 source-instantiated STL bytes (fresh
Wine/checker replay), and 1,190 bytes from two renderer views plus GetRefAPI
(both source checkers replayed). All counted target ranges are disjoint.
This proves the 10% source-coverage checkpoint, NOT a completed renderer or
whole-file identity. Clean source locations/remaining integration are in
SOURCE_STATUS.md. No commit/push by Codex.

Historical Codex-only checkpoint below (do not treat it as current total):
Owner-requested usage checkpoint: no running builds remain. No commit/push and
no new canonical source promotion. Latest work below is diagnostic, not added
coverage. Resume the xsurface extraction group before repeating older probes.

Prior verified Codex source: **80,796/1,089,680 = 7.41465%**. STL closure now has
24 functions/3434bytes, superseding1030 (never count both). JPEG73123 +
engine4239 + STL3434 =80796; gap to10%:28172. Helper bindings, complete
RET/padding extents, branches, corruption/truncation/wrong-binding negatives,
fresh source DLL Wine fixture and shared linked-referee100% all PASS.
Replay checker below; latest packet is sort_helpers_packet.json in the same
stl_sort_gl_r6ekw52i run. Old median/partition packets remain historical.
cmp.py now bounds the last function by the PE virtual code extent, not raw
zero padding: old discovery appended10 bogus bytes to the last150-byte rotate.
No masks changed. No complete group promotion, renderer release or commits.

PREVIOUS verified source: **78,392/1,089,680 = 7.1940%**. Added1030 from two
source-instantiated VC7.1 STL median helpers, target1000e330 and10017d40,515each.
These are genuine compiler-generated std::sort helpers, not copied retail code.
Full source snapshot and pinned `/O2 /GL /Gy /TP` source-only `/LTCG` link:
scratch/library_runs/stl_sort_gl_r6ekw52i. Both whole bodies equal UNMASKED,
uniquely placed, RET/CC bounded, fully decoded, all jumps internal/on boundaries;
15 indirect comparator calls each and no direct external/data dependencies.
Checker rejects changed instructions and omitted tails. Fresh Wine source DLL
fixture exercises80 sorts (two comparators, four patterns, ten sizes); this is
source behavior, not retail game execution. Proof: median_packet.json. Replay:
`python3 gfx/tools/check_stl_sort.py gfx/scratch/library_runs/stl_sort_gl_r6ekw52i`.
JPEG73123 + engine4239 + source-instantiated STL1030 =78392. Gap to10%:30576.
Compiler headers remain toolchain dependencies, not vendored Microsoft source.
Ordinary non-/GL sort build matched0; genuine /GL+LTCG build matches33 shapes/
3444 source bytes, but only1030 are accepted so far. Remaining helper bindings
and wrapper bodies are NOT certified. Keep the partly verified source group
in scratch; do not promote the whole file into src or add all3444 to coverage.
Partition/heap/rotate closure has since completed above. Do not repeat it.

PREVIOUS checkpoint: **77,362/1,089,680 = 7.0995%**, +1051 for the complete
Windows1.0 GetRefAPI initializer. `cd target; make verify-refapi` replays original
referee100%, full RET/CC boundary, all entry/global/message bindings, individually
wrong binding negatives and native table/version guards. File refapi_table.c is
fully checked initializer source, NOT proof of callback signatures or bodies.
Entry declarations are opaque address identities (no invented prototypes, no
retail byte payloads). They require actual callback definitions and typed API
integration before enabling a real linked build. Do not define dummy callbacks.
Copy preserved from scratch/refapi_context/j_get_ref_api.c; run7_9fo60y packet.
The source is not in tus.txt yet: callback resolution/GL behavior remains open.
Earlier7.003% checkpoints below are historical. 10% still needs31,606 new bytes.

- Prior source instruction coverage: 77,362/1,089,680 (superseded above).
  JPEG73,123 + engine4,239. Evidence remains in ../codex/renderer and gfx scratch; do not add it
  again when integrating into the link. Whole-link discovery baseline not established.
- New complete candidate file: target/src/codex/renderer_views.c. Both functions
  match in a fresh historical /O2/Gy build: target1000aa60/82 and10023e90/57.
  All bindings, full boundaries, negative bindings and native fixtures checked.
  `cd target; make verify-views` replays the pinned proof and checks copied-source
  identity. It does NOT compile the shared link or establish historical TU membership.
- Existing target/src/codex files were copied by Claude. They still need shared-build
  regression. Mac-derived target/src/gfx_d3d files are reference drafts, not verified.
- renderer_views.c intentionally not added to tus.txt before a link baseline exists.
  Default /GL must not silently replace its proven non-/GL flags.

## Alternate agents, one continuation

1. Read git status and claims; preserve other edits. Claim exact files before editing.
2. Work in the shared gfx tree (own worktree when concurrent). Never move another
   agent's active source. No new separate implementation repository.
3. Batch genuine source fixes, build once, compare gains AND losses. Keep discovery,
   verified functions and whole-file identity separate. No masking gate relaxation.
4. At handoff record exact source revision/dirty changes, command, run/object hashes,
   actual first differences, rejected attempts and the next concrete batch here.
5. Completed verified files go into target/src with their proof; drafts in scratch.
   Do not bulk import the expanded JPEG source as wholly verified: some included
   constructor/memory/API bodies remain unmatched despite matched subsets.
6. Owner makes commits. Never commit binaries, objects or archive contents.

## Next execution

Latest active source group: `scratch/xsurface_counter_width/j_xsurface.c`.
It derives from opencod2 r_xsurface.c, not invented renderer behavior.
Target1002cee0 is mislabelled R_RegisterXModelSurfs in GLM; its actual behavior
is rigid/skinned vertex extraction, SUPPORTED name XSurfaceGetVerts. Raw target
pins surface bone offset+6, vertex count+2, vertex buffer+12,32-bit signed bone
compare, countdown loops, and full RET1002d1b5 (726bytes).

Preserved probes (all compile, zero full matches; do NOT add to coverage):

| Overlay | Fresh run | GetVerts bytes |
|---|---|---:|
| xsurface_reference | baseline_jpeg__n6x_87r |736|
| xsurface_countdown | baseline_jpeg_98h0ad1f |733|
| xsurface_counter_width | baseline_jpeg_4ugvydjn |720|

Last overlay uses target-backed vertex countdowns, int initial bone comparison,
and a cached blend-count countdown. Native `test_surface.cpp` passes all three
overlays: transfer counts0..9 with output guards, rigid position/normal/UV
transforms and nullable outputs, skinned blend weighting. Not retail runtime.
Replay latest fixture from workspace root:
`g++ -m32 -O0 -D__cdecl= gfx/scratch/xsurface_counter_width/j_xsurface.c gfx/scratch/xsurface_counter_width/test_surface.cpp -o /tmp/cod2_xsurface_counter_width && /tmp/cod2_xsurface_counter_width`.

Latest source-only GL link **FAILED**, not a match: build_gl.sh compiled and
generated code, then LNK2001/LNK1120 for `__fltused` under /NODEFAULTLIB. No DLL
proof. Next link the authentic compiler runtime dependency (not a fake __fltused
definition), then run cmp.py and inspect the complete720/726 discrepancy.
Source TransferDx7 is400bytes, same size as target1002d240, but target takes
src/count in ECX/EAX; standalone source doesn't prove that caller-derived ABI.
TransferDx9 source129 vs target1002d1c0/119 also needs actual caller context.
Keep all this in scratch until full bounds/bindings and regression pass.

Earlier model-reader work (separate group, not the latest priority):
Reference-backed next candidate: model_surface_reference/j_model_surface.c
is an unchanged copy of opencod2 r_xsurface_load_obj.c. Target1002d4a0 reader
1519bytes; allocator(24), model.memUsage+0x84 and finalRET1002da8e confirmed
on raw instructions. References agree on surface24/vertex64/blend16, texture
offsets28/44, weights60/bone62. Minimal model header is a prefix, not a complete
historical struct claim. Fresh baseline_jpeg_x0dbazn_ /O2/TP reader801bytes,
source-only /GL+LTCG also801; /G6 same, /G7 804. None match; tiny consume
aliases are not counted. Draft/builds stay scratch/model_surface_reference.
Do not repeat these flags; next use genuine caller context/source differences.
Local numWeights promotion to unsigned int was also tested separately in
scratch/model_surface_wide_weights: baseline_jpeg_r_f2wa0_ compiled, zero
matches. Do not repeat this standalone probe or count it toward coverage.
Target-backed four-blend/remainder overlay now lives in model_surface_unrolled.
Fresh baseline_jpeg_6jt133xe reader1336 vs1519 target; zero full matches. Native
512-case reference comparison passes (see its README for command). Next resolve
target's tile store-before-input-advance and32-bit signed initial bone comparison.
The /Oa linked probe also failed. Coverage is unchanged; no canonical import.
Those source differences have now been tested: model_surface_order builds1320
bytes (baseline_jpeg_t9_fuc5m), zero matches. Common-allocation/index-reload
overlay model_surface_allocation builds1299 (baseline_jpeg_3yr_bvfe), zero
matches. Both native512-case comparisons pass. Initial32-bit bone comparison
and direct model-count addition agree with target instructions, but allocation
register lifetime and body reloads still differ. Do not repeat these probes.
SDK library reconnaissance avoided a speculative PNG/zlib rebuild: checked
PNG/zlib member code sections did not occur in target (bounded section discovery,
not full absence proof). sdk_math_reference instantiates32 SDK header-defined
math operations; fresh baseline_jpeg_iae12yt3 compiles, finds only2 tiny shapes/
6unique bytes. No accepted credit; do not repeat this unchanged batch.
model_surface_allocation/build_gl now has a fresh source-only /GL+LTCG DLL,
without /FORCE or default CRT dependencies. Linked reader stays1299 and fails
the full referee. No coverage credit. Mac/DirectX_9/D3DXMath.c is not the next
bulk import: MatrixInverse uses COpenGLMatrix_Inverse and DX error text is stubbed.
KisakCOD image list confirms std::sort; its hash routine differs (XOR*33 versus
CoD2 weighted addition), so reference reuse still needs target verification.

Prior upstream sweep checkpoint (before the STL gain):77,362/1,089,680.
Full raw-backed code scans of official6b C and C++ produce no nontrivial new
body beyond the existing proofs. Extra1/3-byte aliases are not accepted as
JPEG identities. Real encoder source-group probe23/8481 also entirely overlaps
existing accepted addresses; native C++ bool produces no gain. Exact run IDs,
commands and cache replay are in LIBRARIES.md. Preserve scratch inputs/results;
do not spend another batch on these unchanged source/flag combinations.
Batch parser now uses a one-object, exact-byte in-process cache, with a runnable
parity/changed-input check. No verifier gates or old workspace files changed.
DXErr dependency and both completed candidate source checks replayed green.
Next new coverage must come from remaining engine/callback source or a genuinely
different target-backed JPEG adaptation, not short empty-function aliases.
Historical D3DX reuse remains the large build-dependency shortcut; validate its
bindings before reporting dependency coverage, separately from source progress.

SDK dependency checkpoint: Summer2004 extracted; Makefile points to it, not the
modern iw3xo package. tools/check_dxerr_dependency.py PASS18 full sections with
internal code/data bindings, nine externals and negative checks; fresh CRT3-body
binding identities replayed. This is SDK dependency verification, ZERO source
coverage increase. GLM100f93bb is actual _vsnwprintf111, not guessed vswprintf.
Mask-only Claude matcher picked ASCII addresses for wide functions; don't count
its first-hit matches without string/graph disambiguation. D3DX447696 raw section
hit bytes still need binding validation. Read updated LIBRARIES.md for hashes.
Rebuilt with the correct SDK libraries: still fails ONLY at missing GetRefAPI
export (LNK2001/1120/1141); no linked DLL. Existing verify-views replay remains
green. No commits. Preserve the owner's existing NOTES.md edits.

LIBRARY-FIRST checkpoint: read LIBRARIES.md. Official6b /O2 reproduced20 existing
matches; /O1 and/Oy- no gains. New44-file CRT_MT batch has60 shapes/11789bytes,
including six additional candidates1106bytes requiring full binding/data review.
No source-coverage increase yet. Next inspect completed2004 SDK libraries using
prepared local7zip; Claude's three download processes were confirmed live, so
do not overwrite/extract those files while mutable. All run identities recorded.

Codex ran `cd target; make` on2026-09-27: all nine existing /GL TUs compiled,
but LINK failed LNK2001 GetRefAPI, LNK1120, then LNK1141 while building exports.
There is NO linked DLL or discovery baseline. GetRefAPI is declared/defined in
reference draft src/gfx_d3d/r_init.c (line338), currently disabled in tus.txt.
Do not create a dummy export, remove the export requirement or treat /FORCE as
completion. Claim and port the real Windows1.0 GetRefAPI source/table first,
using ../codex/renderer/refapi_pinned.json (API59,108 slots; Mac version differs).
Verify its complete body and all slot bindings; then establish a link baseline.
Source-transfer check `make verify-views` passed; shared source unchanged from
its proven input. No new whole-link bytes and no commits made by Codex.

Establish the existing nine-TU shared link baseline before enabling more TUs.
Record compiler/link failures; /FORCE may diagnose but is not a valid release build.
Then integrate proven non-LTCG groups with explicit per-TU flags and regressions.
Main unresolved image work is Image_Setup/ClampPicmip and full472-byte2D upload.
Recent source experiments and exact failures are in ../codex/renderer/NEXT_SESSION.md;
do not repeat their pointer/uchar/bool logging variants or count equal lengths.

## Cleanup

Nine former DeepSeek scratch directories moved intact to archive/deepseek-20260927/.
No files deleted. Archive is git-ignored and includes source, packets and old objects.
Historical checks with original absolute scratch paths require temporarily restoring
the named directory to ../codex/renderer/scratch/; do not rewrite immutable evidence.
All other Codex, GLM, reference and release trees remain intact.
