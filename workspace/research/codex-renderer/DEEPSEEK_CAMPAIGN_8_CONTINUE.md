# Campaign 8 — finish the substantial reconstruction pass

Read DEEPSEEK_CAMPAIGN_8.md and its queue first; all gates and ownership remain
unchanged. Continue in scratch/deepseek_campaign_8 only. This is implementation,
not another planning/index pass. Preserve existing logs before new attempts.

## Review of current files — 2026-09-27

The eight-TU report belongs to campaign7_revision2, not eight accepted TUs.
Codex independently accepted only two new Locate functions, 186 bytes; the
WorldBounds match was already counted. Reviewed coverage remains 59513/1089680,
about 5.46%. No whole-file identity or release completion is established.

Current campaign8 contains one compiled primary, RB_ChangeState_1, unmatched:
reported target extent1420, object546; no binding or negative tests. Eleven
other primary rows are deferred. A counterpart not yet found is an outstanding
investigation, not evidence that reconstruction is impossible. The current
files are not a completed campaign8 packet.

## Execute in this order

1. Pin the complete bounds/control flow of 1003cc60 and 1003c430 from the DLL.
   Trace actual callers, address-taking and exports. Derive parameters and the
   cached-state global/type from instructions and agreeing references. The
   current546-versus1420 discrepancy requires body/extent/context investigation
   before cosmetic source variants. Do not assume either extent is correct.
2. Implement both real state-bit bodies plus the actual related callers and
   helpers. Test evidenced private/static linkage where applicable, retaining
   non-inlined functions where actual target calls require them. Match complete
   callers too; no invented wrapper, omitted prefix or forced register shim.
3. Continue the original12-primary pass and associated helpers, aiming for36
   distinct real implemented functions and at least12000 audited primary bytes.
   If an original candidate has genuinely missing facts after investigation,
   retain its exact evidence and select another source-supported candidate from
   the28-entry queue. Unknown names alone do not prevent target-backed source
   reconstruction. Unknown semantics/signatures must never be guessed.
4. Reuse each freshly built object for all comparisons. Group mismatch causes;
   at most3 evidence-backed experiments per shared cause. Persist full diffs,
   then move to another independent family instead of spinning on one near miss.
5. Complete real32-bit source fixtures, source/header/toolchain/object hashes,
   exact symbol/data bindings and per-binding negative tests for every claimed
   match. Retain prior matches in changed groups. No unresolved match credit.

## Fix the replay before claiming completion

Current replay.py builds the anchor path from HERE.parents[2], which resolves
under dev/codex rather than dev. Resolve the actual workspace anchor and verify
its pinned SHA. Do not modify the anchor or weaken its check.

A successful replay of an EXPECTED MISMATCH is only a reproduced mismatch,
not a successful reconstruction. Check subprocess exit codes and report distinct
matched/unmatched/blocked totals. Old campaign6 replay supplies regression only,
not new accepted bytes. Preserve unique evidence files for each attempt.

Deliver REPORT.md, packet.json, primary_work.tsv, EVIDENCE.md, attempts.jsonl,
actual source, immutable build/check/fixture logs and a working fresh-build replay.
Give one final packet after the substantial implementation pass. If budget stops
you earlier, explicitly label it INCOMPLETE with completed and remaining work;
do not call eight compiled files, twelve listed rows or a passing mismatch replay
mission completion. Never fabricate to satisfy a quota or percentage.

20% needs217936 accepted bytes, another158423 beyond the current checkpoint.
This campaign is a concrete increment, not a guaranteed20% result. No edits to
JPEG, client/server, CRT, canonical release/progress trees or Codex-owned tools.
