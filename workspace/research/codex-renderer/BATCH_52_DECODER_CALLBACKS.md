# Decoder callback checkpoint — 2026-09-27

Reviewed subset60518/1089680≈5.55%. No whole-file identity/link/boot claim.
Full JPEG dependency replay session93207 PASS:178shape matches,176directly
closed source bodies/57469bytes. Previously closed bodies retained.

New unique code1005bytes:

-1004aa30 start_input_pass92
-100516e0 start_pass_upsample26
-100517e0 fullsize_upsample11
-100517f0 noop_upsample11
-1004ad90 dummy_consume_data3
-1004b940 jinit_d_coef_controller364
-10051c10 jinit_upsampler498

Fresh pinned MSVC/O2/Gy build baseline_jpeg_d6d0wpgj uses genuine IJG decoder
source scratch/codex_jpeg_decode_inline. Force-inline start_iMCU_row reproduces
the actual computation within start_input_pass; retained all38prior group shapes.
This is a bounded source-generation experiment, not historical annotation proof.

Tiny callbacks require full typed COFF function sections, exact whole bytes,
zero relocations, RET/alignment and target PE pointer references. Actual source
dispatch/initializers and typed callback signatures establish identity; a table
pointer or shape alone is not sufficient. Both referees, exact site/type and
symbol/addend bindings, per-bound-symbol negatives and full input hashes pass.
The legacy COFF parser omits type in its returned dict; the acceptance check
reads the recorded raw symbol type, without changing shared parser or gates.

Real32-bit source memory/main/post/upsampler/coefficient fixtures pass: ordinary
and context main buffers, post strip allocation, upsampler method/start/fullsize/
noop behavior, coefficient reset and suspended callback, virtual zero-fill/data
preservation/final-row bounds, balanced allocation/free. These are native source
fixtures, not target-DLL game execution. GCC only strips MSVC annotations; byte
acceptance uses the original fresh pinned MSVC object.

Reproduce check_jpeg_dependencies.py with all BATCH_50 arguments, replacing
decode-run with baseline_jpeg_d6d0wpgj; memory-run remains baseline_jpeg_9nwllwps.
Saved jpeg_dependency_packet.json records commands, input hashes and all proofs.
Three unresolved sites remain: inverse-DCT helper and two sprintf calls.
IDCT full-block lead in BATCH_51 is still uncredited pending closure.

No worker-folder, release-tree or progress-repository changes/commits.
