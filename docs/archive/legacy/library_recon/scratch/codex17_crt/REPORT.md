# CRT17 source checkpoint — 2026-09-30

Reused authentic VC7.1 source, not opaque library code or newly reversed game
logic. `build.sh` compiles 121 source files in both original ST/MT header
configurations inside the pinned compiler image. Source files are compared
with the image originals before compilation. Microsoft source is external
to this Git checkpoint and must not be redistributed with the release.

Replay: from `gfx/target`, run `sh scratch/codex17_crt/build.sh`; from the
workspace root, run `python3 gfx/tools/check_ten_percent.py`.

The frozen plan is discovery input, not proof. `check.py` certifies 200 full
source bodies / 37,866 bytes before overlap removal. The aggregate accepts
41 new address-disjoint bodies / 9,176 bytes, reaching 187,028 / 1,089,680
= 17.163571%. It checks complete instructions, relocation sites and types,
code/data/import bindings, original pointer initializers, source/header/object
hashes, and per-binding negative tests. Twelve code-dependency proofs and
391 data proofs add no standalone coverage. Five variants are rejected.

Typed COFF external function pointers are proved as callbacks, not mistaken
for data. Anonymous inventory entries inside a body are allowed only when
they are a decoded direct-branch destination; named conflicting entries are
still rejected. Both classifications have executable negative checks.

The first main compile failed after a running script was edited; that run
is not accepted as build evidence. Stable main and globals scripts were
subsequently rebuilt successfully, followed by checker and aggregate PASS.
Do not edit build scripts while the shell is executing them.

This is per-function source coverage, not a whole-file identity claim.
