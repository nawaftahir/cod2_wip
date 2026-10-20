# CoD2Radiant.exe 1.0 reconstruction

![radiant CI](../../actions/workflows/ci.yml/badge.svg)

C/C++ source for the Call of Duty 2 map editor that compiles, with the original MSVC 7.1
compiler, to the retail `CoD2Radiant.exe` byte for byte. Private repo.

- Agents: `AGENTS.md` is the whole contract.
- Facts and evidence: `RULES.md`.
- Progress: every push runs CI. The numbers show up in the run summary, as a commit comment,
  and in Discord if `DISCORD_WEBHOOK` is set.

## Status (2026-10-20)

| | functions | bytes |
|---|---:|---:|
| All functions (Ghidra inventory) | 6,234 | 998,174 of 1,204,750 `.text` |
| MFC/CRT library code (identified; linked, never written) | 2,173 | 235,493 |
| Game code (must be written) | 4,061 | 762,681 |
| ... with a known source file (48 files) | 1,194 | 424,466 |
| ... source file still unknown | 2,867 | 338,215 |
| Matched from source | 61 | 3,816 (0.50%) |
| Rebuilt exe bytes in place (the SHA goal) | | 0% (no link step yet) |

The rest of the file is `.rdata` 240,948, `.data` 221,184 raw (13.5 MB in memory), `.rsrc` 117,464,
and 4,096 bytes of headers. All of it must match too.

## Plan to a SHA-identical exe (structure first)

Matching functions alone doesn't produce the file. The client and server taught us to fix structure first:
which file each function and each piece of data belongs to, in retail order, linked from day one.
Matching then fills a frame that is already right.

1. **Link from day one.** Build the whole exe now with the real linker flags, MFC/CRT libs, imports and
   resources, from source files in retail link order, even when most bodies are still drafts. Headers,
   imports and the resource section can match early. Score: bytes at the right offset.
2. **Finish the file map.** 2,867 game functions have no known file yet. Pin them from string/data
   references, call-graph clusters, RTTI/MFC class names and Q3Radiant file contents. The function order
   inside each file follows from addresses.
3. **Data layout per file.** Strings, constants, vtables and globals in `.rdata`/`.data` come from
   the same files in the same order. Map them like the code.
4. **Resources as source.** Decompile `.rsrc` into an `.rc` script (dialogs, menus, bitmaps) and compile it with `rc.exe`.
5. **Fill the frame.** Agents match functions file by file. A file counts as done only when its
   `.obj` produces exactly the retail bytes for its whole span, code and data.

Owner work (stronger models): steps 1-4 and the hard functions. Cheap agents: step 5 inside files whose
structure is fixed.

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
