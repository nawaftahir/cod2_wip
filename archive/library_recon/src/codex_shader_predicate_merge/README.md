# Predicate and argument merging

merge.cpp contains two complete C++ definitions: MergePredicates(CArgument*,
CArgument*) at1008d884/129 and MergeArguments at1008d905/97. Total226
instruction bytes, anchored to SDK member90 sections181/182 and retail.

The first handles gradient/loop restrictions before merging predicate chains;
the second redirects an argument and combines the observed flag-class bits.
Opaque argument60/64 remain DWORDs, not guessed historical field names.

Clean V2, private V3/592 retaining590 and1284 full shader/error/constant-table
CPU outputs pass. Full aggregate credit remains pending. The four-argument
predicate-chain helper remains an SDK dependency with zero source credit.
No whole-DLL checksum or GPU claim. Gates: ../../scratch/codex35_predicate_merge/.
