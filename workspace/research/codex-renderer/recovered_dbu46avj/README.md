# Recovered engine source candidates

78 files, 79 engine candidates, preserved from GLM with original source hashes.
All 79 reproduced strict instruction-shape matches when freshly compiled from
this snapshot (`../baseline_6ygs9qm0/results.json`). That is NOT source/ABI/binding
review or release progress. Preserve the recorded flags and full TU contents.

The manifest also references 94 CRT source matches in GLM. Authentic Microsoft
CRT source was not copied here; redistribution rights must be reviewed separately.
No assembly/byte transplants, retail binaries or game assets are included.

Names and extern prototypes may be wrong. See `../LABEL_CORRECTIONS.md` for
confirmed naming problems. Unresolved signatures/bindings require DEFER, not a
plausible replacement. This is a working research snapshot, not canonical source.

Rebuild engine candidates:

```sh
python3 codex/renderer/batch_existing.py --manifest codex/renderer/recovered_dbu46avj/manifest.json
```

The clean, manually-reviewed candidate families live in `../src/` and have their
own verifier. Do not combine their coverage with overlapping snapshot functions.
