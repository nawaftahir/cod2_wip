# Claude handoff: renderer layout preparation

## Owner's latest instruction comes first

The owner PAUSED the old "stage 1-3 now" goal. Do not resume the reconstruction
campaign from PROGRESS.md's old next-action text. The immediate request is the
initial file/layout setup that makes later byte matching easier. Keep this small
and concrete. The owner is frustrated with days of tiny function waves, repeated
full suites and little movement on the requested structural checkpoint.

Do the layout preparation first. It does NOT require implementing every missing
callback, world loader, scene renderer or backend command. Mark genuine missing
code/interfaces as open entries. Do not turn a preparatory layout pass into an
open-ended source-recovery campaign. Do not claim a layout plan is historical
proof, source completion or a matching retail binary.

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

## The short layout task

Use the existing tree and manifests rather than reorganizing everything.

1. Record the intended source-file groups and which existing TU owns each
   shared global, table and helper. Reuse layout/README.md. Keep one allocation
   for ri/rg/rgp/vidConfig, backEnd, tess, scene, dx/dxState and sunFlareState.
2. Make tus.txt the explicit candidate object order and profile.mk the actual
   per-TU flags authority. Separate observed order constraints from guesses.
   Do not sort files mechanically by the earliest shared helper address.
3. Outline whole-file contributors: real entrypoint/GetRefAPI and tables,
   .text, constants/strings, initialized/zero-initialized data, SDK/CRT/JPEG
   library members, imports/exports, relocations and PE/debug metadata. List
   missing contributors explicitly, with source owner/path where known.
4. Leave one concise layout checkpoint/next-action list in PROGRESS.md and
   the existing layout notes. State what is settled, what is a candidate and
   what remains unknown. Preserve the current verified source. A full source
   rewrite, speculative compiler sweep or new parser framework is not this task.

Only run a build when changing compiler inputs/order or when verification is
needed for the layout change. Batch related edits into ONE build/referee/full
regression pass. Documentation-only classification does not need a rebuild.
No dummy callback table, marker root, size filler or unresolved /FORCE link.

## Verified checkpoint to preserve

HEAD at handoff: a019106 (API dependency audit; metadata only).
Last code commit: e3bce0e (early-post command).
Earlier code commits:25f681d lines/XYZ writer;356dda5 points;a2eb71b triangles.

Last original build and BOTH unchanged byte/binding referees passed, followed
by all135 fixtures. Logs:

    target/work/proof/latest/early_post_build.log
    target/work/proof/latest/early_post_fixtures.log
    target/work/proof/early_post_checkpoint.json

Protected accepted address/extents:1448, exact set unchanged.
Authored C/C++104237/253580=41.106159792%,617 bodies on a frozen legacy game
inventory; NOT whole-file completion.31 assembly-bearing bodies/7787 bytes
excluded. Latest backend command source:26/33 handlers, not a complete dispatcher.
Current whole-file same-offset equality:9.138583293%, a layout diagnostic only.
157 temporary exports, GetRefAPI absent. No GPU/game smoke or retail SHA claim.
Candidate SHA256: 2cede0c8d63e87127bac11e6aafb04c7f47827e5706e139d46edb3162dd1afaa
Retail SHA256:4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6.

Immutable protected bind:
    target/work/proof/image_residency_warm_bind.json
SHA256:3a19cc20bd06656bbc5b30274f423feda712364f22fda7155c8ff58122f67c59.
Do not change its hash or weaken tools/check_checkpoint.py/source_coverage.py.

Two generated tracked files are modified after the last build:
    target/work/layout/current.json
    target/work/proof/source_coverage_current.json
These are expected current evidence, not uncommitted source changes. No pending
source edits from this session. Many unrelated legacy paths were ALREADY staged;
never commit that entire index. Use explicit paths and git commit --only.
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
