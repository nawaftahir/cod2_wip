# Reconstructed shader helpers — 2026-09-30

Result: **37 complete source methods / 1,798 unique instruction bytes**.
Clean accepted C++ is in `../../src/codex_libraries/`:

- `instruction_predicates.cpp`: 25 methods / 1,438 bytes.
- `shader_native_constants.cpp`: 12 native/raw specializations / 360 bytes.
- `shader_build.mk`: actual clean-path compile rules, separate from the
  existing four error-lookup rules.

These are reconstructed SDK-derived source, not Microsoft's historical source
or newly reversed game rendering logic. The established hash-pinned MSVC
13.10.4035 `/O1 /Oy- /hotpatch /MT` context reproduces them without `/GL`.

## Proof and limits

`check.py` requires typed single-function COFF sections, complete source-built
body equality with the SDK and retail, exact extents, valid instruction/branch
boundaries, 100% from the original referee, and first/final-byte mutation
rejection. Accepted bodies have no relocations. The 12 callbacks' identical
code is named using independent original callback relocations in
`CConstant::Create` at 0x1008085f, not arbitrary first-hit matching. Its full
664-byte SDK section and relocation fields/types are checked; wrong callback
targets fail. The opaque carrier receives **zero source credit**.

The declared instruction class is only the confirmed five-word prefix.
Full size, allocation, construction and destruction are not established.
Do not allocate SDK objects using this view. The callback TU covers only
vertex/pixel native/raw inputs; it does not implement conversion variants.

The fresh private closed link accepts **400 source matches**, retaining
all **363** previous. All 37 new linked bodies match retail. The original
four lookup proofs are rechecked, with only their already proved two
description placements/code extents refined in private comparison input.
Native callback placements use the independently proved identity carrier.
Raw reports are retained. Standard binder, canonical source and closed.mk
are unchanged; no `/FORCE` is used. Whole-DLL SHA identity is still pending.

The CPU fixture passes **361,654** original-SDK versus reconstructed
predicate/getter comparisons, including opcode-mask, width, index, count and
null-output cases. Division-by-zero getters are not invoked. The fixture is
not a GPU or game boot test and does not certify the rest of the class.

## Deferred work

`shader_constants.cpp` is a separate 24-specialization experiment. Only the
12 native variants match, and those are accepted through the clean TU above,
not counted again here. All 12 conversion variants remain DEFER. Bounded
source-order, lifetime and induction probes left register/instruction-order
differences; float-to-int calls `__ftol2` instead of the target's control-word
sequence. No compiler-impossibility or `/GL` conclusion is justified. Preserve
`attempts.json`; do not invent target assembly or accept a near-match.

SDK discovery names 1,427 matched archive sections. Those observations and
opaque SDK linking earn **zero source credit**. Larger remaining families are
shader compiler/optimizer code, not ordinary stock D3DX math. Use the naming
map to choose a source-backed cohort rather than repeat broad flag searches.

## Replay

From `gfx/target`:

```sh
sh scratch/codex35_sdk/build.sh
python3 scratch/codex35_sdk/check.py
python3 scratch/codex35_sdk/check_link.py
python3 scratch/codex35_sdk/run_test.py
cd ../..
python3 gfx/tools/check_ten_percent.py
```

The cached compiler and SDK must match all recorded hashes. To fresh-build
the CPU fixture, run `sh /w/scratch/codex35_sdk/compile_test.sh` in image
`sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694`,
with `gfx/target` mounted at `/w`, SDK at `/dxsdk`, working directory `/w`,
and networking disabled. The fixture script invokes the base link.exe
explicitly; the extracted 4035 compiler cache has no linker.

Packets record all source/object, toolchain, headers/archive, private
snapshot, link and fixture hashes. Binaries, SDK source and compiler files
remain uncommitted. The aggregate is **28.673831%**, not the requested 35%;
**68,935** further source instruction bytes are needed.
