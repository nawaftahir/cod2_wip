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

## 2026-09-30 — Four clean SDK lookup TUs

- PINNED: aggregate 307,651 / 1,089,680 = 28.233151%. New wide-name
  48,462 bytes and descriptions 9,617 each add 67,696 unique code bytes.
  All are reconstructed SDK-derived C++, not historical source/rendering logic.
- PINNED: the shared HRESULT alias labels / SDK return-leaf ordering /
  MSVC 13.10.4035 `/O1 /Oy- /hotpatch /MT` context reproduces all three
  siblings on their first compile. New full proofs check 10,991 bindings
  and 27,703 table bytes; the latter receive no instruction credit.
- PINNED: the ASCII/wide description bodies are masked-code aliases;
  complete source initializer bytes reject the wrong character-width target.
  Code ends with RET4 at +9,617, followed by 1,880 table bytes each. Treating
  those tables as instructions invents CALL/extent failures in the raw binder.
  The private check_link supplies only these two fully proven placements/code
  extents to the unchanged standard binder, after checking full linked sections.
  Raw 361 source matches becomes 363; all 359 baseline / 360 previous remain.
- Clean module: target/src/codex_libraries/build.mk compiles four actual
  clean C++ files as separate non-/GL objects. The private wrapper tracks
  those object prerequisites. SDK fixture passes 426,244 comparisons.
  Review narrow placement/table proofs before Claude-owned canonical integration.

## 2026-09-30 — Source-backed shader helpers and remaining CRT survey

- PINNED: fresh aggregate 312,453 / 1,089,680 = 28.673831%. CRT35 adds
  29 disjoint complete C bodies / 3,004 bytes; SDK35 adds 37 complete
  reconstructed C++ methods / 1,798 bytes. 35% remains 68,935 bytes away.
- PINNED: MSVC 13.10.4035 `/O1 /Oy- /hotpatch /MT` reproduces the 25
  CInstruction methods. Confirmed prefix: token +0, inputCount +4,
  inputs +8, outputCount +0xc, outputs +0x10. Full size and allocation
  layout are NOT established. Only method access to this prefix is proved.
- PINNED: explicit shared `offset = width * index` in GetInputs/GetOutputs
  preserves the target's reuse; the factored `(index + 1) * width` spelling
  did not. GetOutputs switch layout also matters. The final 25 complete
  methods match; previous 68/134-byte near-matches are not accepted.
- PINNED: 12 SetShaderConstant native/raw specializations are 30 bytes each.
  Their original name/address binding comes from CConstant::Create at
  0x1008085f (664-byte SDK section, zero source credit), not first-hit
  selection among identical bodies. Conversion specializations remain DEFER:
  float-to-int source called __ftol2 while target uses a control-word sequence;
  this does NOT prove impossible source reconstruction or a /GL requirement.
- PINNED: new private clean-module link accepts 400 source matches, retains
  all 363 previous, and CPU fixture passes 361,654 predicate/getter comparisons.
  No canonical edits, binder weakening, whole-DLL identity or game smoke claim.
- PINNED: `_amsg_exit` discovery at 0x100f7840 was a 37-byte suffix of the
  previously certified complete 51-byte body at 0x100f7832. Reject interior
  entries even when homogeneous BSS permits shifted apparent data bindings.
  CRT35 inherits the unchanged hash-pinned complete-body/binding verifier.
- 358 remaining original CRT C files were compiled in each of ST/MT modes;
  357 per mode produced objects. tidprint.c fails both and is excluded. Use
  response-file batching, not one compiler process per source. Original CRT
  source stays external. SDK discovery names 1,427 sections but earns no
  source credit. Reports and replay packets: scratch/codex35_{crt,sdk}/.

## Codex parser family — 2026-10-01

- PINNED: one shared C++ shift/reduce implementation matches all three
  complete SDK parser sections and retail bodies. d3dxtok_parse 0x10066a19:
  1,128 code +188 table; d3dxasm_parse 0x1006b861: 1,263 +248;
  d3dxshader_parse 0x100a352e: 3,691 +1,172. Credit 6,082 code bytes only.
- PINNED: initializing yychar=-1 before *yyssp=yystate=0 removes the
  shader parser's five-byte instruction-order difference while retaining the
  other two matches. Context is 13.10.4035 /O1 /Oy- /hotpatch /MT /Gy.
  Grammar action rule/count pairs are target-derived, not opcode bytes.
  Historical byacc version and original TU grouping are unestablished.
- PINNED: parser stacks have 500 elements; recovery token is 256; final
  states are preprocessor 15, assembler 16, shader 40. All grammar table,
  parser-global and Token/Production/Error bindings are independently checked
  against typed original SDK members. Those dependencies get zero credit.
- PINNED: original parser COMDAT selection is NODUPLICATES (1). Adding /Gy
  alone does not resolve duplicate definitions in original SDK members.
  The private link excludes only source-replaced COMDAT definitions from its
  generated dependency archive, retains SDK code as opaque dependencies,
  and verifies each parser's actual source-object owner in the linked map.
- PINNED: generic map data spans extend the last source literal over unrelated
  anonymous SDK data. Comparing that gap falsely rejects "syntax error".
  Source COFF and complete linked/retail strings establish literal ends;
  private derived-map data metadata supplies these ends. Standard binder
  remains unchanged and raw results remain available. No function marker
  variants, lost matches or unchecked string truncation are accepted.
- PINNED: private link retains all 400 previous source matches, now 403.
  CPU fixture compares 96 complete shader/error outputs against original SDK;
  this is neither GPU validation nor game boot nor whole-file identity.
- SetTyped draft remains DEFER. Target-backed count scaling and reverse
  padding were corrected; all nine Set bodies still differ. Read bounds are
  deliberately inclusive Rows/Columns. CConstant is an access prefix only,
  never an allocation layout. See its report before more variant testing.
