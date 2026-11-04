# Renderer checkpoint 43 — independent DeepSeek mission 1 review

Date2026-09-27. Worker source/report left untouched. Verdict: **PASS for the three
bounded matches and useful builtin source; qualified/incomplete for the larger
cluster.** No canonical promotion or whole-DLL claim.

## Independent reproduction

Fresh pinned source build `baseline_jpeg__4k10qm8`, not the worker's object:

```sh
python3 codex/renderer/verify_jpeg_reference.py --reference codex/renderer/scratch/deepseek_image_1 --source j_wavelet.c --start 0x1000c910 --end 0x10061ca0
python3 codex/renderer/check_deepseek_review.py codex/renderer/baseline_jpeg__4k10qm8
python3 codex/renderer/verify_image_family.py --run codex/renderer/baseline_jpeg__4k10qm8
python3 -c 'import sys;from pathlib import Path;sys.path.insert(0,"codex/renderer");from check_image_file import main;main(Path("codex/renderer/baseline_jpeg__4k10qm8").resolve(),"test_deepseek_release.c")'
```

All passed. Independent packet:
`baseline_jpeg__4k10qm8/independent_deepseek_review.json`.
Fresh source/header/dependency hashes checked; no reused object. Exact flags
and commands in run inputs. Three proofs use explicit bindings, both referees,
complete return/padding boundaries and a wrong-address test for EVERY bound
symbol, not only the release counter.

| Target | Source function | New code bytes |
|---|---|---:|
| 0x1000c910 | Image_Release |87|
| 0x10010680 | Image_GenerateLightGridWeights |43|
| 0x100107b0 | Image_GenerateSunHalfAngle |46|

**176 unique newly independently reviewed bytes.** The established eight-body
group1,141, header67, dispatcher261/full switch table, formatter26 and file240
are retained and independently replayed on the fresh object; NOT new credit.
Full GPU/callback dependency closure remains false.

The reviewer re-read the target bodies directly. Lightgrid allocates stack0x6000
and forwards image/submap/res0x20/callback100104a0 to10010160. Sun allocates0x18000
through101d49d8, forwards res0x40/userData0/callback100106b0, frees101d49f8.
The cubemap target itself pushes pixel/userData/vector and caller-cleans12 bytes,
supporting the declared callback argument order. Its source is still external.

## Behavioral validation

`test_deepseek_release.c` reuses the worker's actual builtin-source fixture and
adds independent release assertions. Reviewer checker really compiles AND runs
this32-bit test; it does not set passed=True without execution.

Covered: worker's ten-name dispatch and procedural argument/pixel plumbing plus
track0/1/4 accounting bypass, track2/255 accounting, actual stdcall COMRelease,
card-memory zeroing when a texture exists, null-texture preserving card values,
and mapType reset. Mock cubemap/pixel callbacks mean generated lightgrid/sun
pixel correctness is NOT tested. Old file-error/reload fixtures are not claimed
as passing against this extended source; current selected fixture covers builtin
and release, while the file/header/dispatcher source bytes and bindings replay.

## Corrections and limitations

1. **Our mission boundary was wrong.** Direct complete target disassembly confirms
   Image_Alloc1000cc10 RET1000cc7c:109 bytes, then threeCC, next code1000cc80.
   Earlier125-byte claims in BATCH_38/39 and NEXT_SESSION are superseded. Worker
   followed the binary correctly. Alloc still DEFER: equal length is not identity.
2. Worker `check_new_matches.py` hashes current source without asserting against
   build inputs and hardcodes fixture passed=True; it also allows deferred rows
   while reporting REVIEWABLE. Do not reuse it as an acceptance gate. Reviewer
   checker validates recorded input hashes, fails on any required mismatch,
   checks every binding and actually executes its fixture.
3. Report's claim that remaining mismatches are exclusively original TU context
   is **HYPOTHESIS**. Register/frame differences and a failed static experiment
   do not prove missing callers or exclude source/type/optimization issues.
   In particular Image_Load IS present in this candidate, contradicting the
   report's statement that no builtin callers are in it. Public linkage still
   constrains optimization; this is not proof of historical original TU layout.
4. Newly added builtin source is useful but largely unmatched. Lightmap605,
   cubemap generator and pixel callbacks remain externs; procedural correctness
   cannot be inferred from mocks. No full pass completion of all mission scope.
5. A minor Allman brace violation in outdoor helper is left in worker evidence;
   correct only in a future owned source revision, then preserve/reverify hashes.

## Next useful worker task

Own a NEW scratch overlay copied from this reviewed worker baseline. Reconstruct
actual cubemap generator10010160 and its lightgrid100104a0, sun100106b0 and
water100107e0 callbacks as a caller/callee group. Audit true complete extents
and interfaces before source; compare structural refs but do not copy browser
adaptations. Replace mocked pixel tests with real callback outputs and keep
all established matches. This yields missing logic/dependency closure instead
of repeating isolated register probes. No assignment launched by this review.

Source licensing/canonical integration, remaining image source matches, linker
layout, all other renderer families, whole-file checksum and runtime remain.
