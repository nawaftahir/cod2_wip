# Next session: CoD2MP_s.exe 1.3 to 100%

Worktree `dev/cod2_wip/.worktrees/w29` (branch `client/1.3/w29`, equal to `client/1.3/main`).
State: 1,974,041 / 1,974,272 same-offset (231 B). Gate: `tools/ratchet13.sh` with absolute ANCHOR/DXSDK.

## What is left
1. `.rdata` constant pool, 68 B: double 1000.0 (first user CL_DemoCompleted, compiled F 5436, retail needs it
   between Pickup_Health 5603 and Die@Particle 5635) and float 720.0f (fire_grenade F 6035, retail after
   Mantle_CreateAnims 6041). Pool order = compile (F) order. Both bodies equal retail.
2. Knock-ons of 1: ~40 B pool addresses in otherwise matched fns, static .bss addresses
   (Com_ErrorCleanup, Com_GetSubtitleStringEdReference). VM_Notify and Window_Paint also change with compile order.
3. Regalloc/scheduling residue: FX_CalcOriginAndAxis 56 (slot packer), CG_DrawCursorhint 17, XAnimCalc 15,
   CG_FireWeapon 7, CG_DrawGrenadePointer 6, Menu_SetNextCursorItem 5, StartWeaponAnim 4, nb_decode 3,
   FX_AddFxToScene 2.

## Already exhausted (see docs/TRIED.md, do not repeat)
Single decl moves, DFS root moves, one-edge hidden-call searches (only fabricated calls fit), source shapes for
every fn in 3 (25+ rows each), per-TU flags /Op /Ob2 /G6 /GB /Oy- on the residue TUs, speex as C.

## 11-17 night (all dead, see TRIED/KNOWLEDGE)
Inlined-wrapper model, hidden edge from the whole DemoCompleted subtree, every node as first DFS root, flags /Oa /Ow /GX /Gs.
Key constraint: under any list order DemoCompleted's pass is <= 24 (depth bound), and the matched fns pin today's order
everywhere else (the 53-change root/decl moves lose 1.38 M), so retail must have ONE extra edge from CL_DemoCompleted to a
pass-24 fn whose inlined body folds away, or the IL graph has an input we do not model. Next real step: read c2 0x1070cfdf
edge collection for non-call IL references (address-of, vtable, data with initializers) instead of more model searches.

## Next attacks (in order)
1. c2 compile-order trace: find why CL_DemoCompleted / fire_grenade compile when they do (c2 0x1070cfdf walk,
   tools/dfs13.sh, peel13.py). Look for any input besides call edges: address-taken refs, static initializers,
   EH/dtor edges, COMDAT inline IL loading, symbol-list insertion from undefined refs in earlier objs.
2. FX_CalcOriginAndAxis slot packer (c2slots13.sh, KNOWLEDGE w5/w12 rows): retail creates the height/len
   entry last; find the IL ref-count shape that gives it (JKA ancestor in KNOWLEDGE for shape).
3. Per-file flag lever (new PINNED rule): probe flags per TU on any residue that ignores every source edit.

## Rules
Never stop or send status text until 100%. Background every build. Clean-gate accept, commit, push, merge to
client/1.3/main on green. No asm, byte arrays, fake callees or behaviour changes. Log every attempt in TRIED.md,
every PINNED fact in KNOWLEDGE.md and the client-recon msvc71-c2.md reference.
