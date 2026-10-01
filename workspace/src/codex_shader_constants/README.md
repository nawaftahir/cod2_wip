# Shader reads — verified source, not a completed renderer

This independent clean module supplies eleven static `SetTyped::Read` methods
and `D3DXGetShaderVersion`: **475 instruction bytes**. Each emitted body matches
its complete typed Summer 2004 SDK section and the retail renderer, including
instruction boundaries. No external relocation fields are hidden. First-byte
and final-byte corruption tests fail; the original referee reports 100%.

The private renderer link retains all preceding **403** source matches and
accepts **415**. The SDK dependency selector excludes only definitions supplied
by source; remaining library code has zero source credit. Claude's canonical
tree, `closed.mk`, and the standard binding verifier are unchanged.

CPU fixtures compare **1,988** read results plus **12** shader-version queries
against the original SDK. This is not GPU/game validation or whole-file SHA
identity. The combined source lower bound is **319,010 / 1,089,680 = 29.275567%**;
30% still needs **7,894 instruction bytes**.

## Scope and pinned behavior

- The fifth template parameter is **PointerArray**, not transpose. Matrix
  pointers are selected before indexing; Class 2 is row-major, Class 3 column-major.
- Bounds deliberately use `row > Rows` / `column > Columns`, including the
  target's unusual inclusive limit. These are reconstruction facts, not bug fixes.
- Explicit instantiations define exactly eleven read bodies. Four matrix
  linear-read variants and ambiguous scalar-template placements are not accepted.
- Static methods require no SDK object allocation or guessed class layout.
  This file is an independently verified module, not a claimed historical TU.
- The nine larger Set/upload methods remain drafts in
  `target/scratch/codex30_constants/`; they receive no credit.

## Replay

From `gfx/`, with the pinned toolchain images already installed:

```sh
sh target/scratch/codex30_reads/build.sh
python3 target/scratch/codex30_reads/check.py
python3 target/scratch/codex30_reads/check_link.py
python3 target/scratch/codex30_constants/run_reads_test.py
python3 tools/check_ten_percent.py
```

Rebuild the CPU fixture first using `compile_reads_test.sh` in the pinned
`9147e308…` image, mounting `target` at `/work` and the SDK at `/dxsdk`.
Fixture freshness checks reject changed source with old executables.
Input hashes, ownership, linked bindings and negative-test evidence are in
`scratch/codex30_reads/{clean_packet,link_packet}.json` and
`scratch/codex30_constants/reads_fixture_packet.json`.
