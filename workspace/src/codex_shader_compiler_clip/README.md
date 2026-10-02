# Compiler/clipping integration candidate

Nine readable C++ methods,1066 bytes: clean V2 and private full-link V3 pass.
The previous eight methods account for757 already accepted bytes; clipping's
309 bytes are new candidates. The CPU runner and aggregate refresh are still
pending, so accepted coverage has not changed. Do not link this TU alongside
the previous compiler TU; both contain the same eight definitions.

See `../../scratch/codex35_clip/REPORT.md` for checks, replay and resume steps.
