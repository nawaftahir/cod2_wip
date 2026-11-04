# Renderer checkpoint44 — frame end and DeepSeek routing

2026-09-27. DEEPSEEK_MISSION_2.md is ready for human routing. Worker owns NEW
scratch/deepseek_cubemap_2 only: actual cubemap generator and three callbacks,
real pixel tests replacing mocks, preserved matches and strict bounded review.
No worker was launched here; external owner will convey prompt.

Separate Codex source `scratch/codex_frame_end/j_frame_end.c` implements actual
EndFrame10021f90, correcting legacy BeginFrame label. Target's actual flow:
registered guard → adaptive GPU sync10032e20 → cache unlock1001e540 →
debug callback slot101d4af0 → transfer debug globals100058b0 at backend+249d18
→ submit10020d50 → if tempSkinBytes101d49c4 nonzero, virtual decommit slot101d49f0
(buffer101d49c0, bytes), then zero tempSkinBytes. Calls are observed cdecl/plain
returns with caller cleanup; reference behavior agrees with opencod2's
r_rendercmds.c:565, despite additional behavior in its adapted submit path.

Fresh pinned `/O2 /Gy /W3` build `baseline_jpeg_n2weway4`:
**86 newly reviewable code bytes**, complete RET10021fe5+10CC. Both referees,
all11 relocation sites, every bound-symbol negative test and source hashes pass.
`python3 codex/renderer/check_frame_end.py` replays these and actually compiles/
runs32-bit `test_frame_end.c`: registered no-op, service ordering, debug pointer
offset, decommit arguments, zeroing AFTER callback, zero-size skip. Packet:
`baseline_jpeg_n2weway4/frame_end_packet.json`. External callees mocked/unmatched;
no independent acceptance, canonical integration, dependency closure or V4.

Reused compiler/referee tooling and a single assertion test, no infrastructure.
DeepSeek mission1 preserved; mission2 folder untouched. Next separate submit
group10020d50/10021040 or returned mission2 review; do not overlap image TU.
