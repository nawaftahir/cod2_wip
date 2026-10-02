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

## Codex shader read checkpoint — 2026-10-01

- PINNED: SetTyped argument five is PointerArray, not transpose. SDK Read
  sections select `data[element]` before indexing. Class 2/3 supplies orientation.
  Target 0x1007fae3 confirms pointer-array reads through all Set copy paths.
- PINNED: accepted clean Read module has eleven complete bodies / 457 bytes;
  nullable shader-version query adds 18. Inclusive Rows/Columns bounds are
  deliberately preserved; no SDK instance is allocated from an incomplete view.
- PINNED: standalone source-built bodies match unmasked complete original
  sections and retail; original referee 100%, first/end mutation negatives.
  Private link retains 403 and accepts 415; 2,000 SDK/source CPU outputs agree.
- PINNED: raw matrix Set has explicit fixed 4x4 transpose fast paths. Float-to-int
  control-word setup is outside the conversion loop; the nine upload functions
  remain unmatched despite corrected behavior paths and bounded compiler probes.
- PINNED: the first reused selector response incorrectly named the old parser
  dependencies. Correct both POSIX run paths and escaped Windows response paths,
  and assert the resulting prefix before linking. The librarian was not at fault.
- Original C++ CRT ST/MT and remaining C `/O2` ST/MT surveys supply no accepted
  gain. Common tiny no-op shapes are not entry/name identity. Preserve reports;
  repeating these unchanged batches will not advance source reconstruction.

## Codex assembler and support modules — 2026-10-01

- PINNED: 14 complete clean assembler/node helpers contribute 1517 code bytes;
  their private link accepts 505 source matches and retains all preceding 491.
  The original SDK CPU comparison passes 1440 complete-output cases. Eleven
  clean allocator/diagnostic methods contribute 1162 code bytes; their private
  link accepts 516 with all 505 retained, and the combined fixture passes 3584
  cases. The full aggregate, not these subtotals, authorizes coverage updates.
- PINNED: asm instruction/register nodes are 96/44 bytes. Instruction bytes
  +0x5c..+0x5f are untouched. Omitting base-node body definitions from their
  compilation TU restores four constructor register sequences; SDK member60
  calls the external base constructor from member75. No ABI workaround needed.
- PINNED: CAssembler has a confirmed 128-byte access prefix, not a proven
  complete historical class. Token's final jump goes back to its existing
  epilogue at +63; verify all 222 bytes rather than cutting at its earlier RET.
  GetShaderCode reloads escaped storage after virtual calls; aliasing it to a
  new local shortens/reorders the body and fails byte matching.
- PINNED: CAlloc's six words are chain, commit granularity, cursor, committed,
  reserved, initial reserve. Initial zero-byte Alloc returns NULL, confirmed
  by the complete original 234-byte body and original-SDK CPU run. The first
  fixture wrongly assumed non-NULL; only the test was corrected. Alloc's final
  jump targets its earlier pop/pop/pop/leave/RET8 epilogue at +177.
- PINNED: CTErrors is 32 bytes: head, message bytes, error count, warning count,
  warning level, specifier count, keys pointer, flags pointer. Error/Warning
  are cdecl varargs; Push is protected. ErrorChunk text starts at +4, requiring
  sizeof(pointer)+strlen+1 allocation, not padded sizeof(ErrorChunk).
- PINNED: Push preserves partial allocation and NULL cleanup; Clear retains
  keys/warning policy and clears flag 0x20 while resetting messages/counts.
  Separate ascending initial stores, comparison operand orientation and
  NOT+INC instead of NEG affect exact 4035 compiler output. Preserve the source
  forms that actually match; do not label mismatches an impossible compiler.
- Production remains a scratch-only 1500-byte draft versus an original
  1453-byte section (1277 code + 176 tables); zero source credit. Shared/direct
  error paths and switch/loop source orders were tried without a complete match.
  No whole-DLL identity, failure injection or GPU/game execution claim.

## Codex tokenizer module — 2026-10-01

- PINNED: seven complete clean C++ methods / 1037 code bytes pass source/SDK/
  retail, typed bindings, boundaries, mutation negatives and the original
  referee. The private closed link accepts 523 with all 516 retained; 9976
  full-output CPU cases pass. Fresh aggregate: 328122/1089680 = 30.111776%.
- PINNED access view: cursor/end +0/+4, token +8 (32 bytes), flags +40,
  allocator +44, diagnostics +48. This 52-byte access declaration is not proof
  of an original complete historical class; unexamined ctor-tail fields wait.
- PINNED: original libcmt.lib hash 6e2b3742e58245de52149137f64281b73db1487a07a31e165fff269fbf9b2ee8
  supplies complete identities for isalpha/isdigit/isalnum/atof/tolower and
  the 61-byte MASM alloca probe. Complete SDK caller edges identify their retail
  entries; their library bodies/relocations match. External dependencies only.
- Tested source forms: LexFloat's integer marker and suffix flags are int,
  not bool; the first digit loop uses preincrement for, and allocation length
  stays in its output branch. Integer suffix declarations are long flag,
  cursor, unsigned flag. Identifier starts text+1. Octal uses int overflow
  and <= '7'. LexChar advances the pointer after its external character helper.
  Preserve these forms; the old full draft records nine unmatched methods.
- Original quirks, including exponent-plus rejection and bounded malformed
  characters, are preserved. CPU comparisons include full float/integer bits,
  unchanged token words, nullable outputs, strings and complete diagnostics.
  No allocation failure, non-ASCII locale or GPU/game boot proof.

## 2026-10-01 Codex preprocessor source checkpoint

- PINNED: clean preprocessor has 25 complete source bodies / 2199 code bytes.
  Full V2, private link 548 retaining all 523, and 12259 complete-output CPU
  comparisons pass. Fresh full aggregate: 330321/1089680 = 30.313578%.
- PINNED: CPreProcessor access layout is 684 bytes: allocator +0, errors +24,
  define buckets +108 (127 entries), include stack +616, lexer +620, token +632,
  mode +664. CPPConditional/CPPBlock/CPPDefine are 16/12/20 bytes. CPPInclude
  is a 112-byte access view; unexamined file/resource fields remain opaque.
- PINNED: SDK member 94 critical-section methods use CNode's allocator static,
  not CPreProcessor's parser static. A 23-byte masked Leave draft is wrong and
  excluded. The parser static has protected-name mangling in the SDK.
- PINNED: private link regression selected libcpmt:newop.obj's 36-byte operator
  new rather than the target's 14-byte libcmt:new.obj. A hash-pinned authentic
  source-rebuilt CRT dependency restores all five previous source matches.
  Its archive/object bytes receive no additional credit and are never committed.
- PINNED: a synthetic literal-end map label can shadow an adjacent real literal
  symbol at the same address. Real map symbols already establish that boundary;
  append a proven end label only where no real symbol starts. Keep binding checks.
- PINNED: recursive CPPConditional/CPPBlock destructors have typed COFF self-call
  fields omitted by the shared external-branch locator. Privately prove their
  exact decoded self-entry calls and typed identities; only then enable the
  original referee's existing MASK_INTRA option for these two methods. Canonical
  referee is unchanged. FindDefine's full 135-byte body ends with an internal
  jump to its independently decoded pop/pop/pop/ret epilogue, not a truncated RET.
- Matched source forms: positive end/cursor comparison, recursion guard before
  define search, initial-test plus do/while undef traversal, signed token-kind
  bounds 2..4, and 32-bit quoting/escaping state without a terminator append.
- Four subsequent source loaders have first-compile masked equality (412 bytes),
  not V2/aggregate credit. GetToken854/838, DoError223/228, define equality571/620
  remain scratch. Read the REPORT before repeating their bounded source attempts.

## PINNED — 2026-10-02 compiler source checkpoint

- Eight isolated CCompiler definitions pass complete scratch V2: 757 instruction
  bytes, exact source/SDK/retail bodies and typed bindings, original referee 100%,
  full extents/branches and byte/binding negatives. No aggregate gain until clean
  rebuild/link/CPU integration and disjoint accounting. Last accepted 30.313578%.
- Thirteen actual definitions are preserved in codex35_compiler/compiler.cpp;
  20,355 complete original/source CPU comparisons pass. The larger EvalRange is
  3264/3274, still unmatched. Keep both the full draft and isolated eight.
- PINNED compiler c2.dll contains -QIftol; /d2QIftol emits __ftol instead of
  __ftol2 for these casts. /QIftol alone is ignored. This establishes reproduced
  compiler behavior, not the original historical flags; no ABI/byte rewriting.
- Range clamps intentionally include unordered comparisons when flags 4/8/10h
  assert sign/unit bounds. Ordinary <=/>= replacements fail NaN cases. Unary
  10A00000h = asin, 10B00000h = acos with reversed endpoints; 207/208 binary
  operations combine min lower/max upper bounds. LIT pow reverses its exponent
  endpoint below base one. All are pinned from typed SDK code, not Ghidra labels.
- CRT finite21/isnan46 identities are verified from complete typed SDK caller
  edges and pinned libcmt member721; both dependencies receive zero source credit.
  IsFullySemantic69 ends with a backward jump to its checked return epilogue.
- Private read-only Ghidra retry recovered the missing EmitIntrinsic analysis
  (3210 lines), plus expression/range exports. Analysis is not source; its wrong
  IMAGE_DOS_HEADER types and nonsettling type propagation are documented. SDK
  intrinsic section23940 versus analysis body23580 needs code/table accounting.
  No DB/reference edits or compiler-impossibility claim. Replay/attempts in REPORT.

## PINNED — compiler clean integration and matrix predicates, 2026-10-02

- Eight compiler source methods / 757 bytes now pass clean V2, a 556-match
  closed link retaining all 548, 20,355 clean-profile CPU comparisons and the
  full disjoint audit: 331,078/1,089,680 = 30.383048%. Source is separated in
  target/src/codex_shader_compiler/. Clean EvalRange and StackAlloc remain
  original SDK dependencies; the older thirteen-method draft is not promoted.
- Select all 193 source-replaced definitions' objects when using the full
  private dependency archive. The clean CPU link originally omitted 181;
  adding the actual missing source objects resolves that failure without
  relaxing unresolved-symbol or duplicate-definition gates. Map ownership
  must use the clean maps, not the earlier draft fixture's filenames.
- SDK member73's IsRowMajor404 at1006D5D9 and IsColumnMajor406 at1006D76D:
  template2 first-pass mismatch returns1, second-pass mismatch returns0;
  non-template2 returns rows==1 and rows>1 respectively. Zero dimensions
  return0. Label flag40h selects array/component checks, otherwise instruction
  +48h. Indexed drafts pass32,768 complete original/source output comparisons
  but are unmatched372/376; pointer361/362 and cached391/387 attempts remain
  drafts. Do not simplify target behavior or repeat these probes. Evidence
  and source are in target/scratch/codex35_compiler_layout/REPORT.md.

## Codex expression checkpoint — 2026-10-02

- PINNED: member73 EmitExpression at1007B5EB is5701 instruction bytes plus108
  table bytes, all27 table destinations checked against retail and decoded
  starts. Do not count5809 as code. Typed SDK callee signatures and diagnostic
  strings are in target/scratch/codex35_expression; Error is cdecl, its missing
  implementation code isDB6h. CBaseProgram fields+6C/+70 flags, +74 special
  register, +78 constant label, +88 null label, +A8 clip label are access views.
- PINNED: EmitClip311 standalone becomes exact309 when real EmitTemp28 shares
  the TU. Isolated clip_matched.cpp passes strict retail/SDK/source V2 including
  bindings, negatives and original referee. Callee bytes are already credited;
  clipping's309 still need clean/full-link V3. This is an observed compiler
  context result, not proof of historical source/TU provenance.
- Five complete expression/helper drafts (8102 target instruction bytes) pass
  1284 original/source full-output CPU comparisons:954 successful compilations,
  330 errors. Fixture uses standalone helpers.obj, not the matched cohort.
  No new aggregate credit, no GPU/whole-file claim. Preserve fixture/packet
  hashes; next integrate cohort without duplicate callee ownership. Eight
  EvalRange array/scope/induction variants remain unmatched in codex35_evalrange;
  their REPORT.md records the failed routes. Owner requested pause after commit.

## Codex clipping integration — 2026-10-02

- PINNED: separate compiler/clipping cohort reproduces all nine complete bodies
  (1066 bytes) and retains every556 prior full-link match, adding clipping for557.
  Only309 bytes are potential gain. CPU/aggregate acceptance remains pending.
- PINNED: the strict SDK selector removes204 definitions for194 distinct source
  symbols: IsCLIP appears3 times, IsUnary2, IsBinary2, IsTexture6, GetParameters2.
  CPU preflight must pin both counts plus exact symbol-set equality, not194 raw
  entries. The first run rejected the mistaken count; corrected runner not run.
  Source/proofs/resume commands are in target/scratch/codex35_clip/REPORT.md.
