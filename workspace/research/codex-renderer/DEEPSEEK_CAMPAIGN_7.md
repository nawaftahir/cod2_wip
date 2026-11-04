# Campaign 7 — actual engine reconstruction, not another certification sweep

Read root AGENTS.md, glm/AGENTS.md, DEEPSEEK_CAMPAIGN_6.md and this file fully.
Keep campaign6 unchanged. Own ONLY `codex/renderer/scratch/deepseek_campaign_7/`.
No cod2engine/renderer-progress/shared-tool edits, commits or pushes.
Use the campaign6 pinned anchor/compiler and unchanged two-referee gates.

## Correction to the previous delivery

Campaign6 was an audit/reuse packet, not the requested bulk implementation.
This mission must produce new readable engine C/C++ files and confirmed headers.
A manifest pointing at old sources does not satisfy source delivery. Do not spend
this campaign certifying CRT, recovered tiny leaves, or redoing the 288-row index.
Read-only existing source reuse is encouraged, but reconcile it to THIS target.

The objective remains whole-file identity and 20% reviewed coverage; the current
accepted baseline remains57746/1089680. A draft, report, successful host test or
worker self-certification does not change that baseline. Never promise or invent
the missing160190 accepted bytes.

## Fixed implementation queue

Use the target inventory to enumerate these groups, then follow their actual
callers/callees. Region membership is provisional scheduling, NOT a signature,
function name, source-family classification or boundary proof.

1. Material group:10016000 <= entry <1001d800. Inspect
   `refrences/opencod2/src/PC/gfx_d3d/r_material.c` and applicable shader sources.
2. World/load group:10001000 <= entry <1000aa00. Inspect r_bsp.c,
   r_bsp_load_obj.c, r_loadworld_new.c, r_light_load_obj.c and actual xrefs.
3. Buffer/render group:1002d000 <= entry <10033000. Inspect r_buffers.c,
   r_cmds.c and reference files agreeing with target callsites.

Start with substantial, source-supported functions and their dependency groups;
do not blindly attempt the single largest unknown body. Select 8 coherent TUs
from these groups, including their helper functions. Rank once by source reuse,
confirmed interface evidence and expected unique-byte yield, then IMPLEMENT.
Use the Mac debug-name/type oracle and Kisak only as structural evidence.
The actual target overrides all reference names, fields and algorithms.

Deliver actual source for at least48 distinct engine functions if evidence permits,
including at least12 bodies with audited target extents>=256 bytes. This is a
work-output target, not permission to invent48 implementations or matches.
Prioritize complete groups over trivial accessors. No naked assembly, `_emit`,
retail copying, post-link patching or fake ABI shims. No JPEG/image overlap.

## Investigate before deferring

'Needs caller/TU context' is the next task, not a completed DEFER reason.
For each selected TU: inspect real callsites and callee bodies, establish register/
stack arguments and return behavior, pin struct-field offsets and constants,
reconcile local references, then write the group together to reproduce compiler
context. Preserve confirmed facts in EVIDENCE.md with address/instruction or
reference citation. Never use address-named externs as evidence by themselves.

If a needed fact is genuinely unconfirmed after target/caller/reference inspection,
record the exact missing fact and checks attempted. Implement independent,
confirmed portions and move to the next TU. Do not speculate just to avoid DEFER.
Missing declarations or includes are build work, not a reason to abandon a family.
At most3 evidence-backed variants per shared compiler mismatch cause; record
actual diffs and attempts. No universal blanket deferral and no endless flag sweep.

## Build and prove the new source

Fresh-build EACH changed TU from campaign7 sources with the pinned MSVC image;
compile once and compare all emitted functions using that object. Record all
headers, compiler flags, image and source/object hashes. Engine /O2 /Gy is the
starting configuration; bounded /Oy- or .cpp experiments require evidence.

Keep campaign6's unchanged full-extent, both-referee, exact-relocation-map,
data/import/ABI, negative-binding, retained-regression and real-fixture gates.
Strengthen, never weaken, the worker replay:

- A repeated inferred address is CONSISTENCY_ONLY, not independent symbol proof.
  Establish a binding using target-backed identity/ABI, independently established
  source/callee identity or complete data/import evidence. Otherwise unresolved.
- Decoding to a ret/jmp alone is insufficient to prove a whole function extent.
  Audit control-flow targets, incoming references, neighboring entries and data/
  padding. Store evidence; do not silently override inventory lengths.
- replay.py MUST build the NEW engine source before checking it. A fresh dependency
  build followed by checks against old engine objects is not a fresh engine replay.
- Recompute totals from actual gates, unique addresses and non-overlapping ranges.
  Overlap uncertainty remains ACCOUNTING_PENDING, not new accepted bytes.

## Deliver one implementation packet

`src/` with new .c/.cpp/.h; `EVIDENCE.md`; `attempts.jsonl`; REPORT.md;
packet.json; raw build/referee/test logs; one minimal replay.py reusing existing
helpers. Include MATCH, IMPLEMENTED_UNMATCHED, and genuinely investigated DEFER
rows separately. Do not label implemented-but-unmatched source as verified.
Tests must call the real drafts, not replace their logic with mock stubs.
Do not claim original-DLL behavior from host/reference-oracle tests.

Execute a bounded pass over all8 chosen TUs before returning; do not finish after
triage or certification of old code. If the48-function output target cannot safely
be met, return the actual new source and exact per-TU shortfall evidence. A real
partial reconstruction is useful; another generic defer table is not completion.
Finish with 'Return this implementation packet to Codex for independent review.'
