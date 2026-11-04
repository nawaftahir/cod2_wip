# File completion ledger

Open files.tsv to review all 102 game translation units in retail link order.
VERIFIED means every owned routine, generated helper and relevant data binding
passes its recorded normalized file audit. PARTIAL and UNSTARTED are explicit.
Image placement remains PENDING; only the final executable SHA can prove full
binary identity. The table does not credit generated helpers as new game code.

Run the full referee first, then `python3 tools/file_ledger.py`. The latter runs
inside the pinned toolchain, rejects stale source verification, reruns all complete
file proofs, and refreshes files.tsv. Logs and the linked-image proof hash stay
in build/file-ledger-{audit.log,proof.json}. Existing authored-function totals
remain in matches.tsv; whole-project percentages remain in meter.json.
