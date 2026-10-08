# Register-pool helpers checkpoint — 2026-10-03

Status: **V2 REVIEWABLE, V3 PASS, CPU PASS; aggregate pending**.
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

## Historical regression failures — now resolved

V3 session50698 first failed a byte-total assertion:34001 was an incorrect
expectation; the retained33039 plus new424 equals33463. The wrapper now uses
33463. Its genuine rerun session29472 exited1 at:

    table_proof = load(HERE / 'vtables.py', 'node_table_proof')
    FileNotFoundError: codex35_pool_helpers/vtables.py

The missing dispatch is now supplied by small hash-pinned vtables.py and
sdk_binding.py wrappers around the existing complete proofs. The table proof
uses prior typed metadata packets but checks actual storage, relocations,
entries, owner objects and callee destinations in the NEW helper image. No
table or binding gate was removed and the earlier image is not substituted.

Fresh V2 session26958 ended exit0 after adding both wrappers. Fresh V3
session68494 ended exit0:626 private linked source matches, all622 preceding
matches retained, no losses. Fresh CPU session3906 ended exit0:1284 cases,
zero differences. All three complete packet input sets were rehashed current.
Their actual link_packet.json is retained. No whole-DLL identity is claimed.

## Replay / resume

From gfx/target:

    python3 scratch/codex35_pool_helpers/check.py --clean
    python3 scratch/codex35_pool_helpers/check_link.py
    python3 scratch/codex35_pool_helpers/run_clean_test.py

Build command uses the existing pinned4035 compiler image and build.sh,
read-only SDK mount, as in the retained prior program-order cohort.
The exact4/424 cohort is now added to tools/check_ten_percent.py with all nine
tool hashes, exact address/length identities and the existing complete gates.
One full audit is live: process32299/session47013, aggregate.log. Do not restart
it, edit any accepted proof inputs or credit its expected result before terminal
PASS/exit0. Confirmed aggregate345492/1089680 remains31.705822% until then.
The owner initially requested pausing after this checkpoint.

## Terminal aggregate acceptance and resumed work

Process32299/session47013 completed terminal PASS/exit0. The retained
aggregate.log accepts424 new disjoint source bytes:345916/1089680 =31.744732%.
No expected result was counted before this PASS. All three packet input sets
were rehashed current after the audit. The owner revoked the checkpoint pause
and requested continuing through32%;2782 additional verified bytes are needed.
