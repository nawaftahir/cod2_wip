# Unary/swizzle reconstruction continuation — 2026-10-04

Status: complete source drafts, all UNMATCHED; ZERO accepted bytes.
No new V2, V3, CPU or whole-DLL identity claim. Existing accepted source and
the353882-byte aggregate remain unchanged.

References are full target decompiles plus literal summer-2004 SDK COFF bodies:
SimplifyUnary1841 at1008d966, member90/section183;
PropagateSwizzles_Unswizzle755 at10089055;
CompactRegisters922 at10098c39. Headers reuse the existing target-backed
program/argument/instruction prefixes, not speculative allocation layouts.

Compiler:4035 in pinned image
sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131;
SDK mounted read-only. Flags /O1 /Oy- /hotpatch /MT /Gy /d2QIftol.
Fresh compile handles all terminated exit0. Diagnostic probe_*.json reuse
codex30_constants/probe.py, SHA
95d68413ad4582c5da798955cff7b5f18484aceaed538972efb4544f4529f0dc.
The packets record current source/object hashes and DISCOVERY ONLY status.
Objects remain local, uncommitted. Literal lengths do not count as coverage.

## Actual new source and bounded attempts

- unary.cpp reconstructs the entire unary optimizer: flag propagation,
  constant math/folding and domain errors, producer-chain simplification,
  reciprocal/exp simplification through multiplication, and final remapping.
  Initial1741/1841 became1737/1841 after preserving the cached low flag bits,
  literal float comparison orientation and correct constant-pool operand.
  Current first difference7; frame14h rather than24h, registers/control-flow
  and encoded branches still differ. No partial-match credit.
- unary_remap.cpp normalizes the incoming argument ID in place and obtains
  the output pointer first. Still1737/1841, firstdiff7. Do not repeat.
- registers_cleanup.cpp reuses the existing complete CompactRegisters draft
  with one genuine shared cleanup path.929/922 firstdiff36. Unsigned retained
  count in registers_unsigned.cpp gives the same outcome.
- registers_group.cpp tests the original compaction draft with actual
  RemapArguments224, CompactArguments249 and CompactPool_End161 bodies in
  the same TU. The retained dtor32 and these callee bodies reproduce complete
  masked bytes but are already accepted elsewhere, so get ZERO extra credit.
  CompactRegisters remains933/922 firstdiff36. This real caller/callee test
  does not prove matching is impossible; it rules out that specific grouping.
- unswizzle.cpp reconstructs the full alias-ring search, ancestor validation,
  distance scoring, best-vector selection and copy-instruction fallback.
  An initial redundant validation form853/755 was removed; the retained
  direct found-component control flow is757/755 firstdiff7, frame44h vs3ch.
- unswizzle_control.cpp uses target comparison orientation, link-before-
  relative capture and early success-copy handling.756/755 firstdiff7,
  frame40h vs3ch; remaining register/stack/branch differences are genuine.
  Equal or nearly equal length does not establish matching bindings or bytes.

## PINNED facts worth keeping

SimplifyUnary AddArgument loads the constant-pool ID from this+78h. In this
verified access prefix that is poolIds[1], NOT poolIds[0] at74h. The initial
draft operand was corrected before any acceptance request. Original Error
sites push instruction->node(+3ch), program this and exact code/string pairs:
4002/indefinite logarithm,4003/imaginary square root,
4005/indefinite arcsine,4006/indefinite arccosine. Return values are ignored.

The unswizzle helper treats argument+34h (named origin in the reused prefix)
as the next link of its alias ring. It compares writer index against insertion
index and intentionally skips score contribution when writer==0, not~0u.
Fallback uses AddInstruction(identity token,~0u,~0u), Instance(original),
AddArgument(pool ID at88h,register counter,component,0.0), preserves parent
link/relative fields, splices the alias ring, then moves the new instruction.
Do not silently add bounds guards or repair these literal behaviors here.

Next useful action: inspect complete remaining register/CFG differences, not
another broad random flag sweep. These are source-backed drafts suitable for
continuation, not clean/canonical source or reconstructed historical TU proof.
