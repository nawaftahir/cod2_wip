# Call of Duty 2 renderer reconstruction

Target: gfx_d3d_mp_x86_s.dll, PC1.0. Read docs/STATUS.md and CLAUDE.md first.

- src/: complete files with pinned source/function proof.
- workspace/work/src/: active partial reconstruction.
- workspace/src/: compatibility and reference inputs.
- workspace/work/proof/: immutable evidence and current referee outputs.
- docs/TRIED.md: failed approaches; read before experimenting.
- ledger/meter.json: generated confirmed meter, published by CI.

Create work from gfx/main with git worktree add in cod2_wip/.worktrees/.
Use make check for the clean acceptance gate. Set DXSDK and GFX_ANCHOR to
installed local inputs, or unpack them from the PRIVATE CI package. The
pinned compiler package and recipe are documented in toolchain/.

The public repository contains no retail binary, compiler, SDK payload or
built game artifact. The gfx workflow runs on trusted gfx branches, keeps
those inputs private, uploads logs/meters only, and updates the progress
page after a successful gfx/main run. No fork pull-request job gets them.

Function matching is intermediate proof. Readable C/C++ and a whole-file
SHA256-identical rebuild, followed by a smoke test, are the final objective.
