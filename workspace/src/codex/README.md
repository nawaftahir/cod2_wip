# Verified-source transfer

refapi_table.c is a complete1051-byte Windows1.0 API initializer.
Replay: `cd gfx/target; make verify-refapi`. Native fixture checks169-slot import
copy, all108 export cells, success/wrong-version/reinitialization and print args.
This source models code-entry addresses opaquely; it does NOT certify the types
or implementations of the98 populated callbacks. No literal game bytes emitted.
Actual definitions/typed API integration must precede enabling it in tus.txt.
Historical TU membership and whole-link identity remain unproven.

renderer_views.c is a complete two-function candidate file (139 code bytes),
not an asserted historical TU. Replay: `cd gfx/target; make verify-views`.
Target addresses1000aa60 and10023e90, proven flags/O2/Gy, no/GL.
Source identity, complete bodies, symbol bindings, negative binding tests and
native behavior are checked by dev/codex/renderer/check_seven_percent.py.
Evidence: dev/codex/renderer/baseline_jpeg_7h016wwk/seven_percent_packet.json.
It is not in tus.txt until the shared link baseline and non-/GL integration
are checked. Existing files in this folder were previously copied by Claude;
their shared-link status must not be inferred from this new file's proof.
