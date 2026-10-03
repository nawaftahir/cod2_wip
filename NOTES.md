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

## Codex resumed clipping/type checkpoint — 2026-10-02

- Clipping clean integration now passes1284 full original/source shader outputs
  (954 successes,330 errors), full-link557/556 retained and the full aggregate:
  331387/1089680 =30.411405%. Only309 new bytes count; the previous757 are
  retained. Older pending/pause entries above are historical, not current state.
- PINNED: GetTypeFlags at1006DDF3 has313 code bytes and a13-entry/52-byte jump
  table; each target resolves to a decoded instruction start. Component codes
  0=>17h;1/5=>2;2/6=>02000002h;3/7=>04000002h;4/8=>08000002h;
  9=>0;10=>02000000h;11=>04000000h;12=>08000000h. Compiler+14h bit20h
  overrides precision bits using(value &F3FFFFFFh)|02000000h.
- PINNED: Error at1006DCA1 sets compiler+4Ch to1, formats at most256 bytes
  with __vsnprintf at100F61B9, forcibly terminates byte255, forwards to input
  diagnostics+18h with GetToken(node), and returns0. Its98-byte source section
  matches SDK/retail with complete bindings. Remaining SDK/runtime dependencies
  are independently checked but receive no extra source credit.
- Normal source lifetime matters: initializing GetTypeFlags'count only after
  its null-node return moves the EBX save to the target's non-null path. This
  gives complete365-byte SDK-section equality, including its table. No padding.
- PINNED verifier limitation: legacy MASK_INTRA=0 fails on four recursive
  GetTypeFlags call operands (first+96); MASK_INTRA=1 additionally masks exact
  internal E9 jumps only on the PE side (first+25). Both report349/365=95%.
  Full typed SDK/retail/source proof passes, but packet remainsDEFER and gets
  zero coverage credit until the referee issue and integration are resolved.
  Do not silently change or relax the existing gate.
- Six new interpolation lifetime/cleanup/shared-final-call variants remain
  unmatched947/937 or945/937. Preserve codex35_lerp/REPORT.md; they have no
  independent CPU proof and must not borrow the older fixture's certification.

## Compiler type integration and pause — 2026-10-02

- PINNED: local decoded referee fixes four recursive E8 operand relocations
  in GetTypeFlags. Internal E9 jumps stay literal; table data and E8/E9 inside
  immediates are not instructions. Its executable self-check covers all these
  cases plus bounds. Raw legacy95 is recorded separately from normalized100;
  independent complete SDK/source/retail byte, binding and negative proof is
  still required. No global legacy referee was changed.
- Clean types.cpp provides Error98/GetTypeFlags313, excluding52 table bytes.
  Clean V2 passes; private link559 retains557;1284 full shader-output checks
  pass. Selector196 distinct/206 raw definitions includes10 archive duplicates.
  All opaque SDK/runtime dependencies get zero additional source credit.
- Environment restart interrupted the full aggregate replay before output.
  Last confirmed total remains331387/1089680 =30.411405%. Resume with a fresh
  full replay, not a percentage edit. Candidate gain411 would yield30.449123%,
  still6003 bytes short of31%. Paused at the owner's request.
- Do not repeat completed surveys: codex30_crt_o2 tested358 C files in ST/MT
  with zero accepted gain; codex30_cpp tested58 runtime C++ files, zero gain.
  This turn's duplicate CRT batch was stopped; partial objects prove no gain.
  codex30_token already has a624-byte opcode initializer versus607 target;
  this turn's644-byte attempt is worse and remains DEFER. Consult old REPORTs
  before spending more builds on these families.

## Program source checkpoint and pause — 2026-10-02

- Fresh aggregate PASS confirms331798/1089680 =30.449123%; the earlier411
  compiler type/diagnostic bytes are accepted. Program bytes remain uncounted.
- PINNED: SDK87/88 class-specific CArgument/CInstruction operator delete is
  static __stdcall. Correct declarations generate32-byte deleting helpers;
  global-delete drafts generated33. SDK1-byte destructors stay dependencies.
- PINNED: ReadWriteInfo relocation+705 binds global operator delete, not _free.
  A masked-byte-equal free draft had wrong binding and was corrected before
  clean strict proof. Never substitute masked equality for typed binding.
- Clean program.cpp:12 complete methods/2663 bytes, clean V2 negative tests,
  scratch and integrated1284 full-output CPU cases all pass; hashes current.
  Private DLL builds, retains559 preceding matches, but four new methods fail
  linked acceptance: both deleting helpers and both compaction methods.
  Exact failure and next steps are in codex31_program/REPORT.md and link.log.
- Accepted aggregate checker remains unchanged; its proposed extension is
  saved as aggregate_pending.patch. Optimizer625/638 remains scratch-only.
  Paused at owner's request; no whole-file SHA or GPU claim.

## Program and graph source checkpoint — 2026-10-02

- PINNED: the program cohort's four linked failures were absent one-byte SDK
  destructor locators, not mismatched source bodies. SDK88 CInstruction at
  100853af and SDK87 CArgument at10085bf4 are exact C3 sections. Verify SDK,
  retail and linked byte equality, named library owner, typed helper CALL+8 /
  relocation+9 / target+13 displacement, and wrong-target negative. These
  locators receive zero additional source credit. Program12/2663 now passes
  V3/571 retaining559 and fresh1284-output CPU proof plus full aggregate.
- PINNED: graph fields CInstruction+14/18/1c/20 are parent-count/pointer and
  child-count/pointer access prefixes, not verified complete allocation size.
  The four clean graph methods independently prove945 instruction bytes;
  V3/575 retains571 and1284 integrated full shader outputs agree. Full aggregate
  PASS confirms335406/1089680 =30.780229%, including945 new disjoint flow bytes.
- PINNED: CompareIndex is a26-byte static SDK callback. Only that named static
  definition is rebound after full SDK/source equality, no relocations and
  local-label reference checks. The strict selector verifies212 distinct
  source definitions /232 removed archive definitions and exact symbol sets.
- PINNED: ParentInfo includes a recursive E8 relocation; legacy raw97 remains
  recorded separately from decoded normalized100 and independent typed proof.
  Base Initialize's complete210-byte section ends in a backward jump into its
  verified +196 return epilogue. Neither body is truncated or padded.
- The new proof uses stdlib lru_cache on immutable COFF bytes within one
  process, with parity, hit and changed-input-miss checks. No result/file cache
  or relaxed verification gate. A build script briefly regenerated the owned
  program runtime archive; corrected paths plus freshly rerun V3 and CPU proof
  restored current hash consistency without editing proof digests or retail.
- MarkVarying scope3/token-local609/614 remains unaccepted. Five masked-opcode
  comparisons use shorter EAX immediate encodings than SDK's ECX; input-pointer
  load order also differs. Preserve bounded attempts, do not infer impossibility.
- Owner asked to pause after checkpoint.31% needs2395 more bytes;35% needs45982.
  No verification process remains running; no V4/V5 claim.

## Varying/pruning source work resumed — 2026-10-02

- Owner explicitly resumed35%; previous pause revoked. Confirmed total remains
 335406/1089680 until the fresh varying aggregate passes;673 candidate bytes.
- PINNED: IsVarying target10086f0d/59 is reproduced by an early-invalid-return
  recursive C++ form. The compiler emits the target loop with zero self-call
  relocations. Other loop/result/goto forms differed in return-block layout.
- PINNED: token-mask expressions plus indexed inputs reproduce MarkVarying614
  at1008d61e. It requires the actual helper definition in the same TU: a lone
  caller produced603 bytes. Both source bodies now pass strict clean V2 and
  V3/577 retaining575;1284 full CPU shader outputs agree. No impossible-source
  or LTCG excuse, padding, ABI hack or opaque helper credit was used.
- PINNED: StripUniform10087159/408 matches with a for-counting loop (no redundant
  zero-count guard), indexed buffer compaction and a low20-bit count-field
  assignment in a four-byte token union. Explicit extra guards changed codegen;
  XOR-expression source emitted extra moves rather than the target field store.
  Its clean V2 passes; full integration is in progress, no aggregate credit.
- The source bitfield is a target-backed representation of the observed low20
  count update, not an assertion about historical private SDK header names.
- Varying full aggregate now PASS:336079/1089680 =30.841990%, including673
  disjoint bytes. StripUniform V3/578 retains577 and1284 CPU outputs pass;
  its408 aggregate gain is pending. The failed initial pruning linked checker
  selected an older run due to inherited replacement collision; a direct
  pinned parent wrapper fixed selection and genuinely reran V2/V3, no gate waiver.
- PINNED Origin:10086c88/33, protected nonconst unsigned CProgram::Origin(unsigned),
  maps a noninvalid argument's relative3 to its origin unless that is invalid,
  otherwise preserves the input. GetArgument27 at1006c367 returns null when
  index>=argumentCount, otherwise arguments[index]; do not conflate the two.
- PINNED: StripVarying10086f48/529 matches after repeated argument-index access
  replaces the cached relative-chain pointer. Both input-buffer forms then
  match. The five-method clean strip file totals643 bytes and passes strict
  V2,V3/583 retaining578 and1284 integrated CPU outputs, aggregate pending.
- PINNED: GetPool1006c34c/27 and GetInstruction1006c382/27 return null for
  out-of-range indices, otherwise the indexed pool/instruction. The CPU linker
  removed unused getters under /OPT:REF; /OPT:NOREF preserves all definitions
  in both real fixtures for the unchanged owner gate. Output parity is not
  direct execution coverage of every retained getter.
- Origin /Ob1,/Ob2 and explicit forceinline experiments did not solve the
  dead-code helpers. Bounded guard/buffer/flag variants1189..1198/1202 remain
  unmatched and uncredited, not evidence of impossible source matching.
- PINNED: ReadWriteInfo_ReadInfo1008a7ee/94, WriteInfo1008a84c/98 and
  CommitOrigin1008a8ae/203 reproduce complete SDK sections in a fresh genuine
  C++ draft. Write tracking uses pool lastWrites[index*4+component]; reads
  follow relative arguments and update origin/pool bounds. These395 bytes
  remain uncredited until full clean typed, binding, regression and CPU gates.
- CORRECTION: all four read/write methods above already belong to the accepted
  codex31_program module (1112 of its2663 bytes). The duplicate selector caught
  a repeated reconstruction before private linking; these drafts add ZERO
  coverage. The redundant clean copy was archived in scratch, unused new gate
  wrappers removed, accepted program source untouched. Before every new batch,
  subtract existing REVIEWABLE clean-packet symbol rows from the SDK queue.
- Uniform-pruning full aggregate PASS now336487/1089680 =30.879432%;408 new
  disjoint source bytes accepted. Strip643 and sort279 have all local gates
  green but aggregate credit remains pending. The active goal remains35%.
- PINNED: HeapSort10086920/279, member90 section13, uses __stdcall helper and
  comparator. Scoped locals, first-child initialization inside the split>0
  guard and direct array[child+1] access reproduce the entire body. Shared
  locals also gave279 bytes but differed at40; size equality is insufficient.
  Clean V2,V3/584 retaining583 and1284 actual full-output CPU comparisons pass.
- CompactOutputs1008d26d/696 remains unmatched after bounded flag/opcode,
  indexed-buffer/lifetime and actual12-definition caller/callee TU tests.
  Observed opaque argument offsets60..70 are not guessed semantic types.
  No new source credit, integration claim or compiler-impossibility claim.
- Strip/accessor full aggregate PASS now337130/1089680 =30.938441%,643 new
  disjoint bytes accepted. Sort279, argument duplicates681 and instruction
  duplicates1106 have complete current V2/V3/CPU proofs;2066 aggregate bytes
  are pending. The active35% goal remains unfinished, not paused.
- PINNED: CompareValue100864e9/79 compares unsigned pool4 then double20;
  CompareRegister10086538/142 orders38,3c,4,c,8,10,14 as unsigned and18 as signed.
  Else-if lifetime/control-flow plus shared value-return paths solve whole
  bodies. RemoveDuplicateArguments10094810/460 needs pool-ID comparison order
  matching the target. V3/587 retains584 and1284 actual full CPU outputs pass.
- PINNED: grouped static C++ CompareDuplicateInstructions1008b1b3/415 and
  Stable1008b352/44 match literal SDK bodies. Compiler4035 itself passes the
  first private comparator argument inECX/ret8; address-taken Stable keeps
  ret12. Keep the real static caller/callee group; never force a different ABI.
  Original SDK calls occur only in sections141/210, both replaced by source.
- PINNED: RemoveDuplicateInstructions10094eb4/647 checks an opaque DWORD24,
  not the earlier children20 prefix field. Count-before-allocation, shared
  cleanup and bounded-loop comparisons yield the complete body. V2,V3/590
  retain587 and1284 full CPU outputs pass. Its comparator section ends with
  a backward jump to a pinned pop/pop/pop/leave/ret8 epilogue, not a truncation.
- DelayOutputs1008bbde/648 remains619/626 versus648 after genuine cleanup/
  group-cursor source tests. Instruction3c is still an opaque DWORD. MSVC's
  legacy for-loop scope collided with an outer i; rename the cursor or scope
  it explicitly, and genuinely rebuild. No draft coverage or CPU parity claim.

## Codex predicate/pool checkpoint — 2026-10-03

- PINNED: member90 sections181/182: pointer MergePredicates1008d884/129 and
  MergeArguments1008d905/97, complete source/SDK/retail matches. Gradient/loop
  special case clears relative2 and sets signed link1; MergeArguments remaps
  second argument, combines flag-class bits25..27 and copies opaque60/64 when
  destination60 is zero. Clean V2,V3/592 retain590 and1284 full CPU outputs pass.
- PINNED: member90 sections108/109/115: CombinePools10089f75/293,
  MutuallyExclusive1008a09a/181 and SwizzleParameter1008a70d/225 match complete
  clean source bodies. Pool8/10/18 stay opaque DWORD fields; signed predicate
  senses use argument18 and chains14. Counted parameter-copy loop reproduces
  the225-byte body; memcpy emits224 and differs. V3/CPU still pending.
- A chained CPU-runner substitution212->232 then232->252 incorrectly rewrites
  both assertions. Replace232->252 first, then212->232. Fix requires fresh
  pinned V2/V3 and actual CPU replay; no successful CPU result was claimed.
- DelayOutputs current621/648, pointer-cursor alternative643/648; shared chain
  helper256/258, output-pointer trial261/258; Vectorize267/267 register swap.
  These remain unaccepted scratch. IsSameRegister117 has discovery equality
  only; no new strict coverage. Goal35% stays active at confirmed30.938441%.

## Codex pool replay and vectorization helpers — 2026-10-03

- Pool/predicate/swizzle699-byte cohort now passes clean V2,V3/595 retaining592
  and1284 actual full CPU outputs with current hashes. The substitution-order
  bug was fixed only after the pinned check finished; all gates were replayed.
- PINNED: VectorizeLeft_UpdateLinks10088f70/229 uses the full instruction token
  local across its high12-bit guard, then masks low20 bits for width. This
  source form reproduces the complete SDK section; the previous direct-field
  forms gave equal229 bytes but rearranged prologue registers. Instruction24
  and28 remain opaque DWORDs; argument40 tracks observed shift/or bits.
- Initial IsSameRegister100883d0/117 and UpdateLinks229 discovery equality was
  subsequently promoted through all local gates below. Other helper near-matches
  never receive source credit merely for equal lengths.

- Vectorization helpers now pass clean V2,V3/597 retaining595 and1284 actual
  full CPU outputs, all hashes current.346 bytes await combined aggregate.
- PINNED: PropagateMovs10089562/410, member90 section98: grouped-input alias
  validation continues with unsigned j>=count, not merely equality. That
  expression restores full410-byte source equality and target stack lifetimes.
- PINNED: DeadLinkRemove1008ba48/406, member90 section168, is private. CProgram
  poolIds starts at74; AddArgument loads88=poolIds[5], unused arguments take
  74=poolIds[0]. Wrong6/1 indexing emitted equal406 bytes but differed at246;
  corrected ordinary source fully matches. Local integration passes below;
  complete aggregate inclusion remains pending.
- Prior aggregate118170/session65215 disappeared with no PASS and empty log.
  Fresh replay274530/session55509 includes3337 pending disjoint bytes. Do not
  claim expected31.244677% before its actual terminal PASS.

## Codex cleanup and instruction-ordering proof — 2026-10-03

- Cleanup816 now passes clean V2,V3/599 retaining597 and1284 full CPU outputs,
  all recorded hashes current. The exact DeadLinkRemove406 tail branches back
  to394, with popedi/popsi/popbx/leave/ret394..398. Strict checker pins name,
  full size, jump and decoded epilogue; allocation-failure tail is not truncated.
- PINNED: SDK90 sections6/99/100/101: CompareDependency100865e0/59,
  MarkParents100896fc/78, ComputeDependency1008974a/128 and private recursive
  ReorderInstructions100897ca/395. Grouped ordinary C++ fully matches660 bytes.
  Instruction30 uses signed compare/division;24/38 stay opaque DWORDs.
- Else-if signed score ordering followed by b>a / b<a reproduces CompareDependency
  fully. Tag-first field comparison reproduces ComputeDependency. A parent-index
  pointer and score-before-marked initialization reproduce recursive caller395;
  cached parent-index value gave392. No ABI or padding workaround.
- New comparator59 is externally rebound only after full literal SDK/source
  equality, exact section/storage and zero-relocation proof. MarkParents/raw94
  and recursive caller/raw97 self-call scores stay visible; decoded normalization
  is100 with complete independent typed binding/boundary proof. Clean V2,V3/603
  retain599 and1284 full CPU outputs pass with current hashes; aggregate pending.

## Codex transform source — 2026-10-03

- PINNED SDK91 sections3/4/5/6/8/9/12/13/15: clean Read117,Write105,
  UpdateRead64,UpdateWrite38,CompareLoad71,CompareIndex26,RemoveDuplicates70,
  RecalculateLoad285 and Reduce109 fully match885 bytes. Private V3/612 retains
  all603;1284 actual full CPU outputs pass with current hashes.
- PINNED: complete RemoveDuplicates caller's ABS32 callback relocation selects
  CompareIndex100cbbac, not global100865c6. Full26 bytes, zero relocations,
  complete caller and typed target proof disambiguate the two physical copies.
- PINNED: Reduce109 ends by jumping to102, its complete popedi/popesi/ret
  sequence102..104. Exact name/size/destination/decoded epilogue checks admit
  that complete body, not a generic truncated-branch waiver.
- PINNED: member91 section17 Apply100cc228/1129. Initial result=0 at entry
  creates1136 bytes/extra stack slot. Delaying its lifetime until flow-tag setup
  restores1129; a real final-allocation success block and shared failure/cleanup
  labels restore exact control-flow layout. Standalone and caller/helper TU
  forms fully match. Clean V2,V3/613 retain612 and1284 full CPU outputs pass.
- Preserve the target's ignored ReadWriteInfo status, observed initialization,
  cleanup order and negative Reduce early return. Byte reconstruction is not
  permission to fix allocation behavior. Prefix labels are descriptive, not
  original header/field provenance; public CPU tests do not cover all branches.
- The clean checker includes sibling *.cpp/*.py/*.sh inputs. Editing an unrelated
  draft in that same scratch directory invalidates its packet. Keep active
  drafts in separate sibling directories, freeze every pinned input, and replay
  gates after moves/tool fixes. This caused two honest V3 failures, not progress.
- ReverseInsts endpoint/loop alternatives72/73/74/75 never fully matched74;
  current independent-last-index form74 differs24. Do not repeat unchanged forms.
- ComparePredicate573 initially562 differed315 because combined final conditions
  merged return blocks. Nested sense tests and explicit final else reproduce the
  full573-byte SDK body. Clean V2,V3/614 retaining613 and1284 actual full CPU
  outputs pass with current hashes; aggregate inclusion remains pending.

- Full cleanup/ordering aggregate subsequently completed PASS/exit0:
  341943/1089680 =31.380130%. New helper/driver/comparator2587 bytes remain
  pending a later full replay. All fifteen proof-input sets were rehashed current.

## Codex public ordering inspection checkpoint — 2026-10-03

- PINNED on the hashed Summer2004 SDK library: member90 section66 is the complete
  six-byte CTransform::Apply body, `mov eax,0x80004001; ret` (E_NOTIMPL), not1.
  Base vtable section63 has destructor relocation0 and Apply relocation4;
  derived CTReorderInstructions vtable section70 adds Apply(int) relocation8.
  This is SDK declaration/context evidence, not a new retail/source match.
- Public CProgram::ReorderInstructions100910df/828 remains inspected, not drafted
  or credited. Verify compiler-generated vtable/constructor/deleting-destructor
  bindings before accepting a source caller. Do not replace virtual dispatch
  with invented constants, raw table data or a plausible stub.

## Codex public ordering source — 2026-10-03

- Full previous aggregate303733/session10758 completed PASS/exit0:
  344530/1089680 =31.617539%. Immutable log is codex35_predicate_order/aggregate.log.
  All fifteen cleanup/order/transform/driver/predicate input sets remain current.
- PINNED: public ReorderInstructions100910df/828 fully matches ordinary C++.
  Separate caps bit tests combine into the target DWORD test. Repeated masks
  of full token locals in both loops restore registers/spill/70-byte frame;
  pointer virtual dispatch restores constant-vtable+8; a real final-allocation
  success block restores exact failure/cleanup layout. Earlier808/812/816/819
  forms are not accepted; don't repeat unchanged attempts.
- PINNED SDK and fresh source: both `_E` weak externals have COFF search-kind2
  with `_G` fallback tag indices, NOT kind3. Complete typed8/12-byte tables at
  10110440/10110448 distinguish34-byte deleting bodies10086d2c/1008c825.
  Constructors10086d08/10086d4e are23; adjacent full reset destructors10086d1f/
  10086d65 are7; base Apply10086d26 is6. All eight complete V2 bodies total962;
  tables add zero code credit. Integrated CPU equality is not branch coverage.
- The inherited table proof uses a global prior_prove. A new extension must
  save its delegate under a different name or it makes that older proof recurse.
  Fixed ordering_prior_prove; fresh affected checks are required, not waived.

- Final clean ordering V2, V3/622 retaining614 and1284 integrated CPU outputs
  pass with current hashes. Selector259 distinct/279 physical SDK definitions.
  Three named6/7-byte scan locators require full100 V2 and full linked bodies;
  no global scan threshold or body/binding gate is relaxed.962 await aggregate.

## Codex scheduling draft checkpoint — 2026-10-03

- PINNED SDK91 Bubble100cbd29/1170: candidate end is scan+1 without advancing
  scan; temporary argument flag is54, not lastRead58; reference index is74.
  Initial argument marker loop uses arguments[j], not the read-buffer index.
  Blocked expansion preserves generation/delta and resumes choose_direction,
  not restart. Preserve all observed behavior; no bug-fix substitutions.
- PINNED: Bubble stack allocation54 hex differs from fresh draft4c. Reusing
  step, caching initial program, positive flow guarding and hoisting locals
  still give1157/1170, first difference7. Reverse73/74 differs18. These are
  emitted/target BODY LENGTHS, not matching-byte counts; both earn zero credit.
- Source and immediate prior baseline are retained in isolated
  codex35_transform_bubble with compile/probe scripts, hashed discovery packet
  and REPORT. The latest compiler and probe finished exit0; full equality is
  false. No V2/V3/CPU gate is claimed and no clean source was added this save.
- Owner requested checkpoint. Confirmed31.617539%; aggregate328542/session88253
  is still live and public-order962 remains pending. No new aggregate, expected
  percentage, whole-DLL claim, goal completion or release-tree write.

## Codex register-pool checkpoint — 2026-10-03

- PINNED SDK90 CProgram caps[17] is offset6c, caps[18] offset70 and poolData
  pointer offsetbc. Initial draft caps[9] was wrong: full target-byte comparison
  caught it. Correcting to17 makes SeparatePhases_Phases178 match completely.
- PINNED compaction record is100 bytes, cleared as25 DWORDs. pool0;
  component counts8; maps10/14; source/mapped argument pointers18/1c;
  copy lists30/34/38; macro lists3c/40/44; read lists4c/50/54;
  12-byte read records58; current instruction pointer5c; packed flags60.
  Names are descriptive, not recovered historical header provenance.
- PINNED ReadCount is a do/while on the argument predicate chain; an incoming
  sentinel guard changes target behavior. Predicate14, sense18, origin38,
  instruction48, lastRead58 and read ID74 were inspected on the target.
- PINNED Map's unusual equality compares current sense18 to other predicate14;
  preserve it. Process's preference scan starts at inputs[k*width] for every
  input group, not inputs[j+k*width]. Reconstruction is not bug fixing.
- PINNED static CompareRead65 uses EAX context / ECX first / EDX second in
  its genuine same-TU private compiler convention. Address-taken Index56 and
  Stable33 use stdcall stack ABI; declaring a substitute fastcall is not proof.
- Target-backed bitfield extraction caps[17]<<1 with signed >>31 emits the
  observed SHL/SAR/XOR insertion in Begin. Its1739/1739 body still differs555;
  local lifetimes and SIB operands are unresolved, not compiler impossibility.
- Fresh Process1715/1715 differs1191; CompareRead65/65 differs30. Index56 and
  Stable33 have full masked discovery equality only. Their typed bindings are
  unverified; all larger draft source remains scratch-only and uncredited.
- Bubble correction: candidate-read marker compares candidate index, not
  original reference, to argument74. Current1160/1170 uses frame50 hex,
  target54. Structured loops and /G5,/G6,/G7 do not solve it. Reverse74/74
  differs24. Historical REPORT sizes are superseded by its appended checkpoint.
- Pool helpers4/424: complete clean V2 and1284 CPU cases pass; all packet files
  rehashed current. V3 first failed a guessed byte total34001 (correct33463),
  then missing local vtables.py. Both failures must be preserved, not waived.
  Reuse complete existing metadata proof in the new image and rerun affected
  gates before aggregate inclusion. No aggregate is live; confirmed31.705822%.
## Codex helper acceptance and pool algorithms — 2026-10-03

- Missing helper metadata dispatch resolved with pinned prior table/binding
  proofs applied to the NEW private image. Fresh V2, V3/626 retaining622 and
 1284 CPU outputs pass; all three complete input sets rehashed current. A
  single full aggregate32299/session47013 is live;424 remains pending credit.
- PINNED SDK90 Score: argument flag80000000, caps17 bits4/2 and producer
  IsSpecial select1 versus4 components; cost uses copy penalties29+, parity28,
  component preference24. Read pairs macro-register constraints before Score.
- PINNED SDK90 Read: instruction node pointer3c; cdecl Error(code4004), exact
  string preserved in source, logging only when commit flag bit1 is set.
  Both logged and silent allocation failure return80004005. Link insertion
  follows argument remap30 and lastRead58, then allocates relative8 recursively.
- Process >0 loop conditions fix unsigned branches. Whole-body decoded diff
  leaves ONLY SIB order4a5/4dc, still not full equality. Pointer/scalar refresh,
  unsigned-long counter and/G5/G6/G7 did not solve. Do not accept equivalent
  encodings, substitute assembly or infer impossibility. ABI stays unchanged.
- Current larger drafts include Score647/630, Read691/712 and Begin1739/1739;
  all unmatched, zero credit. Exact CPU-sweep source is baseline_cpu.cpp with
  hash878cabff43af3b2b9b9d9886fc258efd6ac9939323194df757a41eae98594c35.
  Its three probes are historical, not proof of the current source revision.
- Owner requested pausing at the next checkpoint. No more source batches;
  finish the one live audit and record its real result before pausing the goal.

## Codex helper aggregate and driver discovery — 2026-10-03

- Helper aggregate32299/session47013 ended PASS/exit0:345916/1089680,
 31.744732%. Four helpers424 are accepted; all prior source retained.
- Owner revoked checkpoint pause;32% next,2782 further bytes needed.
- PINNED SDK90 Link ends with a tail jump at offset56 hex to private
  DeadLinkRemove (AAEJXZ); it is not a truncated body. linkedProgram is an
  accessed CProgram pointer atE0. Error is protected cdecl (IAA...ZZ).
- Driver discovery Link91/Optimize638 matches complete sections, zero credit
  until typed bindings, full boundaries, private regression and CPU proof pass.
  Vectorize267 still differs33. Target Optimize has nine zero-result/XOR paths;
  the bounded source form retains those paths, no historical macro claim.
- Driver V2,V3/628 retaining626 and1284 full CPU outputs now pass. Named Link
  tail jump is checked exactly; original raw95 is retained, decoded100 plus
  complete independent byte/binding proof pass.729 awaits aggregate43146.
- PINNED target SeparatePhases late allocation/compaction failures are cleaned
  up then return0; only initial CompactInstructions failure propagates.
  CompactRegisters ignored IdentityRemap/one Process result and double-End
  failure cleanup are target behavior, not bugs to fix during reconstruction.
## Codex32 continued source facts — 2026-10-03

- Driver aggregate43146 terminal PASS/exit0 confirms346645/1089680=31.811633%.
  Diagnostics506,special/literals520,swizzle536 have complete fresh local
  byte/binding/regression/1284-case CPU proof; they are not yet aggregate credit.
- PINNED Special snapshots count and first output before initializing its
  cursor. That initializer order produces the exact422-byte body. Instance
  results are ignored; successful PerComponent clears the move token.
- PINNED Swizzle keeps masked opcode in stack storage, with a nonvolatile
  group-counter lifetime reusing it. A volatile opcode is explicit storage-
  constrained source, not historical provenance. Complete536 bytes match;
  source ABI and comparison masks are unchanged. Its group stride is
  outputCount, not scalar width; helper errors are intentionally ignored.
- PINNED SDK87 CArgument copy Initialize leaves1c untouched and copies the
  secondary double at28. Instance copies only60..74 and rejects null80004005.
  SDK90 Depth skips maximum dereference for a sentinel relative2, otherwise
  traverses that chain and keeps the maximum. Register equality excludes
  component; used-together uses same ID or opaque40 overlap. CompareHash
  compares opaque40 unsigned values. New507-byte cohort awaits full proof.
- Duplicate-ownership gate rejects IsCombine35 from the new helper cohort;
  older instruction-predicate source already owns it. GenerateCode61 replaces
  it: reset optimized/detailedInfo, clear optional output, preserve negative
  Optimize/Vectorize results, otherwise0. New seven-method533 now passes
  V2,V3/642 retaining635 and1284 full CPU outputs, hashes current. CompareHash46
  is rebound only after the existing exact literal static-callback proof.
- One full audit3787 is live for four new cohorts2095 bytes. Expected32.003854%
  remains unconfirmed until terminal PASS. No source,ABI or comparison waiver.
- Owner requested immediate checkpoint/pause, overriding continue-through32%.
  Save current proofs and inspect live audit3787 result first on next resume.
## Codex32 audit-continuation checkpoint — 2026-10-03

- Old audit3787 has no reusable handle, process125717 is absent, and its partial
  log has no terminal PASS/exit status. Cause unknown; no new coverage accepted.
- Replacement full audit13323/process23905 is live at
  target/scratch/codex32_argument_helpers/aggregate_resume.log. Latest poll:
  earlier assembler linked regression. Leave it running during requested pause.
- All15 driver/new-cohort packet input sets independently rehashed current.
  Fourteen new definitions2,095 bytes are internally disjoint; only full audit
  establishes global disjointness/acceptance. Confirmed31.811633%, expected
  32.003854% pending. No new source/tooling or release-tree mutation.
## Codex32 aggregate accepted — 2026-10-03

- Audit13323 terminal PASS/exit0 accepts14 complete source definitions /2,095
  disjoint instruction bytes. Confirmed348740/1089680=32.003891%; threshold
  348698 exceeded by42 bytes. Earlier expected32.003854% was transcription
  error, not the result of a different byte count.
- All30 cohort verifier pin sets and90 packet input sets independently rehashed
  current after completion, anchor SHA current. Final642 linked matches retain
  all635 preceding ones;1,284 full CPU outputs per new cohort pass.
- Clean source saved in1b6f344/246b910. Drafts, duplicates, tables and opaque
  dependencies excluded. Whole-DLL identity/GPU/release integration unfinished.
  This32% goal is achieved;35% needs32,648 further verified instruction bytes.
## Codex35 address/register continuation — 2026-10-03

- PINNED SDK90/194 SplitRegisters586 at10090e95 and SDK90/85
  MulSequence221 at10087a5d now have complete clean V2/V3/CPU proofs.
  Private MulSequence mangles AAE, not protected IAE. Selector281 distinct/
  301 physical source definitions;644 linked matches retain642. All1284
  complete CPU outputs agree, all three proof packet input sets current.
  Their807 bytes await aggregate8482; accepted348740 bytes unchanged.
- PINNED CArgument54 is firstRead,58 lastRead,5c readCount. Output compaction
  reads54. AddSequence caches an unsigned base at40 and double coefficient28.
  CanVectorize_TraceMulAdd ADD updates offset by scale*constant, not scale.
  Preserve unguarded original producer assumptions; these are prefix views,
  never full allocation layouts or fabricated historical type provenance.
- New drafts retain complete address/output folding and recursive bound and
  coefficient recovery. Fresh probes/attempts in codex35_address_registers;
  no credit for near sizes or plausible source. Existing allocation SIB and
  counter-scheduling retries produced no gain and were restored/rebuilt.
  Reuse their recorded dead ends instead of re-deriving them.
-35% goal remains active. Full audit log codex35_register_split/aggregate.log;
  one live audit only, clean source/proof inputs frozen. No release-tree write,
  opaque dependency credit, whole-DLL identity or GPU claim.
