# CoD2MP_s.exe 1.0: verified knowledge

Facts with evidence only (LAW 12). PINNED = confirmed on the binary or the compiler; SUPPORTED = a reference
agrees. Disproved claims are fixed here in place. Failed attempts are in `TRIED.md`, numbers in `STATUS.md`.
The compiler rules (section 1) hold for client 1.3 too (same toolchain).
Raw sources: `archive/LESSONS.md` (dated log), `archive/CLIENT_KNOWLEDGE.md` (10-31 audit). Tool and note
paths `lab/w200/...`, `/home/nawaf/...` refer to the old `dev/claude_client` tree (archived, read-only).

## 0. Toolchain and build (PINNED)
- MSVC 7.1 build 3077 (VS .NET 2003 RTM c2.dll md5 8460473c), `/O2 /GL`, `link /LTCG` 7.10, image
  `cod2-msvc71-vs2003` (VS2003 cl/c2/link + its own Platform SDK, Wine 5). Clean build reproduces 286/286
  import hints. d3d9.lib/dsound.lib = DirectX SDK Summer 2004.
- Do not use image `cod2-msvc71-build`: Wine 8 hangs cl.exe on compile errors, its Server 2003 SP1 SDK re-rolls
  LTCG ties (-6,665 B) and breaks import hints. Never mix /GL objects from different SDKs (header content
  changes ties).
- `toolchain/vc70` = VS .NET 2002 (7.00.9466): builds `mss32.lib` like retail (Rich entries 9466).
  Its c2.dll (md5 d04db730) is NOT the 7.1 back end: never use it for oracle work.
- VC++ Toolkit 2003 1.0 (c2 3052) and 1.01 (c2 3077) give identical code: no other compiler build to try.
- `/FORCE` links unresolved symbols as `call 0x400000`: the gate refuses any LNK2001/LNK2019.
- Rich header id 100 counts LTCG C++ objects (retail 271). Six `unknown/empty_N.cpp` TUs supply the count;
  their link positions move a few register ties (search spent, 10-31c).
- PDB GUID is pinned by `guidpin.c` (LD_PRELOAD answering Wine UuidCreate); release link runs under faketime.
- `mixerGetRecordLevel` 0x4b5ad0: original retail (0bdee00f) has `je` 74 0b at 0x4b5b09, as our link emits. The
  old anchor 8caf434c had it NOPed (90 90): a community black-screen fix, not retail (PINNED 11-10, 2-byte cmp).

## 1. The compiler: decoded mechanisms (PINNED unless tagged)

### 1.1 Inline decision per call site (c2 0x1078d1aa via 0x1078cf54)
- COST-MODEL path (callee already compiled): cost = size81 - argcost + [site+0x4e]*size81/254 - constant-arg
  discount. size81 = callee compiled size; argcost = 1 + 5 per constant/address/memory arg, else 2 per arg,
  +3 if the result is stored to memory; [site+0x4e] = loop-weight byte.
  cost < 14 -> inline. Else with site count c (1e8 = function entry): r = (cost*1e8/c + 6*cost)/7 if c <= 1e8,
  else (cost*1e8/c + 2*cost)/3; refuse if r >= 71. No per-caller budget on this path.
- BUDGET path (callee not compiled yet): caller budget 1000 minus what it already inlined; refuse if
  [0x10882b5c] > 35000 or (budget < callee IL size and IL size > 40); else raw IL inline.
- Site count (frequency estimator 0x1078095b): if-arms halve; a loop header sends 10x its entry flow. Natural
  loops (do/while, while(1)/for(;;) without increment) give every exit an equal share, so code after the loop is
  back at entry count. A `for` with an increment is flagged non-natural (flag spreads to enclosing loops): no
  exit shares, code after it keeps x5. Counts are computed once per caller, before inlining.
- Callee cost >= 71 never inlines at count <= 1e8: if retail inlines it, look for a loop around the site.
- Constant-arg discount (FUN_10797769) reads a callee-side branch summary. A constant passed through a LOCAL
  (`horzAlign = 2;` then pass it) is not folded at decision time: no discount -> call, still folded later.
- `__declspec(noinline)` and `#pragma auto_inline(off)` clear the summary-candidate bit: every site calls.
- Paid examples: UI_LoadMenus (Kisak do/while, 5 exits), CL_MapLoading (CoD4 one-trip local-client loop
  `for (localClientNum = 0; localClientNum < 1; ...)` makes later sites x5), CalcScreenPlacement (aligns through
  locals, CoD4 shape: 48 calls == retail), CL_SetServerInfoByAddress (`continue` after search arms).

### 1.2 Compile order (sweeps) -> local statics, float pool, vtables, .rdata
- LTCG compiles in sweeps: TUs in reverse link order, functions in reverse definition order; a function
  compiles only after all its /GL callees. Any call in the IL counts, even inlined or dead.
- Emitted at compile time: local statics (.bss groups), `__real@` float constants (pool order), first-referenced
  string literals, vtables. Within one object, .rdata items follow reverse definition order of their functions.
- A retail static placed "late" means its function had a real callee that vanished (Sys_ScanForCD calls Q3
  `Sys_DefaultCDPath()`; Item_Getter_5338c0 indexes through the 0-caller stub `CL_Zero_40b4d0()`). Only use a
  callee with evidence (retail 0-caller stubs, Q3/CoD4 source).
- Retail kept-unreferenced getters/stubs are real inline callees; layout constants can be expressed through them
  (CG_CheckDrawScoreboardLine 432.0f via two scoreboard getters).
- An inline wrapper delays its caller one sweep: call the wrapped function directly when retail order says so
  (G_DebugCircleEx -> CL_AddDebugLine).
- Forward class declarations order vtable emission (FxPrimitives.cpp).

### 1.3 One body per helper (/OPT:NOREF)
- Every inline / `static __forceinline` / static helper used in a TU leaves an out-of-line body, in the FIRST
  TU in link order that emits it. Retail has no body for helpers it only inlined, exactly one for the rest.
- Fixes that worked: use the genuine shared helper (VectorCopy, Q_stricmp, QuatMultiply) instead of local
  copies; per-site expansions as macros; Inl+noinline pairs -> one plain function; `__asm` helpers as a macro
  (FAST_CEIL). Give a TU a real call to place a helper body where retail has it (Com_BitCheck).
- Cross-TU `__forceinline` on a non-static function = broken link (body dropped, hidden by /FORCE).
- `__attribute__((always_inline))` is defined away under MSVC: oc helpers using it are plain functions.

### 1.4 Stack slot packer (c2 0x10790ad6)
- Items sorted by size ascending, use weight descending, creation order. Last-fit: an item joins the newest
  entry where size <= 2x entry size and no interference. Entries ordered by weight*1000/size; densest gets the
  lowest esp offset. Declaration order does not matter; scope and which values are separate variables do.
- A bool local is a 1-byte item that never shares a 4-byte entry; an int ?: passed to a bool param gives dword
  stores + byte reads (UI_Init).

### 1.5 Register allocation and LTCG conventions
- Priority = use count x region weight x candidates; ties by later last use; order eax ecx edx esi edi ebx ebp.
  Short-lived locals become colored temps; locals live across an outer loop stay memory candidates.
- Local code generator hands scratch regs out in IL first-reference order; imul destination = earlier
  referenced field (CG_DrawCrosshairNames, SND_RawSamples).
- A param arrives in a register only if the callee gives it a callee-saved reg other than ebp; raise/lower a
  param's use count to move it (Menu_HasItemLeft/Right, FxHelper::WarpTime duplicated arms).
- Callee register summary (record +0xc3 untouched mask): valid only with /Og and all callees summarised.
  A NON-STATIC `inline` function is a selectany COMDAT and callers distrust its summary (CalcTracerFinalScale).
- Swapped incoming registers in a custom-convention prologue = swapped param order.

### 1.6 x87
- Commutative op with both operands in memory: lower-numbered object becomes the memory operand. Numbering =
  first reference in the function (assignment target first). Locals/params beat globals for the memory side.
- Block rule: a value computed in the same basic block is consumed (fld side); a named local assigned before a
  block boundary stays on the FPU stack (`fld; fmul st(1) ... fstp st(0)`).
- `a*b` vs `b*a`, declaration order, use counts never matter; earlier statements, base-pointer identity and a
  cast from a DIFFERENT type do (same-type casts are dropped by the front end).
- /Op (`#pragma optimize("p")`, e.g. com_math AngleVectors) spreads to callers by inlining (global 0x108a9204,
  merge 0x1078dbd7); then float mem->mem copies become int copies and float objects leave dataflow: only
  constants and by-value formals forward. Under /Op redundant parens change x87 order.
- In C++ TUs fabs/acos/log/floor(float) resolve to inline overloads (+2 IL levels): retail speex was C.

### 1.7 Stack alignment
- `and esp,-8` placement is a whole-program pass (c2 0x1070cd11): call-graph levels bottom-up, first-visited
  level-7 node with an own double or >= 2 nonzero callees aligns; callee edge order = first DECLARATION order in
  the caller's TU (prototype order is an input). A named double local aligns; a compiler double temp does not.

### 1.8 Scheduling
- c2 list scheduler (0x107b5338) issues 1 int + 1 x87 per cycle; first ready node wins. Residues in CursorHint,
  AdsOverlay, GrenadePointer are issue-order only.
- add vs lea is chosen at lowering (lea is flags-free); a repeated getter makes a shared CSE that lowers to lea.

## 2. Data layout (PINNED)
- .rdata: imports, CRT, one merged block of per-object const data in link order, then strings per object.
- .data/.bss: per-object blocks in link order. Inside a TU block the order is a fixed total order on NAMES
  (type-independent; statics and globals interleave); unreferenced statics are dropped.
- Explicit `= 0` globals and function-local statics go to an END group of .bss in definition order; tentative C
  defs go to `<common>`. `ALIGNED(128)` must be on the definition AND every extern.
- Float pool order = LTCG code generation order (bottom-up over the call graph).
- Data-address +8/-8 pairs inside one function = statement/store order, not struct layout.

## 3. Evidence sources (value order)
1. Retail binary. 2. Verified Linux server 1.0 source (`cod2engine/archive/lnxded-1.0/src`, -O0, SHA-identical):
original statement shape; GCC -O0 compiles several spellings identically, so it is a constraint, not one
spelling (check with the server build). Client and server were built from different revisions of a few
functions (XAnimGetInfo, XModelTraceLine: clone-proven, client tree takes the client spelling).
3. Mac 1.3 STABS (`data/mac_stabs.json`): names, local scopes, types, line tables; Mac inlines some things
differently (FX ctors). 4. Quake III and KisakCOD (CoD4): idioms, loop shapes, locals feeding constants.
5. coduomp, opencod1/2, CoD2rev: hints only. 1.2/1.3 Windows clients: hard 1.0 functions byte-identical, no help.

## 4. Fix patterns that paid
The full catalogue (with gains) lives in the `client-recon` skill. Target examples:
| Lever | Example |
|---|---|
| Constant through a local | CalcScreenPlacement aligns (CoD4) |
| One-trip local-client loop | CL_MapLoading |
| Value into its own local before the call | SND_RestoreSoundAlias offset (+1,374) |
| int ?: to a bool param | UI_Init ui_mousePitch (+531) |
| Non-static `inline` helper | CalcTracerFinalScale (+550) |
| Function-scope shared floats, dead-store copies | CG_DrawCompassFriendlies (+1,426) |
| Getter re-called per arm (CoD1) | CG_ConfigStringModified (+651) |
| Vanished callee with evidence | Sys_ScanForCD, Item_Getter_5338c0 |
| Mac sizes/types for data | buildInfo[128], LegacyHacks type |
| Own TU for a Mac file | com_profilemapload.cpp (Rich +1) |
| Server body as given | AxisTransformVector, FloatSwap two-union |

## 5. Stand-ins still in the tree (must become real code before release)
q_parse_online.inl (2 sites), cl_keyevent.inl (Key_ClearStates), xanim_settime.inl (CG_UpdateKillCam),
G_MODEL_NAME_INLINE, ANGLE_VECTORS_INLINE (FinishSpawningItem), noinline GetBestOffhand / Item_ListBox_HandleKey,
AxisTransformVector parens, UI_Init one-trip loop around Dvar_RegisterInt, EvalPrimitiveExpression `goto
evalFloat`, XModelCalcBasePose pragma, CG_Respawn offset macros, CG_CalcViewValues `&cgArray[0]`,
CG_InitXAnimTrees written-out XAnimCreateTree (owner OK, labelled), com_endParseSessionUnderflow pointer.
All are split inline decisions; the cause is the site count, not the callee (state 10-31, not re-audited since).

## 6. Identities (PINNED)
- Sys_Error 0x462a20; Sys_Print 0x462c00 = jmp Conbuf_AppendText; WinMain 0x463710; MainWndProc 0x465e30.
- refexport_t = 108 slots; client refimport_t = 169 slots (gfx verified header).
- cls 0x60f2a0, clc 0x5c6860. scr_const 0x17ce8a0.
- yylex = bison 1.28 skeleton (scr_yacc). Speex = upstream 1.1.9 text.
- Retail debug dir names `c:\builds\crc6_v1\pc\cod2\pc\CoD2MP_s.pdb` (never shipped).
- PINNED (w29, 11-15): DSound_UpdateSample retail 1.0 == retail 1.3 (address-masked disasm identical) and our TU play_dsound.cpp is byte-identical between the trees; 1.3 matches, 1.0 swaps the dwLockLen1/dwLockLen2 slots. Pure LTCG-context slot tie (decl order, return order no effect).
- PINNED (w29 c2slots10x vs c2slots13, 11-15): DSound_UpdateSample packer lists: 1.3 items id6 then id8 (both w5, flags 00020604, size 4 = the two lock lengths), 1.0 id8 then id6; everything else identical. c2 disasm: the frame-item list (head 0x108a78a4) is built by 0x10788642, which inserts sorted by item+0x20 (size/align key) and appends after equal keys; it is called from the block/tuple walk at 0x10785c4b..0x10785c96 (blocks via [blk], tuples via [blk+0x28]/[t+0]). So list order among equal items = first reference order in that IL walk; 1.0 meets id8 first. Renaming locals, extra total local: no effect. Next: log the walk (block ids + tuple) at 0x10788635 in both trees to see which block reaches id8 first in 1.0.
- PINNED (w29 bp 0x10788642 both trees, 11-15): the insert walk visits the same tuple positions in 1.0 and 1.3, but the item objects there differ: 1.3 pos 6..9 = a64(id6,key 0x2004) ac4(id7,0x1004) b24(id8,0x2004) b84(id9,0x1004); 1.0 pos 6..9 = 73c(id7,0x1004) 79c(id8,0x2004) 7fc(id9,0x1004) 85c; 1.0 id6 (6dc) is inserted later. So in 1.0 the first 0x2004 item met is id8, not id6: the symbol-to-item numbering differs between the trees for identical source. Next: name the items (sym+4 strings) in both runs.
- PINNED (w29 c2slotnames, 11-15, rerun): with names, both trees list dwLockLen2 then dwLockLen1 (w5), pLock2/pLock1 (w3): the item order is the SAME (the earlier "id8 first" read was a different run). Phase-2 entries (offset -4 w5, -8 w3, -0xc w8, ...) also have the same shape. So the 1.0 swap is decided at member->entry assignment (which symbol joins which entry), not by the item list. Next: log bp 0x10790eb5 (EAX sym, ECX offset) with names in both trees.
- (w29, 11-15) RETRACTED: an "I_fmin arg order" residue note here was read from a stale lab ox.exe (the fm lab). Masked diff of the real base = the 18-line dwLockLen slot swap only.
- PINNED (w29, 11-15, base objs rebuilt): 1.0 base packer list = dwLockLen1 (id8) before dwLockLen2 (id6) (1.3: id6 first), both w5 key 0x2004. The 0x10788642 insert walk inserts id6 first in BOTH trees, so the swap happens in the later weight ordering (input list equal by key; the weight sort or a weight update differs). Earlier 1.0 dbg runs after the fm lab used a lab object: ignore them. Next: watch item +0x38 (weight) of 0661d6dc/0661d79c between 0x10788642 and 0x10790cba in both trees.
- PINNED (w29, 11-15): DSound_UpdateSample 1.0 slot swap traced: packer weights grow per reference in walk order (0x10789a99: weight += loop weight, item moves ahead of strictly lighter items), so among equal final weights the item that reached it first leads. Refs match in both trees up to the last pair: `return dwLockLen2 + dwLockLen1` reaches c2 as L2,L1 in 1.3 but L1,L2 in 1.0. Linking the 1.3 play_dsound.obj into the 1.0 build gives the same 1.0 result (18 lines), so the operand order comes from LTCG context (c2 canonicalisation), not from the object or source order (`L1 + L2` also 18).
- PINNED (w29 c2 RE, 11-15, operand-order mechanism, DSound_UpdateSample 1.0 vs 1.3): (1) c2sched logs are identical in both trees, so the scheduler is not involved. (2) The full masked diff is the dwLockLen slot swap plus the return `lea eax,[edx+ecx]` (retail) vs `[ecx+edx]` (ours): the two operands of `dwLockLen2 + dwLockLen1` reach c2 in opposite order, and that one order sets both the packer tie (last weight-5 reference wins, 0x10789a99) and the lea operand order. (3) Not the source (`L1 + L2` = same), not the obj (the 1.3 obj linked into 1.0 = same), not the inlined I_fmin body (a TU-local copy = same). (4) GAIN=1 opwalk: the 1.0 colour worklist has 2 fewer insertions (n3 0x22 and 0x17 missing) and a different insert order, so the IL that reaches RA differs between trees through LTCG context. Next: find where c2 orders commutative operands (watch the return-add tuple's use list from IL read to RA).
- PINNED (w29 GAIN=1 opwalk both trees, 11-15): DSound_UpdateSample has identical E/K/N/P/G/X counts in 1.0 and 1.3, but the colour worklist insert (I) order differs. 1.3 inserts n3 0,6,1e,11,24,21,22,17,-3,1e,36,20,1e,30,16,1e; 1.0 inserts 0,6,11,1e,24,-3,21,1e,36,20,1e,30,16,1e (the 0x22 and 0x17 nodes are not inserted, and 1e/11 and -3 move). Node addresses ascend in insert order in both runs, so insert order = node creation order. That makes the residue a web/node CREATION-ORDER difference coming from LTCG context: the same class as the Window_Paint reload-order hypothesis (web-id order). So the operand-order and reload-order mechanisms are one: c2's web creation order. Next: name the 0x22/0x17 webs (sym 064c5a04 / 064c5b24 in the 1.3 GAIN run) and find the web-creation walk.
- PINNED (w29, 11-15): correction to the line above. DSound webs are identical in both trees (66 syms, 79 nodes, same split counts 2,2,2,3,3,3,5), and node creation order is the same. What differs is the colour WORKLIST: two nodes (n3 0x22, 0x17) are never inserted in 1.0, and 1e/11/-3 insert in a different order. Insertion is gated by gain n16 > 0 (0x10784b8f) and ordered by n3, so the context-dependent input is the RA cost/gain numbers, not web creation. All callees are compiled before the fn in both trees (F order: GetBytesLeft, Com_Printf, then the fn). Next: dump n3/n16 per node at 0x10784b8f in both trees and find which cost term differs (HYPOTHESIS: per-callee clobber info under LTCG).
- PINNED (w29, 11-15, GAIN logs indexed by node creation): the n3/n16 values are identical in both trees. 1.3 puts two extra nodes (n3 34 n16 0x0e, n3 23 n16 -2; both are the 2nd web of a split symbol, e.g. the second node of sym 064c5a04) into the INITIAL worklist; 1.0 does not, and later pops follow the changed list. So the gate is not n16 > 0 (one has n16 -2): the initial-candidate test for split-piece webs differs. Next: find the initial worklist build (the caller loop of 0x10784bf4 before the first P) and log why those two split pieces pass in 1.3.
- PINNED (w29 bp 0x10784b8f/0x10784ba9, 11-15): the initial colour worklist loop walks a bitset of WEB IDS in ascending order (next-bit 0x107b3786; node = hash 0x108807b8[id&0x3ff] chain, [n+0x1c]==id). It takes a node when [n+0x40] > 0 and the 0x10782133([n+0x20]) class test == 1, then inserts it sorted by n3 (ties keep walk order). The same webs carry DIFFERENT ids in the two trees (gain [n+0x40] by id: 1.3 5:2 6:0 7:8 8:8 9:2 a:e c:-2 f:0; 1.0 4:-2 5:2 6:e 8:8 9:0 b:8 e:2 f:0), i.e. the same multiset permuted. Web-id numbering is the context-dependent input; everything downstream (worklist order, colours, reloads, slots, lea operand order) follows. Next: find where c2 numbers webs/symbols for a function and why the numbering depends on the build.
- PINNED (w29 c2 disasm + bp 0x1077c13e, 11-15): web/var ids come from the counter 0x10882154, assigned in 0x1077c10f (eax = symbol) the first time a symbol needs a var object ([sym+0x3c] == 0); var hashed into 0x108807b8[id & 0x3ff]. In DSound both trees create ids from the same call sites in the same pattern (1077e252 x14, 1077fd0c x18, 1077e252 x4, 1077fd0c x4, with matching heap spacing). So the permutation is in WHICH source symbol each creation step visits, i.e. the order of the walk inside the 0x1077fd0c / 0x1077e252 callers. Next: name the edi symbols at 0x1077c13e (c2slotnames-style lookup) in both trees, then read the walk at 0x1077fd0c.
