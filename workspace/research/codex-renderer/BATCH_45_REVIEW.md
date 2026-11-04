# Checkpoint45 — independent cubemap mission2 review, 2026-09-27

Verdict **honest DEFER, useful research source, zero new matched bytes**.
Worker folder unchanged. Do not call the new source behavior-identical or promote
it to canonical. The worker acknowledged mismatches and rounding tolerance.

Independent fresh pinned build `baseline_jpeg_h3ay7tvx` reproduces10 shape
matches/1006 bytes, none newly assigned. Reviewer commands:

```sh
python3 codex/renderer/verify_jpeg_reference.py --reference codex/renderer/scratch/deepseek_cubemap_2 --source j_wavelet.c --start 0x1000c910 --end 0x10061ca0
python3 codex/renderer/check_deepseek_review.py codex/renderer/baseline_jpeg_h3ay7tvx
python3 codex/renderer/verify_image_family.py --run codex/renderer/baseline_jpeg_h3ay7tvx
cc -m32 -std=c99 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_cubemap_rounding_review.c -lm -o /tmp/codex_cubemap_rounding_review
/tmp/codex_cubemap_rounding_review
```

All passed with required Docker/32-bit execution approvals. Initial denied
Docker attempttn4187n2 retained. Fresh input/source/header/object hashes checked;
Release87/lightgrid wrapper43/sun wrapper46 reverified with both referees and
every bound-symbol negative test. Eight established bodies1141 retained.
Independent packet `baseline_jpeg_h3ay7tvx/independent_deepseek_review.json`.
Actual worker cubemap fixture compiled/run, not merely its saved success label.

## Material finding: numerical behavior is not exact

PINNED target double1019bd80 bytes000000000000103e equals2^-30. The water callback
100107e0 spills scaled float, materializes the double bias in a stack slot,
reloads scaled float, adds that double and uses FISTP to a32-bit integer. Its
complete RET is10010841 (98 bytes). FISTP follows x87 rounding control; a normal
C integer cast truncates. A matching constant alone does not establish conversion
semantics or identify the original source helper.

Reviewer numerical check explicitly selects FE_TONEAREST and compares source
casts against a mathematical nearest-round model: source127.5→127, model→128;
source1.75→1, model→2. These are reproducible discrepancies, not new match proof.
Retail rounding-mode initialization has NOT been established in this review;
the model is conditional on nearest mode, not a claim of observed retail output.
The worker's one-byte tolerance masks this distinction. Host passes therefore
support geometry/pixel plumbing only, not exact original pixel results.

## Proof quality and scope

- The new cubemap generator, callbacks and additional helpers remain DEFER by
  the worker's own lengths/byte differences. No claimed new match to accept.
- `check_cubemap.compare` is diagnostic only: it masks unioned sites separately,
  and can label MATCH before requiring identical relocation site/type maps.
  Do not use it for acceptance. Reuse strict checker for any future actual match.
- A fresh build of full source was independently performed; nine new-function
  semantic audits are not complete. Geometry formulas and helper names remain
  source candidates until complete target/control-flow and numerical proof.
- Claims that no pinned compiler configuration can produce the target, or that
  larger TU register pressure explains it, exceed the bounded experiments.
  Record tested configurations as failed; don't generalize to impossibility.
- Mission's probe ceiling was exceeded by listed whole-TU flag variants. Don't
  repeat them; next work requires new evidence, not broader flag sweeps.

## Next execution

DEEPSEEK_MISSION_3.md targets the common float-conversion problem with controlled
arithmetic/rounding tests and bounded codegen evidence before touching all pixels.
New owned overlay only, preserve mission2. Reuse tooling/objects and exact tests;
no new framework or goal substitution. Codex can separately continue render-submit.
No whole-file checksum, runtime, canonical source or release completion claim.
