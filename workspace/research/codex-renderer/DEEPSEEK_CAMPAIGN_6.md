# DeepSeek campaign 6 — reconstruction bulk pass

Owner objective: readable C/C++ rebuilt into the checksum-identical CoD2 1.0
renderer. Overall reviewed coverage starts at 57,746 / 1,089,680 bytes (5.30%).
20% means 217,936 bytes, requiring 160,190 additional unique accepted bytes.
That is an objective, not permission to count unverified source or promise a date.

## Ownership and mandatory reading

Write ONLY `codex/renderer/scratch/deepseek_campaign_6/`. Create it if absent.
Read root AGENTS.md and glm/AGENTS.md completely, then this file,
NEXT_SESSION.md, LABEL_CORRECTIONS.md, FAST_ROUTE.md, DEEPSEEK_CAMPAIGN_5.md,
batch_existing.py, verify_jpeg_reference.py, check_shape.py, audit_legacy.py,
and the verifier relevant to the family being changed.

All other folders are read-only, especially `cod2engine`, `renderer-progress`,
GLM sources/tools/inventory, prior DeepSeek missions and Codex JPEG experiments.
No commits, pushes, cleanup, ledger edits, installs or external workers.
Codex owns JPEG; do not reconstruct, modify or recount JPEG in this campaign.
No client/server/modtools work. SDK CRT source remains read-only licensed input;
do not place it in a redistributable source tree.

Anchor SHA256:
4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6

Pinned compiler image:
sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694

## A. High-yield reuse first — 90 CRT C candidates

Execute Campaign 5's A–C contract in your OWN campaign-6 folder, not its folder.
Use `baseline_p9txpec2/results.json` as the candidate seed. The 88 previously
shape-matching rows represent about 14,752 inventory bytes, NOT new progress.
Compile each distinct source/flags combination once; inspect all emitted symbols
so a seed row does not hide additional real C functions in that object.
Resolve dependencies, complete data and imports in connected source families.
Never spend this entire mission on sprintf: its strict/original-referee
disagreement remains DEFER unless both unchanged gates genuinely pass.
Separate SDK-derived C proofs and their redistribution restrictions from engine
source. Keep already reviewed CRT coverage separate; do not add it to the baseline.

## B. Engine cohort — 288 address candidates, grouped by real source family

Seed: `DEEPSEEK_CAMPAIGN_6_QUEUE.tsv`. It contains the 288 largest non-thunk
inventory entries below 0x10041600. Sizes are provisional, labels are not
signatures and rank is NOT an instruction to start with the hardest function.
The region/rank filter is a scheduling hint, not proof that every entry is engine
code or that extents are correct. Classify each before assigning provenance.

Triage all 288 once using target instructions, decompile/xrefs and local source
references. Write `triage.tsv`: address, audited/provisional size, source family,
available reusable source, known overlap, dependency/ABI blocker, priority and
specific action. Do not dump 288 decompilations or label every row DEFER without
inspection. Reuse evidence for shared families rather than repeating analysis.

References: `refrences/opencod2/src/PC/gfx_d3d`, KisakCOD, Mac 1.3 debug names/types,
GLM `src/f`, `src/tu` and target decompile. These are not byte-match authorities.
GLM asm_gen/masm/masm2 and naked-wrapper bodies are NOT reconstructed C.
Do not translate instruction listings into `_emit`, inline-assembly functions,
retail arrays, marker branches, binary-copy helpers or post-link patches.

Select up to 12 coherent families with the best reusable-source + expected-byte
yield + dependency-closure prospects. Record your ranking BEFORE drafting.
Prefer a source group containing several substantial functions over tiny leaves
or one giant untyped dump. Reconcile real caller/callee groups in the same TU
where custom register conventions require compiler context. Keep only signatures,
fields, constants and indirect callback interfaces confirmed by target evidence.
Uncertain facts get PINNED/SUPPORTED/HYPOTHESIS labels; never ship HYPOTHESIS.

Perform substantial source work in every selected family that has sufficient
evidence. Aim to attempt at least 48 non-overlapping engine functions across
those families, not 48 spelling/flag variants. If fewer are safely implementable,
give address-specific evidence for that shortfall instead of inventing source.
Each family gets one initial source build and at most three new evidence-backed
source/compiler/context experiments for a SHARED mismatch cause. Persist attempts;
then DEFER that cause and move to an independent family. A register difference
alone does not establish impossible compiler matching or LTCG.

## C. Acceptance gates — exact, not approximate

For every proposed match, require all of these:

1. Fresh MSVC object from the recorded source/header set and pinned image. One
   build per changed TU/flags; reuse that fresh object for all its comparisons.
2. Complete function bounds checked against decoded instructions and the target,
   not only the old inventory length. Reject prefixes, padding and overlaps.
3. UNCHANGED original `match_gfx.py` referee prints 100% MATCH; independent
   instruction-aware `check_shape.py` also passes. Either disagreement is DEFER.
4. Exact relocation site/type maps; symbol plus addend destinations established
   by evidence. Inspect complete referenced data/import/callback interfaces.
   Explicitly report unverified indirect interfaces; a masked match cannot prove
   them. No guessed binding merely because a target address makes the test green.
5. For every bound symbol, deliberately perturb its destination and show the
   strict checker rejects it. Tests must exercise the current actual source.
6. Retained family matches still pass using the changed object. Explain every
   lost match; do not silently drop it from the packet or roll back its evidence.
7. Real small behavioral fixtures cover boundary/error cases where evidence
   defines behavior. Label mocked services, shared-source oracles, host precision
   assumptions and original-DLL execution separately. No 'runtime verified' claim
   from mocked fixtures, tolerant pixels or shared-formula tests.

Struct/union-by-value returns belong in .cpp. Use /O2 /Gy for engine unless
target-backed bounded testing establishes another variant; authentic CRT uses
its recorded /O1 configuration. Compiler warnings about ignored flags are not
successful experiments. Keep custom ABIs intact; do not use assembly shims to
force a standalone match. Genuine assembly is outside this mission's credit.

## D. One automated packet — make independent review cheap

Deliver in the owned folder:

- `src/`: actual new engine C/C++ and confirmed headers; not just reports.
- `triage.tsv`, `attempts.jsonl`, `REPORT.md`, `packet.json`, build/test logs.
- `replay.py`: one CLI that fresh-builds changed TUs, replays BOTH existing
  referees, negative-binding tests, retained regressions and real fixtures.
  Reuse existing helpers; no new framework or changes to shared verifiers.

Required packet fields: anchor_sha256, image, status, input file hashes including
all used headers, exact compiler/test commands, source/object hashes, per-address
audited bytes/symbol/source/status, bound symbol+addend/site/type evidence,
data/import/ABI evidence, negative-test results, regression results and attempts.
Provide separate rows for MATCH, DEFER and IMPLEMENTED_UNMATCHED. Every successful
row must point to its raw logs; do not hardcode totals or generate success flags
without executing gates. Replay must exit nonzero for any claimed match that fails.

Accounting: unique addresses and non-overlapping byte ranges; deduplicate against
existing JPEG/dependency packets, all reviewed image/engine packets and previous
DeepSeek reviews. Report existing accepted, proposed NEW engine C, proposed NEW
CRT C, and unmatched implemented source separately. If baseline membership is
uncertain, mark ACCOUNTING_PENDING and provide evidence instead of adding bytes.
Only Codex's independent replay/acceptance changes the reviewed percentage.

Stop after the bounded cohort/family pass, return ONE combined packet, and say
'Return this to Codex for independent review.' Honest partial results are valid;
do not stop at a plan, a few tiny existing functions, or a made-up 20% claim.
Do not ask the owner to route each small function. Use local evidence and continue
independent families when one is blocked; ask only for an actual authority gap.
