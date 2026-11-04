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
- Retail `mixerGetRecordLevel` 0x4b5ad0 has a 2-byte `je` NOPed after link (0x4b5b09): no source produces it;
  documented post-link step (`data/postlink_ranges.txt`, owner decision).

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
