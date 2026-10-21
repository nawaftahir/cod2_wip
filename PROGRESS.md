# Renderer progress

## Checkpoint - 2026-10-21

Work only in gfx. Source: `target/work/src/`. Plan: [WHOLEFILE.md](WHOLEFILE.md).
This is the sole current progress/continuation log. Update it instead of creating
new handoffs. Machine proof receipts and technical reference notes stay separate.

### Verified state

- Source commit: `221cfa5`. Authored C/C++: **99872/253580 bytes (39.385%)**
  against the SUPPORTED game inventory, not the entire DLL.
- Mixed C/C++ and authored assembly: 612 game bodies, 107659 bytes.
  Assembly is excluded from the C/C++ meter. Cleanup adds zero code credit.
- All 820 protected source/library extents retained on the latest relink.
- 55 actual-source fixtures passed as a batch; two new API/layout checks passed
  separately. Four relevant checks passed again after relinking.
- Receipt: `target/work/proof/wholefile_checkpoint.json`. Current referees:
  `target/work/proof/latest/`. Layout: `target/work/layout/current.json`.
- **Whole-file retail SHA does not match. No release or runtime proof.**

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
   slots: 98 written callbacks, ten initial zeros. 53 written slots have accepted
   implementations; unverified does not mean source absent. Use primary code
   and `target/work/layout/api_callbacks.tsv`; never guess signatures or stub bodies.
2. Replace temporary roots with genuine reachability as connected groups close,
   retaining all accepted extents. Candidate has 152 exports and no GetRefAPI;
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
forms, read `target/work/ATTEMPTS.md` and archived NOTES.md. r_bsp upload/init
and light-history drafts remain unaccepted: preserve them without counting them.
Do connected source work next, not another parser/report framework.

Anchor SHA256:
`4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`.
Latest candidate SHA256:
`b779f9d3f034bd9fa993f528a5c0a6700666c642f45b59878e21e92e65310e68`.

### Limits

No fresh independent cold rebuild or client/GPU smoke test for this checkpoint.
No reliable whole-project completion percentage or release date is established.
Renderer checks no longer need dev/codex, **but client/deepseek tools still use
codex/client/salvage_gemini/data/names_1.0.json**. Deleting that folder can break
those tracks; they were not modified here. No retail binaries/assets committed.
