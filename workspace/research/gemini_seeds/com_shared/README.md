# Recovered com_shared source seed

These three routines passed the prior linked referee and regression gate, but
were reverted solely because same-offset bytes moved. Current policy permits
retaining them. Reverify from current main before adding any ledger row.

- 0x48af50 Com_StringContains: 88 B
- 0x48b2a0 Com_HashKey: 67 B
- 0x48b2f0 Com_RealTime: 96 B

seed.cpp contains only those three readable routines and the qtime type.
seed_matches.tsv contains the corresponding prospective rows. It intentionally
excludes Com_FilterPath: that former four-function trial had unresolved caller
context. Preserve the existing source when incorporating these definitions.
Reference: verified server com_shared.cpp. Historical trials are described in
workspace/research/codex_notes.md under the rejected com_shared offset trial.
