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
