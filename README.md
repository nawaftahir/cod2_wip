# client 1.0 (CoD2MP_s.exe 1.0)

Byte-matching reconstruction of the CoD2 multiplayer client 1.0 (MSVC 7.1 `/O2 /GL`, `link /LTCG`).
Branch `client/1.0/main`, worktree `cod2_wip/client-1.0/`. Anchor: `../binaries/windows/1.0/CoD2MP_s.exe`.

| Path | What |
|---|---|
| `src/` | TUs whose every function the referee reports matched (`data/verified_tus.txt` at import) |
| `workspace/` | every other TU, headers, `tus.txt` (link order + per-TU flags) |
| `tools/` | referee, gate and analysis scripts (`tools/ghidra/` = name tables cmp uses, `tools/oracle/`) |
| `data/` | referee baselines (`good.json`, `ties.txt`), runs, tables |
| `docs/` | knowledge, lessons, handoffs; `docs/CI_NOTES.md` = what a build needs |
| `toolchain/` | image recipe; `toolchain/vc70/` (VS .NET 2002 cl/lib, not in git) |
| `lab/` | old experiments (spike, rich, ltcglab, scratch, ci batch patches) |

The build merges `workspace/` and `src/` into `build/tree/` and mounts it as the compile root, so
moving a TU between them never changes its compile path.

- Gate: `tools/ratchet10.sh` (replaces `lab/mym.sh` + `~/lv.sh`): `make` + `tools/cmp.py` for the
  matched-fn bytes and fn-loss check vs `data/good.json` (ties in `data/ties.txt`), then `make release`
  + `tools/shameter.py` for same-offset bytes. `tools/ratchet10.sh accept` records the baseline and
  writes `meter-1.0.json`. Only the gate writes the meter.
