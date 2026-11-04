# Renderer checkpoint35 — authentic CRT formatter dependency evidence, 2026-09-26

Reused GLM's authentic Microsoft VC7.1 vsnprint.c (defines_COUNT_ then includes
vsprintf.c), not a handwritten imitation or retail-byte wrapper. Fresh pinned
CRT /O1 full flags in authcrt_6_oplcrm/inputs.json compiles to86 bytes at target
100f61b9. Instruction-aware strict checker passes and binds both calls correctly:
__output100fa4e6 and __flsbuf100fa320. WRONG-binding test fails as required.

IMPORTANT: original GLM referee reports95%, not100, so ZERO accepted/new credit.
Original pe_mask_for misses actual _output call operand+41; strict decoder finds
the call and masks/resolves it correctly. Original raw-byte scan is known unsafe
(prior strict-only cases excluded too). Do not silently replace referee or claim
the source impossible. Preserve exact reproducible disagreement for review.
No canonical GLM tool/inventory/source edited. Initial commentary describing a
match was based on the strict checker only; the later commentary explicitly
retracted credit once both checkers were run.

`python3 codex/renderer/check_crt_vsnprint.py` PASS evidence replay and expected
DEFER:all localCRT dependency hashes/source/object/image identity; strict body
and both actualbindings; negative wrong_output address; original score95 and
missing-call-field evidence. crt_vsnprint_packet.json explicitly credits0bytes.
This is CRT library-origin, not newly reconstructed custom engine code; SDK
source redistributability/independent acceptance not assumed.

Fresh authentic _flsbuf.c probe authcrt_1g0gftf0 compiles278 vs target281,DEFER.
No new matching progress. _output full-body proof from earlier CRT checkpoint
remains separately recorded, not rewritten or recounted. Deep FILE/IO dependencies
are not magically closed by authentic source compilation. No Wine CRT/runtime
test; path formatter's hostadapter test remains only that wrapper's source check.

Next return to genuine caller-group reconstruction and independently review
referee discrepancy before counting CRT86. Do not grind flags or accept strict
alone just to raise progress. Existing compiler/SDK sources/replay code reused;
no new dependency/framework. Goal still complete source plus whole-file identity.
