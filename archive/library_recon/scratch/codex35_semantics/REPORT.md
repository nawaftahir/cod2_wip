# Public shader semantics — checkpoint 2026-10-04

All files here are unmatched reconstruction drafts. ZERO accepted coverage.
Target-backed algorithms are retained; no marker variants, byte wrappers,
ABI changes or historical source-provenance claims.

PINNED references: summer-2004 D3DX SDK member57/section63,
D3DXGetShaderInputSemantics954 at10062f1e; section64,
D3DXGetShaderOutputSemantics806 at100632d8. Compiler4035, pinned image
sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131.
Baseline flags /O1 /Oy- /hotpatch /MT /Gy /d2QIftol. Existing probe.py reuses
the pinned full-section diagnostic; its packets are DISCOVERY ONLY, not V2.
Object files remain local and are not committed.

## Attempts to preserve rather than repeat

- semantics.cpp: initial complete input958/954, output823/806; unmatched.
- semantics_tokens.cpp: repeated low-word opcode comparisons, target-order
  bitmap clearing, common FX success label. Input958/954 firstdiff13;
  output806/806 firstdiff17, NOT equal despite matching length.
- semantics_index.cpp: private force-inline register-index helper does not
  resolve output allocation. Same806/806 firstdiff17; no extra helper credit.
- semantics_c.c: C89 form compiles but gives the same958/954 and806/806
  differences. Scalar-return C/C++ comparison does not prove impossibility.
- semantics_destructive.cpp: decode the token's register type, then reuse
  that token variable for its register index. Input958/954 firstdiff13;
  output800/806 firstdiff17. This is the closest retained output draft.
  Moving the null-input return to an end label did not change that outcome.
- semantics_parameter.cpp: using the incoming shader parameter as iterator
  worsens output to809/806 firstdiff11.
- semantics_scope.cpp: moving the existing bitmaps to function scope does
  not improve output800/806 firstdiff17.
- /G5 and /G6 gave output800/806; /G7 gave798/806 with additional partial
  register/scheduling differences. Those objects predate the null-label
  source edit: do NOT claim their hashes prove the current source. Rebuild
  the exact current source if those variants need authoritative replay.
- /Og- on current destructive source gives input1546/954 and output1420/806,
  both firstdiff7; /EHsc gives958/954 and800/806, unchanged. The fresh
  probe_semantics_destructive_{ogoff,eh}.json record actual input hashes.

The output800-byte draft still differs in callee-save entry/return ordering
and one VS3 pointer-step LEA/ADD combination, as well as resulting encoded
branches. A label-normalized disassembly diff is only diagnostic, not full
CFG/byte/binding acceptance. Preserve the output routine's original final
unconditional count-pointer write; FX early success skips it. Do not silently
repair its null-count behavior while reconstructing.

Other unaccepted continuation work: combined shader-comment/sampler draft
in ../codex35_shader_comments/comments.cpp now has unmatched sampler194/190;
the accepted comment parser is the separate clean source, not that TU.
../codex35_address_registers/merge_call_order.cpp tests real helper evaluation
order, but remains1203/1199 with frame/local allocation differences. Neither
adds bytes. Their fresh diagnostic packets retain source/object identities.

Resume from these exact differences; do not rerun identical helper, C-front,
array-scope or flag variants. No fresh CPU fixture, V3 or aggregate acceptance
is claimed for any semantics, sampler or merge draft.

Continuation: output_preincrement.cpp moves VS3 cursor advancement to the
loop entry, output805/806 firstdiff17; output_outer_guard.cpp adds the genuine
outer non-null control scope, output815/806 firstdiff17. Both fresh compiler
builds and source/object diagnostic identities are retained. Neither fixes
the callee-save/return differences or matches the complete target body.
Initial extraction omitted the function signature line and failed compilation;
the corrected complete files compiled successfully before these diagnostics.
No new accepted bytes; do not repeat the identical forms.
