# Active renderer workspace

Work here. Old scratch folders and archived builds are history, not active inputs.
Follow [the renderer roadmap](../../ROADMAP.md):40% C/C++ first, then45% through retail SHA.

- `src/`: only the TUs in `src/tus.txt`, their local headers and build configuration.
- `tests/`: actual-source behavior and referee regression fixtures.
- `tools/build.sh`: the single build/verification entry point.
- `layout/`: object order, library order, data ownership and the latest section/map report.
- `proof/baseline/`: the pinned, forced-rebuild checkpoint. Never overwrite it.
- `proof/latest/`: results from the current verified build.
- `build`: a link to the ONE existing object/DLL directory; no duplicate build.

From `gfx/`:

    sh target/work/tools/build.sh
    python3 target/work/tests/test_model_bounds.py

Use `--rebuild` for an explicit fresh rebuild. Header/compiler-profile changes
trigger one automatically. The image is pinned; builds use four jobs. A lock
rejects competing builds. Every run checks both referees, all prior
source/library extents, game accounting and the latest raw-offset layout meter.
Failed checks stop the command; a diagnostic match is never accepted progress.

Frozen baseline:579 game bodies /101478 executable bytes. Latest cold checkpoint:
609 /107350, including1712 new C++ bytes over the602-body checkpoint.
Mixed coverage42.333780%; current authored C/C++ coverage39.262954% after
non-inlining guards and source_coverage.py attribution. Owner milestone40%,
then45%, excluding assembly. Known assembly remains protected by regression.
The counter excludes entire containing bodies, treats C/C++ intrinsics as C/C++,
and does not audit internal implementation of original compiler/SDK dependencies.
Partial files still contain unaccepted drafts. This is an organized working
source tree, not a release or a claim that each entire file is reconstructed.

Object order lives in `src/tus.txt`; compiler exceptions live in `src/profile.mk`.
Maintain layout structure DURING source work: update ownership notes and inspect
the generated map/section report on each wave. The current order is a proven
candidate, not a claim to have recovered every historical TU or final address.
Do not defer layout until100%, and do not freeze speculative addresses early.

The build maps this physical `src/` to the old compiler-visible source path
inside the container to preserve debug/error-file strings and reproducibility.
That is path mapping, not byte patching or an extra source copy. Do not run old
scratch build scripts: they do not select this physical input tree.

Read-only shared dependencies: `target/src` compatibility/reference headers,
the Summer2004 SDK and original VC7.1 libraries. They are not reconstruction
credit. The unchanged regression script retains historical proof JSON inputs
under `target/scratch`; those proofs are deliberately preserved, not active
source. Nothing moves into `cod2engine/` without owner review.

Whole-file identity and game/GPU tests remain unfinished. No assets/binaries
belong in git. No new worker, build directory or trial folder unless needed;
reuse this tree and keep failed attempts in one short log.

Unaccepted source: FresnelTerm in gfx_d3d/r_utils.cpp. Its numerical
tests pass, but a203-vs201-byte x87 cleanup mismatch prevents acceptance.
See ATTEMPTS.md and proof/fresnel_defer.json. This work adds ZERO coverage;
Fresnel itself adds no coverage. Run the new
tests with `python3 target/work/tests/test_fresnel.py` and
`python3 target/work/tests/test_debug_plumes.py` from gfx.

The genuine bounds callback/worker is also in gfx_d3d/r_scene.cpp, still
unaccepted because its model-debug callee chain is unresolved. Run
`python3 target/work/tests/test_scene_bounds_callback.py` for its routing test.
The restored continuation checkpoint's source/proof hashes are recorded in
proof/continuation_checkpoint.json; subsequent drafts must pass the same gates.

Latest proof is proof/dx7_checkpoint.json: all817 extents retained,
cold bind and cmp identical to the frozen warm checkpoint,422 unchanged
input hashes,45 passing fixtures and a separate passing PDB-string fixture.
The compiler-named-string boundary correction is tested separately and adds
no game coverage in the side-by-side legacy-checker cohort. See ATTEMPTS.md.
Earlier material/sampler/polygon/continuation receipts are historical snapshots.
