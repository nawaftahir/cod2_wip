# Renderer checkpoint 41 — separate debug-frame cluster

DeepSeek owns `scratch/deepseek_image_1` under DEEPSEEK_MISSION_1.md. It was not
touched. Codex worked only on the independent render-command/debug-frame path.

## Readable source and proof

`scratch/codex_debug_frame/j_debug_frame.c` contains two genuine source functions:

| Address | Supported name | Complete code bytes |
|---|---|---:|
| 0x10020ec0 | R_AddCmdEndOfList | 71 |
| 0x10022040 | R_EndDebugFrame | 114 |

Fresh pinned MSVC build `/O2 /Gy /W3`:
`baseline_jpeg_8cwyzk_y/{inputs.json,results.json,job000.obj}`. Both normalized
matches are reproduced by `python3 codex/renderer/check_debug_frame.py` with
every relocation binding checked, incorrect command-list destination rejected,
original GLM referee 100%, exact RET/full body and following CC padding verified.
Packet: `baseline_jpeg_8cwyzk_y/debug_frame_packet.json`.

**185 unique newly reviewable code bytes**, not independent acceptance or V4.
The old snapshot's 114 shape-only bytes overlap this proof and are not added
again. Callees ExecuteRenderCommands, EndFrame and LockSkinnedCache remain
unmatched bodies; this packet pins destinations/observed interfaces, not closure.

32-bit source-selected assertion fixture:

```sh
cc -m32 -std=c89 -Wall -Wextra -Werror codex/renderer/scratch/codex_debug_frame/test_debug_frame.c -o /tmp/codex_debug_frame_test
/tmp/codex_debug_frame_test
```

Both commands passed (execution required sandbox approval). Tests cover disabled
registration, actual source command emission, service call ordering, clearing
three backend counters, saved pointer restoration before cache relock, relock
flag clearing before callback, skipping relock, clearing saved state, exact-fit
and insufficient command-buffer space, and untouched adjacent buffer bytes.
Mock service callbacks are not real Windows/GPU execution. The replay script
does not rerun this fixture; its inputs hash the test alongside implementation.

## PINNED facts and structural cross-check

- 0x10022040 is NOT BeginDebugFrame: it submits, executes, ends and restores
  previous state. opencod2 `r_rendercmds.c:958` and KisakCOD
  `r_rendercmds.cpp:1802` support EndDebugFrame; Begin saves state instead.
- Registered byte 0x101d4d00; backend pointer 0x101da9c8; command-list pointer
  0x1042e778; saved list/backend pointers 0x101e4a00/04; restore byte 0x101e4a08.
- End calls 0x10020ec0, zeroes dwords backend+0x249d0c/10/14, calls
  0x10033d20 with stack backend pointer and caller cleanup, then 0x10033b20.
  It restores pointers before clearing restore byte and calling 0x1001e4b0
  with stack integer 1 and caller cleanup. Finally saved pointers become zero.
- 0x10020ec0 has complete RET at 0x10020f06, nine CC bytes afterward. Its list
  byte buffer is 0x30000 bytes; usedTotal +0x30000, usedCritical +0x30004,
  lastCmd +0x30008. Less than four bytes remaining only clears lastCmd.
  Otherwise usedTotal and usedCritical advance four; header shorts are id=0,
  byteCount=4. End's full RET is 0x100220b1, followed by fourteen CC bytes.
- Source command-list shape expresses these observed fields only. No claim of
  recovered complete historic backend struct or original source spelling.
- The old contract's `/Oy-` general hint was not needed for these actual fresh
  source matches. No unsupported historical build-flag claim is made.

Initial Docker attempt `baseline_jpeg_gp6dflnp` failed permission before build;
retained as failed evidence. Escalated fresh build succeeded; no failed object
credited. Source is isolated; no canonical promotion, commit or retail import.

Retained image replay: 8/1,141 bytes green on load-entry baseline. Existing
JPEG dependency replay remains separate; no previous matches are new credit.
Next independent debug packet review or another non-image caller group while
DeepSeek proceeds. Reused existing compiler/discovery/referee helpers and one
assert fixture rather than adding orchestration or a second build framework.
