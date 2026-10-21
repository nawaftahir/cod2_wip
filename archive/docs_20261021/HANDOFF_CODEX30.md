# Renderer: independently reproduced 30% checkpoint

2026-10-09. REVIEWABLE candidate; owner/Claude adoption is still required.

## Result

`python3 tools/gamecov.py target/build/codex30_checkpoint/bind.json`:

**467 unique game functions, 76,102 / 253,580 bytes = 30.011%.**

Compared with the pinned starting build: **+28 functions / +8,844 bytes**.
All 439 baseline game target/extent pairs remain, and all 465 matches from build 72
remain. Cold compilation and both unchanged referees completed successfully.
The goal was game-code coverage, not library-inclusive DLL coverage.

The denominator is the existing SUPPORTED GLM game inventory. This is not an
independent audit of every retail boundary, not 30% of the entire DLL, and not a
release-ready checksum-identical renderer. V2 matching and V3 regression are proved;
V4 whole-file identity and V5 real-GPU smoke testing are not.

## Source and evidence

- Readable working source: `target/scratch/codex30_merge/src/`.
- Frozen source/evidence: `target/scratch/codex30_merge/proof_30011/`.
- Full new-function list with source paths: `proof_30011/acceptance.json` and
  `target/scratch/codex30_merge/REPORT.md`.
- Fresh artifacts: `target/build/codex30_checkpoint/{gfx.dll,gfx.map,gfx.pdb,cmp.json,bind.json}`.
- Actual profiles: `profile_cwinding.mk` -> `profile.mk` -> unchanged `closed.mk`.
  Bounds TU gets `/Op`; com_math retains its existing `/Op`; the winding C TU uses
  `/TC`. No /QIfist or processor-profile experiment is inherited.
- Toolchain image: `sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131`.
- SDK/header identities: `proof_30011/external_inputs.sha256`. Frozen source and
  referee identities: `proof_30011/source_tools.sha256`.

The source tree contains unverified neighboring bodies needed for ongoing work and
LTCG context. Only acceptance.json's target/extent rows are new verified progress;
no entire TU or historical TU grouping is certified. Pre-existing assembly debt is
inherited; this campaign adds no assembly, retail byte arrays or post-link patches.
`target/verified/src`, `target/build/v`, the release tree, and shared checkers were
not edited. No commit or push was made. Compiler `_CL_*` scratch files were left
alone and excluded from the frozen source copy.

## Last two accepted functions

| Function | Retail VA | Bytes | Source |
| --- | --- | ---: | --- |
| Image_Release | 0x1000c910 | 87 | gfx_d3d/r_image.cpp |
| Image_GetSurface | 0x1000d4b0 | 87 | gfx_d3d/r_image.cpp |

Image_Release reuses the retail track switch and release/null/zero sequence.
R_ReleaseLostImages calls this real helper and retains its baseline match.
Image_GetSurface's non-retail export was removed: it had forced a stack convention
instead of the target's internal ESI argument. Ordinary LTCG now generates the
matching convention with the same C++ declaration, no wrapper and no fake caller.

## Independent review commands

From `gfx/`:

```
python3 tools/gamecov.py target/build/codex30_checkpoint/bind.json
python3 target/scratch/codex30_merge/audit_checkpoint.py
python3 target/scratch/codex30_merge/test_audit_checkpoint.py
python3 target/scratch/codex30_merge/test_resampling.py
python3 target/scratch/codex30_merge/test_model_cleanup.py
python3 target/scratch/codex30_merge/test_lighting_cache.py
python3 target/scratch/codex30_merge/test_lookup_and_images.py
```

The audit only checks the referee outputs; it cannot manufacture matches. Its
negative tests reject a missing baseline function, a changed extent, and a packet
below 30%. Behavior fixtures use host-side imports/COM mocks, not a real GPU.
The lookup fixture explicitly reads the preserved DEFER draft, not canonical source.

For a fresh independent build, choose an unused `build/codex30_review` directory.
From `gfx/target/`:

```
mkdir -p build/codex30_review/tmp
docker run --rm --pid=host --network none \
  -v /home/nawaf/cod2/test/dev/gfx/target:/w \
  -v /home/nawaf/cod2/test/dev/sdk/sum2004:/dxsdk:ro -w /w \
  -e TMP='Z:\w\build\codex30_review\tmp' \
  -e TEMP='Z:\w\build\codex30_review\tmp' \
  sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
  make -j4 -f scratch/codex30_merge/profile_cwinding.mk IN_IMAGE=1 \
  SRCDIR=scratch/codex30_merge/src B=build/codex30_review DBG=1 \
  build/codex30_review/gfx.dll
docker run --rm --network none -v "$PWD/build/codex30_review:/w" \
  --entrypoint chown cod2-msvc71-build -R 1000:1000 /w
python3 ../tools/cmp.py build/codex30_review/gfx.dll build/codex30_review/gfx.map \
  ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll build/codex30_review/cmp.json
python3 ../tools/bindcheck.py build/codex30_review/gfx.dll build/codex30_review/gfx.map \
  ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll \
  build/codex30_review/cmp.json --json build/codex30_review/bind.json \
  --pdb build/codex30_review/gfx.pdb
python3 scratch/codex30_merge/audit_checkpoint.py build/codex30_review/bind.json
```

Wait for compilation to finish successfully before comparing; never accept stale
JSON after a failed build. Match identity is source/toolchain/SDK-bound; debug PDB
timestamps or GUIDs can differ on replay, so do not require the whole experimental
DLL hash to reproduce byte-for-byte as a substitute for the referees.

## Checkpoint hashes

```
retail anchor 4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6
gfx.dll       f1949307d9b3d1916ca064dc90f74bbcff55847916016d1bde58b91c959186b6
gfx.map       36db100f487726025e0841aafa77fb0e0fea21c091d85550a87a46b8e0f3be66
gfx.pdb       d15cf48da26ae9d306aa50f471aa3df5eb412fd83bba98692c514e3573ee8db4
cmp.json      1d4b418c09d4b3cd2159eef9140886d64350939cc9d3d057ac775d7723786288
bind.json     aad32296ade6e37e048177c77ad3548c3f5b8b5414423be33e520e8427cc1e3c
baseline bind 71df8eac7314fe394f8966b40fe8d426f6b42d58b84c46230220140f69145dab
```

## Preserve, do not credit

`deferred_src/gfx_d3d/` retains failed AABB, model, lighting-allocation and lookup
drafts. The 403-byte AABB body still differs in two SIB encodings. Lighting-cache
allocation reached a one-store near match in build 84. Neither is accepted.
Build 87 failed compilation; any diff against its older DLL is invalid evidence.

The 82-byte lookup update at 0x10020790 reproduces the body, but the unchanged
checker misattributes its negative-offset/one-past-member references to neighboring
s_cache. This causes a genuine verifier rejection and two baseline losses.
Build 90 also suffered three upload-helper rejections from linear disassembly of
jump-table bytes as an external jump. No checker was weakened; the rejected results
are excluded. Failed experiments were removed from the candidate without deleting
their preserved source/evidence. The final cold checkpoint has zero baseline losses.

## Fast next work

First independently replay and review this candidate; merge only accepted changes
after checking the complete game target/extent ledger. Keep working in scratch;
do not copy every unverified body into the release tree.

Then prioritize real caller/callee cohorts (not isolated register-argument leaves):
RB_EndSurface at 0x1003a8d0 and its backend helpers, or a complete world-loader group.
Reuse fresh objects across checks. Time-box near-misses to a few evidence-changing
trials, then preserve them and move on. Existing refs remain valuable for names and
types, but cannot override retail constants, ABIs or bytes. Any verifier correction
must be independently reviewed with positive/negative tests before it affects
coverage; neither identified false-negative is permission to bypass a gate.
