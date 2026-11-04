# Memory-initializer caller context — 2026-09-27

Fresh run baseline_jpeg_9nwllwps compiles jpeg_api_group.c with only
cl /nologo /c /W3 /O2 /Gy; pinned MSVC7.1 image. NO /GL or LTCG link.
Source contains the actual IJG jpeg_CreateCompress and jpeg_CreateDecompress
drafts already adapted to preserve target allocator/free callbacks, plus the
matched memory source and genuine utility/backend functions.

The private jinit_memory_mgr declaration is static __declspec(noinline).
Static linkage is a bounded source-context reconstruction experiment, NOT proof
of historical declaration syntax. A separate target function/call exists, so
noinline preserves that evidenced non-inlined relationship; no invented callers
or assembly calling-convention shims are used. COFF storage class3 confirms the
emitted initializer is private. Compiler naturally chooses its register ABI.

Both unchanged shape referees match initializer10055840's COMPLETE160bytes.
All13memory bodies/2699bytes and default_decompress_parms393 are also retained.
CreateCompress/CreateDecompress themselves are still UNMATCHED and not credited.
The393-byte default helper was already counted, not new. Target initializer
method-pointer/data/callee bindings and negatives require dependency replay.

Consequence: target custom register arguments do NOT by themselves establish
that full-program /GL+LTCG is necessary. Real caller/callee-TU tests can reproduce
such a function under /O2 alone. This is evidence for this group, not proof every
renderer custom ABI will yield to the same declaration or compiler options.
See existing campaign7 review/revision; do not invent generic impossible claims.

Host memory fixture includes jmemmgr.c and strips only MSVC's __declspec attribute
via a GCC command-line macro. The acceptance object is always the unmodified
MSVC source build. Host fixture is not target-DLL execution, a Create API byte
match, a whole-file link proof or an observed original runtime configuration.
