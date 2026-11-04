# Renderer checkpoint 42 — debug-frame pair

DeepSeek's image workspace remains untouched. Separate source overlay
`scratch/codex_debug_pair/j_debug_frame.c` preserves checkpoint 41 and adds
the real BeginDebugFrame at **0x10021ff0**, correcting GLM's `R_EndFrame` label.

Fresh pinned MSVC `/O2 /Gy /W3` build `baseline_jpeg_arnc6688` contains three
matching complete bodies: Begin73, End114, end-command helper71 =258 code bytes.
**Only 73 bytes are new**; prior185 are retained, not recounted. Both original
referee and strict checker pass all bindings, wrong-binding rejection, RET and
padding bounds. Packet `baseline_jpeg_arnc6688/debug_frame_packet.json`.

```sh
python3 codex/renderer/check_debug_frame.py codex/renderer/baseline_jpeg_arnc6688
python3 codex/renderer/check_debug_frame.py
cc -m32 -std=c89 -Wall -Wextra -Werror codex/renderer/test_debug_pair.c -o /tmp/codex_debug_pair_test
/tmp/codex_debug_pair_test
```

All passed. Old original source/checkpoint remains reproducible. The new fixture
is separate from immutable compiled inputs; its hash is recorded in the packet.
Checker replays byte evidence, not fixture execution. During development the
overlay's copied fixture was briefly edited after compilation; it was restored
byte-for-byte from checkpoint41, then extended tests moved to the separate
`test_debug_pair.c`. All original build dependency hashes now pass unchanged.

## PINNED facts

- Begin73 ends at RET0x10022038, followed by seven CC bytes before End.
- Registered byte 0x101d4d00 gates all writes/calls.
- Saves command-list0x1042e778 into0x101e4a00 and backend0x101da9c8
  into0x101e4a04 before testing skin-cache lock pointer0x101d49b0.
- Non-null lock sets restore byte0x101e4a08 to1 before no-argument
  call0x1001e540. Null lock does NOT clear a preexisting restore byte.
- Finally switches command-list to address0x103fe718 and backend to
  address0x101e4a0c. These are address constants, not dereferenced globals.
- `R_UnlockSkinnedCache` destination0x1001e540 has plain RET and reads/clears
  lock pointer; its source body is still external/unmatched, not credited.
- Name/behavior SUPPORTED by opencod2 `r_rendercmds.c:398` and KisakCOD
  `r_rendercmds.cpp:1778`; neither reference overrides observed version offsets.

Fixture adds disabled-registration no-op, save-before-unlock ordering, switching
both pointers, lock-present/no-lock branches and preserving an already set
restore flag. Previous End and command-buffer assertions remain green. These
are mock-based host checks, not a real D3D/Wine frame.

Status REVIEWABLE, no independent acceptance/full external closure/canonical
promotion/V4. Minimal extension of the existing checker, one fresh TU reused
for all three comparisons, no new framework. Next non-image renderer caller
group or DeepSeek packet review when owner reports completion.
