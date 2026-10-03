# Register-pool helpers checkpoint — 2026-10-03

Status: V2 REVIEWABLE, CPU PASS, **V3 DEFER / zero aggregate credit**.
Clean candidate: ../../src/codex_shader_pool_helpers/pool_helpers.cpp.
No unmatched larger methods are in this file. Complete definitions:

| Method | Target VA | Instruction bytes |
|---|---|---:|
| SeparatePhases_Phases | 10089348 | 178 |
| CompactPool_WriteCount | 1008a646 | 38 |
| CompactPool_Write | 1009295e | 47 |
| CompactPool_End | 1008a66c | 161 |

Total424. Clean source SHA256:
ae5afc2102615f2bbc3b9b0b7e6f6ae577a828cab1afedb3cc0c1425e03a63e8.
Origin33 was excluded: its source already exists and adds no new bytes.

## Completed evidence

Fresh V2 session20210 ended exit0: both full-body referees, complete boundaries,
typed bindings and negative tests pass all four bodies. clean_packet.json
records the source, toolchain, objects and full input hashes. Private DLL
build completed without /FORCE. Selector removes263 distinct /283 physical
source-supplied SDK definitions; dependency bytes are never source credit.

Fresh CPU session96502 ended exit0: clean_fixture_packet.json records1284
cases, zero differences,954 successful compiles per side and330 diagnostic
cases per side. Both packet input sets were independently rehashed current
at this checkpoint. CPU equality does not establish whole-file or GPU proof.

## Actual regression failure — do not skip

V3 session50698 first failed a byte-total assertion:34001 was an incorrect
expectation; the retained33039 plus new424 equals33463. The wrapper now uses
33463. Its genuine rerun session29472 exited1 at:

    table_proof = load(HERE / 'vtables.py', 'node_table_proof')
    FileNotFoundError: codex35_pool_helpers/vtables.py

No successful link_packet.json or626-retaining622 claim exists. The existing
parent table and SDK-binding proofs must be dispatched against the NEW linked
image, with the appropriate prior metadata packets, not omitted or run only
against the old DLL. check_link.py currently documents the attempted pipeline,
not acceptance. Tool changes invalidate pinned inputs; rerun affected gates.

## Replay / resume

From gfx/target:

    python3 scratch/codex35_pool_helpers/check.py --clean
    python3 scratch/codex35_pool_helpers/check_link.py
    python3 scratch/codex35_pool_helpers/run_clean_test.py

Build command uses the existing pinned4035 compiler image and build.sh,
read-only SDK mount, as in the retained prior program-order cohort.
Finish metadata dispatch, rerun all affected gates and rehash recorded inputs.
Only after V3 passes add the exact4/424 cohort to tools/check_ten_percent.py
and run one aggregate. Current confirmed aggregate345492/1089680 remains
31.705822%; there is no live audit and no whole-file identity claim.
