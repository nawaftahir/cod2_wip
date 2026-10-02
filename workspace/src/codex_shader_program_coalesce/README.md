# Pool, predicate and parameter helpers

coalesce.cpp has three complete C++ functions: CombinePools10089f75/293,
MutuallyExclusive1008a09a/181 and SwizzleParameter1008a70d/225. Clean V2
matches all699 bytes against SDK member90 and retail, including bindings,
bounds and negative tests. Pool offsets8/10/18 are explicitly opaque DWORD
accesses. This is not a reconstruction of the original private header.

Linked regression is running. The CPU runner failed its source-count
assertion: sequential substitutions accidentally changed both counts to252
instead of232/252. No CPU success or aggregate acceptance is claimed.
Fix that runner after its pinned regression finishes, then replay all affected
gates. The267-byte Vectorize draft is byte-mismatched and stays scratch-only.
