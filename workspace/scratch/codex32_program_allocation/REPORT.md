# Register/phase source experiments — 2026-10-03

Drafts only; no source coverage credited. Kept separate from hash-frozen
codex32_program_drivers and codex32_program_diagnostics proofs.
Existing accepted helper bodies copied for genuine compiler context receive
zero additional credit. Compilation/body length alone is not a match.

## Replayed bounded attempts

- CompactRegisters initial929/922; first difference36 is a branch destination.
  Real cleanup preserves the failing result, including the target's double-End
  after an End failure. Shared goto, embedded cleanup label and explicit per-call
  returns give929/935/933 variants, none matched. Genuine RemapArguments224 and
  CompactArguments249 definitions remove a real ECX reload but do not match
  the new caller. All duplicate helper matches remain uncounted.
- SeparatePhases initial557/564. Direct short-circuit Begin/Process matches
  the target's TEST branches. Count-driven reversal gives564/564. Separate
  loop-index lifetimes fix the stack-slot differences and leave first diff479:
  store/shift scheduling before the final reversal. Reordering initializers
  and using a separate left iterator do not solve it. No memory padding.
- MoveTex initial346/360. Scoped loop counters, cached first phase, reversed
  final-swap assignment and initializer order preserve346. Computing phase
  before the instruction pointer produces367/360, still mismatched.
- Process is a copy of the existing genuine read/write context group. Both
  remaining differences are SIB operand order at4a5/4dc;1715/1715 is not equality.
  Pointer-add spelling, int/unsigned-long producer index and explicit integer
  address expression do not solve it. The integer-address experiment stays
  unaccepted and must be removed in favor of readable array access if continuing.
- Vectorize267 still swaps the constant-one/counter registers. Unsigned-long
  counter and const mode leave the same diff33. Target constant-one is EBX,
  counter EDI (not the inverse); inspect actual target bytes before retrying.
- Four diagnostic/name functions match discovery506 and are now separately
  clean/proved in codex32_program_diagnostics. This scratch file also contains
  unmatched Vectorize and cannot add duplicate diagnostic credit.
- New SwizzleRegisters536 and VectorizeLeft_Special422 are reconstructed from
  complete SDK90 disassembly. Initial bodies530/536 and407/422 did not match.
  The latter target snapshots outputCount and first-output ID before calls;
  preserve that observed alias behavior rather than rereading them each time.

## Target facts

PINNED SwizzleRegisters ignores ReadWriteInfo/SwizzleParameter results; the
general swizzle's group stride is outputCount, not the scalar-width local.
Symmetric operands sort by earliest producer, then pool flags, pool ID/index.
PINNED Special copies the instruction before testing shared-register outputs;
allocation failures8007000e, Instance results ignored. It creates a move opcode
100 and temporary pool5 arguments, then instances them and explicitly copies
predicate/sense/flags. A successful per-component transform clears move.token.
All names/signatures/access offsets come from the target's typed SDK90 member;
class prefixes are access views, not recovered historical allocation layouts.

## Continuation discoveries — not aggregate credit

- First-output initialization before cursor fixes Special422. Swizzle536
  needs pinned stack storage: volatile opcode plus distinct nonvolatile group
  counter matches; a volatile counter itself differs165. Both are separately
  clean and fully proved in special/literals520 and swizzle536 cohorts.
- Literal allocator98 matches and is in the520 cohort; CompactLiterals621/675
  remains unmatched. Same-length536/422 previously did not mean equality.
- VectorizeLeft newly reconstructed from the complete569-byte SDK90 driver:
  emitted572, then574; reversed loop spelling, opcode load order and captured
  pool counter do not match. No fabricated helper ABI or credit.
- DelayOutputs was reconstructed from all648 target bytes. Initial619; cached
  output-group cursor/common-exit experiment640, both unmatched. Proper stdcall
  CompareRegister142 is an already accepted external dependency, no duplicate
  credit. Do not turn its declaration into an undefined static method.
- Argument helpers: scalar Initialize110/112 and CanRead100/106 remain draft.
  Copy Initialize188, Instance61, IsCombine35, Depth49, SameRegister83,
  IsUsedTogether45 and CompareHash46 all match fresh discovery507. They are
  extracted separately for strict full gates; discovery adds0.
- Process indexed-as-pointer spelling and byte-address spelling both retain
  the two SIB differences; no acceptance. Separate's reused left counter still
  differs479; explicit byte-offset reversal worsens570/564 and is not promoted.
  Keep ordinary readable index accesses when returning to those drafts.

Final isolated save: ordinary Process array indices and Separate reversal were
restored, freshly compiled and reprobed. Process still1715/diff1191, Separate
564/diff479; no false freshness packet. IsCombine35 matches but duplicates
earlier source ownership and was rejected by the selector; GenerateCode61
matches and replaces it in the now fully locally verified seven-method533
cohort. Scalar Initialize110/112 and CanRead100/106 stay scratch-only.
