# Verified renderer knowledge

PINNED: retail renderer SHA256 is
4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6.
The original compiler/linker hashes and private image recipe are in toolchain/README.md.

PINNED: accepted source and library extents are enforced by
workspace/work/tools/check_checkpoint.py and regression.py. Their historical
proof hashes remain unchanged during migration; do not replace these gates.

PINNED: RB_CalcSunBlindGlare at1003bda0/352 matches bytes AND bindings after
explicit zero/one/fraction branches. Evidence:
workspace/work/proof/sun_blind_glare_20261104_warm_bind.json and
workspace/work/proof/nov04_sun_predicate_checkpoint.json.

PINNED: Set2D's scene viewport reads are1072dde0/dde4/dde8/ddec, corresponding
to sceneViewport at backEnd+3e0..3ec. They are not backEnd.width/height.
The fixture seeds different scene/output dimensions to detect this error.
Set2D remains a draft; see docs/TRIED.md for its unresolved code generation.

PINNED: the lightmap weight image builder1000fe90/605 matches both referees.
Its unchanged I_fround calls expand assembly, so all605 bytes are excluded
from C/C++ coverage. The same full-body exclusion applies to every listed
assembly-bearing function in source_coverage.py.

SUPPORTED: TU link order and source ownership tables are candidate structure,
not recovered historical boundaries. Keep workspace/work/layout alongside
code. A masked byte match does not prove a call or global binding.

Migration preserves all168 commits on the old master line, adds separate
freeze snapshots for the main/Gemini dirty work, and leaves the old repos
and archived research untouched. No build artifacts are imported.
