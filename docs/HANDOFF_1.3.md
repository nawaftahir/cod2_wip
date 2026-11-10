# CoD2MP_s.exe 1.3: handoff (11-10 night run)

State: branch `client/1.3/w5-bss` (not pushed yet). Meter now counts the whole file including the PE heade
(METRIC CHANGE 11-10): same-offset 1,971,438 / 1,974,272 (99.86%), matched-fn 1,554,291. Last accept: see `git log`.

## Tools added tonight (all in tools/)
- `gate13.sh "msg"`: clean ratchet, commits + accepts on OK; refuses a same-offset drop.
- `dfs13.sh`: LTCG DFS / compile-order oracle link -> build/dfs/ord.txt.
- `callscan13.py`, `diffclass13.py`, `addrruns13.py`, `regonly13.py`: residue scanners (call lists, byte classes, address runs, register-only diffs).
- `c2dbg13.sh`, `c2memscan13.sh`, `c2picks13.sh`, `c2pickmap13.sh`, `c2dis.py`, `c2xref.py`: c2.dll debugging (winedbg link, emitted-byte search, short-temp pick log and map).
- `dref13.py`, `symdrift13.sh`, `dworddrift13.sh`, `gapref13.py`: data operand drift and unreferenced-gap proof.

## Rules found tonight (KNOWLEDGE sections 18-23, skill client-recon)
- libcmt member order = order of each module's DIRECT CRT references, modules in objs.rsp order.
- Short-temp register rotation = local pick count mod 3 (c2 0x10775acc); restore the duplicate cross-jumping removed.
- FX vtable .rdata order = reverse forward `class X;` order (last two at the end).
- Explicit `= NULL`/`= 0` also moves function-local statics; within a TU .bss order follows the symbol name.
- Unknown storage rule (owner + lead): KNOWLEDGE "Unknown storage".

## Plan (in order)
1. Merge, push w5-bss (owner), CI green, merge into client/1.3/main.
2. Code residues (~1.9 KB), one agent per group:
   - DL_BeginDownload: compare with RTCW-MP libwww src/qcommon/dl_main.c (likely ancestor); ours keeps 0 in esi and re-zeroes per HTSACopy arm.
   - CG_CalcCrosshairPosition: one extra local pick from copying cg->gunYaw through ecx to [esp+0x28]; retail flds it directly.
   - Stack-slot only: FX_CalcOriginAndAxis, CG_DrawScoreboard_Objective, Item_Text_AutoWrapped_Paint (not ties, checked).
   - Menu_SetNextCursorItem: one-step rotation, guard load `mov eax,[esi+0x220]` is pick 1.
   - FX_AddFxToScene, nb_decode: REGALLOC.md D-local / C-num classes.
   - One-slot scheduling: CG_FireWeapon (lea ebp), CG_DrawAdsOverlay, CG_DrawGrenadePointer, G_GetPlayerViewOrigin, XAnimCalc.
   - CL_ConsolePrint_AddLine: parked; charWidth is split before colouring in ours (eax piece), whole in ebp in retail.
3. Data/order (~150 B): stPbSv::LoadServerDll string order, two __real pool constants (compile-order shifts), HTEvtLst fn_54ed70 tail order, unknown-name statics (HTEvtLst pump state, fs config pointer, win_threads statics): deferred without evidence.
4. Last: add all proven unknown-storage objects together (gaps proven by gapref13.py: 0xb013f8-ff, 0xd529a4-af, 0xd52a40-4b, 0xd52a50-53, 0xd52a58-5b, 0xd76aec-f7), then re-check LTCG ties (each added TU re-rolls CG_DrawPlayerStance / SV_DirectConnect until the object set is complete). Rich (25,9466)/(28,9466) order: needs the original Miles mss32.lib member order (4 header bytes).
5. After SHA identical: boot/smoke, workspace -> src, original file layout from retail path strings + Mac file list, release to cod2engine.
