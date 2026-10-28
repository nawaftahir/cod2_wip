# Info-string recovery

Three routines / 818 B were previously verified in the full linked exe but
rejected for the old same-offset rule. The approved lane contract makes that
metric report-only. Reused scratch/codex_1028_q_shared/pruned.cpp after checking
canonical source SHA against before.cpp; only these three bodies were added.
Their reference is cod2engine/archive/lnxded-1.0/src/universal/q_shared.cpp.
Target-specific oversize strings are confirmed by make show and the retained
info_retail.txt. They stay in retail order around the existing Info_NextPair.

Fresh stock make try and gate pass all 424 game rows; 52,447 B / 7.50% game
code, 11.85% game functions, 25,947 B / 1.446% whole-file same-offset (+140).
Compiler helpers remain 2 / 35 B; unverified 50, order warnings one, failures
zero. test_bindings.py checks live MATCH results and the three actual strings
beyond masked relocation comparison. No full SHA or boot claim.
Logs: scratch/codex_1028_q_shared_resume/.
