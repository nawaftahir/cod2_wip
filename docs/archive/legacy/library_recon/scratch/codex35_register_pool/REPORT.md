# Register-pool source draft checkpoint — 2026-10-03

Status: **target-backed C++ draft / zero aggregate credit**. Source includes
SDK member90 compaction and phase methods; source grouping here is an
experiment, not recovered historical TU provenance. No body-length number
below is a matched-byte count. No V3 or CPU acceptance is claimed for this TU.

Anchor DLL SHA256:
4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6.
Summer2004 d3dx9.lib SHA256:
3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88.

## Fresh build and discovery

Compiler session78912 completed exit0. Probe session26898 completed exit0.
Latest source SHA256 cb61e102a37de360a6f0cd1bf00b4e29e98c5b8c21d581115236a9a81dc80df4.
Object SHA256 fa004837eeb2a5a07960eb7e373e51acee317f80820234261e4f4bea9af4c8e6.
Discovery packet SHA256303174c3eb818073149aacc98e172b1c60e9423dc484630b392ffffb995505d5.

| Definition | Emitted / target length | First difference | Full masked equality |
|---|---:|---:|---|
| Origin | 33 /33 | none | yes; already accepted elsewhere |
| SeparatePhases_Phases | 178 /178 | none | yes |
| Map | 249 /254 | 8 | no |
| ReadCount | 386 /387 | 42 | no |
| WriteCount | 38 /38 | none | yes |
| Write | 47 /47 | none | yes |
| End | 161 /161 | none | yes |
| CompareRead | 65 /65 | 30 | no |
| CompareReadIndex | 56 /56 | none | yes; discovery only |
| CompareReadStable | 33 /33 | none | yes; discovery only |
| Process | 1715 /1715 | 1191 | no |
| Begin | 1739 /1739 | 555 | no |

The four helpers424 were extracted into a separate clean candidate TU with
full V2 proof and CPU checks; its V3 metadata dispatch remains unresolved.
Do not credit them twice or extend that clean file with unmatched methods.
Stable's relocation masks do not prove its mismatching CompareRead callee.

## PINNED target facts

Program caps[17] offset6c, caps[18]70, poolData pointerbc. Compaction record
size100,25DWORDs; read record size12 (instruction0,predicate4,sense8).
Record offsets and corrected target quirks are persisted in ../../../NOTES.md.
Names of opaque fields are descriptive. Initial caps[9] use was incorrect;
correct17 yielded full SeparatePhases_Phases178 equality.

ReadCount uses do/while with no incoming sentinel guard. Map's predicate
comparison uses current sense against other predicate, as observed, even
though it appears unusual. Process repeats its preference scan from the start
of the input list for every group; this is not permission to fix the target.

All comparator symbols are static/internal in the authentic SDK object.
CompareRead65 uses private EAX-context/ECX-first/EDX-second ABI; source uses
genuine same-TU static stdcall compilation rather than a fabricated fastcall
declaration. Index and Stable are address-taken stdcall callbacks. Preserve
caller/callee coherence; masked jumps alone do not establish their bindings.

## Attempts already made

ReadCount initial while395 corrected to do/while386; opcode positive,
negative and switch forms all remain386/387 and differ42. Target special
branch precedes the ordinary branch; draft branch placement remains different.
Map caching read count reduces256 to249, but caching instruction did not solve.

Begin initial reverse flag boolean produced1737. Signed shift extraction of
caps[17]<<1 then >>31, target comparison orientation and final allocation
branch restore1739. First difference555 remains: width/j dead-slot lifetimes
and copy/macro pointer operands differ. Reordering declarations, shared width,
bitfield/token-mask access, explicit count-offset locals and inline Origin
forms did not solve. baseline_1739.cpp preserves the source preceding those
latest lifetime attempts and the later Process/callback additions.

Process and all three callbacks were reconstructed from the inspected full
target/SDK bodies and compiled as a group. First Process difference1191 is
the next bounded source/control-flow experiment; do not restart random flag
sweeps or infer impossibility from equal-length register differences.

## Replay

From gfx/: pinned compiler image, SDK read-only:

    docker run --rm --network none -v /home/nawaf/cod2/test/dev/gfx/target:/work -v /home/nawaf/cod2/test/dev/sdk/sum2004:/dxsdk:ro -w /work sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 sh scratch/codex35_register_pool/compile.sh

From gfx/target:

    python3 scratch/codex35_register_pool/probe.py register_pool.obj register_pool.cpp

Flags /O1 /Oy- /hotpatch /MT /Gy /d2QIftol. Discovery reuses the existing
hash-pinned full-section probe and checks source/object freshness. No object,
SDK library or DLL belongs in git. No bytes are credited from this discovery.

## Superseding continuation checkpoint — 2026-10-03

Current source1ff63e37853f603bf38a6e1c7303339fbfb391ebe3e22ff65385db3eaf7ed0c1,
current fresh probe1087e7d59116e5fcd31fe5bddc4408bd4eeef887659b4ec957d2bf84b62b7d9f.
The earlier source/probe hashes above belong to the preceding committed save.
The draft now implements full target-backed Score630 and recursive Read712,
including literal diagnostic text and CNode pointer at instruction3c. This is
the complete source algorithm, not just declarations or copied object bytes.

Fresh default compiler87168 and its probe completed exit0. Current emitted
Score647/630 differs7; Read691/712 differs38; Process1715/1715 differs1191;
other method sizes/discoveries are as above. Every one remains scratch-only.
There is no typed/linked proof for the two discovery-equal callbacks.

Changing both reverse Process loops from a truth test to unsigned >0 fixed
the target unsigned branch encodings. Decoded whole-body comparison now shows
only two differences: target/source SIB operand order at4a5 and4dc. Pointer
addition forms did not change them. This is NOT permission to accept equivalent
encodings, change an ABI or emit bytes. Source-level equality remains required.

Other bounded attempts actually compiled: shared negative-return goto gives
CompareRead65/difference30 unchanged; result-variable form gives63/difference9.
Refreshing a scalar input temporary gives Process1717/difference1000; reverted.
Refreshing a pointer temporary gives1715/difference1173; reverted to the closer
direct-index form. Unsigned-long local producer counter does not fix the two
remaining SIB differences. No compiler-impossibility claim follows.

Score first draft645/difference7; target-backed cached first-pass register
offset, count guard and intrinsic memset initialization produce current647.
Read bestScore/bestReg declaration ordering still gives691/difference38.
These attempts are neither matches nor accepted bytes.

A real /G5,/G6,/G7 compile/probe batch completed. /G5 and/G6 retain the pointer
temporary Process1715/difference1173 and current Score/Read sizes. /G7 changes
Map246, ReadCount383, Begin1733 and callback ABI/code and still fails Process.
All three packets pin source878cabff43af3b2b9b9d9886fc258efd6ac9939323194df757a41eae98594c35;
that exact tested source is retained as baseline_cpu.cpp. They are historical,
not current-source proof. Do not repeat that CPU sweep or silently promote it.

PINNED SDK90: Score uses4 components unless argument flag80000000, cap17
scalar/vector flags4/2 or producer IsSpecial require1. Cost fields penalize
copy mismatches in bits29+, parity preference bit28 and component search bit24.
Read failure on committed allocation calls cdecl Error(node3c,4004,
"program too complex; there are more active values than registers") and
returns80004005. Noncommitting failures still return80004005 without logging.
Read's linked-list insertion compares lastRead58 and links through remap30;
relative8 allocation recurses with no preference/explicit binding. Names remain
descriptive; known target behavior must not be fixed during reconstruction.

The extracted clean4/424 helper cohort now passes all local V2/V3/CPU gates.
Its sole full aggregate is live; keep these larger drafts separate from its
frozen inputs. Owner requested a checkpoint pause, so no new source batch is
started after the current audit. On resume inspect actual first differences,
not another random flag sweep. The35% goal and whole-file identity are unfinished.

## Latest corrected snapshots and resumed work

The helper audit completed PASS, accepting424 bytes. Owner revoked the pause
and resumed through32%. Larger drafts still contribute zero bytes.
Current primary source20918231b2f30a84d3a2ba2edb372448b0a7c6f5897e355d22af94df4ba3933f;
probe b731619d139fd5f135e14a7ddede6f2874dc78d520a03adec4302c7f0de5323e.
Group source d579347e0b65680385d06be918522aa805c64121d899f31c33c18abf3292aad9;
probe64e3038be168e3e383313bd4704b4f8f62d76000d7756ab707555e772a08b9a0.
Both fresh compiles95332 and probes60766 completed exit0. Group contains four
genuine read/write definitions that retain their previous1112 bytes; duplicate
credit is zero. They do not resolve Process's two SIB operand-order differences.
Primary pointer refresh gives Process1715/diff1173; group direct array gives
1715/diff1191. Both corrected Error to SDK-protected cdecl (IAA...ZZ).
This does not change masked bodies but restores the real callee identity.
Further source work belongs in codex32_program_allocation, not frozen helper
or driver packets. No equivalent-encoding or compiler-impossibility waiver.
