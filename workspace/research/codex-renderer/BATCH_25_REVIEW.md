# Renderer checkpoint25 — matched full mip-chain accounting, 2026-09-26

New scratch/wavelet_memory_clamps preserves prior inputs. One bounded experiment
expresses dimension clamping as the target's subtraction test, `1 - dimension >= 0`,
after shifting. For valid positive image dimensions this clamps to1; target SUB/JNS
shape follows naturally, no assembly or invented register convention. Malformed
INT_MIN input/overflow semantics are not a supported source-equivalence claim.

Fresh pinned MSVC7.1 /O2 /Gy baseline_jpeg_olyhxdy7 compiles and matches
Image_GetCardMemoryAmount1000f020,135 code bytes. Both direct calls bind to the
actual same-object matched Image_GetMipMemoryAmount1000ef40. Its149 code bytes
and whole219-byte code/table section reverified, not counted again.

`python3 codex/renderer/check_image_memory_chain.py` passes both referees,
two callee bindings, negative wrong callee test, complete target boundary135 plus
9 CC bytes, all dependency code/table bindings and32-bit warning-clean fixtures.
image_memory_chain_packet.json embeds the full dependency proof/hashes. Reuses
check_image_memory_size.py with an explicit saved run and source-specific fixture
include; unchanged old run still available via that tool's default. Root mip
packet records whichever explicit run was most recently checked—read its inputs.

Fresh source retains all creator362 bytes (discovery both referees), and original
independent snapshot check_image_create.py remains green. Tracking179vs200 still
DEFER; clamp experiment improved its size but not matching status. No historical
TU certainty, independent acceptance, retail link, realGPU or whole-file identity
claim. Only135 NEW engine .text bytes credited at this checkpoint.

Fixture test_image_memory.c now allows explicit source overlay selection; same
existing checks test mip/single-level/cube/block accounting, category0..255 and
actual creator mock calls. No new framework/dependency; source sizing is O(number
of mip levels), tracking is two platforms, no need for caching or parallelism.

Next actual tracker loop/context and upload/row-copy source. Do not regrind the
matched mip or chain body. Preserve creator/error correction from checkpoint22.
