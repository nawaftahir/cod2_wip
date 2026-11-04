# Memory recovery candidate

Thirteen previously linked matches / 1,969 B, rejected solely for the former
same-offset policy. These are candidates, not current credited progress.
Source is the preserved pruned.cpp from Codex's original whole-file trial.
Main com_memory.cpp still equals the saved before.cpp byte for byte.
Candidate SHA-256: 44a7a85d12c192baedfe4dfc6dd9ec9a40f3e50e51b14a06aecaf154fb47879b.

Freshly verify candidate.cpp in src/universal/com_memory.cpp before adding
candidate_matches.tsv. Preserve assertion lines, shared globals, function order
and every existing row. Windows-specific primitive flags and data layout were
checked against retail; source and primary evidence remain at
.agents/codex/scratch/codex_1028_com_memory/{retail.txt,gate.log,verify.log}.
No inline assembly, explicit ABI tricks, fake callers, flags or verifier changes.
If all thirteen no longer match together, retain only fresh passing bodies and
leave the other drafts in scratch. Do not grow the unverified count.
