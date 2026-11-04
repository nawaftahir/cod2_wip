# JPEG memory source group — 2026-09-27

Independent of DeepSeek campaign7/revision2 material/world/rendering ownership.
Fresh MSVC build: baseline_jpeg_vctq8lbv, pinned image and source/header hashes
in inputs.json. Overlay: scratch/codex_jpeg_memory. No release-tree changes.

Source-level context: expose genuine no-backing-store backend in the same TU,
disable getenv configuration absent in target initialization, expose genuine
jutils zero-fill for compiler inlining. Callback allocator/free macros unchanged.
This is a reconstruction experiment, not a claim about historical TU provenance.

Fresh object matches13bodies/2699bytes under both referees. Existing9allocation
functions retained; new unique candidates:

| Address | Function | Bytes |
|---|---|---:|
|10055190|realize_virt_arrays|360|
|10055440|access_virt_sarray|329|
|10055590|access_virt_barray|345|
|10055800|self_destruct|51|

New directly closed total1085bytes: full session82866 PASS,166JPEG closed/55968bytes,
overall reviewed58831/1089680≈5.40%. No V4/link/game-boot claim.
Dependency replay performs full decode, branch-target,
final-return/alignment checks and incoming references for missing entries, both
unchanged referees, source/data/callee binding proofs and negative tests for EVERY
bound symbol across all13memory functions. Source inputs rehashed after fixtures.

Merged data section changed pool-array layout: whole-section comparison correctly
left first_pool_slop/extra_pool_slop unresolved. Dedicated complete-symbol proofs
check their target-pinned eight bytes each, no object relocations in either range,
proper initialized-data section and exact destination/addend. Fixture confirms
each source array is eight bytes. This does not accept arbitrary partial data.

Real32-bit source fixture exercises no-backing-store virtual realization, pre-zero
rows/blocks, stored sample/coefficient preservation, last-row access, ordinary
allocations, pool lifetime, memory-manager destruction and allocated==freed.
These are host source tests, not original-DLL/game runtime proof or V4.

Reproduce the existing full JPEG replay with its encoder/utility/missing-discovery
arguments plus `--memory-run codex/renderer/baseline_jpeg_vctq8lbv` and authenticated
toolchain-ftol2 identity argument. First hi2byq_1 is superseded and its overlay hash
no longer matches; do not reuse it as current source proof.
