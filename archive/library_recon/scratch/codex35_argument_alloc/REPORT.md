# Argument allocation source batch — 2026-10-03

AddArgument356 and CopyArgument82 now pass clean complete V2, typed bindings,
literal boundaries and negative tests. V3 retains all647 preceding matches and
reports649. Fresh CPU replay passes1284 complete outputs, zero differences,
954 successes and330 errors on each side. All packet input hashes rechecked.
Full aggregate11516 is running; no new aggregate credit yet.
The compiler-generated CArgument deleting destructor32 is already accepted
at1006db35 by codex31_program and MUST NOT be counted again.

PINNED CArgument is128 bytes: SDK89/19 CopyArgument at10086240 pushes80h
to its typed allocator before default construction. A sizeof assertion guards
that full allocation layout. Unknown trailing fields retain neutral names.
AddArgument grows capacity by2 or400h, preserves failure ownership, and
classifies literal values with the target's ordered/unordered x87 behavior.
Literal-first zero/one comparisons and value-minus-integer fabs recover356.
CopyArgument's explicit null-allocation and failed-initialization returns
recover82; combined conditions, result/else and shared labels did not.

All canonical/progress gates remain mandatory. Draft V2 passed --draft while
source stayed in scratch; then the complete module was promoted to target/src
and freshly rebuilt through clean V2/V3/CPU. SDK/CRT dependencies remain uncredited.
The existing strict selector is reused; only the already verified duplicate
CArgument COMDAT is coalesced after full literal32-byte and typed-edge equality,
with both object identities recorded. No duplicate coverage or ABI exception.

PINNED runtime conversion: libcmt archive686 defines __ftol as a complete
39-byte relocation-free section. SDK89/10 AddArgument's typed call recovers
the retail address and requires complete equality to the authentic CRT body.
The archive hash remains pinned; this external code earns zero source credit.

PINNED SDK87 defines CArgument's default constructor as the complete three
literal bytes mov eax,ecx; ret at10085bf1. The generic binder skips this tiny
external body, which initially made CopyArgument and two accepted callers
fail transitively. The retained table helper now certifies the full original,
linked and SDK bodies, owner, typed call and wrong-target negative test before
supplying a zero-credit locator. No binding check is waived.

Normal COMDAT selection must retain program.obj's existing deleting destructor.
The new object is ordered last in LFLAGS after the included makefiles expand
their immediate flags. Appending XL after inclusion drops the object from the
link because closed.mk captures LFLAGS with :=; that failed trial is not proof.
All clean V2/V3/CPU gates subsequently passed with the final link flags.
