## Latest batch

Allocator clean CI41900093450 passed and the source was merged into gfx/main.
R_GetRigidTransform1001ee70/399 now passes both local referees and retention:
definition-level noinline reproduces the real outlined ABI. Its arithmetic is
unchanged. Rigid/model/skinning native fixtures pass; missing/unverified body
negatives reject in both guards. New coverage must come from clean CI.

Root src now includes two additional complete snapshots:r_dvars and r_splitscreen.
Frozen evidence and source hashes are in proof/verified_source_20261102/manifest.json.
No additional code bytes are credited for copying already verified files.
The empty flare TU is not promoted under the snapshot's unique-raw-hit rule.
Current-TU accounting now includes independently binding-certified short bodies;
that is an announced counting correction, not reconstruction progress.

Cached-skin command retains16-byte bone alignment and common input captures;
its254-byte draft still differs in register allocation, so ZERO credit.
All other caller/noinline/ownership/leaf probes were restored; see TRIED.md.
The shader needs FNClEX and stack-layout work. Original compiler rejects
_clearfp as an intrinsic. Seven /QIfist conversion/storage probes all emit
QWORD rather than the target DWORD. No new assembly or conversion flags retained.

Next: inspect the fresh gfx/recon clean CI head; land only if green. Merge in
any generated gfx/main meter before starting the next source cohort. Do not
repeat failed attributes, selector spellings or the recorded rounding probes.

# Renderer active checkpoint - 2026-11-05

Owner resumed reconstruction. Continue toward50% pure C/C++ inventory coverage,
then whole-file identity. The new transform batch awaits clean CI before landing.
All work belongs in cod2_wip; old dev/gfx is not a build dependency.

## Locations and authority

- Work: cod2_wip/.worktrees/gfx-recon, branch gfx/recon.
- Confirmed: cod2_wip/gfx, branch gfx/main.
- Partial source: workspace/work/src. Verified snapshots: root src/.
- Read CLAUDE.md, docs/STATUS.md, KNOWLEDGE.md and TRIED.md first.
- CI-generated ledger/meter.json is the published authority. Never hand-edit it.
- Main shared dashboard changes are already pushed; it rebuilds after successful gfx/main CI.

## What actually passed

Baseline:118475/253580 pure C/C++ bytes,729 bodies (46.720956%).
Copier1002b790/82: now118557 bytes,730 bodies (46.753293%).
Its source reads cached->xsurf/triIndices before baseVertIndex. Both referees,
regression,29 actual cache routes and four retention negatives pass.
Clean CI41898613267 passed on gfx/recon; this change was landed on gfx/main.
Canonical publication run41899333256 was still running when this handoff began.

Additional allocator1002acd0/215: local total118772 bytes,731 bodies
(46.838079%), a total +297 C/C++ bytes this session. Direct indexed freelist
accesses replace a retained head pointer, reproducing the late ESI save and
unlink register order. Both local referees/regression and29 cache routes pass.
Its clean CI must pass before landing. This is NOT yet confirmed page credit.
Both bodies are permanently pinned in check_checkpoint.py and regression.py;
missing/unverified rows are rejected by both tools.2525 protected extents pass.
Evidence:workspace/work/proof/cache_{indices,allocator}_20261105_warm_bind.json,
the corresponding negatives.json, and nov05_cache_*_checkpoint.json.

40 existing assembly-bearing bodies/10151 bytes remain excluded in full.
Root src/ remains10 verified snapshots/61 functions; no partial file was promoted.
50% needs8018 additional verified pure C/C++ bytes after the allocator is accepted.
The denominator is provisional inventory, not whole-DLL completion.
Whole-file same-offset equality remains238607/1851392; SHA/GPU remain unfinished.

## Metrics added

CI derives current_source_tus_* from every emitted cmp row and its actual binding.
Local count:43/112 current source TUs have every emitted body verified, including
libraries. Two common.obj basenames are ambiguous and excluded from verified count.
This is NOT proof of complete historical TUs. Empty objects get no automatic credit.
Positive/negative checks run inside write_meter.py; standalone:python3 tools/tu_metrics.py.
The page now displays verified C/C++ bodies and current emitted-body-verified TUs.

## Retained draft and next leads

Sun settings10028cd0/826 now byte-matches after pinning the blind-fadein dvar
pointer load after prior stores.144 actual sun routes pass. Binding is blocked
by Material_Register145/144, then Material_LoadBinary183/171 and fixup dependencies.
ZERO credit for this draft or dependent callers. No assembly was added.
Material explicit-else/size probes and shader pointer-add/declaration-order probes
failed and were restored; read TRIED.md before any new experiment.

Next inspect the cached-surface caller1002b7f0/193: current195 differs in loop
comparison direction and allocation-failure block layout. It also requires
R_SkinStaticModelCachedCmd, which is still unmatched. Do not count callers early.
The successful allocator source is retained; never restore the pre-copier backup.

## Resume safely

1. Check latest gfx/recon and gfx/main Actions runs and their exact head commits.
2. If the allocator work branch passes clean CI, merge it into gfx/main from gfx/.
   Push only with existing owner authorization; let gfx/main CI publish the meter.
3. Fetch its generated meter commit into both worktrees before reporting numbers.
4. Use one physical local build:workspace/build/codex_boundsoutside_1016_02.
   Compiler-visible /w/scratch paths and TU/link order must remain unchanged.
5. Local inputs:DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004,
   GFX_IMAGE=cod2-gfx-ci-local:20261104; anchor resolves from cod2_wip/binaries.
   make check is the clean gate. For failed probes set exact GFX_PROBE_SYMBOL to
   stop before expensive full binding checks. Successful probes still run all gates.
6. Local generated evidence is not a clean CI receipt. A write_meter.py 0 replay
   checks counters only; it does not establish a fresh build. Do not report it as one.

## Old repository and backups

Owner clarified deletion means old GitHub nawaftahir/gfx ONLY; local dev/gfx stays.
Old remote may be retired: all168 master commits and freeze/research branches are
preserved in cod2_wip. PRIVATE cod2-gfx-ci package is linked to cod2_wip, not gfx.
Keep nawaftahir/cod2_wip and that private package. No remote was deleted by Codex.
The original four migration backups agree between .migration-backups/gfx-20261104
and D:/cod2_anchor_backup/gfx-20261104-cod2wip-migration.
An unnecessary full backup was stopped after clarification; its name ends
INTERRUPTED.tar.gz. It is NOT a verified backup. Ignored old scratch was not fully
included in the original source-only backups, so local deletion remains unapproved.
No old source/index was modified or deleted. The354 staged old files stay intact.
