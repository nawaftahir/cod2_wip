# SDK90 address, output and sequence reconstruction

Drafts only; no source credit from this discovery cohort. Two matched bodies
were extracted into the separately gated clean register_split.cpp cohort.
All other complete source bodies remain here even when they do not match.
probe.py reuses the existing hash-pinned full-section discovery checker and
rejects an object older than its source. Source/object hashes and exact first
differences are recorded in probe_address_registers.json after fresh builds.

PINNED: CArgument at28 is a double sequence coefficient;40 is its sequence
base cache;54 is firstRead,58 lastRead,5c readCount. CompactOutputs tests54,
not58. Corrected the draft after checking the literal target displacement.
Compiler shapes must not be inferred from the opaque prefix field names.

SimplifyAddresses772: complete literal/MOV/add-relative folding recovered.
Initial782; flattened pointer-slot assignments and reordering prerequisite
loads produce779, still unmatched. No original source-sized body is discarded.
Array bounds are pool+8; FA7 diagnostic precedes80004005. Rounding uses zero
when caps6c has01000000, otherwise0.5. Lazy ReadWriteInfo and RemapArguments
ignore their return values as in the original. Original1 means unchanged.

CompactOutputs696: complete reverse MOV/output merge recovered; draft694.
Only opaque60..70 metadata is copied, not74. ReadWriteInfo ignored, instruction
token/input/output counts cleared only after all source/output eligibility
checks. Bitfield/cached-opcode expression changes did not solve allocation.

MulSequence221: complete ordinary C++ recursion matches the fresh SDK object.
SplitRegisters586: complete ordinary C++ pass matches after literal comparison
operand order was restored. Both were extracted for independent full gates.

AddSequence650: cached base40 and coefficient28, recursive MOV/NEG/ADD and
constant MUL recovered. Opposite-order ADD retries preserve cache effects.
Initial goto-form668; structured initial cases652. Chained output assignment
and swapped ADD input declarations did not improve652. Do not repeat unchanged
forms or excuse the remaining instruction differences as compiler impossibility.

RangeSequence1548: complete MOV/MUL/MIN/MAX and zero/one CMP producer recovery
authored directly from SDK90/87 and its typed edges. Fresh initial1558 differs
at12. CMP recognizes negation or addition containing a negated operand, visits
the second ADD input first, and allocates a zero literal for unary negation.
Four bound pointers remain positional, not guessed semantic domain types.
Invalid shape returns80004005; failed literal allocation returns8007000e.
No validation absent from the original was invented for producer indices.

CompactLiterals_Remap241: scan uniform values first, slot order3,0,1,2;
mixed rows try(j+i)&3. Count0 still enters uniform scan. The current controls
preserve ordered/unordered floating comparisons; same byte length alone never
establishes a match. Initial241 differed36; shared goto form239 differed53.
Latest direct success-loop attempt is tracked by the fresh probe, not presumed.
The241-byte direct/goto success forms reproduced all operations but outlined
uniform copy after the mixed loop. A genuine allSame flag, structured if/else
and inner copy followed by break recovered the original layout: fresh241/241
full masked equality including relocation fields. Full acceptance gates remain
pending; this discovery is not coverage credit and did not modify the live audit.

VectorizeLeft_PerComponent1006: complete scalar extraction, same-register
output grouping and four-wide compatible/conflict-free packing reconstructed
from SDK90/91. Initial989 differs81. Scalar/non-scalar Instance results are
ignored as in the target; AddInstruction failure returns8007000e. Existing
outputs are consumed with~0 sentinels. When four or fewer remain and neither
flow control nor output pool1000 constrains packing, both compatibility gates
are disabled. Complete source remains a draft until both byte referees agree.
No textbook rewrite or optimization is substituted for the original algorithm.
Output pointer lifetime plus a local20-bit instruction-field update recovered
the full1006 bytes; XOR-temporary form1012 was not accepted. Extracted with
literal remap into the clean output_groups.cpp module for all acceptance gates.

VectorizeLeft_DotProduct1221: full paired-register grouping, dot temporaries
and four-way summation/reduction authored. Initial1220; source-level branch
ordering, direct conditional calls and individual cached register fields
recovered1221 except loop-init scheduling. Guarded unsigned-positive do-loop
recovered all bytes. Formatted normally and freshly recompiled; match remains.
Preserve the second-input sentinel check in pair counting and14/18 destination
metadata. This completed body is also in the clean output_groups.cpp cohort.

VectorizeLiterals1370: complete fixed-pool placement, duplicate remapping,
literal group packing/fallback and final pool conversion authored fromSDK90/215.
Initial1409 differed10; uncounted draft, no original body is discarded. Allocation
is16*(fixed-register count +2*instruction count) bytes, memsetff. Pool100 with
C00 flags is fixed;800 pools reserve slots without shifting argument indices.
Target's fallback tail memset executes only when count<4. No new input clamps
or repaired error handling: IdentityRemap/RemapArguments and fallback packing
return values are ignored as in the target. Success sets detailedInfoDC=1.
Corrected tail-fill guard and the MSVC71 nonstandard for-scope warning by using
one explicitly declared lane variable. Fresh1413/1370 still differs10; no credit.

SquishInstructions1240: complete lane-duplicate merging and compacted group
strides recovered from SDK90/209. IdentityRemap precedes processing. Only
high-nibble classes1..4 qualify; output pools1020 are protected. One through
four input groups compare remapped argument IDs, preserving~0 sentinels.
Two-group symmetric instructions also allow reversed input pairs. MergeArguments
is ignored-HRESULT and consumes the current output with~0. Outputs and input
lanes compact within old group stride first, then groups are packed to the new
stride. Full token low20-bit update/inputCount/outputCount follows. Unchanged
returns1; changed calls RemapArguments and returns0. Draft stays uncredited.
Direct local union width and shared lane counters both remain1241/1240;
sentinel conditional reversal fixes branch ordering but not the remaining
stack/register/SIB differences. No mask change or source-padding workaround.

MergeInstructions1199: complete hash-sort/equivalent-output merging authored
from SDK90/172 at1008c376. Hash multiply83f, opcode exclusions, two winner/victim
directions, firstRead54 ordering, remap-chain compression and repeated rounds
are target-backed. Initial1203; explicit helper-call sequencing1196. Original
helper calls have a defined observed order; relying on C++ operand-evaluation
order let the compiler reverse them. Ordinary named temporaries preserve it.
No claim of acceptance or compiler impossibility for remaining differences.

PropagatePredicates1462: complete backward propagation, predicate-depth trimming,
backup comparison and producer-order repair authored from SDK90/212 at1009698a.
Full argument storage is REQUIRED here, unlike earlier access-prefix views:
PINNED SDK89/19 CopyArgument at10086240 literally pushes80h to CArgument's
allocator before its default constructor. CArgument is128 bytes; the earlier
120-byte prefix must not be used for allocation. Two unknown tail words are
preserved as opaque fields, not invented semantics. Default constructor and
destructor declarations are genuine SDK typed edges; the original retains a
local object's lifetime even though the optimized body never uses its members.
Initial1468; straight opcode exclusions and bounded input-buffer iteration1459
before this full-size correction. Source remains scratch-only pending exact
byte, binding, boundary, negative, regression and fresh behavior proof.
Full-size correction restores the original9ch frame; current1459 differs25.
Guarded input-buffer iteration and predicate-depth reuse preserve target calls;
counter-slot lifetimes and one SIB operand order remain unmatched.

VectorizeLiterals retries: scalar copy/fill loops1374, first difference10;
shift-size memcpy/memset with positive-copy guard1400, first difference10.
Explicit (~caps17 &4)>>2 preserves target uniform-test operations. These are
unaccepted ordinary source attempts, never evidence for narrowing comparison.

CanVectorize_TraceMulAdd365: complete neg/MUL/ADD tracer authored; draft338.
ADD writes *offset += *scale * constant, not *scale. A nonnull scale gates the
operation; no fabricated null-offset guard. NEG doubles no values; equal ADD
inputs double scale. Preserve the original two-pass pointer advancement.
Literal target caches the first input ID before any scale/offset writes; that
alias-sensitive order is now explicit. Captured width gives356, cached pool
table350, still unmatched. The one transient undeclared-poolList compilation
was corrected in scratch and freshly rebuilt; no stale probe was accepted.

All compiler attempts use pinned4035 /O1 /Oy- /hotpatch /MT /Gy /d2QIftol.
Do not widen masks, alter ABI, insert padding or manufacture assembly wrappers.
The existing allocation retry report records unchanged pointer/SIB and counter
ordering experiments; originals were restored and freshly compiled/reprobed.
