PINNED: SMC_AllocCachedSurface1002acd0/215 recomputes the indexed freelist
address after the split callback instead of retaining a head pointer in ESI.
Direct cache->freelist[listIndex] accesses reproduce the late ESI save and
unlink operand order. Both byte/binding referees and local regression pass;
evidence:workspace/work/proof/cache_allocator_20261105_warm_bind.json and
nov05_cache_allocator_checkpoint.json. Clean CI is required before landing.

PINNED: copier1002b790/82 reads cached->xsurf/triIndices before baseVertIndex.
Reordering those initializations reproduces the incoming EAX use and all bytes
and bindings. Evidence:workspace/work/proof/cache_indices_20261105_warm_bind.json;
negative guards and local regression are in nov05_cache_indices_checkpoint.json.
Historical TU completeness is not inferred from current emitted-body matching.

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

## Transform and diagnostic findings - 2026-11-05

PINNED: R_GetRigidTransform1001ee70/399 passes both byte and binding referees
with definition-level __declspec(noinline), preserving its original arithmetic.
Retail stacks output/scale and uses ECX/ESI/EDX inputs. Evidence:
workspace/work/proof/rigid_transform_20261105_warm_bind.json,
rigid_transform_20261105_negatives.json; clean work CI42036887579 and canonical
CI42038128889. Both retention tools reject removal/unverification of the body.
This is not evidence to add noinline elsewhere; the other boundary probes fail.

PINNED: canonical meter bd80a2ea names source commit db75b7d2. The meter's
119171/253580 C/C++ bytes excludes all40 assembly-bearing bodies in full.
Root source snapshots and current emitted-body-certified TUs are separate
measurements. Two common.obj owners remain ambiguous. Historical TU boundaries
and full-DLL source completion are not established by these counts.

PINNED: the24 tested private vertex signatures all fail. They permute the four
float-vector inputs with bone/output last; they do not cover all720 possible
six-argument signatures. Receipt:proof/vertex_order_20261105.json. No candidate
or coverage was accepted. All three explicit DX7 expression variants also fail;
see TRIED. Do not repeat these batches without new primary evidence.

PINNED: filtering cmp bodies after building the complete sorted symbol table
preserves the next-symbol extent. Filtering that table first would change sizes.
Evidence:tests/test_short_candidates.py exact/missing/plain-name cases and the
real filtered/full row equality recorded in vertex_order_20261105.json.
The --symbol mode is diagnostic only. A passing probe still runs full cmp,
bindcheck, regression and source accounting. It does not certify bindings.

PINNED: the32-bit native fixture can fail with SIGSYS under sandbox seccomp;
the same existing fixture passes outside that restriction. This is not a source
regression. Log:proof/latest/nov05_dx7_explicit_native.log (local diagnostic).
Native tests grant behavioral evidence, not original-compiler byte identity.

PINNED: MP 1.3 gfx_d3d_mp_x86_s.dll (sha 243505f5) differs from MP 1.2 (aed5b8de)
in 24 bytes only: PE timestamp 0x130, 0x10c204 and two .rdata spans near 0x19c92c
and 0x19d4e4. Both have .text 0x10a570 (1.0: 0x10a090). FASTPATH_11-04 "1.3 = 2.9%,
different build" is wrong; that row measured another binary. Order: finish 1.0,
port to 1.2, then 1.3 is a near-trivial patch. Evidence: cmp -l, objdump -h.

PINNED: tools/cmp.py capped raw byte hits at 8. Common SDK bodies (e.g. 33-byte
scalar deleting destructors ??_GCPool/_GCConstant/_GCFragmentInfo) have more
retail copies, so the caller-placed address (AddPool calls 0x100cb926) was absent
and the binder could never place them; 80 KB of chains hung on that. Cap 64:
+96 bound functions/+86990 library bytes, zero previously bound bodies lost
(same DLL, referees rerun). Binder acceptance predicates unchanged.
