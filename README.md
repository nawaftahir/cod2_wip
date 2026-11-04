# client 1.3 (CoD2MP_s.exe 1.3)

Byte-matching reconstruction of the CoD2 multiplayer client 1.3 (MSVC 7.1 `/O2 /GL`, `link /LTCG`).
Branch `client/1.3/main`, worktree `cod2_wip/client-1.3/`. Anchor: `../binaries/windows/1.3/CoD2MP_s.exe`.

| Path | What |
|---|---|
| `src/` | TUs whose every function the referee reports matched (`data/verified_tus.txt` at import) |
| `workspace/` | every other TU, headers, `tus.txt` (link order + per-TU flags) |
| `tools/` | referee, gate and analysis scripts (`tools/ghidra/` = name tables cmp uses, `tools/oracle/`) |
| `data/` | referee baselines (`good13.json`, `ties13.txt`, `ratchet13.*`), runs, tables |
| `docs/` | `STATUS.md`, `KNOWLEDGE.md`, `TRIED.md`, generated `WORKLIST_1.3.md`/`LAYOUT_1.3.md`, `CI_NOTES.md`; `archive/` = old raw notes |
| `toolchain/` | image recipe; `toolchain/vc70/` (VS .NET 2002 cl/lib, not in git) |
| `lab/` | old experiments (spike, rich, ltcglab, scratch) |

The build merges `workspace/` and `src/` into `build/tree/` and mounts it as the compile root, so
moving a TU between them never changes its compile path.

- Gate: `tools/ratchet13.sh` (release build, shameter + `tools/cmp13`; OK only if matched-fn bytes
  do not drop and no matched fn is lost vs `data/good13.json`). `tools/ratchet13.sh accept` records
  the new baseline and writes `meter-1.3.json`. Only the gate writes the meter.
- Moving a TU into `src/`: only when every one of its functions is matched in `data/good13.json`;
  the meter counts `unverified_in_src`.
