# GEMINI r1 report (PARTIAL, handoff)

Branch `radiant/gemini-r1` (base `e60acd88`). **Nothing committed. Full clean gate (`tools/ci_local.sh`) NOT run.**
Only verified rung: V2 for `0x49a0e0` (`make try` -> MATCH). V3/V4 not cleared.

## Landed in working tree (uncommitted)
| Addr | Fn | Change | Evidence |
|---|---|---|---|
| `0x49a0e0` | `getCameraInfo` (185 B) | `splines.cpp` L1246-1247: `RAD2DEG((float)atan2(...))`, `RAD2DEG((float)asin(...))` | `make try` -> `MATCH` (SUPPORTED) |

Ledger: `matches.tsv` row added after `0x0049a0b0`; both duplicate `0x0049a0e0` rows removed from `defer.tsv`.

## Best result per remaining target (lab only, not applied to tree)
| Addr | Best | First diff | Notes |
|---|---|---|---|
| `0x484060` RotatePointAroundVector | **97%** 757/757 (was 88%) | `+0x161` | `rad = ((degrees * 0.017453292519943295f));` + `dst[i] = ((r0*p0 + r1*p1) + r2*p2);`. One instr left: `mov [ebp-0x80],ebx` is at `+0x171`, retail `+0x161`. Not applied to `com_math.cpp` yet. |
| `0x46fbe0` | 98% 355/355 | `+0x88` | Use real `CArray<SelFace,const SelFace &>::RemoveAll()` (already matched at `0x474ef0`), not the `SelArr` stand-in; gives retail's exact delete/zero sequence. `0x46e4a0` stays MATCH. Left: `mov [DAT_011298b4],ebx` ordering. |
| `0x429bc0` | 97% 553/553 | `+0xcf` | `*px=-1;*py=-1;` scheduled after `DAT_010c4d84` load vs retail before. |
| `0x458440` | 99% 511/511 | `+0x1ad` | ecx/edx swap in `b->owner->def == b->def->owner` assert. 8 variants, none moved it. |
| `0x457bd0` | 99% 260/260 | `+0xe8` | SIB order `[ecx+edx+0xa4]`. 8 variants. |
| `0x439620` | 98% 69/69 | `+0x12` | `[ecx+esi]` vs `[esi+ecx]`. 8 variants. |
| `0x41f910` | 98% 183/183 | `+0x89` | eax/ecx vs ecx/edx. 10 variants. |
| `0x421150` MakeMeshNormals | 99% 931/931 | `+0x2f0`/`+0x357` | 9 variants in batch 1; `double_v1_z_no_cast` 98%. |
| `0x42bf50` | 41% 1174/1175 | `+0xd` | Adding it to `Pmesh.cpp` breaks matched `0x42e290` (70%). Do not land as is. |

## Levers found
- `RAD2DEG(...)` / outer-paren float expression shifts `add esp,8` before the load (solved `0x49a0e0`).
- `x = ((a*b + c*d) + e*f)` + `rad = ((...))` fixes x87 tail order and `rad` placement (`0x484060` 88->97%).
- `CArray<T, const T &>::RemoveAll()` inlines `SetSize(0,-1)` exactly like retail (`0x46fbe0`).

## Variants tried and failed (do not repeat)
- `0x484060`: swap/unroll dot, DotProduct, im[2][0] from vf/dir, transpose after zrot, 1.0f unrolled, 3-4x parens on rad, FastSinCos((rad)), double-dot variants, col-major im fill, im20/im21 parens, zrot after assert.
- `0x41f910`: void* / unsigned / int nValue, nested if, local def, while, do-while, parens on flags, local map ref, v-before-inc.
- `0x421150`: (double) casts on each cross operand, k1 hoist, b-alias first, parens on cross0, dead read, Vec3Cross.
- `0x46fbe0`: void*/float DAT_011298b4, early-return in `0x46e4a0`, bounds alias, def local before/after, unrolled bounds, do-while, `((0))`.
- `0x429bc0`: found-after, do-while guard, local count (80%), `((-1))`.
- `0x458440`: Brush_Alloc, parens, void cast, redef b, local owner, assert macro form, def->patch (83%).
- `0x457bd0`: chained 1.0f, packed at call, if-not-owner, while, ptr+i, parens store, packed copy (80%).
- `0x439620`: float d inside, ptr walk, while, do-while, parens, `i[v1]`, dead read, ptr order.

## Queued, written but NOT run (scratch dir)
`spec_421150_v2`, `spec_458440_v2`, `spec_439620_v2`, `spec_429bc0_v2`, `spec_457bd0_v2` in
`/home/nawaf/.gemini/antigravity-cli/brain/eb06f03b-ca30-449f-a4dd-27b8b7d3af6f/scratch/`
(run with `lab_batch.py <spec>` inside the `cod2-radiant-msvc71` image; it restores the source file after each case; `show_diff` and `also_check` supported).
Docker needs sandbox bypass in this environment.

## Next steps for whoever resumes
1. Run the queued v2 specs (one at a time, never overlap links in one worktree).
2. Apply the `0x484060` 97% edit only if it breaks no matched row (verify with the gate).
3. For any 100% MATCH: edit `workspace/src`, `make try`, add row to `matches.tsv`, drop from `defer.tsv`.
4. Run the clean gate (`RADIANT_CI_NO_NOTIFY=1 bash tools/ci_local.sh`, then `git checkout -q -- ledger/files.tsv`), then commit as `Nawaf`, no push.
