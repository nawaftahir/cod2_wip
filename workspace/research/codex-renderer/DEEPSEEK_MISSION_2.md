# DeepSeek mission 2 — real procedural cubemap source

Read root AGENTS.md, glm/AGENTS.md, DEEPSEEK_MISSION_1.md,
BATCH_43_REVIEW.md and NEXT_SESSION.md. Mission1's source is preserved evidence,
not canonical. Own only `codex/renderer/scratch/deepseek_cubemap_2/`.
Copy mission1's j_wavelet.c and common_types.h there; do not edit mission1,
Codex's debug-frame files, GLM, client, or cod2engine. No parallel worker on this TU.

## Large bounded scope

Reconstruct as genuine readable source the caller/callee group:

- Image_GenerateCubemapFunction: 0x10010160.
- Image_GetLightGridWeightsForVector: 0x100104a0.
- Image_GetSunHalfAngleForVector: 0x100106b0.
- Image_GetWaterColorForVector: 0x100107e0.

Audit COMPLETE boundaries first: inventory truncation and switch/data splitting
are known hazards. Existing reports suggest about1.6KB, not certified extents.
Verify every type/argument/constant/axis orientation/rounding rule against the
target before using it. Source unknowns → written DEFER, not plausible formulas.
Target wins over `refrences/cod2-mp-macho`, `refrences/opencod2`, and
`refrences/KisakCOD`; document version/browser adaptations. These references
are local and need no installation.

Replace the four externs with actual source in the owned overlay. Preserve the
real builtin wrappers and upload path; exercise generator→callbacks→texture
upload with mock external COM/allocator services, NOT a mocked generator or pixel
callback. Inspect target data tables and reconstruct typed initializers only
when values/meaning are established; no retail instruction byte arrays.

Write one assert-based32-bit test covering face orientation/loop endpoints,
lightgrid submaps0/1, sun and water output, representative signed vectors and
rounding/clamping edges that the target actually handles. Do not invent new
retail input validation to improve source behavior. Label mock runtime limits.

## Build and verification

```sh
python3 codex/renderer/verify_jpeg_reference.py --reference codex/renderer/scratch/deepseek_cubemap_2 --source j_wavelet.c --start 0x1000c910 --end 0x10061ca0
python3 codex/renderer/verify_image_family.py --run codex/renderer/<fresh-run>
```

Compile changed TU once; reuse that object for all comparisons. Use original
GLM referee AND strict decoded instruction/site/type check, every actual binding,
complete code/table/data extent and a deliberately incorrect binding test.
If typed floating tables are needed, prove their actual bytes as well as code.
Cache/replay only with unchanged input/toolchain identities. Preserve input/object
hashes, exact commands/flags, logs and failed experiments.

Retained image proofs: eight bodies1141 plus header67/dispatcher261/formatter26/
file240 and mission1 Release87/lightgrid wrapper43/sun wrapper46. Count retained
matches only once; callback addition may change private ABI and requires actual
regression, not assuming wrappers stay matched. Source-test ALL used new helpers.
Reuse verifier modules where possible; do not invoke mission1's hardcoded-pass
checker as proof for the new overlay. Its source/fixture hash gaps are documented
in BATCH43. Fixture passed=True must follow actual execution.

At most three evidence-backed source/context probes per common mismatch before
DEFER and continuing the other members. Failed isolated probes are NOT proof
that TU context is the sole cause. Do not broaden to lightmap/register/client,
new SDKs, network tooling or source transformations unrelated to this cluster.

## Required returned packet

Complete one pass over all four members and final regression, then stop.
Return `REPORT.md` and `packet.json` in the owned folder: audited per-address
MATCH/DEFER, genuine source paths, every ABI/data/binding fact with evidence,
source/input/toolchain/object/fixture hashes, executed commands/logs, negative
checks, retained failures, newly unique code bytes, unresolved dependencies and
reference divergences. A useful honest DEFER packet is acceptable; never weaken
gates or hide lost matches. No canonical edits/commits, marker variants, ABI shims,
retail copying or post-link patches. Return it to Codex for independent review.
