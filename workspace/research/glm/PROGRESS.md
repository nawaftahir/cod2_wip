# Progress Log — gfx_d3d_mp_x86_s.dll reconstruction

Policy: only independently verifiable numbers go here. "Fully reconstructed"
means real readable C (or authentic VC7.1 CRT source) whose compiled bytes are
identical to the target under tools/match_gfx.py relocation-normalized diff.
Byte-transplants (MASM/_emit/naked-asm) are counted separately and never
promoted into the reconstruction total.

| Date | Fully reconstructed (C + CRT-SRC) | Byte-matched (any method) | Milestones |
|------|----------------------------------:|--------------------------:|------------|
| 2026-08-22 | ~30 (early hand-C era) | 1,250 | transplant waves 8–23 inflate match count |
| 2026-08-24 (round 1) | 129 | 1,274 | honest metric established; wave24 CRT certification (+99); first IPRA-cluster redemption FUN_10045ce0 |
| 2026-08-24 (round 4) | **140** (43 C + 97 CRT-SRC) | 1,276 (47.2%) | multi-flag CRT sweep partial join; 6/6 sampled certifications independently re-verified by fresh recompile; docs corrected |
| 2026-08-24 (round 9) | 144 | 1,276 | SIB-order class CRACKED via cached-local rewrite (ClearScreen tail now matches); auto-uchar heuristic reverted as net-negative (compile yield 676->324); BlendSavedScreen allocator still resists |
| 2026-08-25 (rounds 11-17) | **147** (50 C + 97 CRT-SRC) | 1,277 | dual-variant join (+FUN_100046e0, FUN_10015740 recursive); IPRA detector+cluster builder (1,215 consumers, 439 clusters); GATE fn Sub_1001ffc0 written; R_AddPolyToScene 100% in-TU; reg-pick rule cracked |
| 2026-08-25 (rounds 37-44) | **148** (51 C + 97 CRT-SRC) | 1,277 | whole-TU codegen law proven; stale-obj strike two caught+fixed; rebuild_cb.sh enforcement; HANDOFF rewritten; best stable scoreboard 100/67/55/39/61/61 |
| 2026-08-25 (rounds 32-36) | **148** (51 C + 97 CRT-SRC) | 1,277 | cluster-B walls mapped precisely; F171f0 61%; 42ae0 semantics corrected (p2++ wrong) though 85% artifact kept; house-of-cards lesson |
| 2026-08-25 (rounds 30-31) | **148** (51 C + 97 CRT-SRC) | 1,277 | F171f0 added; C910 semantics bug found+fixed (jl routes negatives INTO subtract): now ONE byte from match |
| 2026-08-25 (rounds 18-29) | **148** (51 C + 97 CRT-SRC) | 1,277 | FUN_10060c10 certified; cluster-B TU built out (C910 66%, f2a0 55%, FA40 61%, f900 39%); promotion-trick + stale-obj lessons |
| 2026-08-24 (round 10) | 144 (checkpoint) | 1,276 | draft-failure survey launched (527 files); self-name extern collision fixed in drafter; PAUSED for the day |
| 2026-08-24 (round 8) | **144** (47 C + 97 CRT-SRC) | 1,276 | R_BeginDebugFrame hand-fit to **100%** via disassembly-guided fixes (single-load stores + byte-width decls); SIB-order pair documented as allocator-dependent |
| 2026-08-24 (round 6) | see below | 1,287 (47.7%) | NEW lever: tools/draft_tiny.py bulk-redemption — 232 small std-conv candidates drafted from decomp corpus, mass-compiled /O2-/O1 variants; **10 canonically verified promotions** |
| 2026-08-24 (round 9) | 144 | 1,276 | SIB-order class CRACKED via cached-local rewrite (ClearScreen tail now matches); auto-uchar heuristic reverted as net-negative (compile yield 676->324); BlendSavedScreen allocator still resists |
| 2026-08-25 (rounds 11-17) | **147** (50 C + 97 CRT-SRC) | 1,277 | dual-variant join (+FUN_100046e0, FUN_10015740 recursive); IPRA detector+cluster builder (1,215 consumers, 439 clusters); GATE fn Sub_1001ffc0 written; R_AddPolyToScene 100% in-TU; reg-pick rule cracked |
| 2026-08-25 (rounds 37-44) | **148** (51 C + 97 CRT-SRC) | 1,277 | whole-TU codegen law proven; stale-obj strike two caught+fixed; rebuild_cb.sh enforcement; HANDOFF rewritten; best stable scoreboard 100/67/55/39/61/61 |
| 2026-08-25 (rounds 32-36) | **148** (51 C + 97 CRT-SRC) | 1,277 | cluster-B walls mapped precisely; F171f0 61%; 42ae0 semantics corrected (p2++ wrong) though 85% artifact kept; house-of-cards lesson |
| 2026-08-25 (rounds 30-31) | **148** (51 C + 97 CRT-SRC) | 1,277 | F171f0 added; C910 semantics bug found+fixed (jl routes negatives INTO subtract): now ONE byte from match |
| 2026-08-25 (rounds 18-29) | **148** (51 C + 97 CRT-SRC) | 1,277 | FUN_10060c10 certified; cluster-B TU built out (C910 66%, f2a0 55%, FA40 61%, f900 39%); promotion-trick + stale-obj lessons |
| 2026-08-24 (round 10) | 144 (checkpoint) | 1,276 | draft-failure survey launched (527 files); self-name extern collision fixed in drafter; PAUSED for the day |
| 2026-08-24 (round 8) | **144** (47 C + 97 CRT-SRC) | 1,276 | R_BeginDebugFrame hand-fit to **100%** via disassembly-guided fixes (single-load stores + byte-width decls); SIB-order pair documented as allocator-dependent |
| 2026-08-24 (round 6) | **142** (45 C + 97 CRT-SRC) | 1,276 (47.2%) | NEW lever live: tools/draft_tiny.py bulk redemption - 10 canonical promotions; audit showed 8 of them fix ATTRIBUTION (good C existed, ledger pointed at dead paths), +2 genuinely new |
| 2026-08-24 (round 5) | 140 (no change) | 1,276 | full 4-flagset CRT join: **0 net gain** — all 106 hits were wave24 re-discoveries. CRT region exhausted as a lever. Emitter TU extended: R_EmitWord 69% first shot. Next: automated tiny-function C drafting |

## Objective

>=600 fully reconstructed AND byte-identical functions.

## How numbers are computed

1. `MATCHES.md` is the ledger; last row per address wins.
2. `tools/classify_matches.py` reads the ACTUAL source behind each row:
   - `.c` with real code -> C
   - `crt71/...` -> CRT-SRC
   - naked inline asm / MASM / _emit -> transplant buckets
3. Spot-audits recompile cited sources from scratch and byte-compare again
   (2026-08-24: 6/6 VERIFIED — getqloc.c, _open.c, sbheap.c, fwrite.c,
   strdup.c, xtoa.c).

## Next levers (ordered by expected yield)

1. Finish v1/v2/v3 flagset compiles for crt71 sources and rejoin
   (~1,800 jobs pending) — expected new CRT-SRC matches/upgrades.
2. TU-cluster reconstructions of the D3D command-emitter family
   (pattern proven with FUN_10045ce0 at 100%).
3. Naming pass over FUN_ tail via ri-table/strings/xrefs, then honest C.
| 2026-08-25 (rounds 45-50) | **152** (55 C + 97 CRT-SRC) | 1,281 | import-thunk shim class discovered: 4x ff25 certified honest (RtlUnwind, D3D9, DDraw x2); FA40 63% plateau w/ full wall census; HANDOFF/progress finalized |
| 2026-08-26 (rounds 45+) | **156** (59 C + 97 CRT-SRC) | 1,282 | MISSING pool opened: R_GetFarPlaneDist, FUN_10013200, FUN_10012f40, flag-getter certified; rawdumps tree + HOW_TO_VERIFY added for multi-agent handoff |
