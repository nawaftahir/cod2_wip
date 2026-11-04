# CRT19 source checkpoint — 2026-09-30

The aggregate `python3 gfx/tools/check_ten_percent.py` accepts 16 new
complete original CRT C bodies / **2,751 bytes** and four original MASM
procedures / **1,749 instruction bytes**, with overlaps removed.
The frozen C plan certifies 216 complete bodies / 40,617 bytes before
deduplication. Ten rejected variants stay in `rejected.json` and earn nothing.

Original library source was rebuilt, not rewritten function by function.
`compile.sh` compares built C files with the pinned original compiler image;
`check.py` verifies complete code, typed callbacks, callee bodies, data
initializers/pointer graphs, PE relocation sites/types, internal labels,
all bindings and wrong-binding negatives. `crt0init.c`'s original data
sentinels resolve `_doexit`'s dependency proof. No new renderer logic is claimed.

`compile_asm.sh` builds unchanged original memcpy, memmove, strchr and strcmp
procedures with authentic MASM. `check_asm.py` compares each full section,
local bindings and branch destinations, replays the original masked referee
(100%), and excludes 240 total embedded table bytes plus strchr's 11 NOP
alignment bytes. Full source-backed coverage is 709 + 709 + 195 + 136 bytes.
strchr's public entry is 16 bytes after its source-defined shared return
helper. strcmp's inventory extent is one byte too short; its final JMP is
included by the complete section proof, not discarded to fit an inventory.

Attempted security/exit C variants ending compiler INT3 padding remain
rejected by the complete-body gate. No gates were weakened to credit them.
Discovery lengths alone are not acceptance. Plan rows do not confer credit.

Replay: `python3 scratch/codex19_crt/check.py` and
`python3 scratch/codex19_crt/check_asm.py` from `gfx/target`.
Rebuild C with `sh scratch/codex19_crt/build.sh`. The MASM Docker command
is recorded in `gfx/HANDOFF.md`; original inputs are in `glm/crt71` and the
pinned image, not this repository. Preserve the frozen plan.

Combined with the separately reconstructed SDK helper, the aggregate is
**239,955 / 1,089,680 = 22.020685%**. This is instruction-source coverage,
not whole-DLL identity or a distributable completed renderer.
