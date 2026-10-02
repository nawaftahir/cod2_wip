# Duplicate shader arguments

Three complete readable definitions: CompareValue100864e9/79,
CompareRegister10086538/142 and RemoveDuplicateArguments10094810/460.
Total681 disjoint instruction bytes; SDK member90 sections3,4,208.
The optimizer sorts and merges equivalent values/registers, then remaps
argument references. The comparators order the pinned fields; link18 is
signed, and value20 is an x87-compared double. Opaque fields remain unnamed
access prefixes, not historical allocation-size or private-header claims.

Clean V2 passes full source/SDK/retail bodies, bounds, bindings and negative
tests. Private V3 accepts587 matches retaining584. Actual integrated CPU
fixtures agree on1284 complete shader/error/constant-table outputs.
Aggregate acceptance is pending; no whole-DLL identity or GPU certification.
See ../../scratch/codex35_program_duplicates/REPORT.md for commands and proof.
