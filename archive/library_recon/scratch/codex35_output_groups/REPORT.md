# Complete output-grouping / literal-remap source cohort

Local V2/V3/CPU PASS, three definitions/2468 instruction bytes. Aggregate
acceptance pending; the existing register audit8482 was not modified while live.
It exited1 at a legacy raw-score assertion on MulSequence. Replacement30276
includes both cohorts at aggregate.log after exact self-call diagnosis, without
altering source bytes or widening any comparison/binding rule.
Clean source: target/src/codex_shader_output_groups/output_groups.cpp.

SDK90/91 VectorizeLeft_PerComponent1006 at10088517: scalar decomposition,
same-register grouping, then compatible/conflict-free four-wide output packs.
Fresh original989 differed81. Capturing the original output pointer for the
first counting scan and using a genuine20-bit field update recovered1006.
Plain XOR temporaries produced1012; local bitfield union recovered all bytes.
No fake register convention, marker, padding or instruction transplant.

SDK90/92 VectorizeLeft_DotProduct1221 at10088905: grouped paired registers,
temporary dot products and four-wide reduction to the original destination.
Initial1220; source-level branch order, direct conditional calls and individual
cached register fields recovered1221 except one loop-initialization order.
An unsigned-positive guard plus guarded do-loop recovered the full body.
No original assumptions or input/output sentinel mutations were removed.

SDK90/103 CompactLiterals_Remap241 at100899b7: uniform slot order3,0,1,2;
mixed rows try(j+i)&3. Structured allSame flag/if/else preserves exact block
layout where earlier goto forms outlined the uniform-copy loop differently.
Count0 and unordered floating comparisons retain the target behavior.

Fresh pinned4035 build passes complete V2, both referees100, typed dependency
edges, relocation bindings, exact boundaries and negative tests. Two functions
end in literal jumps into earlier epilogues, not terminal ret instructions.
The first strict terminal-ret gate rejected PerComponent. Added exact
name+length+terminal-jump+destination+complete epilogue proof ONLY for these
two target bodies: PerComponent1006 jumps to161 (ret4 at165); DotProduct1221
jumps to40 (ret4 at44). All instructions and internal branches remain checked,
last-byte mutations still fail; no general boundary rule was loosened.

check_link.py passes647 matches, retaining all644 preceding source matches.
run_clean_test.py passes0 differences/1284 full shader/error/constant outputs,
954 successful and330 error cases in each profile. These are integrated CPU
comparisons, not a claim of direct coverage of every internal branch or GPU.
All three proof packet input sets independently rehashed current.
Selector284 distinct definitions/304 physical source replacements; retained
SDK/runtime code is an opaque test dependency with zero source credit.

Replay uses the existing pinned batch pipeline: build.sh; check_link.py;
compile_clean_test.sh in the compiler image; run_clean_test.py; then the full
coverage aggregate after its inclusion. No whole-DLL SHA/release claim.
