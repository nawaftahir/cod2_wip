# Predicate merge reconstruction — 2026-10-03

Clean source: ../../src/codex_shader_predicate_merge/merge.cpp.
Two complete source functions match member90/retail: pointer-overload
MergePredicates1008d884/129 and MergeArguments1008d905/97. V2 includes complete
bodies, boundaries, typed callees, source/SDK/retail bindings and negative tests.
Private linked regression passes592 matches, retaining all590; dependency
selection replaces229 distinct source symbols /249 original entries. SDK
dependency code is not reconstructed-source credit.

Actual original/source CPU fixtures pass1284 full outputs:954 successful
compilations and330 diagnostic cases per profile. This is not direct branch
coverage of every internal function or GPU certification.

The inherited CPU wrapper initially failed its cohort-count assertion, then
failed on an inherited nested run_test.py filename. The runner now derives
directly from the pinned flow runner and fixes the nested execution filename;
no marker file or weakened gate. Superseded private regression runs were
cancelled before the final serial V2/V3 replay. The final CPU run really passed.

The shared four-argument predicate-chain helper100872f1/258 stays scratch-only.
Initial253/258; shared return/local-chain form252/258; scoped depth-count loops
and shared destination store256/258 (current merge.cpp); output-pointer-local
trial261/258 (chain_trial.cpp). Current diagnostics are in probe_merge.json
and probe_chain_trial.json. No near-match or compiler-impossibility
claim. Only the two complete clean definitions can enter aggregate accounting.

Full aggregate acceptance is pending; the35% goal remains active.
