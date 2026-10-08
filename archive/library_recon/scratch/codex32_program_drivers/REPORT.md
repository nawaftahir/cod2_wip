# Program drivers — 2026-10-03

Clean source: ../../src/codex_shader_program_drivers/drivers.cpp.
Two complete definitions: Link10093c0c/91 and Optimize10098fd3/638, total729.
Vectorize and all register-allocation experiments remain separate drafts.
Access prefixes describe confirmed SDK89/90 fields, not historical full classes.

## Completed local gates

Fresh clean V2 session57280: complete SDK/source/retail boundaries, typed
bindings and negative tests PASS. Both instruction-aware scores100; original
raw Link95 is retained, not reported as100. Its terminal jump at offset86 is
bound to SDK-private DeadLinkRemove1008ba48, with exact preceding pops/load.
The named terminal edge is validated independently, not masked as internal code.

Fresh V3 session78976 ended PASS/exit0:628 private linked source matches,
all626 preceding matches retained, no losses. The image links without/FORCE.
Selector removes265 distinct/285 physical genuine source definitions from the
SDK dependency. Opaque dependencies and metadata receive zero source credit.

Fresh CPU session31345 ended PASS/exit0:1284 full-output original/source
comparisons, zero differences,954 successful compiles and330 diagnostic cases
per side. All three packet input sets independently rehashed current.

## Historical failures / fixes

- Initial generic boundary gate assumed every method endedRET and every jump
  stayed within its body. Link is an actual typed SDK tail call. The precise
 91-byte Link edge/epilogue is now checked; all other boundary gates retained.
- Initial V3 found hashes stale after draft source edits. Allocation experiments
  moved into separate codex32_program_allocation; fresh V2/V3/CPU then replayed.
- Initial CPU invocation lacked its compiled harness object. Fresh pinned-image
  compile_clean_test.sh built both real executables; subsequent tests pass.
- First inherited V3 dispatch inspected the older program_order image and
  correctly rejected Link's SDK ownership. The new wrapper uses the existing
  pinned flow proof with an explicit new driver RUN and helper baseline.
  Source ownership, exact bytes and every retained table/binding gate now pass
  in the NEW image. The older image is not substituted for regression proof.

## Aggregate and next work

Full replay session43146 is running, log aggregate.log. Do not count its
expected729-byte gain before terminal PASS/exit0. Confirmed345916/1089680
=31.744732%;32% needs2782 more accepted bytes. After this gain passes,2053
remain. Continue source work in the separate allocation scratch while all
driver proof inputs remain frozen. No whole-file identity or GPU claim.

Superseding result: session43146 completed terminal PASS/exit0. The full
disjoint audit accepts729:346645/1089680 =31.811633%;32% needs2053 further bytes.
All source and proof inputs remain current. The running statements above
describe the earlier state, not a live audit.
