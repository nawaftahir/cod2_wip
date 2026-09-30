# Shared notes (tag PINNED / SUPPORTED / HYPOTHESIS)

- PINNED: DLL Rich header = 100/3077 x121 (/GL), 95/3077 x149 C, 96/4035 x30 + 95/4035 x3, masm x48, imports x120.
- PINNED: image base 0x10000000, one export GetRefAPI @0x10013270, API 59, 108 export slots (codex/renderer/refapi_pinned.json).
- PINNED: imports d3d9 x1, DDRAW x2, KERNEL32 x99, USER32 x14, GDI32 x1, ADVAPI32 x3.
- SUPPORTED: DX SDK in the Makefile is iw3xo-radiant deps (D3DX v43, not the 2005 SDK); fine for d3d9.h, not for matching D3DX code.

## 2026-09-30 — CRT19 and reconstructed SDK lookup

- PINNED: independently replayed aggregate 239,955 / 1,089,680 = 22.020685%.
  New instruction credit: CRT C 2,751; authentic MASM 1,749; reconstructed
  SDK-derived C++ 48,427. This is library work, not rendering logic.
- PINNED: `DXGetErrorString9A` at 0x100cc81b matches a complete 72,524-byte
  section with all 8,899 relocations/bindings. Shared alias case labels in
  actual SDK return-leaf order and MSVC 13.10.4035 `/O1 /Oy- /hotpatch /MT`
  are the accepted source/build context. Only 48,427 code bytes count;
  24,097 table bytes do not. Clean source: src/codex_libraries/dxerr9_name.cpp.
- PINNED: `/ML` on this helper conflicts with canonical `/MT` and loses 42
  existing source matches; `/MT` retains all 359 and adds the lookup. `XL`
  changes are not dependencies in closed.mk: the private link.mk explicitly
  tracks the helper object to prevent stale-link acceptance. No `/FORCE`.
- PINNED: authentic CRT0INIT data sentinels resolve `_doexit`; compiler
  INT3-ending security/exit variants remain rejected, no relaxed boundaries.
- PINNED: memcpy/memmove have six in-code DD tables each, excluded from
  coverage. strchr's source-defined return helper precedes its public entry
  by 16 bytes (11 uncredited NOP alignment bytes); strcmp's full source
  section has a final JMP omitted by the inventory's 135-byte extent.
- Source proof, hashes, repeatable build and regression/fixture evidence:
  target/scratch/codex19_crt/ and target/scratch/codex19_dxerr/REPORT.md.
