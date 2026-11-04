# Renderer checkpoint 4 — 2026-09-26

No release promotion or whole-file identity claim. The clean engine packet remains
13 functions /356 bytes, pending independent review. This checkpoint expands
authentic CRT evidence and proves the local DirectX import library can link.

## Authentic CRT, separate from engine reconstruction

`verify_authentic_crt.py` batches original SDK assembly and C helper sources in
the pinned MSVC image. Each run records source/dependency/object hashes, commands,
flags, failures and strict shape diagnostics. No retail byte wrappers are used.
Microsoft CRT sources remain local reference inputs, not copied into release.

- `authcrt_f0z031l7`: 42 source jobs, nine matching functions, twenty deferred,
  thirteen missing-include compilation failures.
- `authcrt_wi5hy4yr`: retry of only those thirteen failures using the original
  CRT includes already inside the pinned image; five additional functions match.
- `authcrt_k7o2adah`: bounded `/D_MT` builds of free.c and wctomb.c. Both wctomb
  functions match; free required the complete-body correction below.

The fourteen first/retry matches comprise thirteen authentic assembly functions
and the Microsoft C-source naked security-cookie checker. Keep these separate
from ordinary reconstructed engine C. All are SHAPE_ONLY: external binding and
independent source review still apply.

Correction: seven previously excluded C rows did NOT contain assembly. Comments
mentioning `.asm` triggered the old filter. `contains_assembly` now strips comments
and strings before detection, with positive/negative self-checks. Fresh three-TU
build `baseline_pn934zlj` matches six rows; `__crtExitProcess` still differs in
length (47 target inventory versus 48 object). Do not credit that unresolved row.

## PINNED: full _free body is 113 bytes

`python3 codex/renderer/check_crt_free.py`

The contiguous body spans 0x100f84d0..0x100f8541, including the nine-byte finally
funclet at 0x100f8523. The next inventoried function starts exactly at the end.
The old 104-byte inventory size excluded the funclet; treating it as a contiguous
span truncated real code. Full 113-byte shape/sites match the authentic MT source.
Ten external bindings remain unresolved. Evidence: `crt_free_body.json`.
Do not globally replace inventory sizes; each corrected boundary needs evidence.

## PINNED: _output data bindings

`python3 codex/renderer/check_crt_block.py`

The complete 2,042-byte code/table block still passes, including wrong-switch-table
negative fixture. Five formerly unresolved relocation sites now have data proofs:

- Entire 89-byte `___lookuptable` matches at 0x1017c708. Its first instruction uses
  COFF addend -32, so the encoded operand 0x1017c6e8 is NOT the table base.
- ASCII null-string pointer at 0x101a4890 resolves to 0x10196d94; wide-string pointer
  at 0x101a4894 resolves to 0x1017c764. Both source initializer relocations and full
  literal bytes agree with the retail data.

Twenty external sites remain unresolved (down from twenty-five), plus nine local
sites bound. Evidence: `crt_output_block.json`. Fresh SDK callee matches provide
useful next binding candidates, not automatic approval of the remaining sites.

### Follow-up: all _output sites accounted for at source-shape/data level

The same checker now rechecks nine source-defined callee bodies from their hashed
fresh objects before comparing the caller's destinations and addends. Fifteen
call sites are `CALLEE-SHAPE-SUPPORTED`, not independently accepted callees.
Their own unresolved dependencies are retained in the packet diagnostics.

A bounded four-source data build, `authcrt_7df5umf_`, supplies initializer proofs:

- seccook.c: four-byte security-cookie initializer exactly matches 0x101a50d0.
- ctype.c: `_pctype` at 0x101a5090 points 256 bytes into the complete 1,284-byte
  source classification-table section at 0x1017cf80. All section bytes agree.
- cmiscdat.c: six initializer relocations target `_fptrap`; all retail entries
  at 0x101a4fb0 point to its fresh matching body at 0x1010851b.
  Runtime table initialization/mutation is NOT established by this static proof.

These data-only inputs legitimately have no per-function matches; the batch
reports DEFER for function accounting, not compile failure. Their objects are
fresh, hashed and checked for this separate data purpose. `_ctype.c` is retained
as a bounded unsuccessful function probe, not progress credit.

Latest block packet: nine local sites, ten data-bound sites, fifteen callee-shape
supported sites, **zero unidentified destinations**. Still no independent
approval, complete callee closure, source release licensing, link parity or V4.

## DirectX source-built link probe passes

`python3 codex/renderer/link_probe.py`

`link_probe_gopi_uz_/packet.json` records source/header/import-library hashes,
commands and toolchain identity. MSVC linker/dumpbin report 7.10.3077. A tiny
source DLL links the read-only local x86 d3d9.lib and imports Direct3DCreate9 from
d3d9.dll. No SDK installation was needed on Linux: Wine/container tools suffice.

This /NOENTRY, /NODEFAULTLIB probe is NOT the reconstructed renderer, runtime
smoke, historical SDK provenance, or V4. Its generated DLL is ignored.

## Next useful work

Review remaining CRT callee/data bindings using existing fresh objects; recover
larger renderer source families with pinned types; audit real DLL layout and
initialization requirements. Repeated full sweeps are unnecessary unless inputs
change. GLM and Claude work remain untouched; canonical source is unchanged.
