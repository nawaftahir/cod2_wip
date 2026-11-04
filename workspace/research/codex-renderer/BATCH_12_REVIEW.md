# Renderer checkpoint 12 — integrated JPEG boundaries, 2026-09-26

## Final successful packet (supersedes intermediate numbers below)

The one-TU __forceinline experiment succeeded: preserved scratch/jpeg_inline_bits
changes only emit_buffered_bits' compiler hint. Fresh baseline_jpeg_yd16dq0p
matches emit_eobrun183 AND all five prior jcphuff functions (six/1,219B), including
the separately emitted45-byte emit_buffered_bits. Thus no original body is lost.
Empty INLINE and __inline probes did not change the156-byte mismatch; their
source identities are recorded in their runs but the final overlay has changed.

check_jpeg_dependencies.py now validates both complete overlay hash sets and
the pinned image, uses the new jcphuff object instead of the old one, and replays
all functions through both checkers. No union of stale variants or duplicate
function credit. The original BGR source remains preserved.

Final PASS: **76 distinct functions/25,573B**,36 callee-shape sites and86 complete
source-data sites; **zero unresolved direct relocations**. All76 functions have
fully accounted direct sites. Both32-bit fixtures and prior65 regression pass.
Indirect callback ABI/semantics, independent review and V4 are still NOT proven.
__forceinline's matching result is evidence of one working source formulation,
not a claim about historical source spelling or compiler settings.

Next: review indirect callbacks, collect full unmatched TU/function boundaries
before more compiler experiments, and broaden renderer engine clusters/link
integration. This does not mean the entire JPEG library or DLL is complete.

## Earlier intermediate proof

The same omitted-tail problem also affected initial_setup at0x1004cfa0:
inventory510 bytes stops after loading the input controller for its second
exit. Full body516 ends RET at0x1004d1a3, followed by CC padding to0x1004d1b0.
The existing fresh BGR object matches all516 bytes against BOTH checkers.
No source modification, prefix acceptance or GLM inventory edit needed.

check_jpeg_boundaries.py now replays four complete bodies/1,867B, hashes every
source/header/object, verifies source table bytes and terminal RET/padding.
check_jpeg_dependencies.py reuses those proofs only for their exact fresh run
and applies explicit asserted extents in memory. It adds the four source
definitions without duplicating prior rows; all65 older regression entries
remain required. Every function is still replayed against both checkers.

Latest successful command:
`python3 codex/renderer/check_jpeg_dependencies.py`

- 75 distinct source-body candidates/25,390B.
- Direct sites:32 CALLEE-SHAPE-SUPPORTED,86 COMPLETE-SOURCE-DATA-SUPPORTED,
  one UNRESOLVED.
- 74 functions/25,131B have no unresolved direct relocations.
- Actual selected-source32-bit scan and BGR color fixtures pass.
- jpeg_dependency_packet.json and baseline_jpeg_ux9623q1/dependency_packet.json
  contain the integrated full-body proofs.

The only unresolved direct call is emit_restart's emit_eobrun helper.
Source156 versus target183 is a real difference: target inlines the correction
bit loop, including gather_statistics guard and per-bit emit_bits calls, where
the current object calls emit_buffered_bits. Source and target symbol emission
are already inlined identically. This is PINNED instruction evidence, not a
newly invented ABI or permission to remove a target function.

No canonical promotion, independent acceptance, indirect-callback closure or
whole-DLL identity. Coverage is still separately accounted library research.
The restricted sandbox rejects32-bit fixture execution (SIGSYS) and Docker
socket access; approved outside-sandbox reruns passed. Neither failed attempt
was counted as a successful build or regression.
