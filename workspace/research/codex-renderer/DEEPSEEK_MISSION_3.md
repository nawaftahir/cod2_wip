# Mission3 — bounded numerical conversion investigation

Read root/renderer contracts and BATCH_45_REVIEW.md. Own ONLY
`codex/renderer/scratch/deepseek_rounding_3/`; preserve missions1/2 unchanged.
Start from mission2 source/types in a new overlay. No other agent edits this TU.

Focus on the common conversion used by pixel callbacks, NOT another full-TU
flags sweep. Source `(int)(value +2^-30)` is not equivalent to target FISTP under
nearest rounding. Reviewer counterexamples are127.5 and1.75. Worker tolerance
must not be used as original-behavior proof.

1. Audit target1000f180 and water100107e0 conversion instruction sequences;
   distinguish float intermediate rounding, extended/double addition, x87
   control word and integer store. Investigate actual control-word setup in
   target startup and/or authenticated local source. Record unresolved runtime
   mode rather than presuming it.
2. Search local references for an authentic conversion helper/intrinsic pattern.
   Target bias is confirmed; its historical helper name is not. Any source-level
   assembly experiment must be separately labeled with target evidence and
   separate accounting, never called historical original source merely because
   it matches. No naked wrappers, byte emission or retail copying.
3. At most THREE new evidence-backed source/compiler experiments TOTAL; record
   source and generated instructions. Do not repeat mission2's failed flag probes.
   No claims of compiler impossibility from this budget.
4. Add exact arithmetic tests: signs, near-halves, halves,0/255 and finite
   clamp edges. Test rounding modes separately; validate the chosen source
   against a target-instruction or independently justified numerical oracle.
   No ±1 tolerance. Mocked Fresnel remains explicitly mocked.
5. If the conversion is resolved, apply only to this overlay's pixel source,
   compile once, compare affected bodies, and replay all existing image proofs.
   If not resolved, STOP with an honest evidence-rich DEFER, no unrelated scope.

Deliver REPORT.md+packet.json with exact commands, hashes, pinned toolchain,
fresh source/object proof, negative tests, per-function MATCH/DEFER, retained
regression, numerical oracle assumptions and new unique bytes (possibly0).
Actually execute tests; never hardcode success. No canonical edits/commits.
Return to Codex for independent review. Diagnostics from check_cubemap.py are
not an acceptance gate; strict relocation sites/types/bindings are required.
