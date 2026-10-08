# Claims — one owner per file

Add a row before editing a TU; delete it when merged. Stale (>24 h, no commit) = free.

| File | Owner | Since | Note |
|---|---|---|---|
| target/src/codex_shader_nodes/*, target/scratch/codex35_nodes/* | Codex | 2026-10-01 | Accepted typed SDK node source, private closed-link and CPU proof; canonical unchanged |
| target/scratch/codex30_assembler/* | Codex | 2026-10-01 | Target-backed assembler nodes and semantic methods; private drafts, zero credit until all gates pass |
| target/scratch/codex30_support/* | Codex | 2026-10-01 | Target-backed SDK allocator and diagnostic-source batch; drafts only until full proof |
| target/scratch/codex30_token/* | Codex | 2026-10-01 | SDK CParse tokenizer source reconstruction; private source, no canonical edits |
| target/src/codex_shader_instructions/*, target/scratch/codex30_instructions/* | Codex | 2026-10-01 | Matched SDK instruction copy and shader profile helpers; independent proof/link |
| scratch/library_sources, scratch/library_runs, tools/build_library_reference.py | Codex | 2026-09-27 | Official IJG6b version/flags batch; SDK inspection read-only |
| scratch/stl_sort_context, tools/build_stl_sort.py, tools/check_stl_sort.py | Codex | 2026-09-27 | VC7.1 sort template instantiation/binding probe; no invented callbacks |
| tools/cmp.py | Codex | 2026-09-27 | Last MAP function must end at virtual code extent, not raw section zero padding |
| scratch/model_surface_reference | Codex | 2026-09-27 | Reuse opencod2 XModelReadSurface; target-backed prefix/vertex layouts only |
| scratch/model_surface_wide_weights | Codex | 2026-09-27 | Bounded local count-width probe, no interface/layout changes |
| scratch/model_surface_unrolled | Codex | 2026-09-27 | Target-backed four-blend loop plus remainder, reference reader retained |
| scratch/model_surface_order | Codex | 2026-09-27 | Target tile-store ordering and signed initial bone comparison |
| scratch/model_surface_allocation | Codex | 2026-09-27 | Shared allocator and target-visible index reloads |
| scratch/sdk_math_reference | Codex | 2026-09-27 | SDK header-defined math instantiations, discovery only |
| scratch/xsurface_reference | Codex | 2026-09-27 | opencod2 vertex extraction/transfer group; target726-byte body mislabelled in GLM |
| scratch/xsurface_countdown | Codex | 2026-09-27 | Target-backed extraction countdown loops only |
| scratch/xsurface_counter_width | Codex | 2026-09-27 | 32-bit bone compare and cached weight countdown |
| tools/check_ten_percent.py, SOURCE_STATUS.md, HANDOFF.md | Codex | 2026-09-28 | Deduplicated 10% source audit and clean-tree visibility |
| target/scratch/codex_math_15/* | Codex | 2026-09-28 | Private com_math match batch; do not edit Claude's verified/src |
| target/scratch/codex15_drawgroups/*, target/scratch/codex15_material/*, target/scratch/codex15_sun/* | Codex | 2026-09-30 | Private no-/FORCE renderer source probes; verified/src untouched |
| target/scratch/codex15_cubemap/* | Codex | 2026-09-30 | Private R_CubemapLighting call-ABI probe; verified/src untouched |
| target/scratch/codex15_cell/* | Codex | 2026-09-30 | Private R_CellSurfaces register-schedule probe; verified/src untouched |
| target/scratch/codex15_xsurface/* | Codex | 2026-09-30 | Private Kisak Buf_Read template source probe; verified/src untouched |
| tools/codex15_bindcheck.py | Codex | 2026-09-30 | Private bounded one-past-array binding probe; canonical referee untouched |
| target/scratch/codex15_crtinput/* | Codex | 2026-09-30 | Authentic CRT input.c flag-cohort probe; external-source accounting only |
| target/scratch/codex16_crt/* | Codex | 2026-09-30 | Original CRT source batch and complete-section discovery toward 16%; no canonical edits |
| target/scratch/codex17_crt/* | Codex | 2026-09-30 | Original-source batch expansion; preserve all previous packets and canonical source |
| target/scratch/codex_rendercmd_15/* | Codex | 2026-09-28 | Private render-command scheduling probe; no edit to Claude's verified/src |
| target/scratch/codex_rendercmd_noinline_15/* | Codex | 2026-09-28 | Private target-backed R_ConvertColorToBytes caller-boundary probe |
| target/scratch/codex_rendercmd_rotate_15/* | Codex | 2026-09-28 | Private target-backed float-rounding probe for rotated pic |
| target/scratch/codex_short_cmp.py | Codex | 2026-09-28 | Five-byte thunk discovery probe; preserves historical cmp.py packet hash |
| target/scratch/codex_closed_op.mk | Codex | 2026-09-28 | Private renderer /Op flag sweep; canonical closed.mk untouched |
| target/scratch/codex_rotate_vector_15/* | Codex | 2026-09-28 | Private RotatePointAroundVector source-order probe; Claude tree untouched |
| target/scratch/codex_internal_abi_15/* | Codex | 2026-09-28 | Private LTCG internal-call ABI probe for renderer state routines |
| target/scratch/codex_buffer_tu_12/* | Codex | 2026-09-28 | OpenCOD2 buffer TU reuse and whole-image match scan |
| target/scratch/codex_state_tu_12/* | Codex | 2026-09-28 | Private state/log TU coalescing probe for MSVC LTCG/IPRA codegen |
| target/scratch/codex_state_static_12/* | Codex | 2026-09-28 | Private internal linkage probe for state/log LTCG call conventions |
| target/scratch/codex_qparse_12/* | Codex | 2026-09-28 | Private target-backed parser call-boundary probe; Claude tree untouched |
| target/scratch/codex_state1_12/* | Codex | 2026-09-28 | Private target-backed depth/stencil state reconstruction; Claude tree untouched |
| target/scratch/codex_sunparse_12/* | Codex | 2026-09-28 | Private source-level parser callee-boundary probe; Claude tree untouched |
| target/scratch/codex_state_log_12/* | Codex | 2026-09-28 | Private target-backed backend log call-boundary batch; Claude tree untouched |
| target/scratch/codex_merged_12/* | Codex | 2026-09-28 | Private full-link merge of independently bound renderer batches |
| target/scratch/codex_rotate12/* | Codex | 2026-09-28 | Private source-order match for target-backed RotatePointAroundVector; standard referee required |
| target/scratch/codex_bindcheck.py | Codex | 2026-09-28 | Private test of C-string literal boundary in CRT binding verification; canonical checker Claude-owned |
| target/scratch/codex_near.py | Codex | 2026-09-28 | Private opcode-near candidate ranker for unmatched linked source, discovery only |
| target/scratch/codex_wavelet15/* | Codex | 2026-09-28 | Private source-backed missing-TU whole-link probe; no canonical source edits |
| target/scratch/codex_moretu15/* | Codex | 2026-09-28 | Private unported Mac/OpenCOD2 TU batch; exact-link gate, no canonical edits |
| target/scratch/codex_cohort13/* | Codex | 2026-09-29 | Private buildable-TU expansion toward 13%; no canonical edits |
| target/scratch/codex_crt13/* | Codex | 2026-09-29 | Pinned authentic CRT-source object rebuild and strict binding audit; external toolchain source, not canonical renderer source |
| target/scratch/codex_discover13/* | Codex | 2026-09-29 | `/FORCE` model-TU discovery only; zero verified credit |
| target/scratch/codex_discover14/* | Codex | 2026-09-29 | Private high-byte renderer TU discovery toward 14%; no canonical edits |
| target/scratch/codex_crt14asm/* | Codex | 2026-09-29 | Authentic VC7.1 CRT assembly source survey; separate from C and synthesized assembly |
| target/scratch/codex_dpvs14/* | Codex | 2026-09-29 | Private renderer DPVS source probe; no canonical edits |
| target/scratch/codex_batch14/* | Codex | 2026-09-29 | Batch port of independent Mac-derived renderer TUs, discovery first |
| target/src/gfx_d3d/*, target/src/tus.txt, target/Makefile (build flags only) | Claude | 2026-09-27 | Bulk-port Mac r_*/rb_* for the first link baseline; names for refapi entries from cmp evidence |
| target/src/claude/*, target/closed.mk, tools/bindcheck.py, tools/fdiff.py | Claude | 2026-09-28 | Closed LTCG source link (no /FORCE), verified via bindcheck |
| target/verified/src/* (one tree: gfx_d3d/, universal/, tus.txt, roots.txt) | Claude + workers a1/a2 (per-file owners in verified/NOTES-*.md) | 2026-09-28 | Merged verified tree; src/claude, src/claude_a1, src/claude_a2, src/cl frozen, pending removal |
| target/src/claude_a1/* (renderer 0x10001000-0x10015000) | Claude worker a1 | 2026-09-28 | Hand-written source for closed link |
| target/src/claude_a2/* (renderer 0x10015000-0x1002c000) | Claude worker a2 | 2026-09-28 | Hand-written source for closed link |
| target/scratch/codex19_crt/*, target/src/codex_drawgroups/* | Codex | 2026-09-30 | Original CRT dependency batch; separate accepted drawgroup source checkpoint |
| target/scratch/codex19_dxerr/*, target/src/codex_libraries/* | Codex | 2026-09-30 | Reconstructed SDK error lookup, exact 4035 compiler, private closed-link regression; canonical unchanged |
| target/scratch/codex25_dxerr/* | Codex | 2026-09-30 | Remaining SDK lookup family reconstructed in one compiler batch; clean library build integration only, Claude-owned source unchanged |
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
| target/scratch/codex35_semantics/* | Codex | 2026-10-03 | Target-backed SDK57 input/output shader semantics954/806 complete source drafts; no masks, external bytes, source credit or aggregate acceptance |
| target/scratch/codex35_pool_reads/*, target/src/codex_shader_pool_reads/* | Codex | 2026-10-04 | Accepted ReadCount387 in completed aggregate8159; clean V2,V3/651 retaining650 and1284 CPU outputs pass; current identities. Unused private classifier41 has zero credit |
| target/scratch/codex35_intrinsic/* | Codex | 2026-10-04 | Read-only Ghidra research export, no source credit; in-memory SDK type hypotheses, original shared analysis database untouched |
| target/scratch/codex35_emit_args/*, target/scratch/codex35_predicate_states/*, target/scratch/codex35_shader_comments/*, target/scratch/codex35_continuation/* | Codex | 2026-10-04 | Checkpointed unmatched target-backed drafts and bounded attempts; ZERO added coverage, continuation details in codex35_continuation/REPORT.md |
| target/scratch/codex35_shader_comment/*, target/src/codex_shader_comment/* | Codex | 2026-10-04 | ACCEPTED231-byte public parser: V2,V3/652 retaining651 and1284 compiler/324 direct CPU cases pass; cold aggregate17239 PASS/exit0, total353882/32.475773% |
| target/scratch/codex35_unary/*, target/scratch/codex35_semantics/output_*.cpp | Codex | 2026-10-04 | Active source reconstruction: unary optimizer1841 and bounded parser control-flow attempts; scratch only, zero credit until full gates |
| target/scratch/codex35_shader_conversions/*, target/src/codex_shader_conversions/* | Codex | 2026-10-04 | Ten clean callbacks696 pass V2,V3/662 retaining652 and640 CPU cases; cold aggregate5151 live, no global credit yet |
| target/scratch/codex35_shader_buffers/*, target/src/codex_shader_buffers/* | Codex | 2026-10-04 | Four CLEAN callbacks308 pass V2,V3/666 retaining662 and256 CPU cases; aggregate inclusion pending, zero global credit |
| target/scratch/codex35_parse_intrinsic/* | Codex | 2026-10-04 | Full5104-byte constant intrinsic evaluator reconstruction; read-only SDK/target research, no clean promotion until complete matching |
| target/scratch/codex35_parse_casts/*, target/src/codex_shader_parse_casts/* | Codex | 2026-10-04 | Two CLEAN CParse conversions209 pass V2,V3/668 retaining666 and1400 CPU cases; aggregate inclusion pending, zero global credit |
| target/scratch/codex33_constant_table/* | Codex | 2026-10-05 | Reconstruct CConstant/CConstantTable family from SDK63 and retail; drafts only until complete byte, binding, link and CPU gates |
| target/scratch/codex33_shader_helpers/*, target/src/codex_shader_native_helpers/* | Codex | 2026-10-05 | Five exact native helpers616,705 linked retaining700,13952 CPU cases; cold aggregate live, no global credit yet |
