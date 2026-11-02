# Renderer reconstruction rules

Read the parent universal laws, PROGRESS.md for current state and WHOLEFILE.md
for execution order. Superseded rules: archive/docs_20261021/RULES.md.

## Scope and finish line

Work only inside gfx. Target: gfx_d3d_mp_x86_s.dll 1.0, readable reconstructed
C/C++ producing the entire retail SHA256:
4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6.
Whole-file identity drives priorities; coverage is a secondary diagnostic.
Assembly stays separately attributed. No retail byte arrays, fabricated
callbacks, `_emit` wrappers, post-link copying or arbitrary layout fillers.

## One tree, one build

- Active source: target/work/src. Only src/tus.txt TUs compile. Partial files
  can contain drafts; accepted bindings identify credited code.
- Build/check from gfx: `sh target/work/tools/build.sh`. Reuse its one build;
  serialize links. No duplicate outputs or archived build scripts. No extra
  workers/worktrees without authorization; coordinate ownership before delegation.
- src/tus.txt holds candidate link order; src/profile.mk holds per-TU flags.
  Maintain helper/data/library ownership in target/work/layout/README.md alongside
  code. Candidate order is not historical proof. Do not defer layout to100%.
- Shared headers remain in target/src/shims and target/src/opencod2/headers.
  Shared ABI/type changes require evidence and affected-source regression.
- Separate source, tests, proof and layout. Record bounded failed attempts in
  target/work/ATTEMPTS.md. PROGRESS.md is the only current status log.

## Evidence and gates

Target bytes outrank analysis labels, agreeing references and structural refs.
Local API evidence: target/work/proof/retail/. Mac names/types and opencod2/
KisakCOD are references, not PC binary proof. Tag non-obvious facts PINNED,
SUPPORTED or HYPOTHESIS; never ship hypotheses. Never guess offsets/signatures.
A register mismatch alone does not prove source/compiler matching impossible.

Both byte and binding referees must pass. Retain every protected extent and
source-attribution gate after code/layout waves; preserve historical proof
hashes. Never relax a gate, bypass regression or count stale objects. /FORCE
and unresolved-symbol experiments are not release evidence.
V2 function match -> V3 regression -> V4 whole-file SHA -> V5 smoke test.
Claim only rungs actually proved. Discovery is not verified coverage.
Original VC7.1/Summer2004 libraries and correct upstream IJG sources are
dependency inputs, not authored game credit. Do not reverse library internals
again just to move a meter. Compiler-visible path mapping is not a second tree.

## Safety and cost

Cache only with complete input/toolchain identity. Batch related work, reuse
fresh objects and inspect connected callers before tiny syntax sweeps. Preserve
failed attempts. Archive obsolete material recoverably; no broad deletion.
Preserve other agents' work and unrelated staged changes. Do not edit foreign
tracks or promote to the release tree without owner direction. Never commit
retail binaries, objects, assets, SDK payloads or Ghidra projects. Use configured
Nawaf identity, short commits, no Co-Authored-By; never push without "push it".

## Work scope and cost

- Read the current owner direction and PROGRESS.md before historical next steps.
  A paused goal is not resumed by old ACTIVE statements in a receipt/handoff.
- Reuse the existing retail-file layout, source tree, manifests and tools.
  Finish a bounded requested layout pass without requiring full source recovery.
- Batch connected source/interface/layout edits before the original build and
  regression pass. Do not run the full suite after each small leaf addition.
  Documentation-only updates need relevant consistency checks, not a rebuild.
- Compare current inputs/output with a receipt before quoting it as current proof.
  Keep C/C++ bytes, normalized file spans and raw same-offset equality distinct.
- Record net verified progress and open dependencies; tests written/passed and
  unmatched bodies do not by themselves increase verified reconstruction.
