# gfx track memory — engine facts (verified against the 1.0 binary)

## Anchor binary (authoritative over ALL references)
- `gfx_d3d_mp_x86_s.dll` 1.0: REF_API_VERSION **0x3B (59)** — opencod2's 0x3C adapter
  targets a sibling build; do not trust its numbering for this DLL.
- refimport: **169 slots** copied from engine's table into global @ 0x101d49c8.
- refexport: **108 slots** @ 0x1076A880; slots 86–95 zero; tail 96–107 = XModel surfs
  (97=R_LoadXModelSurfsSurface, 98=R_RegisterXModelSurfs) + GPU sync (103=SyncRenderThread..107=GpuWaited).
- Slot 20 = R_AddRefEntityToScene; 22/23 = engine-callback bridges (rimp[178]/rimp[177]);
  24 = noop; 26/27 = AddPolyToScene/AddLightToScene variants (API duplicates, real).
- Compiler: MSVC 7.1 13.10.3077, flags `/O2` (proven by 3 matches), CRT **static**,
  filealign 0x1000 (linker-level, matters only at full-binary link stage).
- Sole export GetRefAPI @ 0x10013270 (also the API decoder — table stores enumerate it).
- Imports: d3d9!Direct3DCreate9 only (rest GetProcAddress); DDRAW*2; no MSVCRT.

## Match harness gotchas (do not re-derive)
- COFF reloc entry = `<IIH>` 10 bytes (VA u32, symidx u32, type u16).
- COFF section header: PointerToRelocations at +24, NumberOfRelocations at +32.
- PE basereloc = data directory index **5** (dd+40) — index 1 is import.
- rel32 mask only when decoded target lands inside `.text` — else `e9` bytes inside
  opcodes (da e9 fucompp) cause false masks.
- MSVC float-equality codegen: compare against `0.0f` (pooled m32 const); `0.0` promotes
  to m64 double compare and mismatches.
- Ghidra 12: all `.java` files in one scriptPath dir compile as ONE OSGi bundle; one
  compile error = every script fails with "class could not be found". Isolate suspects.
- Ghidra 12: `StringDataInstance.getStringDataInstance(Data)` — pass the Data object.

## Naming source hierarchy
1. Binary itself (GetRefAPI table stores) — slot→function binding.
2. opencod2 `kReV60` (direction: kReV60[v59_slot] = retail_slot; inverse of kV60ToV59).
3. opencod2 `src/PC/gfx_d3d/` structure — file clustering reference only, NOT byte-parity.
4. `data/v60_api_tables.md` — full reconstructed slot tables (151/181 ri, 94/192 re named).

## Codegen rules (wave 1 lessons)
5. Renderer TUs are C++ (or at least use `bool`): `sete al` return tails require **bool local**
   (`eq = a == b; return eq;`) — direct `return a == b;` gives sub/neg/sbb/inc tail, even in .c.
6. The inline-ret0 + backward-jne branch layout comes from an **else-if chain**:
   `if (ne) return 0; else if (ne) return 0; else { eq = ...; return eq; }`.
7. Two pointers off one base: the **first-assigned** pointer gets `lea`, the other `add`.
8. Build: mixed .c/.cpp — cl infers language per extension; do NOT /TP everything (C files
   rely on implicit void* conversion).

## CRT strategy (confirmed 2026-08-22)
9. CRT region (>= ~0x100F0000 + scattered 0x1006-0x100C cluster) is **statically linked
   libcmt.lib** from this exact toolkit — proven: 0x10102ec3 = 100% libcmt!87disp.obj
   `__rtchsifneg`. Low match rates elsewhere = Ghidra boundary mis-splits (no symbols in PE),
   NOT different CRT. **Do not hand-reconstruct CRT** — link libcmt.lib at final assembly
   exactly as the original build did.
10. ROUND epsilons in gfx: consts are *added* doubles 2^-30 (9.3132257461547852e-10) and
    0.5-2^-30 (0.49999999906867743); PE spills const via fld/fstp to local then fadd, and
    inlines fistp → **/QIfist suspected project flag** (unproven; plain /O2 tail-jmps __ftol).

## Register conventions (session-2 findings)
11. esi/edi/eax custom register-passing (R_AddPlume, R_AddLightToScene families) is MSVC
    interprocedural regalloc for STATIC functions — NOT reproducible in mini-TUs (helper
    gets inlined; /GL+/LTCG+noinline attempt did not produce it either). DEFER until the
    full original TU is reconstructed (real TUs have dozens of functions; inlining context
    differs). Structure sources as TU-shaped files from the start.
12. RI-table calls in code = `ff 15 [slot_addr]` = extern fn-ptr global in source (matched:
    FUN_10012f40).
13. Repeated Win32 imports cached in a register (`mov esi, [__imp__X]`) require
    `__declspec(dllimport)` on the extern declaration (FUN_100227e1 partial).

## IPRA wrapper clusters (wave24 lesson, concrete)
14. Forwarder "wrappers" that look like `push esi; mov esi,[esp+8]; call f; pop esi; ret`
    are NOT plain forwarders: their callees are IPRA statics reading args straight
    from registers (verified: FUN_10023d40 reads esi; FUN_1001ffc0 reads eax+stack;
    FUN_10005820 reads [esi+0xc]). A wrapper can only be honestly matched in the
    SAME TU as its static callee (declared `static`) so MSVC reproduces the reg
    allocation. Process clusters atomically: {10020cd0→10023d40→1001ffc0},
    {10020ce0→10023d70}, {10005970→10005820}, R_BeginCubemapShot→1003ea30(eax).
    Ghidra marks these as in_EAX/in_ECX/unaff_ESI in data/decomp/*.c.

## Redemption wave findings (2026-08-24)
15. Many small "simple" functions in the D3D-command/debug bands are IPRA
    consumers even when Ghidra shows plain calls: FUN_10045ce0's callee
    FUN_10044e40 also reads ESI; R_ShutdownDebug's single real callee
    (0x10032490) takes arg in ECX + table ptr in EAX (Ghidra split one callee
    into two names). Standalone honest C cannot match these — they need their
    owning TU reconstructed (statics declared static, MSVC /O2 reproduces the
    custom conventions). This wall is why waves 10-23 went asm-transplant.
16. Per-TU flag variance is real: some TUs are /Oy- (55 8B EC prologues,
    e.g. 0x10062f0c) — tools/redeem_batch.py derives /Oy-, /Gz variants from
    the target prologue/epilogue automatically.

## TU reconstruction mechanics (wave25)
17. MSVC 7.1 /O2 reproduces ESI-arg IPRA between statics ONLY when the callee
    DEFINITION precedes the caller in the file and neither is volatile-touched:
    {structs → static def → public wrapper} = wrapper PASS on first try
    (FUN_10045ce0). Prototype+wrapper+later-def or volatile fields break the
    shape (bl-holding, push/pop edi noise).
18. R_EmitCmd (0x10044e40) body idioms still to reproduce: PE does
    edx=[eax](cur), ecx=[eax+4](free), inc edx/dec ecx, store both, jne on
    free-count; late `mov dl,[esp+4]` arg load; tail `mov [esp+4],esi;
    jmp [ecx]` (vtab[0] with ctx re-pushed over arg slot). Current best 17%.
19. R_EmitCmd progress (wave26): faithful semantics recovered — CmdBuf is
    {cur@0, free@4, flush_fn@0xc}; overflow flag is *(int*)(vtab+0x14)=0x18
    on failed flush; block1 fail-path also calls vtab[0](ctx); body ends in a
    TAIL-JMP dispatch vtab[0] reusing the incoming arg slot. Body now 70%
    (was 17%). Sole remaining early diff: MSVC picks ECX for the first cur
    load (PE) vs our EDX, and inc-form `42` needs a fresh second load of cur.
    Best-known source shape kept in src/f/10045ce0_FUN_10045ce0.c.
20. Region tag "iw" in manifest.tsv is unreliable for 0x1006xxxx-0x100Cxxxx
    unaligned addresses: they are statically-linked CRT pieces (dword-fill,
    128-bit compare loops, ROUND/fistp family). crt_sweep3 scan now covers ALL
    non-thunk rows; expect certifications to land there at join time.
21. FUN_10009700-style "simple loops" hide IPRA too: EBX arrives from caller
    (`mov eax,ebx` before first call). Standalone C cannot match.
22. Emitter family TU v2 (wave28): R_EmitWord (0x10044eb0, value arg arrives
    in EBX from FUN_10045320's two-call sequence) first-shot 69% honest C;
    R_EmitCmd holds 75%; FUN_10045ce0 stays 100%. FUN_10045320 prologue needs
    ctx arriving in EAX from its dispatch-table caller — cannot fix standalone.
    Systematic residual: MSVC picks ECX where our source yields EDX for first
    derived temp; /Os makes everything worse (pop-ecx epilogues). Parked.
23. Near-miss pipeline (wave30): tools/rank_nearmiss.py ranks draft objs by
    byte-similarity vs same-length PE functions. First crop:
    - R_BeginDebugFrame 92%: needs arg-PUSH hoisted above two zero-stores
      (MSVC schedules push early); byte-global fix already applied
      (extern uchar DAT -> mov al,[g]).
    - R_BlendSavedScreen/R_ClearScreen 81%: lea SIB order [edx+eax] vs our
      [eax+edx] — operand-swap in source text does NOT change encoding;
      need different base/index structure (cursor advances 0x1c/0x14).
    - NOTE: /tmp is per-command in this env; keep all artifacts under workspace.
24. Cached-local rewrite FIXES the SIB-order class: R_ClearScreen went
    76->77% with tail matched past the lea (was stuck at +35) purely by using
    one cached base local instead of repeated global reads + `off += N`
    compound updates. Remaining ClearScreen gap: PE pipelines four param
    loads/stores eax/edx ping-pong; source-level trigger unknown.
    R_BlendSavedScreen: same rewrite put base in ECX not EAX (obj 119B vs
    pe 118B) - allocator history still rules; reverted to baseline draft.
25. Auto-uchar-decl heuristic in draft_tiny was NET NEGATIVE (compile yield
    676->324); reverted. Byte-width fixes stay a manual near-miss step.
26. Cached-global transform (wave32): draft_tiny now auto-rewrites repeated
    DAT_ reads to one cached local (engine_facts #24 pattern, mechanized).
    Validated: reproduces the manual ClearScreen fix exactly. Ghidra body
    indent is SPACES not tabs (regex lesson).
27. Matcher asymmetry class: MSVC7 emits ZEROED rel32 + COFF reloc even for
    same-section self-calls; obj-side masking zeroes them while PE-side
    pe_mask_for keeps intra-range targets -> 4-byte phantom diffs.
    FUN_10015740 recursion = 97% victim. Real fix needs full symtab parse
    (parse_coff truncates aux chains; relocs reference syms 11-14 unparsed)
    or /hotpatch-style entry math (PE targets self+1 without pad - unexplained).
28. join_band.py splits hit files per band (draft_hits_<lo>_<hi>.tsv) -
    single shared hits file was being overwritten by sequential band runs.
29. Dual-variant join (wave33): index each obj symbol under BOTH
    (A) same-section rel32 resolved to final disp, unmasked and
    (B) all in-symbol reloc sites masked;
    match PE under standard and MASK_INTRA=1 normalization. Unlocked
    FUN_10015740 (recursive, PE self-call) and FUN_100046e0.
30. CRITICAL mask bug class: relocs span 4 bytes - om.add(q-v) once caused
    11->3 hit regression; always add q-v+k for k in range(4).
31. Draft compile-failure survey now reports ZERO errors across src/draft:
    self-extern fix + regeneration cured the mass failures. Remaining
    non-hits are purely semantic mismatches.
32. Ghidra polarity idioms (wave33b): `if (-1 < X + -1)` == in-place dec +
    >=0 test (dec/js when var reused); `-1 < X` == plain >= 0. Pool-wide
    rewrite applied to 39 drafts (tools/recompile_changed.sh rebuilds a_/c_
    variants). FUN_10042ae0 68->85% via this + stmt reorder; remaining gap =
    scheduler interleave (inc/push/store order).
33. Bands 151-300 (193 cands) & 301-512 (87): drafted, compiled, dual-join
    = ZERO hits. Naive decomp drafting floor is ~150B; beyond that needs
    hand-semantics. Next big lever = IPRA TU-cluster reconstruction.
34. IPRA landscape quantified (wave35): tools/find_ipra.py (capstone,
    defined-tracking fixed) finds 1,215 true register-arg consumers
    (635 unmatched todo + 580 transplant-held). tools/find_clusters.py
    builds reverse-E8 callgraph -> 328 single-root clusters ranked by size.
35. Cluster #1 scope: R_AddLightToScene(12B)->10023d40(47B)->1001ffc0(484B).
    10023d40: idx=((h-g_10678510)*MAGIC>>32+h)>>6 (div 52, M=0x8d3dcb09,
    'add edx,ecx' variant)*0x34+0x10678ac4; tail push idx; mov eax,h;
    call 1ffc0 (mixed EAX+stack arg). Honesty requires ALL THREE in one TU
    so MSVC IPRA assigns ESI/EAX consistently; extern break = byte mismatch.
    Magic-div C form documented for reuse.
36. Scanner lesson: capstone src-reg checks must consult defined-set AFTER
    writes tracked; section symbols (.text) appear in exec-sym lists.
37. Cluster#1 iteration results (wave36): R_AddLightToScene+10023d40 TU
    reaches 75% wrapper / correct-length Sub. BLOCKER proven: wrapper's
    push-esi exists because SUB->1ffc0 transitively clobbers esi; without
    1001ffc0's body in the TU, cl never saves esi -> byte mismatch.
    => 1ffc0 (484B DObj-prep w/ InterlockedCompareExchange) is the GATE
    function for the whole AddLight/AddPoly family; reconstruct it FIRST
    next round, then wrappers fall out.
38. Magic-div lesson: PE 'mov eax,MAGIC; imul reg; add edx,reg; sar N;
    shr 31; add' is just MSVC signed division by constant - write plain
    `(a-b)/52` in C. Do NOT hand-roll __int64 forms (cdq junk).
39. find_ipra false positives fixed via defined-set; always regenerate
    ipra_consumers.tsv BEFORE find_clusters.py (stale tsv caused confusion).
40. GATE FUNCTION LANDED IN-TU (wave37): src/tu/addlight.c holds full
    honest C for Sub_1001ffc0 (484B DObj-prep: interlocked lock state
    machine at handle+0xc, ri-callback fn-ptr vars P_101xxxxx, magic-div
    /52 pool indexing) plus both wrappers & middles. FIRST RESULT:
    R_AddPolyToScene 100% (tu_diff) purely from TU presence.
    Remaining gaps: frame 0x36c vs 0x360 (my stk sizing), ESI/EDI param
    picks on wrappers/middles. Next: fix local layout to shrink frame,
    then per-function reg nudges.
41. TU policy: functions verified 100% via tools/tu_diff.py inside an
    honest multi-static TU are certified; ledger rows cite the TU file
    and say so explicitly (no fake standalone claims).
42. Register-pick RULE discovered (wave38): a static's param gets a
    CALLEE-SAVED reg (esi/edi) iff it is USED AFTER an internal call
    (live across call). Wrapper then emits push-reg/mov [esp+x]/call/pop.
    R_AddPolyToScene certified this way; R_AddLightToScene lacks any
    post-call use of handle -> cl picks ecx -> cannot match standalone.
    PE's esi there implies ORIGINAL source re-used handle after the call
    (or passed through another static). Look for a third sibling or an
    assert when revisiting.
43. Gate frame mapping TODO: PE locals - 0x10 edi-spill, 0x14 count,
    0x18 cursor, 0x1c..0x30 pose constants (48000000 x3 then c8000000 x4),
    0x34 partbits (test [esp+ecx*4+0x34]), 0x44 d9f0-arg1, 0x170 bd4-dest.
    Rewrite gate locals to these EXACT esp offsets to shrink 0x36c->0x360.
44. Gate frame solver state (wave39): sub=frm_size+0x4c currently
    (frm 0x320 -> sub 0x36c; PE target 0x360 => try frm 0x314). After any
    resize, re-derive macro base: PE [esp+X] == frm[X-base] where base=
    (sub_target - frm_size) ... verify by reading FIRST lea offsets in obj.
    Also confirmed missing-path fixes landed in source but obj symbol
    EXTENT stayed 424 (tu_diff extent = to next symbol; insensitive).
    Real progress metric for gate = first-divergence offset, now past the
    prologue once frame matches. NEXT: binary-search frm size over 3-4
    compiles until 'sub esp' == 0x360, then re-map macros, THEN iterate
    body (spin loop shape, pose consts, surface walk spills).
45. tu_diff caveat: obj-side symbol extent can hide growth; always diff
    hex heads, not just pct.
46. Frame solver SOLVED (wave40): sub_esp == frm_size + 8 for the gate TU
    (verified 0x30c..0x320). Current best frm=0x358 -> sub 0x35c (target
    0x360; overhead varies 4..8 with body changes - re-probe after any
    body edit using tools/frame_probe pattern: sed size -> docker cl ->
    capstone first-insn).
47. Gate iteration status: obj 504B vs pe 484B; prologue now push
    ebx/ebp/edi + handle in EDI (cl reallocated when frame changed).
    Next levers: (a) pin overhead=8 by keeping frm=0x358 and trimming one
    temp (e.g. drop w-cursor var), (b) then map first-divergence forward.
    Expect several sessions; wrappers inherit once gate clobbers match.
48. Candidate cluster B mapped (wave41): d450(42B,EAX-in,table-called)
    -> c910(87B,ESI consumer; char-state test w/ movzx+jl/jle/je;
    pool counters 101d0a74/78; vtable dtor [edx+8]) 
    -> fa40(240B,EBX consumer; model-checker: snprintf-ish via 10060c10
    which takes dst=EDI,size=ESI (MORE reg-args), validation chain
    d4afc/d4b00/f2a0/f900 each w/ msg branches; success ret 1).
49. Depth discipline: BEFORE investing fit cycles, walk callee closure and
    confirm every internal call target is either (a) included in TU,
    (b) provably stack-arg cdecl at call site, or (c) tiny enough to add.
    Cluster B blocked on 10060c10 (~size TBD) same as cluster A on 1ffc0.
50. Cluster B TU skeleton at src/tu/clustb.c (c910 faithful, 60c10
    faithful incl _vsnprintf+force-NUL, FA40 stubbed pending faithful
    transcription from build/fa40.asm). Rule reaffirmed: NEVER draft
    bodies from recollection mid-round - always side-by-side with the
    disasm file. Baseline diffing starts next round.
51. Cluster B baselines (wave43): F60c10 100% CERTIFIED (26/26) - tiny
    _vsnprintf+NUL wrapper; needed manual varargs (typedef char* va +
    (char*)&fmt+4; container lacks stdarg env), int RETURN (caller tests
    count), and a public root stub D450 to defeat dead-code elim of
    statics (obj was 390B empty until glue added).
52. C910 at 66%: movzx matches after unsigned-char load; remaining quirk:
    PE does test eax,eax+jl AFTER zero-extend (32-bit uncertainty),
    cl keeps folding to test al,al even via separate int local. Likely
    original flowed the byte through an opaque call or used volatile.
    FA40 at 7%: frame 0x60 vs 0x44 (drop invented loc[] buffer, use
    window slots), d4afc arg shapes to fix from disasm.
53. STALE-OBJ TRAP (wave44, cost several rounds): iterating clustb.c with
    compile errors hidden by >/dev/null left cb.obj OLD - all frame/reg
    observations during that window were artifacts. RULE: in fit loops
    NEVER suppress stderr; after each cl run check obj size/mtime moved.
54. FA40 true state: 14%, obj 180 vs pe 240. Fixed this round: 4th push
    0x1019395c restored (fmt=95c, args 964,[ebx+20],96c; dst=W+4 fits
    0x44 exactly); P_101d4afc is 2-arg (void*,void*). Missing ~60B =
    Sub_1000f900(edx=h+0x1c,eax=mdl) usercall region + tail shapes.
    mdl-in-EBX convention emerged on its own in TU ✓ matches PE.
55. Next FA40 levers: transcribe tail faithfully incl f900 extern shim,
    then n= test chain shape (test/jge/jne flag reuse), C910 al-vs-eax
    test remains open (try opaque helper for the byte).
56. FA40 v3 (wave45): 17%, obj 210/240. Aligned-diff method (difflib on
    instruction mnemonics) = the efficient fit tool - one dump lists every
    delta. Fixed: d4afc args are (w+4, w); printer Sub_10061c80 takes
    (msg, buf) 2 args everywhere incl f2a0's 4-arg variant at 0x10193974
    (fmt,aux,hdr[3],5); success/fail paths free WORKSPACE handle *(int*)w
    via d4b00, NOT mdl; f2a0(h, w+4) receives header ptr + aux slot.
57. IPRA ordering rule CONFIRMED again: extern decl of a TU-defined static
    blocks registerization - definition must precede call site and no
    conflicting prototype may exist. f2a0 relocated above FA40 for this.
58. Remaining FA40 deltas: f900(edx=h+0x1c,eax=mdl) usercall ~60B region
    (needs honest f900 body in-TU eventually, 261B transcription),
    snprintf-ret test placement, flag-reuse chain shape.
59. f2a0 fit log (wave46): 29%->56% via goto-shaped version check
    (PE: cmp al,5; je fwd over print block to 'mov al,1' tail).
    Remaining 3 bytes = missing 'movzx eax,al' before pushes. cl folds
    every honest C form tried (uint param, v3 local, pre-read local made
    it WORSE: reordered whole fn). Best-known form saved; revisit with
    idea: make the PRINTER extern param type force widening at a point
    where cl can't prove value width (e.g. pass through noinline shim?).
    tu_diff symbol naming: use exact obj name minus leading '_'
    (Sub_1000f2a0, not F2A0) - silent skips otherwise.
60. f2a0 movzx SOLVED honestly (wave47): declare the printer VARIADIC
    (const char*, ...) - default argument promotions force uchar->int
    widening => movzx eax,al emitted, byte-exact. Watch flavor: char*
    header gives movsx; use unsigned char* param for movzx.
    f2a0 now 55%, obj len == pe len (67B); SOLE remaining delta =
    branch polarity on version check: cl always emits 'jne +3; ret1'
    early-return form; PE has 'je +17' forward-over-print. Tried goto,
    if/else, noreturn ideas - MSVC7 keeps inverting. Candidate future
    lever: caller-side context or restructured success path.
61. Variadic-promotion trick is GENERAL: any place PE shows movzx before
    a call whose C-level arg is a narrow type - make the callee variadic
    (real-world printers/loggers ARE variadic, so this stays honest).
62. FA40 BREAKTHROUGH (wave48): 17%->67% from TWO mechanical fixes:
    (a) capture F60c10 return & test n<0 BEFORE d4afc (PE prints buf w+4
    with msg 0x10193938); (b) ALL printer calls pass workspace buffer
    w+4 (edi), not w. Body now matches PE insn-for-insn except the
    f900 tail: PE 'mov edx,esi(h+1c); mov eax,ebx(mdl); call' vs my
    stack-push extern call (~10B). obj 243 vs pe 240.
63. FA40 completion requires Sub_1000f900 (261B) transcribed into TU so
    IPRA assigns EDX/EAX naturally - it is ALSO a certification target
    (+1). No standard MSVC calling convention passes EAX as first reg
    arg; only interprocedural allocation reproduces it.
64. Also observed: my esi handling 'mov esi,eax;...add esi,0x1c' vs PE
    'lea/mov esi,[eax+0x1c]' earlier - may auto-resolve once f900 lands
    and pressure changes.
65. Sub_1000f900 = DDS-format dispatcher, v1 honest C at 39% FIRST TRY
    (obj 288 vs pe 261). Jump table read from binary: 13 cases byte=1..13
    -> f5a0(a,b,tag,n) x5 / f380 mixed-reg cases / DXT1|3|5 fourcc
    f7b0 cases; default falls to epilogue. Callees f5a0(527B) f380(537B)
    f7b0(331B) are NON-consumers => extern-safe closure.
66. Reg-assignment note: PE stores [eax+4]=0 with c in EAX; cl insists
    on EDX for that param regardless of declaration order (tried swap).
    f900 needs (ecx=a,edx=b,eax=c); cl gives ecx=a,edx=c. FA40 call site
    now 60% (was 67 pre-f900-inclusion - slight shuffle cost, will
    recover when reg picks settle).
67. Cluster B scoreboard (wave50): F60c10 100% CERT | C910 66% |
    f2a0 55% len-exact | FA40 61% | f900 39%. f900 reg-map: cl gives
    (ecx=a, edx=c, eax=b); PE wants (ecx=a, edx=b, eax=c). Hoisting the
    type-read BEFORE store made cl keep source order -> 34%, reverted.
    Store-first is required; EAX-vs-EDX for 3rd param unsolved. Note:
    cl DID emit 3-reg IPRA form at FA40 call site (mov ecx/edx/eax) -
    convention emerges, just wrong slot for one arg.
68. tu_diff arg order: addr=name pairs; non-hex tokens must come AFTER
    all addr= pairs (parser tries int(addr,16) on every positional).
69. Failed experiments logged (wave51): bit-trick sign test (~t|0x80000000)
    wrecked C910 to 14% (full revert done, back at 66%). Pointer-typed
    f900 params scaled offsets (int* c => c+4 became +16) - keep int
    params with explicit casts. f2a0 polarity: noreturn idea dead (PE
    print block RETURNS inline: xor al,al/ret inside).
70. Standing wall trio, all precisely characterized: C910 test-width,
    f2a0 branch polarity, f900 EDX/EAX slot. Each needs a NEW honest-C
    idea class, not retries. Candidates: caller-pressure coupling via
    TU growth (f380 transcription may shift everything), /O1 mixed
    per-function #pragma optimize? (MSVC7 supports optimize("g",off)?),
    or accepting partial and moving to next cluster for count velocity.
71. Second-root experiment (wave52): F171f0(81B scene-compare) added to
    TU - C910 UNCHANGED at 66% (call-site count did not shift its reg
    pick). F171f0 itself 18% baseline (pe leads with eax loads; mine
    pushed ebx). fc30 confirmed non-consumer (extern-safe).
72. Honest-C idea classes tried & exhausted for wall trio so far:
    bit-tricks, pointer types, param order, hoisting, noreturn, if/else,
    goto, variadic(won movzx!), volatiles pending. Remaining candidates:
    #pragma optimize per-fn, TU-level /O1 flip for ONE fn via separate
    obj+link?? (breaks single-TU IPRA), f380 transcription pressure.
73. C910 SEMANTICS BUG FIXED (wave53): pe 'jl +0x0a' jumps INTO subtract
    block - negatives SUBTRACT, only {0,1,4} skip. My guard had them
    skipping. Condition 'sc<0 || (t>1&&t!=4)' -> 67%, displacement now
    matches (7c 0a). SOLE remaining: 84 c0(test al,al) vs 85 c0(test
    eax,eax) - one opcode byte, width-only. Lesson: re-read jump TARGETS
    when decoding semantics, not just mnemonics.
74. F171f0 sprint (wave54): 18%->51% via UNCACHED global reads (pe
    re-reads [101d1b30]/[101d1b2c] per use - no locals); ->61% via
    swapped comparison operand order (b2c left, b30 right => eax/ecx
    assignment matches). Remaining ~20B: displacement diffs in 3rd
    compare + tail selects; obj 77 vs 81.
75. C910 final byte verdict: /Ox probe identical (test al,al) - genuine
    optimizer-build artifact, accepted as near-miss unless a new idea
    class appears. Certified-adjacent at 67%.
76. F171f0 tail decoded (wave55): PE caches BOTH globals from insn#1
    (eax=a, ecx=b); equal-path 'returns' stale eax=b - i.e., source was
    r=b default + override. Cached+swapped+r-default = 61% same score,
    cleaner semantics. Missing 4B: push esi/pop esi pair around calls -
    pe treats esi as clobbered although C910/fc30 don't read-write it
    visibly; suggests original had another esi-held local (address-taken
    or extra use). Try: cache g_101d1b98 in a local used AFTER calls.
77. esi-save experiment negative (wave56): caching p=g_101d1b98 in local
    used across calls did NOT force push esi. ABI reasoning says no save
    is needed (callee preserves esi); PE's push esi likely tied to
    original-source pressure we can't see. F171f0 plateau 61% honest.
    Full scoreboard: 100/67/55/39/60/61.
78. f900 pointer-typed store param: same EDX result (39%). New theory
    recorded: pe's pushed-EAX in f380 cases is likely MDL(c), meaning c
    HAS late uses - so last-use-order theory predicts EAX correctly but
    cl still disagrees; possibly needs exact source statement ORDER of
    those uses. Parked until f380 transcription (would also fix case
    bodies from inside).
79. FUN_10042ae0 near-miss re-verified at 85% (83/97, length-exact) with
    ORIGINAL ghidra-shaped draft. Blind up-count restructure -> 17%,
    reverted. pe uses UP-counter w/ stored limit + push-ecx align +
    IPRA-ish entry - real fix needs faithful transcription from
    build/42ae0.asm side-by-side (41 insns), not heuristic edits.
    Saved disasm for that session. RULE: never heuristic-edit a >80%
    artifact; transcribe from disasm instead.
80. 42ae0 v3 faithful transcription (wave59): semantics CORRECTED - pe
    does NOT advance p2 (Ghidra param_2++ wrong); lim=dec/inc roundtrip;
    stride spilled & re-read in inner loop. BUT scheduled to 65% vs old
    draft's 85%. Old draft restored as canonical. Both artifacts kept:
    nm1.c(85%, scheduling-lucky) vs analysis in this log. Path to 100%
    for such fns: find source phrasing that yields BOTH correct
    semantics AND pe's reg/schedule choices (e.g., explicit locals
    mimicking spill slots).
81. 42ae0 house-of-cards confirmed (wave60): removing ONLY param_2++
    collapsed obj to 79B/4% - the ++ is load-bearing for scheduling even
    though semantically wrong. => 85% artifact is a fragile local
    optimum; 100% needs exact source phrasing discovery, not edits.
    Parked at 85% honestly. Broader lesson recorded: near-miss % can
    encode compensating wrongness; verify semantics separately from
    bytes (v3 analysis stands as ground truth).
82. Velocity audit (wave62): all 14 dual-variant join hits already
    ledger-promoted (wave33 complete - nothing unbanked). Tiny-unmatched
    scan: 88 fns <=56B remain but sampled ones are convention thunks
    (edx-arg tailjmp, thiscall forwarders w/ hot-patch nops) - mostly
    NOT expressible in honest standalone C; some possible via __fastcall
    forms. Cluster B remains the deepest cert vein (f380 transcription
    unlocks f900+FA40).
83. f380 v1 scaffold written (wave63) as src/tu/f380.c - semantics
    approximated (mip shrink loop, per-level bw/bh sign handling,
    format-tag upload paths ec00/ea20, alloc/free via d49d8/d49f8).
    Integration into clustb.c MANGLED file structure (externs sliced
    off; insertion point confusion) -> reverted to last-good commit.
    NEXT session: strict side-by-side transcription directly INTO
    clustb.c with extern block included; verify no regression on
    certified symbols after every compile (stale-obj rule applies).
84. STALE-OBJ STRIKE TWO (wave64, CRITICAL): orphan code from wave55 sat
    at EOF making every compile from wave56-wave63 FAIL SILENTLY behind
    grep filters - scoreboards for F171f0(61%), f900(39%) were read from
    a pre-wave55 obj. Fresh-ground-truth rebuild reveals TRUE state:
    F60c10 100% | C910 67% | f2a0 55% | F171f0 61%(restored) |
    FA40 60% | f900 9%(real regression, cause not yet isolated -
    bisect against wave49 tree next session).
85. NEW HARD RULE: after EVERY source edit run 'rm obj && cl && tu_diff'
    as ONE step with errors VISIBLE, and treat any unexpected % as
    stale-obj until proven fresh (check obj mtime vs edit time).
    Consider a makefile-style build script to enforce this.
86. WHOLE-TU CODEGEN LAW PROVEN (wave65): adding f380 scaffold AFTER
    Sub_1000f900's definition flipped f900 39%->9%; removing it restored.
    MSVC7 codegen for a function depends on ENTIRE TU contents (later
    functions included). Consequences: (a) never mix WIP scaffolds into
    a tuned TU - separate .c files per family until each is high-%;
    (b) any 'identical text' assumption across different TU layouts is
    void; (c) explains historical mystery regressions. f900 bisect also
    proved its 39%-form = signature (int a, int c, int b) verbatim.
87. BEST STABLE STATE (wave70): F60c10 100% | C910 67 | f2a0 55 |
    f900 39 | FA40 61 | F171f0 61 - all fresh-verified twice via
    rebuild_cb.sh; this IS the committed clustb.c state. Earlier
    '9%'/'tradeoff' reads were script/pipe measurement flakiness.
88. __security_check_cookie near-miss (wave72): honest C form written
    (src/tu/secchk.c), semantics exact, first 5 bytes match
    (3b0d+cookie); cl canonicalizes ALL phrasings (if=/goto/early-ret)
    to 'je +5' inverted shape vs pe's 'jne +1; ret; jmp fail'. The pe
    form comes from the compiler's SPECIAL-CASED /GS emission, not
    normal C flow. Documented; not certifiable honestly.
89. Thunk taxonomy from unmatched scan: e9-rel32 = incremental-link
    thunks (atol/free); ff25 = import thunks (RtlUnwind); both are
    linker-generated, no honest C body exists. Only REAL code like
    security_check_cookie is worth attempting.
90. CORRECTION OF WAVE73 CLAIM: clean aligned-diff proves pe uses
    'lea esi,[eax+0x1c]' = ADDRESS semantics (original code was right);
    the 68% reading came from a semantically-WRONG 2-arg call that
    accidentally shifted regalloc - house-of-cards, rejected.
    REAL wins kept (wave74): FA40 returns unsigned char => al-width
    writes (xor al/mov al) matching pe: 61%->63%, obj len 242 vs pe 240.
    Lesson: verify operand width AND semantics from ONE clean difflib
    pass, never from stale partial windows.
91. FA40 wall census complete (wave76): success-as-goto-target phrasing
    also negative (61%). Plateau 63% = uchar returns win only; residual
    ~85B = f900 ECX-preset + pe's lea-in-branch-shadow scheduling +
    jne-rel32-vs-rel8 displacement widths. Every C phrasing class for
    these has now been tried once; further progress needs a different
    lever entirely (e.g., whole-TU rebase or /Ox probe).
92. IMPORT-THUNK SHIM CLASS (wave77, FINAL ROUND WIN): PE 'ff 25 <slot>'
    import thunks are honestly expressible as C - extern slot fn +
    static void(*const p)(void)=slot; fn calls p => cl emits identical
    ff25 (reloc-normalized MATCH). Certified 4: RtlUnwind 1010a722,
    Direct3DCreate9 1006221a, DirectDrawEnumerateExA 100f5c2e,
    DirectDrawCreateEx 100f5c34. NOTE: e9-rel32 thunks are the
    incremental-link layer, NOT expressible this way. Sweep ALL
    remaining unmatched fns for b'\xff\x25' prefix next session.
93. CRT-ASM SWEEP INFRA (wave78): ml.exe works via
    'wine /opt/msvc710/Vc7/bin/ml.exe /c /coff /Cp -I crt71' BUT:
    (a) /Fo paths with dirs get mangled by wine - write flat then move;
    (b) crt71 .asm files use CODESEG but inc defines codeseg -> sed fix;
    (c) need '.686' after 'include cruntime.inc'. 7/39 assemble so far
    (inp,outp,memccpy,memset,strncat,strncpy,strcpy?) -> build/
    objs_crtasm/. Normalized join vs crt-todo: 0 exact (PE CRT built
    w/ different ml opts/version). Remaining 32 files need deeper
    macro-compat (PROLOGUE/EEND etc). Join script pattern in this
    fact's session log; reuse coff_function_bytes+pe_mask_for.
94. MISSING pool (wave79): 11 never-attempted real functions. 1001d900
    CERTIFIED (14B): 'return g!=0;' gives exactly xor eax,eax;test cl;
    setne al;ret. 10017020 near-miss: pe je+3-over-inline-fail +
    backward-jne-to-shared-fail NOT reproducible under /O2 for any of
    5 phrasings (goto-shared-tail, &&-chain, nested-if...) - cl
    canonicalizes to jne-first. Same polarity-wall family as f2a0;
    likely needs /Os or different flag context. Try /Ox /Os probes.
95. wave80: FUN_10013200 CERTIFIED (79B, first-shot!) - table-index sync
    with lazy material init. Direct extern-array indexing reproduces
    [eax*4+tbl] addressing exactly. 10001230 near-miss (60/69): pe's
    'add eax,0x13c' + [eax+4]/[eax+8] walk not reproducible - cl folds
    to displacement form under O1 AND O2 across 4 phrasings. pe shape
    = scheduling artifact of original source structure unknown.
    MISSING pool: 2/11 done-or-near, 9 remain.
96. wave81: VB-upload twins (10005980/100059e0,93B) near-miss at prologue
    - semantics+rep-movs reproduced via REAL __movsd/__movsb intrinsics
    (honest!), but cl assigns regs differently (ebp-frame vs pe ebx/esi
    interleave). Signature fix found: src is FIRST arg (pe [esp+c] after
    2 pushes = orig+4). Remaining delta = pure reg-assignment cascade.
    Ideas for next session: reorder decls/uses to coax ebx-early, or
    /O1 probe. MISSING pool progress: 154 total honest.
97. wave82: FUN_10012f40 CERTIFIED (51B, 94%->100 after arg swap).
    Import-call shim pattern: cdecl ptr-fn extern + stack buffer +
    address-constant args all reproduce exactly. Arg order lesson:
    derive from PUSH ORDER (last push=first arg), not decompiler order.
    MISSING pool: 3 certified, 2 near-miss, 6 open.
98. wave83: R_GetFarPlaneDist CERTIFIED (82B). FPU idioms decoded:
    - float== chain via fucompp+fnstsw+test ah,0x44/jp
    - CLAMP 'if (v<min) v=min;' emits test ah,5/jp +8 EXACTLY;
      >= / !(<) / early-return variants give test1 or inverted jnp.
    Lesson: for FPU tails try the PLAIN '<'-assignment form first.
99. MISSING pool status: 4 certified(1d900,13200,12f40,aa60),
    3 near-miss characterized (17020,01230,VB-twins), 4 open.
100. TINY-BATCH RECIPE (wave85, +3 certs): (a) const-return 'return 1;'
    needs /O1 for xor-eax/inc-eax idiom (/O2 gives mov eax,1). (b)
    THISCALL in C: compile TU with /Gr, declare void* __fastcall
    f(void *this_) -> this lands in ECX; symbol decorates @f@4.
    (c) vtable stores MUST go through declared address symbols cast to
    int - plain int literals emit NO reloc => unmasked false-diff.
    (d) derived-ctor keeps ECX across base call only in same TU (IPRA).
101. coff_function_bytes mask covers whole-section relocs; CLI diff with
    decorated name works when relocs exist for that function's stores.
102. Remaining tiny pool: ~240 fns <=90B. Next patterns to try: stosd
    zeroing (needs rep-less form - unresolved), __secchk cookie(88),
    float-return getters.
103. wave86 (+1=160): Dtor pattern (push [ecx+c]/vtbl/call free/pop
    ecx/ret) reproduced with /O1 /Gr - 'pop ecx' is O1's cheap
    stdcall-cleanup when value unneeded.
104. thiscall-with-stack-arg twins (10086d08/d4e): real C++ member fn
    (.cpp) gives correct ECX+stack semantics; pe prologue 'mov edi,edi;
    push ebp/mov ebp,esp' needs /hotpatch (VC7.1 cl IGNORES it silently)
    + frame; /Oy- gives frame but not edi,edi and reschedules args.
    These are hotpatch-built originals => park unless flag found.
105. fld tbyte (1010addc) impossible in C (VC long double==double);
    rep-less stosd triplet (101061c8) not emitted by any C phrasing -
    both original-asm, documented skip.
106. wave87 (+2=162): passthrough-forwarder pattern - wrapper adding a
    trailing tag arg; /O1 emits pe's ff 74 24 0c memory-direct pushes
    (/O2 hops through regs). Push-order derivation: after N pushes,
    [esp+K] maps to orig [esp+K-4N].
107. 1003e250 float-table setter: writable but tail-jmp + fchs order
    needs probe; parked with full dump noted.
108. wave88: TAIL-JMP WRAPPER RULE - wrappers ending 'jmp internal_target'
    certify ONLY after target is reconstructed at exact byte-size in the
    same TU placed PE-adjacently (displacement is real bytes, not reloc).
    Parked: 1006518e (21/23, semantics+fastcall-tail PERFECT via
    __fastcall decl), 1003e250 (24/28 same issue). These are SECOND-WAVE
    unlocks once targets land. Also: usercall(edx,arg) helpers
    (push n; mov edx,ecx; call) undeclarable in C - family parked.
109. wave89 (+4=164): (a) xor-ecx/mov zero-store idiom needs a VARIABLE
    zero ('z=0; p->f=z;') not constants. (b) ff15 import calls need
    __declspec(dllimport) decl. (c) [reg*8+tbl] push: express table as
    char[] with manual idx*8. (d) (b+b*8)*4 source shape yields pe's
    double-lea. (e) /Oy- for ebp-frame twins.
110. wave90 (+1): wide-ctor store permutation = SOURCE ORDER verbatim;
    transcribe stores in pe's emitted order, not ascending offsets.
111. COUNT CORRECTION: honest totals since wave89 were under-reported
    by 2 in prose (69C+97CRT=166 not 164). Authoritative source is
    ALWAYS classify_matches output; prose arithmetic must copy it.
112. wave92 (+2): (a) &arr[i] on unsigned __int64 array => lea [i*8+abs]
    (b) deferred push cleanup: pe pushes twice then ONE add esp,8 =>
    vcall typedefs must be __cdecl (stdcall drops the add).
113. wave93: tinyI(100f5d7e scanf-block wrapper) reached 48/52 - ALL
    semantics+idioms exact (/O1 /Oy- combo for ebp-frame+mem-direct
    pushes+lea-varargs); sole delta = call to INTERNAL 100fa200 is
    reloc-masked on my side, real bytes on pe => SECOND-WAVE unlock
    once 100fa200 reconstructs at exact size/position.
114. wave94: 10032cd0 retry-loop WALL - pe bottom-check renders as
    cmp/setne al/test al,al/je-top; cl7.1 emits direct cmp/je for every
    equivalent C condition (4 phrasings: do-while(r==1), continue-form,
    if-break form, O1). Also cl inserts lea esp,esp loop-alignment pad
    absent in pe. Best 22/94 (first form, tinyJ.c kept). Likely ICL-
    compiled original; parked.
115. wave95: 1000d260 sweep-loop WALL - semantics fully mapped (entity
    cleanup, vtable slot2 release, counter subtraction, type-gate
    movzx/test-jl oddity); cl insists on 16B loop-alignment pad
    (jmp+NOP-lea) absent in pe and on entry-rotation regardless of
    do-while/continue phrasing. Best 5/127 structural. Third confirmed
    ICL-flavored original (with 10012ee0 fsin, 32cd0 setne-form).
116. wave96 BREAKTHROUGH (+4=174): the 1118 transplant-class rows are a
    CERTIFIED-BYTES goldmine - their disassembly is known ground truth;
    scan them for pure-logic shapes and re-express in C with existing
    recipes. 62 candidates <=80B found this way. /O1 preserves inc,inc
    (+2) where /O2 folds to add.
117. Transplant->C conversion does not change total byte-parity count
    (already matched); it upgrades METHOD honesty. User's bar is exactly
    this: real compilable C, bit identical.
118. wave97 (+2=176): ctor recipe keeps converting transplant rows.
    tinyR(101061d4) reached 24/25 - sole delta is tail-block order
    (pe carries an orphan xor/ret block; cl merges my single-exit).
    Shared-tail 'return r+1' form is correct; needs split-return
    phrasing to force pe's block layout.
119. wave98 (+2=178): (a) two-exit predicates: pe orders [fallthrough-0
    inline][shared-1 at end]; source shape = nested-if 'if(a!=X){if(b!=Y)
    return 0;} return 1;' + /O1. (b) tinyU(101061ad) diff-walk copy:
    semantics exact, cl reg-assigns walk to dst-reg vs pe's separate
    reg regardless of statement order - parked 21/27.
120. wave99 (+1=179): or/and init pattern via |=0xffffffff/&=0 under
    /O1. tinyV(1001fda0) parked 24/30: pe is usercall(ecx,eax) - src
    ptr arrives in EAX undeclarable.
121. wave102: 100f8c6d double-classifier parked 42/46 - windowed
    misaligned read (+6), reg-mask and (23 c1 under /O1), 16-bit cmps
    all reproduced; residual = cl merges my two forward-goto tests into
    one wider jump (displacement 0f vs pe 0c+05 split). Block-splitting
    beyond cl's canonicalizer - likely ICL. Recipe notes: offset-6
    dword window trick, mask-as-variable for 23 c1.
122. wave104: 100854d2 ten-magic split-range check parked 84/88 -
    reproduced mov ecx,imm/cmp eax,ecx via TRIPLE-USE boundary var
    (single-use folds to cmp imm); ja-vs-jbe branch placement still
    inverted vs pe (ICL picks smaller-body-at-target; cl opposite).
    Boundary ==b returns 1 in pe (je->ret1) - semantic detail kept.
123. wave105: 10108f54 96-bit shift parked 40/45 - reg-lane
    assignment wall (pe: hi->EDX mid->ECX; cl invariant opposite
    regardless of load order or operand order). Same class as tinyU
    diff-walk. Both are cl-vs-original register allocator divergence.
124. wave106: 1008576b fourteen-magic parked ~110/116 - SAME wall
    signature as 854d2 (#122): boundary-in-reg(mov ecx,imm) +
    4-byte branch displacement. Family-wide ICL divergence confirmed
    across split-range format checks; pure-chain members (no range
    test) convert clean, split-range ones park at ~93%. Do NOT retry
    without new flag discovery.
125. wave107 (+1=187): UNMATCHED pool (1407 fns!) has its own
    pure-logic vein - 25 candidates <=90B found by scanning outside
    transplant rows. First: 10106b03 w/ recipe reuse ((b+b*8)*4 lea,
    /O1) + signed-char read => movsx. tiny27(100227c0): pe interleave
    = direct single-use global stores '*a=g_x;' no temps.
126. tiny27(100227c0) parked 18/33: pe hoists second global load above
    first store = requires no-alias assumption; VC7.1 has NO __restrict
    (C4235), volatile breaks interleave other direction. ICL-only
    scheduling. Recipe note: volatile-quals reproduce program-order
    when needed - opposite tool.
127. wave108: unmatched-pool triage continued - 10021840/100131b0
    ring-packet writers are usercall(ESI) x; 10032370 char-classifier
    usercall(DL,ECX) x; 1000a7f0 strided-clear parked low (cl picks
    8b0d/ECX for entry global where pe has A1/EAX short-form; store-
    order interleave not reachable without restrict). Unmatched vein
    is thinner than count suggested - most are usercalls.
129. wave109: full crt71a reassembly (35 files) => all 4 matches were
    already-certified rows; CRT asm vein closed. Split-range triple-
    comparison form WORSE (58/116) - pure-chain literal boundary stays
    best-known (~110/116); family wall stands.
130. wave110: 10012e70 renderer-reset parked 57/109 - memset-chain
    section reproduces EXACTLY (rep stosd x3 via constant-size
    memset to extern arrays!); config-copy tail hits reg-lane wall
    (#123: cfg->ECX in pe vs cl's EAX) + interleave order. Best form
    kept in tiny30.c (hoisted gbase read + direct stores).
131. NEW RECIPE: constant-size memset(extern_array,0,N*4) under /O2
    emits pe's bare rep stosd with count in ECX - bulk-init chains
    are now convertible when rest of body cooperates.
132. wave111: 100222f0 ring-writer parked - semantics/order EXACT,
    diverges only in mid-function register NAMES (pe holds tail in
    saved EDI, cl picks ECX) cascading into jcc displacements.
    Another #123-class instance. Source kept tiny31.c.
133. REG-WALL RULE (final): for call-free functions, cl always assigns
    short-lived values to caller-saved regs (EAX/ECX/EDX); the ICL
    originals spread them into callee-saved (EBX/ESI/EDI) even with
    zero register pressure. Unfixable from C source phrasing. All
    parked near-misses with this signature (~6 fns at 85-95%) are
    permanently parked absent a different-compiler discovery.
134. wave113 BREAKTHROUGH (+3=190): tools/context_patch.py resolves
    obj relocs against the <name>_<hexaddr> convention and compares
    IN ORIGINAL-DLL CONTEXT - pe-side real displacement bytes vs our
    patched ones. Kills the entire internal-call/jmp wall class.
    Rules: unmask site iff pe bytes there are non-AA; suffix regex
    must tolerate @dec; use symbol's own section for reloc list.
    Immediately converted: 1006518e, 1003e250 (needed base-symbol
    array form so fstp disp gets its own reloc), 100f5d7e.
135. Re-audit path: run every objs_red obj through context_patch;
    any parked fn whose only delta was displacements now certifies.
136. wave114: dispatch twins 100fb4b9/50b parked - semantics exact;
    residuals are the two chronic walls (reg-lane on base var +
    cl tail-jmps import-pointer calls ff25 vs pe's call+ret ff15).
    ICL did not tail-optimize indirect cdecl calls; cl always does
    under /O2 when result unused. No source phrasing found.
137. tools/audit_objs.py added: batch context-patch audit of all
    addr-named objs (in-process, fast). Legacy cluster drafts all
    confirmed still-failing; no hidden flips. tiny*.obj need manual
    addr map (by design).
138. wave115: indirect-import tail-jmp wall CONFIRMED unfixable:
    cl 7.1 folds r=imp(x);return r, goto-converge, AND value-return
    back into jmp [__imp_x] every time. dllimport decl changes
    nothing (still ff25, and with broken cdecl stack to boot).
    pe's ff15-call+ret = ICL simply lacked this transform. tiny32
    parked at semantics-exact / 4-byte-shape level.
139. 10002ed0 (98B scan-loop w/ internal calls) = usercall(EDI) x;
    10101060 needs raw-frame-pointer-as-argument x (undeclarable).
140. wave116 MAJOR GAP FOUND: crt71/*.c = 600 REAL MS CRT sources
    (vendored). Earlier sweeps matched by SYMBOL NAME only, so
    CRT-internal fns whose PE symbol is stripped/FUN_ (e.g. _flush
    family at 100fa320 calling certified 10106b03/100fa4e6) were
    NEVER compared. Content-based sweep (compile all -> byte-compare
    every obj fn vs every unmatched PE fn of same size) running as
    bg job bash-3. Expect multiple certs.
141. wave117 BREAKTHROUGH (+4=194): content_sweep found printf-family
    wrappers at 84-88 bytes matching PE within 4; root cause = two
    unresolved relocs (__output/__flsbuf). FIX: CP_SYMVA env map in
    context_patch resolves ANY named extern to a VA:
    __output=0x100fa4e6 __flsbuf=0x100fa320. All four then MATCH.
    Method: real MS crt71 sources + -Zelp8 -GFy -GB -Gi- -GS -D_CRTBLD
    -DWINHEAP -O1 flags (the old sweep's flag set is REQUIRED -
    bare /O2 fails on internal headers).
142. PE name map discovered: 100fa320=__flsbuf(281B,uncertified),
    100fa4e6=__output(2010B,CERTIFIED). _flsbuf.obj is 278B vs PE
    281 - variant drift, still open.
143. Sweep recipe going forward: loosen near-miss threshold to 8,
    add missing SYMVA entries, re-diff. Each newly-named extern
    unlocks whole wrapper families.
144. wave118 (+2=196): data symbols matter as much as code - the
    13B secchk wall was ONLY blocked on __security_cookie's address;
    auto-map from inventory names (data/symva_auto.txt, 2695
    entries incl. data syms like __iob/__lc_time_curr where present)
    resolves them. Getdays same story (__lc_time_curr).
145. In-process sweeps disagree with CLI runs; ALWAYS certify via
    tools/context_patch.py CLI (authoritative), use sweeps only to
    propose pairs.
146. wave119-120: full crt71 corpus (600 sources -> ~3200 objs incl.
    variants) content-swept: a_env's ___crtGetEnvironmentStringsA
    was the LAST exact hit. Corpus exhausted for exact matches;
    _flsbuf(100fa320) is source-version drift (PE variant has
    different commit-path calls) - not fixable by flags.
147. Honest count discipline: classifier C+CRT-SRC ONLY, summed
    verbatim (194 = 97+97 as of wave119). No more prose drift.
148. wave120 verdict: ALL systematic veins exhausted at 194 honest.
    - crt corpus (3200 objs): zero remaining exact or >=88% near
    - twin scan of our own objs vs unmatched: none
    - candidate scan survivors are wall-dominated (usercall,
      jump-table-with-ECX, stmxcsr, xword). 1000d090 switch fn =
      usercall(ECX) x.
    Path to 200 = hand-conversion grind + new-recipe luck only.
