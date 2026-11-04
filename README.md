# CoD2Radiant.exe 1.0 reconstruction

![radiant CI](../../actions/workflows/ci.yml/badge.svg)

Readable C/C++ reconstruction of the Call of Duty 2 map editor using the
original MSVC 7.1 compiler. Whole-executable SHA-256 identity is the goal;
reconstruction is still in progress.

- Contract: [AGENTS.md](AGENTS.md); evidence: [RULES.md](RULES.md).
- Browser worker: [TASK_WEB.md](TASK_WEB.md), branch `web/reconstruction`.
  The standard ChatGPT GitHub app is read-only; the task includes a manual
  source-file handoff that triggers CI.
- Bundled references and retail disassembly: [research/web](research/web/README.md).
- CI: pushes to main and web/**, plus same-repository pull requests. Full source
  gate, complete-file audits, logs and summaries; isolated draft comparisons on
  web branches. The compiler container stays private. No API AI jobs are used.

## Status (2026-11-01)

| Measure | Verified result |
|---|---:|
| Authored game functions | 569 / 3,578 (15.90%) |
| Authored game code bytes | 68,749 / 699,591 (9.83%) |
| Complete-file normalized code/metadata audits | 14 / 102 |
| Whole-file same-offset bytes | 26,574 / 1,794,048 (1.481%) |
| Whole-executable SHA identity | Pending |
| GUI boot/smoke | Pending |

Function matching is relocation-normalized and checks known callees. Exact
placement, generated code and data require further work. See the latest
[handoff](CODEX_HANDOFF.md) and [file ledger](ledger/files.tsv).

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
