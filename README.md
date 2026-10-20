# CoD2Radiant.exe 1.0 reconstruction

![radiant CI](../../actions/workflows/ci.yml/badge.svg)

C/C++ source for the Call of Duty 2 map editor that compiles, with the original MSVC 7.1
compiler, to the retail `CoD2Radiant.exe` byte for byte. Private repo.

- Agents: `AGENTS.md` is the whole contract.
- Facts and evidence: `RULES.md`.
- Progress: every push runs CI. The numbers show up in the run summary, as a commit comment,
  and in Discord if `DISCORD_WEBHOOK` is set.

## Layout

| Path | What |
|---|---|
| `src/` | reconstructed source, one file per original source file |
| `ledger/matches.tsv` | functions proven byte-identical (rechecked on every push) |
| `ledger/defer.tsv` | functions given up on, with the reason |
| `ledger/meter.json` | last accepted numbers; CI fails if a push lowers them |
| `queue/queue.tsv` | work list, easiest first; `queue/claims/` = who is on what (local only) |
| `data/` | function inventory, TU map, library functions, flags, Ghidra decompiles |
| `link/order.txt` | original source-file link order |
| `tools/` | referee and generators |
| `toolchain/` | compiler image recipe |
| `research/` | salvaged older work; hints, not evidence |

## Commands

```
make show A=0x004acd90                     # everything about one function
make try S=src/xanim/xmodel_utils.cpp A=0x004acd90
make verify                                # recheck every ledger row
make gate                                  # verify + meters, fails if anything went down
make accept                                # gate, then write the new numbers to ledger/meter.json
make queue / map / libs                    # owner: regenerate queue, TU map, library list
```

## Toolchain

`toolchain/build.sh` builds `cod2-radiant-msvc71` from `dev/sdk/vs2003/msvc710_vs2003.tar.gz` plus
MFC 7.1 from VS.NET 2003 disc 1 (`dev/sdk/vs2003/VSPROD1.7z`). Disc 1 is a raw image with 2448-byte
sectors: keep bytes 16..2064 of each sector to get an ISO, then `7z x` it into `toolchain/_extract/disc`.
CI pulls the same image from `ghcr.io/<owner>/cod2-radiant-msvc71:1` (private package).
