# Renderer checkpoint 7 — historical JPEG reuse, 2026-09-26

## Larger source recovery, not another accessor sweep

GLM's 0x100532c0 decompile contains the IJG fast-DCT constants 98, 139, 181,
334 and two eight-iteration passes. This led to the already-local historical
JPEG 6b source in `refrences/cod2-mp-macho/PC/jpeg-6`.

`python3 codex/renderer/verify_jpeg_reference.py` fresh-builds 43 reference TUs
at /O2 /Gy in one pinned MSVC container. Each fresh object is reused for strict
comparisons against size-compatible inventory ranges in 0x10050000..0x10058400.
The size filter only saves comparisons: acceptance still requires full byte,
instruction-boundary and relocation-site/type checks. It is not an unrestricted
binary search or prefix comparison.

Run `baseline_jpeg_27xofqtz`: all 43 TUs compile; four strict matches /5,553 unique
bytes. These are library-source candidates, separate from custom engine source.

| Target | Source / symbol | Bytes | Remaining review |
|---|---|---:|---|
| 0x10052180 | jfdctflt.c / jpeg_fdct_float | 4,405 | independent acceptance |
| 0x100534d0 | jfdctint.c / jpeg_fdct_islow | 814 | independent acceptance |
| 0x10054f50 | jmemmgr.c / alloc_sarray | 167 | alloc_small/alloc_large bindings and source ABI review |
| 0x10055000 | jmemmgr.c / alloc_barray | 167 | alloc_small/alloc_large bindings and source ABI review |

The suspected fast-DCT itself is NOT a match: jfdctfst.c yields 516 bytes versus
507 in the target. No coverage credit is assigned to its algorithm resemblance.
No other library function is credited from compilation alone.

## Two complete transform proofs: 5,219 bytes

`python3 codex/renderer/check_jpeg_transforms.py`

Evidence `jpeg_transform_packet.json` preserves source/header/object hashes,
toolchain identity, exact commands and full diagnostics. Both functions pass
strict shape AND the original GLM referee. Both end in RET followed by target
INT3 alignment padding; float function's next inventory start is 0x100532c0.
For integer DCT, the inventory has a large later gap: padding proves the checked
body ends there, but does NOT establish the next function's identity or recover
all code in that gap.

PINNED float constant bindings, checked against COFF literal sections AND retail
data bytes (all four-byte floats, no ignored initializer relocations):

| COFF literal bits | Target address |
|---|---|
| 0x3f3504f3 | 0x1019bcd8 |
| 0x3ec3ef15 | 0x1019bcd4 |
| 0x3f0a8bd4 | 0x1019bcd0 |
| 0x3fa73d75 | 0x1019bccc |

All 80 float relocation sites bind to these literals; integer DCT has no external
relocations. Wrong-constant-destination negative test rejects a shifted address.
The two algorithms contain no external callees to invent or stub.

`test_jpeg_transforms.c` passes with the reference functions in a real 32-bit C89
host build: zero input, constant input (DC192, other coefficients zero), signed
ramp input with independently calculated DC sum. These limited host fixtures
supplement exact target-byte proof; they are not Windows game runtime smoke.

## Provenance and redistribution

Inputs identify JPEG 6b: JPEG_LIB_VERSION62 and JVERSION6b, 27-Mar-1998.
This identifies the reference source; matched bytes support its use here, not an
unsupported claim that all game JPEG modules came from an unmodified 6b build.
The Mac reference directory lacks its accompanying README. The local Quake III
JPEG directory has the release-6b README with IJG notices and distribution terms.
The two source trees differ in macros/copyright-year text; do not silently replace
inputs or copy library files into canonical source without provenance review.

Before distribution, preserve appropriate unaltered IJG copyright/no-warranty
notices, include the accompanying README and document modifications/acknowledgment.
No reference library source was copied into the release monorepo this pass.

## Accounting / next action

Clean custom-engine candidates remain 16 functions /608 bytes. New library packet:
two reviewed-by-this-agent transforms /5,219 bytes, plus two shape-only allocators
/334 bytes. Independent acceptance, full library recovery, full renderer source,
data/link identity and V4/V5 remain incomplete. Do not present this as a released
binary or inflate the engine ledger with third-party library counters.

Continue the JPEG TU cluster using saved objects: confirm allocator signatures,
resolve their two internal callees, inspect the fast-DCT source/codegen difference
and inventory gaps. This source-family reuse yields substantially more bytes per
compile/token than isolated accessor work. GLM and Claude files remain untouched.
