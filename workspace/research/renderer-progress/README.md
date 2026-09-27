# Renderer 1.0 — verified-input checkpoint

Independent progress repository: `dev/renderer-progress/`. Partial work belongs
here, not in the release monorepo `cod2engine/`. Promote into that monorepo only
when the owner approves a completed target. This repository has no remote set.

This is a saved partial reconstruction, **not a release target or a finished DLL**.
It preserves exact source inputs and the function-level evidence from the renderer
workspace. Nothing here claims whole-file identity, a working link, or game boot.

- `src/renderer/`: eight complete source files; fresh MSVC replay passed for
  14 functions / 425 bytes, including five host behavioral fixtures.
- `src/jpeg/`: exact compilation inputs for 162 directly resolved JPEG function
  matches / 54,883 bytes. Separate directories preserve separate TU experiments.
- `manifest.json`: accepted function addresses, symbols, exact compiler commands,
  source/object hashes, relocation evidence and hashes of every saved input.
- `evidence/`: renderer referee output and packet; JPEG modification history.

Saved subset: **55,308 bytes**. The broader research tally is 57,746 bytes;
the remaining 2,438 bytes are still in the research workspace, not this checkpoint.

Important: JPEG TUs retain companion functions needed for their compilation
context. **Only the manifest's listed functions are matched**; this is not approval
of every function in those files. Variants including `jutils.c` must not simply be
linked together: they contain duplicate definitions. Their final TU layout remains
unresolved. `format_message` is excluded because its two sprintf bindings remain
unresolved. SDK `ftol2.obj` supplies symbol identity only, contributes zero source
bytes, and is not committed. No proprietary CRT source, game asset, DLL, or object
file is included. IJG terms and provenance are retained in `src/jpeg/README.IJG`
and the original source headers; this does not license the reconstructed engine.
Original source formatting is preserved byte-for-byte for hash provenance;
`git diff --check` reports inherited IJG trailing whitespace. It is not silently
reformatted in this checkpoint.

## Check saved inputs

From this directory:

```sh
python3 verify_saved.py
```

This checks integrity and accounting, **not target byte matching**. For full
byte-match replay use the existing workspace tools below, from `dev/`, with the
private anchor, saved runs and pinned MSVC image available:

```sh
python3 codex/renderer/verify_material.py
python3 codex/renderer/check_jpeg_dependencies.py \
  --encoder-discovery codex/renderer/baseline_jpeg_iiv3cbly \
  --encoder-inline codex/renderer/baseline_jpeg_resg1sio \
  --encoder-preprocess codex/renderer/baseline_jpeg_imk9bf3i \
  --encoder-coeff codex/renderer/baseline_jpeg_imk9bf3i \
  --utility-discovery codex/renderer/baseline_jpeg_jo87fsju \
  --missing-discovery codex/renderer/baseline_jpeg_37wm8ixj \
  --missing-discovery codex/renderer/baseline_jpeg_7d2elyfu \
  --toolchain-ftol2 codex/renderer/scratch/codex_runtime_binding/sdk_ftol2.obj
```

Both commands passed on 2026-09-27 before this checkpoint. JPEG replay validates
hashed saved MSVC objects and source/header inputs; it is not a fresh rebuild of
every JPEG TU. The saved source hashes equal those replayed inputs. Absolute
paths in evidence record the original workspace; they are provenance, not a
portable build system. The clean target/build/verification migration remains work
to do before promoting this to `targets/gfx-mp-1.0`.
