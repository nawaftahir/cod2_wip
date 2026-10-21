# Renderer progress

## Whole-file API wave - 2026-10-22

Work only in gfx. Source: `target/work/src/`. Plan: [WHOLEFILE.md](WHOLEFILE.md).
This is the sole current progress/continuation log. Update it instead of creating
new handoffs. Machine proof receipts and technical reference notes stay separate.

### Verified state

- Base source commit: `221cfa5`; workspace consolidation: `084b513`.
  Current authored C/C++: **100231/253580 bytes (39.526%)**
  against the SUPPORTED game inventory, not the entire DLL.
- Mixed C/C++ and authored assembly: 614 game bodies, 108018 bytes.
  Assembly is excluded from the C/C++ meter. This wave adds **359 C/C++ bytes**.
- All 820 previous protected extents retained; the stronger ratchet now protects
  **822**. Negative controls reject removal of either new body.
- All **59** source/audit fixtures passed in one batch, including the two new
  actual-source tests. No new assembly or relaxed referee.
- Current receipt: `target/work/proof/api_graph_checkpoint.json`. Current referees:
  `target/work/proof/latest/`. Layout: `target/work/layout/current.json`.
- **Whole-file retail SHA does not match. No release or runtime proof.**

### Actual whole-file work completed

- Restored the real BeginDebugFrame callback, API59 slot49:73 bytes accepted.
  It saves the original frame pointers, unlocks the original vertex cache when
  needed and switches to the embedded debug frame. Eight routing tests pass.
- Restored typed debug-frame storage and pinned its used offsets at compile
  time. Candidate .data virtual size grows from1248244 to3648180 bytes, versus
  retail6086100. This is genuine state, not padding; full original global size
  and final placement are NOT independently proved by the callback match.
- Restored shared view setup10025570:286 bytes accepted. This is needed by
  LOD-origin and scene submission.192 view/LOD behavior cases pass. The LOD
  callback itself remains unaccepted: a floating constant operand width differs.
- Restored four primary-proven empty API callbacks and the sun-reset wrapper
  for eventual GetRefAPI closure. These receive **zero new credited bytes**;
  they are not invented substitutes for missing implementations.
- Current candidate has154 temporary exports and still no GetRefAPI.54 of98
  written API slots now have accepted implementations. The real front door is
  **not implemented yet**; completing its actual callback graph remains first.
- Current .text virtual size436272 versus retail1089680. Raw same-file-offset
  equality is2.024909%; this is a layout diagnostic, NOT source completion.
- Retail debug metadata pins an age1 PDB at the original c:\\builds path. Our
  reused PDB has a different GUID and increasing age. These remain real SHA
  blockers, not hash fields to silently ignore or patch.

### Cleanup

One active source tree and one incremental build; no duplicate build created.
Superseded handoffs, duplicate status files, notes, claims and rules are saved
in `archive/docs_20261021/`, not erased. Old goals and paths are not instructions.
Required gate inputs are local in `target/work/proof/history/`; API evidence
and inventory are local in `target/work/proof/retail/`. Inactive entrypoints are
in `archive/legacy_entrypoints/`. Shared target/src headers remain required.
Unrelated staged work is preserved, not bundled into this cleanup. No push.

### Next work

1. Recover API59 GetRefAPI and the typed callback/caller graph. Retail has 108
   slots: 98 written callbacks, ten initial zeros.54 written slots have accepted
   implementations; unverified does not mean source absent. Use primary code
   and `target/work/layout/api_callbacks.tsv`; never guess signatures or stub bodies.
2. Replace temporary roots with genuine reachability as connected groups close,
   retaining all accepted extents. Candidate has154 exports and no GetRefAPI;
   retail exports only GetRefAPI. Recover TU/data/library ownership alongside code.
3. Complete missing real source and original dependency calls. Reuse exact
   VC7.1/Summer2004 libraries and correct upstream source, not library reversal
   for a counter. Resolve exact layout and metadata, then cold rebuild and smoke.

Same-object relinking already reproduced raw .text/.data/.reloc but changed
timestamp/debug/.rdata/whole-file SHA. This is a real reproducibility blocker;
no output patching or normalized hash may substitute for retail identity.

### Resume

From gfx: `sh target/work/tools/build.sh`. Use `--rebuild` only when warranted.
One output: `target/build/codex_boundsoutside_1016_02`; `target/work/build` is
a symlink, not a duplicate. No own builds remain running. Before retrying source
forms, read `target/work/ATTEMPTS.md` and archived NOTES.md. Do not repeat the
three recorded LOD syntax trials; investigate genuine compiler/caller context.
The shared view helper and debug callback now MUST survive every wave. r_bsp upload/init
and light-history drafts remain unaccepted: preserve them without counting them.
Do connected source work next, not another parser/report framework.

Anchor SHA256:
`4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`.
Latest candidate SHA256:
`438182a3a2bb5ad6bd59794b9592c78e53085fc737380f30cebb8d9b04d1e7e7`.

### Limits

No fresh independent cold rebuild or client/GPU smoke test for this checkpoint.
No reliable whole-project completion percentage or release date is established.
Renderer checks no longer need dev/codex, **but client/deepseek tools still use
codex/client/salvage_gemini/data/names_1.0.json**. Deleting that folder can break
those tracks; they were not modified here. No retail binaries/assets committed.
