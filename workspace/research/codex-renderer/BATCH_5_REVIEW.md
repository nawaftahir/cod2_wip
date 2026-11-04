# Renderer checkpoint 5 — delayed drawing, 2026-09-26

`src/delayed_drawing.c` reconstructs the three related command-list operations
from target instructions and Mac `PC/gfx_d3d/r_rendercmds.c:499,510,529`.
It is a research candidate, not canonical release source.

Replay: `python3 codex/renderer/verify_delayed.py`.
Latest fresh packet: `material_verify_delayed_lv4p1bcv/packet.json`.

| Target | Legacy GLM label | Supported corrected name | Fresh result |
|---|---|---|---|
| 0x10020f10 | R_RenderScene | R_BeginDelayedDrawing | 92-byte full shape/referee match |
| 0x10020f70 | R_BeginDelayedDrawing | R_EndDelayedDrawing | DEFER: object 97 bytes, target 107 |
| 0x10020fe0 | R_EndDelayedDrawing | R_IssueDelayedDrawing | 91-byte full shape/referee match |

Two matches add **183 bytes**, giving fifteen matching clean engine candidates
/539 bytes across eight source files. The End candidate is excluded from those
totals; its matching host behavior does NOT overcome a compiler-byte mismatch.
The original thirteen-function packet was not recompiled this pass; totals combine
its recorded proof with the new packet. Independent acceptance remains pending.

## PINNED behavior and bindings

- Command-list pointer is at 0x1042e778; wrong-global negative test rejects a
  shifted address. All three only reference this external global.
- List data capacity is 0x30000 bytes, followed by used-total at +0x30000,
  used-critical at +0x30004, last-command pointer at +0x30008 (32-bit target).
- Begin returns the original used-total marker in EAX, emits command id 1,
  length 8, and initializes its subcommand pointer to zero.
- End emits id 3, length 4, then patches the earlier command's pointer at
  marker+4 to the current end. If fewer than four bytes remain, it clears
  last-command and patches the earlier pointer without allocating.
- Issue emits id 2, length 8, with subcommand pointer list+marker+8.

Important original defect: Begin/Issue's insufficient-space paths clear the
allocation pointer and then write through address 4. The source preserves this
behavior. Do not silently add guards while reconstructing the original binary.
The host fixture deliberately avoids executing those crash paths; they are
verified by target disassembly and full instruction equality, not a runtime test.

`test_delayed_drawing.c` passes as a real 32-bit C89 host program: normal complete
sequence, returned marker, header fields, critical accounting, link pointers,
End's insufficient-space path and exactly-four-byte boundary. This is not Wine
game smoke. No dependencies were installed.

## Bounded End DEFER

Runs wsa1mmwb, shozlfr1, cw8scvoh and lv4p1bcv under material_verify_delayed_
preserve attempts: shared-tail form, explicit insufficient-space return, explicit
intermediate values, typed command-list layout. All used /O2 /Gy with the pinned
MSVC image; End remains 97 versus 107 bytes. Target uses extra register copies
and separate critical-counter load/store; current compiler simplifies these.
This does not prove impossible source matching, LTCG, or a compiler defect.
Next bounded approaches: original larger TU context/caller groups and documented
compiler optimization variants. Do not weaken the full-length gate.

`pin_refapi.py` now persists the three corrected names as supported labels.
The legacy labels remain in the packet for provenance; slot addresses are pinned.
GLM, Claude, canonical targets and release ledgers were not modified.
