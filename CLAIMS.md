# Claims — one owner per file

Add a row before editing a TU; delete it when merged. Stale (>24 h, no commit) = free.

| File | Owner | Since | Note |
|---|---|---|---|
| target/scratch/codex35_crt/*, target/scratch/codex35_sdk/* | Codex | 2026-09-30 | Remaining original CRT source batch and SDK source-family discovery toward 35%; no canonical edits or opaque-library coverage |
| target/scratch/codex30_parser/* | Codex | 2026-09-30 | Target-backed shared SDK parser source batch; no canonical edits, no opaque-library credit |
| target/scratch/codex30_constants/* | Codex | 2026-10-01 | Target-backed SetTyped family batch; private drafts only until whole-body proof |
| target/src/codex_parsers/* | Codex | 2026-10-01 | Complete source-matched SDK parser family; private link and CPU regression; independent clean module |
| target/src/codex_shader_constants/*, target/scratch/codex30_reads/* | Codex | 2026-10-01 | Completed exact read/version module; private link retains 403 and accepts 415, 2,000 CPU comparisons; no canonical edits |
| target/scratch/codex30_cpp/*, target/scratch/codex30_crt_o2/* | Codex | 2026-10-01 | Bounded original runtime source surveys; discovery only, no accepted gain |
| target/src/codex_shader_assembler/*, target/scratch/codex30_assembler/* | Codex | 2026-10-01 | Complete assembler helpers and node source; private link and CPU regression, no canonical edits |
| target/src/codex_shader_support/*, target/scratch/codex30_support/* | Codex | 2026-10-01 | Allocator and diagnostic source, shared declarations with owned assembler TU; private link and CPU regression |
| target/scratch/codex35_lexer/* | Codex | 2026-10-01 | Complete SDK tokenizer family reconstruction toward 35%; drafts and diagnostic objects only until all gates |
| target/src/codex_shader_lexer/* | Codex | 2026-10-01 | Seven accepted source methods / 1037 code bytes; 523 linked matches retain all 516; 9976 CPU comparisons and full aggregate pass |
| target/scratch/codex35_preprocessor/* | Codex | 2026-10-01 | Larger typed SDK directive/macro family source batch; scratch only, zero source credit until full acceptance |
| target/src/codex_shader_preprocessor/* | Codex | 2026-10-01 | Accepted 25 bodies / 2199 bytes; 548 linked matches retain all 523, 12259 CPU comparisons and fresh aggregate pass |
| target/scratch/codex35_compiler/* | Codex | 2026-10-02 | Eight clean methods accepted / 757 bytes; five unmatched drafts preserved, 20355 clean CPU cases pass, canonical/reference trees untouched |
| target/src/codex_shader_compiler/* | Codex | 2026-10-02 | Accepted eight-method source / 757 bytes; clean V2, 556 matches retain all 548, 20355 clean CPU comparisons and full aggregate pass |
| target/scratch/codex35_compiler_layout/* | Codex | 2026-10-02 | Target-backed matrix-layout predicate batch; drafts only, compiler and canonical proofs preserved |
| target/scratch/codex35_evalrange/* | Codex | 2026-10-02 | Isolated large range evaluator; bounded scratch-storage/loop-context experiments, accepted compiler inputs unchanged |
| target/scratch/codex35_expression/* | Codex | 2026-10-02 | Complete expression-emission source and CPU differential check; private draft, no credit before all gates |
| target/src/codex_shader_compiler_clip/*, target/scratch/codex35_clip/* | Codex | 2026-10-02 | Timed20-minute integration of matched clipping/callee cohort; previous accepted compiler inputs preserved |
| target/scratch/codex35_lerp/* | Codex | 2026-10-02 | Bounded target-backed interpolation control-flow/source-context batch; earlier proofs unchanged |
| target/scratch/codex35_compiler_types/* | Codex | 2026-10-02 | Actual recursive type-flag propagation and compiler diagnostics; reuse existing pinned declarations |
| target/scratch/codex31_instructions/* | Codex | 2026-10-02 | Instruction initialization source batch; preserve accepted copy/predicate modules |
| target/scratch/codex31_crt/* | Codex | 2026-10-02 | Authentic CRT source /O2 batch, strict full-body proof and no opaque-library credit |
| target/src/codex_shader_compiler_types/* | Codex | 2026-10-02 | Clean source type/diagnostic cohort; private V2/V3 integration, previous clean TUs unchanged |
| target/scratch/codex31_program/*, target/src/codex_shader_program/* | Codex (paused) | 2026-10-02 | Accepted12 methods/2663 bytes: clean V2,571 linked matches retaining559,1284 full CPU outputs and full aggregate PASS; optimizer stays scratch |
| target/scratch/codex35_program_flow/*, target/src/codex_shader_program_flow/* | Codex (paused) | 2026-10-02 | Accepted four clean methods/945 bytes: V2,575 linked matches retaining571,1284 full CPU outputs and full aggregate PASS; six mismatched drafts excluded |
| target/scratch/codex35_program_lifetime/* | Codex | 2026-10-02 | Resumed bounded opcode/pointer lifetime alternatives; baseline609/614 unmatched, accepted inputs untouched |
| target/scratch/codex35_program_varying/*, target/src/codex_shader_program_varying/* | Codex | 2026-10-02 | Accepted IsVarying59/MarkVarying614: clean V2,577 linked matches retain575,1284 integrated CPU outputs and full aggregate PASS;35% goal stays active |
| target/scratch/codex35_program_pruning/*, target/src/codex_shader_program_pruning/* | Codex | 2026-10-02 | Accepted408-byte StripUniform: clean V2,578 linked matches retain577,1284 full CPU outputs and fresh full aggregate PASS |
| target/scratch/codex35_program_strip/*, target/src/codex_shader_program_strip/* | Codex | 2026-10-02 | Accepted643 bytes: clean V2,V3/583 retain578,1284 full CPU outputs and fresh full aggregate PASS |
| target/scratch/codex35_program_rw/* | Codex | 2026-10-02 | DUPLICATE of four accepted codex31_program methods; zero new credit, strict selector blocked duplicate ownership, scratch retained only |
| target/scratch/codex35_program_outputs/* | Codex | 2026-10-02 | CompactOutputs1008d26d/696 target-backed reconstruction, absent from existing clean packets; draft only until full gates pass |
| target/scratch/codex35_program_sort/* | Codex | 2026-10-02 | HeapSort10086920/279 target-backed source; unique against existing clean packets, draft until complete gates pass |
| target/src/codex_shader_program_sort/* | Codex | 2026-10-02 | Matched279-byte ordinary C++ heap sort; clean V2,V3/584 retain583,1284 full CPU outputs pass; aggregate pending |
| target/scratch/codex35_program_duplicates/*, target/src/codex_shader_program_duplicates/* | Codex | 2026-10-02 | Complete681 bytes: CompareValue79,CompareRegister142,RemoveDuplicateArguments460; clean V2,V3/587 retain584,1284 CPU outputs pass; aggregate running |
| target/scratch/codex35_instruction_duplicates/*, target/src/codex_shader_instruction_duplicates/* | Codex | 2026-10-02 | Complete1106 bytes: two static helpers415/44 and optimizer647; clean V2,V3/590 retain587,1284 CPU outputs pass; aggregate running |
| target/scratch/codex35_delay_outputs/* | Codex | 2026-10-02 | DelayOutputs648 real source draft currently626/648; no local acceptance, CPU claim or aggregate credit |
| target/scratch/codex35_predicate_merge/*, target/src/codex_shader_predicate_merge/* | Codex | 2026-10-03 | Complete226 bytes: clean V2,V3/592 retain590,1284 CPU outputs pass; aggregate pending. Chain256/258 remains scratch only |
| target/scratch/codex35_program_coalesce/*, target/src/codex_shader_program_coalesce/* | Codex | 2026-10-03 | Complete699 bytes accepted in full aggregate; V2,V3/595 retain592 and1284 full CPU outputs pass. Vectorize267 stays unmatched scratch |
| target/scratch/codex35_vectorize_helpers/*, target/src/codex_shader_vectorize_helpers/* | Codex | 2026-10-03 | Complete346 bytes accepted in full aggregate; V2,V3/597 retain595 and1284 CPU outputs pass. Two helpers stay unmatched scratch |
| target/scratch/codex35_program_cleanup/*, target/src/codex_shader_program_cleanup/* | Codex | 2026-10-03 | Complete816 bytes accepted in full aggregate; V2,V3/599 retain597 and1284 CPU outputs pass, exact named shared-return tail checked |
| target/scratch/codex35_instruction_order/*, target/src/codex_shader_instruction_order/* | Codex | 2026-10-03 | Complete660 bytes accepted in full aggregate; V2,V3/603 retain599 and1284 CPU outputs pass, private callback and typed recursion proof |
| target/scratch/codex35_transform_order/*, target/src/codex_shader_transform_order/* | Codex | 2026-10-03 | Nine complete methods885: clean V2,V3/612 retain603 and1284 full CPU outputs, current hashes; aggregate pending, ReverseInsts excluded |
| target/scratch/codex35_transform_driver/*, target/src/codex_shader_transform_driver/* | Codex | 2026-10-03 | Complete Apply1129: clean V2,V3/613 retain612 and1284 full CPU outputs, current hashes; aggregate pending, all helper inputs frozen |
| target/scratch/codex35_predicate_order/*, target/src/codex_shader_predicate_order/* | Codex | 2026-10-03 | Complete comparator573: clean V2,V3/614 retain613 and1284 full CPU outputs, current hashes; private callback literal/storage/bounds proof, aggregate pending |
| target/scratch/codex35_program_order/*, target/src/codex_shader_program_order/* | Codex | 2026-10-03 | Complete828-byte ordering and seven generated definitions/962 total; clean V2,V3/622 retain614 and1284 CPU outputs pass, current hashes; aggregate pending |
| target/scratch/codex35_transform_bubble/* | Codex | 2026-10-03 | Target-backed Bubble1170 and isolated ReverseInsts74 source group; drafts only, all live audit inputs frozen |
| target/scratch/codex35_register_pool/*, target/src/codex_shader_register_pool/* | Codex | 2026-10-03 | SDK90 register-pool scheduling cohort; target-backed drafts and strict fresh proof only, other workers' inputs unchanged |
| target/scratch/codex35_pool_helpers/*, target/src/codex_shader_pool_helpers/* | Codex | 2026-10-03 | Four complete pool/phase helper candidates424 in isolated full-proof/link/CPU pipeline; larger register-pool draft excluded |
| target/scratch/codex32_program_drivers/*, target/src/codex_shader_program_drivers/* | Codex | 2026-10-03 | Target-backed optimizer/vectorization/link/phase driver cohort for32% checkpoint; isolated source and strict byte/binding/link/CPU gates |
| target/scratch/codex32_program_allocation/* | Codex | 2026-10-03 | Isolated target-backed register/phase experiments; never edit frozen driver proof inputs |
| target/scratch/codex35_address_registers/*, target/scratch/codex35_register_split/*, target/src/codex_shader_register_split/* | Codex | 2026-10-03 | Register807 and output2468 bytes aggregate-accepted30276; active full optimizer/predicate/address drafts remain uncredited,35% goal active |
| target/scratch/codex35_output_groups/*, target/src/codex_shader_output_groups/* | Codex | 2026-10-03 | Three complete source bodies2468 accepted by aggregate30276 PASS/exit0;647 linked matches retain644,1284 full CPU cases, post-audit hashes current |
| target/scratch/codex35_argument_alloc/*, target/src/codex_shader_argument_alloc/* | Codex | 2026-10-04 | Accepted438 disjoint bytes in completed aggregate11516, retained by8159; V2,V3/649 retaining647 and1284 CPU outputs; existing destructor32 excluded |
| target/scratch/codex35_validation/*, target/src/codex_shader_validation/* | Codex | 2026-10-04 | Accepted Validate811 in completed aggregate8159; clean V2,V3/650 retain649 and1284 CPU outputs pass; current identities |
| target/scratch/codex35_pool_reads/*, target/src/codex_shader_pool_reads/* | Codex | 2026-10-04 | Accepted ReadCount387 in completed aggregate8159; clean V2,V3/651 retaining650 and1284 CPU outputs pass; current identities. Unused private classifier41 has zero credit |
| target/scratch/codex35_intrinsic/* | Codex | 2026-10-04 | Read-only Ghidra research export, no source credit; in-memory SDK type hypotheses, original shared analysis database untouched |
| target/scratch/codex35_emit_args/*, target/scratch/codex35_predicate_states/*, target/scratch/codex35_shader_comments/*, target/scratch/codex35_continuation/* | Codex | 2026-10-04 | Checkpointed unmatched target-backed drafts and bounded attempts; ZERO added coverage, continuation details in codex35_continuation/REPORT.md |
| target/scratch/codex35_shader_comment/*, target/src/codex_shader_comment/* | Codex | 2026-10-04 | ACCEPTED231-byte public parser: V2,V3/652 retaining651 and1284 compiler/324 direct CPU cases pass; cold aggregate17239 PASS/exit0, total353882/32.475773% |
| target/scratch/codex35_unary/*, target/scratch/codex35_semantics/output_*.cpp | Codex | 2026-10-04 | Active source reconstruction: unary optimizer1841 and bounded parser control-flow attempts; scratch only, zero credit until full gates |
| target/scratch/codex35_shader_conversions/*, target/src/codex_shader_conversions/* | Codex | 2026-10-04 | Ten clean callbacks696 pass V2,V3/662 retaining652 and640 CPU cases; cold aggregate5151 live, no global credit yet |
| target/scratch/codex35_shader_buffers/* | Codex | 2026-10-04 | Four scratch callbacks308 pass V2 and256 CPU cases; private linked regression and clean promotion unfinished, zero global credit |
