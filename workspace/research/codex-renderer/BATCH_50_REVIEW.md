# Independent checkpoint — decoder group + DeepSeek revision2

2026-09-27. Reviewed subset59513/1089680≈5.46%. No whole-file/link/game claim.

## Own decoder source

Fresh baseline_jpeg_kep_s022 builds actual master/API/main/coefficient/post/IDCT/
color/upsampling source in one private-caller context.38matched bodies/10028bytes;
all33previously accounted bodies in those modules are retained. No ASM shims.
Changing only jpeg_calc_output_dimensions linkage did not improve the14body
initial probe; that change was reverted before the expanded fresh build.

Final full JPEG replay session81394:173shapes/169directlyclosed/56464bytes.
New directly closed: main-controller initializer1004db80/205 and post-controller
initializer10051650/131, total336. Real32-bit source fixtures exercise ordinary and
context-row main-buffer setup, postprocessing strip allocation/method selection,
virtual zero-fill/data preservation and balanced allocation/free, no game claim.
Every closed group's bound symbol has a wrong-address negative test; complete
control flow and incoming references establish missing entry bounds.

Other new shapes are HELD, not credited: inverse-DCT117 has unresolved start_pass;
upsampler498 has three unresolved helper callbacks; coefficient364 has two.
Five tiny helper bodies need full boundary/signature/source evidence; do not
pretend shape success or a table-pointer address alone closes those bindings.
Remaining8unresolvedsites include old format_message's2sprintf calls.

Reproduce existing full JPEG command with memory-run baseline_jpeg_9nwllwps and
decode-run baseline_jpeg_kep_s022. Decoder/source hashes rechecked after fixtures.
No input edits to accepted overlays without a fresh recompile.

## DeepSeek revision2

Eight source groups exist; report says24functions,1large body, not48/12large.
Independent docker rebuild of r_debug.c to scratch/codex_review_7r2/r_debug.obj:
SHA44716b96c5889f1b0c3f8e4d168b97b34687efbff34d0c3a29de2d04929f721d.
10005980/93 and100059e0/93 pass both unchanged referees, full decoded93bytes,
internal branch destinations, finalRET and3CCalignment. Both frontEndDataOut and
allocator bindings negative-tested individually+4 and rejected; no unresolvedsites.
Independent native32actual-source test_debug_locate PASS (3allocations/reuse).
Allocator cdeclsingle-size callback is supported by target call shape plus local
RI slot adjacency and independent opencod2/Mac interface evidence. Not PC-runtime
execution or proof of every RI table field. Names corrected from wrong inventory.
WorldBounds69alreadycounted. Accept only the two NEW functions/186bytes.

Revision2 materially improved honesty/gates/source, but other22reported functions
are retained/duplicates/unmatched. RegisterString's caller experiment still left
the callee externally visible; no private-context impossibility proof was shown.
Campaign8 requires explicit>=512byte primaries and substantial actual source.

No release tree, progress repository or worker-folder modifications/commits.
