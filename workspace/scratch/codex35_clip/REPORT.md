# Clipping integration checkpoint — 2026-10-02

Work resumed after the owner's previous pause. Accepted aggregate is now
**331387/1089680 =30.411405%**, with only309 new disjoint bytes counted.
The complete aggregate replay passes. The35% objective is unfinished;
**50001** further source instruction bytes are needed.

The separate `../../src/codex_shader_compiler_clip/compiler.cpp` preserves the
eight accepted compiler methods and adds clipping in their actual callee cohort.
No previous accepted source/proof inputs were changed. All **nine complete
methods /1066 instruction bytes** pass fresh clean V2, including every typed
SDK/retail/source binding, negative tests and the original referee.
Only **309** clipping bytes are new;757 are retained, never duplicate credit.

The fresh private DLL passes full link/binding V3: **557 source matches**, all
**556** previous matches retained. `clean_packet.json` and `link_packet.json`
record the complete proofs and input/object/toolchain identities. The link uses
one compiler object for all nine methods; no duplicate EmitTemp ownership.

The integrated CPU fixture passes **1284** complete original/source outputs,
with954 successful compilations and330 error cases in both executables.
Its first ownership/dependency preflight correctly rejected an incorrect count:
there are194 distinct source symbols but204 removed SDK definitions, because
ten additional archive entries duplicate instruction predicates. The corrected
gate requires both exact counts AND equality of all removed/source symbol sets;
no safety check was waived. The corrected runner passes and records current
input/toolchain/object/executable identities in fixture_packet.json.

Replay from gfx/target:
`python3 scratch/codex35_clip/run_test.py` (Docker access required).
It compares1284 full public shader outputs and enforces source ownership for
the compiler methods, using the actual integrated source objects. Preserve
the earlier standalone expression fixture as a separate proof, not a substitute.
tools/check_ten_percent.py now includes only309 new disjoint bytes, verifies
retention of the previous757 and replays the full proof chain. It passes.
Keep the old compiler module as history, not a second
simultaneously linked TU.

Replay build: `sh target/scratch/codex35_clip/build.sh` from gfx; then run
`python3 scratch/codex35_clip/check_link.py` from gfx/target. The pinned Docker
compiler image/flags are unchanged from the accepted compiler family. The
new module is an integration candidate in a separate src directory; it is not
a released DLL or a whole-file-checksum claim.

Timing: wall-clock began06:45:12 UTC. Docker approval introduced substantial
waiting time; the owner then explicitly requested checkpoint/pause, overriding
the remaining timed run. Do not claim20 uninterrupted minutes of reconstruction.
