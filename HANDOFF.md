# Claude handoff: renderer layout preparation

## Codex, start here (2026-10-24, after the structure merges)

The owner's current goal: finish putting the source into the retail file
structure, then go back to byte-matching new functions INSIDE that
structure. When you stop, write a short report (what you did, measured
numbers, what you reverted) at the end of this file: Claude reviews it.

### State you start from

- Every candidate TU that had a retail home is merged into it, in retail
  address order. Latest: r_material_shader -> r_material_load_obj (real
  ID3DXConstantTable, no SDK shim); rb_shade_lights + rb_shader_matrices
  -> rb_shade (PC types; rb_backend.h currentEntity/currentEntityLighting
  are now typed). RB_ScaleWorldMatrix was removed: a duplicate of
  RB_ScaleCodeMatrix at 10038c60.
- Build + all gates green, 1448 protected extents kept, 139/139 fixtures.
- C++ coverage 104380/253580 = 41.16255%, 618 bodies.
- Same-offset 167879/1851392 = 9.068% (layout diagnostic only).
- Candidate SHA256 65137c74a69f1ee97e189c94ec0846ecf5a17c3950910c2f897f1d6d95eb0600.
- Protected bind SHA256 unchanged (3a19cc20...c59, see below).

### Task 1: the remaining file moves (layout/README.md "Still to merge")

Do these one at a time; one gated build each (tools/build.sh must end with
"Build, referees and checkpoint regression passed"). Revert any move that
loses an extent; do not "fix" the gate.

1. 5 r_dxbuffers fns -> r_init.cpp; the other 2 -> r_buffers.cpp.
2. 2 rb_buffer_upload fns -> rb_shade.cpp.
3. New r_buffers.cpp (retail file, missing): its fns now in r_bsp_load_obj
   (3), r_dxbuffers (1), r_xsurface_load_obj (1). Add it to tus.txt in its
   retail slot.
4. New r_cmds.cpp (missing): 2 fns now in r_init.
5. r_dpvs_winding (C, /TC) -> r_dpvs.cpp only if it keeps every extent
   (C names change to C++ mangling; check bindcheck).

Leave alone (blocked, not tasks): r_model_lod (/Op vs non-/Op r_model) and
r_lightgrid_weights (moving it costs 9 extents, fabs link-order rule).

For every move: keep the section comment fixtures slice on, repoint the
fixtures that read the old file (grep tests/ for the old file name), update
layout/README.md tables and layout/fragments.json, then
`python3 target/work/tools/file_layout.py target/build/codex_boundsoutside_1016_02`
and `python3 target/work/tools/evidence.py target/build/codex_boundsoutside_1016_02`.
Run the full fixture suite once after the build.

### Task 2: new functions, inside the structure

Look the address up in layout/file_layout.tsv; put the body in that retail
file in address order. No new TUs. Next lead: the static-model load chain
(about 3 KB): 10003880 (entity loader, two passes, "misc_model") ->
100031b0 (misc_model) -> 10002e80 / 10002ed0 (float / vec3 spawn-var
lookups; 10002ed0 has the shape of CoD2rev G_SpawnVector, index starts at 1
because slot 0 is classname) plus unwritten r_staticmodel_load_obj fns
1002a570, 1002a6d0, 1002a730, 1002a780, 1002a860. The two leaves take
register arguments (LTCG custom convention), so they only match together
with their callers: write the chain caller-first. Decompiles:
../glm/data/decomp/<addr>_*.c (shape hints only; retail bytes decide).
Diff helper: `python3 target/build/probe/fdis.py OURADDR RETAILADDR SIZE`.

### Rules that do not change

Game source only: JPEG, CRT, std:: and D3DX are dependencies. Every new body
cites `// PINNED 1000xxxx` (retail start); unconfirmed names get a
"descriptive name" comment. No dummy callbacks, filler, _emit, retail byte
copies, /FORCE links. A file may mix real-D3D and Mac-type code:
`#include "r_local.h"` first, then `#include "gfx.h"`; regenerate SDK guards
with tools/sdk_guard.py, never hand-edit them. Comments: one short ASCII //
line. Never edit compiler inputs while a build or the fixture suite runs.
Do not commit; the owner commits (explicit paths only, never the whole
index).

## Workspace and reading

Work ONLY in /home/nawaf/cod2/test/dev/gfx (its own git repository).
Read RULES.md, this handoff, PROGRESS.md and WHOLEFILE.md. Parent dev/CLAUDE.md
and the cod2-re skill also apply. WHOLEFILE.md contains chronological notes;
its older API-first implementation priority is superseded by the owner direction
above. Its opening status/table is stale in places: use the checkpoint below.

Actual source: target/work/src/. Only src/tus.txt is compiled. Existing tree:

    target/work/src/gfx_d3d/   renderer files and shared interfaces
    target/work/src/universal/ shared engine/math/parser source
    target/work/src/jpeg-6b/   upstream JPEG dependency
    target/work/src/tus.txt    current candidate object/link order
    target/work/src/profile.mk per-TU compiler settings
    target/work/src/roots.txt  temporary retention/export roots
    target/work/layout/       ownership notes, API inventory, generated map/layout
    target/work/tests/         actual-source native fixtures and evidence checks
    target/work/proof/         checkpoint receipts and original build/referee logs

Do not create another source tree, worktree or build directory. Do not delete
codex/, foreign tracks, SDKs, original binaries or reference inputs. No broad
cleanup or rm -rf. Existing drafts need provenance, not deletion by filename.

## Verified checkpoint to preserve

Numbers are in "State you start from" above. Older numbers in PROGRESS.md
and WHOLEFILE.md are history. Build log: target/build/codex_boundsoutside_1016_02/build.log.

Immutable protected bind:
    target/work/proof/image_residency_warm_bind.json
SHA256:3a19cc20bd06656bbc5b30274f423feda712364f22fda7155c8ff58122f67c59.
Do not change its hash or weaken tools/check_checkpoint.py/source_coverage.py.

The structure merges are uncommitted working-tree changes; the owner decides
when to commit them. Many unrelated legacy paths were ALREADY staged; never
commit that entire index. Use explicit paths and git commit --only.
Configured git identity is Nawaf. No Co-Authored-By; never push without "push it".

## Important existing structural facts

- API59 has108 slots:98 written callbacks and10 zero slots. The retained retail
  initializer evidence is proof/retail/refapi_pinned.json. Its legacy names are
  frequently wrong/shifted; they are not authoritative signatures.
- layout/api_callbacks.tsv has54 accepted callback source TUs. Six additional
  bodies match but their callee bindings fail; exact symbols/TUs/reasons are
  recorded separately.38 other callbacks remain unclassified. This does NOT
  mean44 callback bodies are missing. Existing candidate ownership is not
  original historical TU grouping proof.
- Six open edges: Shutdown->RB_SaveLightVisHistory; BeginRegistration->R_Init;
  BeginFrame->R_UpdateFrameDvars; RegisterFont->R_LoadFont;
  BeginCubemapShot->R_ClearForCubemapShot; SaveCubemapShot->R_WriteCubemapShot.
- Known source gaps include LoadWorld10001690, actual RenderScene100257a0,
  API material wrapper10017290 and raw-image172b0/171f0/fc30/14940. These are
  downstream implementation tasks, not prerequisites to write the initial map.
- Material_Register10017100 already exists. IWI Image_LoadFromFile1000fa40
  already exists; it is NOT raw loader1000fc30. Do not confuse similar names.
- Remaining backend entries:19 sprite,21 text,22 text-space,23 surfaces,24 sun,
  26 late post,27 sun post. Actual table10190518 has34 entries including zero.
- Source shared headers include rb_commands.h, rb_tess.h, rb_backend.h,
  r_permanent.h, r_scene_records.h and r_sun_state.h. Common and SDK type views
  still need careful consolidation; never edit an inactive #if0 copy as a fix.
- Existing authored I_fround/FastSinCos may be reused under current policy,
  but add no new authored FP-status/rounding assembly. Keep containing matches
  separately attributed. Owner explicitly deferred those matching problems.
- Retail CodeView GUID/path/age are pinned in ATTEMPTS.md. Candidate GUID/age
  differ and reused PDB age advances; final reproducibility is unresolved.
  Do not patch/normalize the final file to fake the retail checksum.

## One build, when actually needed

From gfx:

    docker ps --format '{{.ID}} {{.Image}} {{.Names}}'
    sh target/work/tools/build.sh > target/work/proof/latest/<batch>_build.log 2>&1
    python3 target/work/tests/run.py > target/work/proof/latest/<batch>_fixtures.log 2>&1

Inspect current containers first; leave client/Radiant/server/mod work alone.
Run tests AFTER build/referees finish, never concurrently with a rebuild. Keep
one live process handle; an observation timeout is not permission to restart it.
Do not edit compiler inputs while a build or freshness-sensitive suite runs.
Native32/Docker require the environment's usual elevated execution permission.
The last renderer build/test handles have ended successfully.

One output:target/build/codex_boundsoutside_1016_02;work/build symlinks to it.
Compiler-visible scratch/codex_boundsoutside_1016 remaps the same canonical source;
it is not a second tree. Pinned image:
sha256:093ff3cf41bff5ef6b7ef1dafce5ace185814c694066cdeef2686042d5324c7d.
MSVC13.10.3077, candidate /O2 /GL /MT and /LTCG; current /OPT:NOREF /OPT:NOICF
and temporary roots are experiments, not recovered historical settings.
SDK:../sdk/sum2004. Retail anchor:
../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll.
Read-only references:../glm,../refrences/cod2-mp-macho,opencod2/KisakCOD.
Target bytes outrank every reference. Do not assume reference code is PC1.0.

## Codex report (fill in when you stop)

- Moves done: all five listed steps, plus the cache initializer in r_staticmodelcache. Eighteen bodies relocated across seven gated moves; all1448 extents retained.
- Moves reverted: none. Two stale fixture boundaries were corrected; no compiler gate was relaxed.
- New bodies: structure work adds no byte credit. The next source wave binds vec3 lookup10002ed0/115 and hex lookup10002f50/192 in r_bsp_load_obj.cpp:307 new C++ bytes.
- Coverage:104380 ->104687/253580 (41.283618582%),618 ->620 bodies. Same-offset9.067717696% ->9.185953056%. Actual fixtures135 ->139. Original starting handoff139 count was stale.


- Codex codex_upload_merge: dynamic index and vertex uploads moved into rb_shade; build/referees and1448 extents pass, 135/135 fixtures. C++104380/253580 (41.162552252%), 618 bodies; same-offset9.068581910%. No new byte credit; no move reverted.

- Codex codex_buffers_merge: five static-buffer helpers moved into r_buffers; build/referees and1448 extents pass, 135/135 fixtures. C++104380/253580 (41.162552252%), 618 bodies; same-offset9.077656164%. No new byte credit; no move reverted.

- Codex codex_cmds_merge: console command registration moved into r_cmds; build/referees and1448 extents pass, 135/135 fixtures. C++104380/253580 (41.162552252%), 618 bodies; same-offset9.070418366%. No new byte credit; no move reverted.

- Codex codex_cache_buffer_merge: cache vertex-buffer initializer moved into r_staticmodelcache; build/referees and1448 extents pass, 136/136 fixtures. C++104380/253580 (41.162552252%), 618 bodies; same-offset9.065827226%. No new byte credit; no move reverted.

- Codex codex_winding_merge: convex winding helpers merged into r_dpvs as C++; build/referees and1448 extents pass, 136/136 fixtures. C++104380/253580 (41.162552252%), 618 bodies; same-offset9.064800971%. No new byte credit; no move reverted.

Structure checkpoint: target/work/proof/structure_checkpoint.json. The first five r_dxbuffers moves also pass; their logs are proof/latest/codex_dxbuffers_merge_*.log. No commits or pushes. Task2 source is now in the canonical retail files; accepted leaves and remaining drafts are described below.

## Final Codex checkpoint - 2026-10-24

- All five handoff steps plus cache-buffer ownership correction and the
  later-confirmed bounds move pass:18 relocated bodies, no move reverted.
  r_model_lod/lightgrid_weights remain the explicitly deferred flag splits.
- Added the genuine static-model entity/validation/transform/lighting chain
  in r_bsp_load_obj.cpp and r_staticmodel_load_obj.cpp. Only two new bodies
  receive byte credit:10002ed0/115 and10002f50/192. Other bodies are drafts;
  exact residuals and rejected source forms are in ATTEMPTS.md. No impossible
  compiler claim, assembly addition, fake API/root or relaxed referee.
- Original build + BOTH referees + all1448 protected extents +139/139
  fixtures pass, including ten new binding-corruption negatives. Old31
  assembly exclusions/7787 bytes and protected bind hash remain unchanged.
- C++104380 ->104687/253580 (41.283618582%),618 ->620 bodies.
  Same-offset9.067717696 ->9.185953056% (diagnostic).
  Candidate SHA256:9efd41a9f8999c8598dc3c8a9f6a104037dfecb3fa4e53438b3bf73012ef1070. Whole-file SHA/runtime OPEN.
- Final receipts: target/work/proof/static_model_checkpoint.json and
  static_model_checkpoint_inputs.json. Final build/fixtures:
  proof/latest/codex_static_bounds_merge_*.log. No commits or pushes.
