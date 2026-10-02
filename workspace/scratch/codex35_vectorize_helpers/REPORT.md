# Vectorization helper drafts — 2026-10-03

One genuine four-function C++ TU, SDK member90 sections74/88/90/94:
SimplifyPredicates_IsEqual257/273, IsSameRegister117/117 complete diagnostic
match, IsConflicting155/165, UpdateLinks229/229 with difference12.

Only discovery diagnostics were run. No strict V2/V3, CPU or aggregate
acceptance; all source remains scratch-only. Equal size is not a match.
Observed instruction24/28 are opaque DWORD accesses. Repeated argument-array
access reproduces IsSameRegister; do not replace it with cached argument
pointers without fresh byte comparison. Caller/helper group remains together.
