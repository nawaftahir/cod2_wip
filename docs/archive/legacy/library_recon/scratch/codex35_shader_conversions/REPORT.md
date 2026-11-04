# Shader conversion checkpoint — 2026-10-04

Ten ordinary C++ conversion callbacks,696 complete instruction bytes, now
match. The indexed loop `scratch[i] = input[i]` produces the target register
allocation; advancing separate scratch/input pointers did not. Twelve
already-accepted native callbacks are duplicates and excluded. Two float-to-
int callbacks still emit70/102 bytes; /QIfist and /d2QIfist produce71/102,
not matches. /Op does not solve them. Do not use byte emission or padding.

## Evidence and scope

- Clean source: target/src/codex_shader_conversions/conversions.cpp.
- clean_packet.json: REVIEWABLE, ten/696, both complete referees100,
  complete section/target bounds and carrier-selected callback identities.
- link_packet.json: PASS662 matches, all652 baseline retained; strict
  source ownership and checked SDK/literal/vtable bindings, no /FORCE.
- fixture_packet.json: PASS640 cases/zero differences, all ten callbacks
  owned by conversions.obj, not an SDK fallback. Full input/scratch buffers,
  HRESULT, register/count, data pointer and mock device slot compared.
- Independent checkpoint posthash:155/211/171 recorded identities current.

Two float-to-bool callbacks each have exactly one COFF relocation, offset25,
type6, __real@00000000. SDK/source storage and retail0x1019bc84 are four zero
bytes; base-relocation site and callback carrier are explicitly checked.
Masking this proven relocation does not permit arbitrary literal binding.
The initial blanket no-relocation assertion failed; it was replaced by this
specific proof, not a wider mask. Failed logs are retained locally.

PINNED device slots: vertex B98/I96/F94, pixel B113/I111/F109. An initial
fixture used wrong pixel slots and both original/source stopped after320
cases. SDK headers and binary dispatch corrected the fixture; all640 now
pass. Mock-device CPU proof is not GPU, allocation-failure or game boot proof.

PINNED target calls the device with the original input pointer after writing
scratch. Preserve it, including when scratch aliases input. Do not change it
to a supposedly fixed scratch pointer. IEEE edge values are fixture inputs.

## Replay / pending global accounting

Run build.sh in the pinned compiler image (see script and link.mk), then:

```sh
python3 target/scratch/codex35_shader_conversions/check.py --clean
python3 target/scratch/codex35_shader_conversions/check_link.py
# Freshly compile fixture via compile_fixture.sh in its pinned image first.
python3 target/scratch/codex35_shader_conversions/run_fixture.py
```

Cold aggregate PID5151/session69820 is live at this checkpoint; log
aggregate.log. Accepted total remains353882/32.475773%. Do not count696 until
terminal PASS and independent complete posthash. Expected resulting total
354578/32.539645%, still26810 short of35%. The old cache is stale.

The ten instantiations alone are promoted. Generic declarations still need
consolidation with the older native family for final whole-tree integration;
no historical TU grouping or whole-file identity is claimed. Wrappers reuse
pinned existing checks, selector, SDK binding and vtable tools to avoid
duplicating the proof machinery; no existing gates were weakened.
