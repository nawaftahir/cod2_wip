# Shader cleanup reconstruction — 2026-10-03

cleanup.cpp reconstructs PropagateMovs10089562/410 and
DeadLinkRemove1008ba48/406, SDK member90 sections98/168. New symbols were
checked against existing REVIEWABLE clean packets before promotion.

The first preserves grouped input widths while replacing known MOV aliases;
the second redirects dead outputs through new temporary arguments and copy
instructions. Argument44 and pool fields remain pinned opaque words, not
invented historical field names. The binary does not test AddArgument's
result here; no unrequested behavior fix was inserted into reconstruction.

Initial PropagateMovs409/410 differed: SDK's unsigned j>=count continuation
and source's j==count continuation generated different bounds/lifetimes.
The observed >= expression yields complete410 equality. Initial DeadLinkRemove
had the wrong source visibility (protected instead of private); mangling was
corrected from target/SDK signature before comparison. Its406-byte body first
differed at246: pinned poolIds starts at74, so offsets88/74 are indices5/0,
not6/1. The corrected ordinary source matches all406 bytes.

Clean source is ../../src/codex_shader_program_cleanup/cleanup.cpp, two complete
definitions /816 bytes. Clean V2 passes complete byte/binding/boundary/negative
checks. The first boundary gate honestly rejected DeadLinkRemove's final
backward jump: the checker now accepts only its exact name,406-byte full body,
jump to394 and decoded popedi/popsi/popbx/leave/ret sequence394..398. No bytes
are skipped. The first CPU fixture build was premature and failed because the
private runtime archive did not yet exist; it was genuinely rebuilt after the
private link, not claimed successful or waived.

Private V3 passes599 source matches retaining all597. Actual original/source
CPU fixtures pass1284 full outputs,954 successful compiles and330 diagnostics
per profile. Every recorded input hash is current. Aggregate inclusion remains
pending. SDK dependencies are not counted. Compiler/image/flags inherit the pinned
vectorization-helper integration; private signature and observed fields are
verified against the actual target, not reference guesses.
