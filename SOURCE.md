# Reconstructed renderer source

**Verified-only snapshots:** [src/](src/README.md). These are actual C++ files,
not links or a copied reference tree. Each exported file has all its emitted
functions byte/binding verified; the manifest also accounts for every function
defined in that file. Validate with `python3 tools/check_verified_source.py`.

**Development source:** target/work/src/. This remains the only active build
input; partial files stay here until the whole file passes. target/src/opencod2/
is reference/shared-header material, not the verified source directory.

Open the actual source here:

| Code | Actual file | Status distinction |
| --- | --- | --- |
| Scene setup, entity submission, surface sorting, scene rendering modes | [r_scene.cpp](target/work/src/gfx_d3d/r_scene.cpp) | Contains verified functions and unfinished work |
| Command allocator, packet writers, normal/debug frame submission | [r_rendercmds.cpp](target/work/src/gfx_d3d/r_rendercmds.cpp) | Contains verified functions and unfinished work |
| Backend executor, command handlers, complete dispatch table, benchmarks | [rb_backend.cpp](target/work/src/gfx_d3d/rb_backend.cpp) | Contains verified functions, unmatched routines and separately counted timer assembly |
| Backend debug drawing | [rb_debug.cpp](target/work/src/gfx_d3d/rb_debug.cpp) | Reconstructed implementation; byte acceptance tracked separately |
| BSP camera-cell lookup, visibility and portal operations | [r_dpvs.cpp](target/work/src/gfx_d3d/r_dpvs.cpp) | Contains verified functions and unfinished work |
| Delayed drawing groups | [r_splitscreen.cpp](target/work/src/gfx_d3d/r_splitscreen.cpp) | Verification is per function |
| All compiled files, in candidate link order | [tus.txt](target/work/src/tus.txt) | Only listed translation units compile |

These are working reconstructed files, **not recovered original developer
files and not a fully verified source release**. Reference-derived names/types
and drafts remain where documented. We validate individual compiled functions
against retail, including their symbol bindings. A plausible reference copy,
a passing behavior test or a whole source file being present does not earn
coverage. No file here should be described as completely matched merely because
some functions in it match.

For the current verified totals and latest proof receipt, read [PROGRESS.md](PROGRESS.md).
The receipt records accepted bodies, source hashes, tests and remaining gaps.
The raw current binding results are [bind.json](target/work/build/bind.json):
only entries with an empty `why` list pass binding; C++ accounting additionally
excludes libraries, authored assembly and embedded non-code spans.
[Source accounting](target/work/proof/source_coverage_current.json) applies those
exclusions. Historical receipts refer to their hashed source snapshots.

Build artifacts live in target/build/, tests in target/work/tests/, evidence
in target/work/proof/. They are separate from the actual source. The verified src/ snapshots are hash-pinned and checked against their build
evidence. They are not edited as a second working tree. The complete standalone
release tree is a later step, after verification.
