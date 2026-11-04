# Memory-backend context experiment

Target jinit_memory_mgr10055840 allocates84 bytes through the application
callback, initializes its method table and limits, and returns without getenv,
sscanf or a backend initialization call. Its memory-limit field is zero.

This separate overlay defines NO_GETENV and includes the existing no-backing-store
backend jmemnobs.c before jmemmgr.c, exposing its zero/no-op helpers for natural
inlining. Callback allocation/free macros in jmemmgr remain unchanged. This is
a bounded source/context experiment, not historical TU provenance or new ABI.
Do not replace the existing matched source until complete regression passes.

2026-09-27 continuation: first merged build failed because jmemsys.h is not
include-guarded; define AM_MEMORY_MANAGER before backend headers and omit the
second jmemsys include. Build hi2byq_1 retained9allocation functions and exposed
realize_virt_arrays360/self_destruct51. It is superseded: its source hash no longer
matches this overlay after the following bounded experiment.

Target access_virt_sarray10055440/access_virt_barray10055590 inline zero-fill;
including authentic jutils.c in this same TU reproduces that context without
assembly or ABI adapters. Fresh build vctq8lbv matches13bodies/2699bytes, including
the retained9 and four proposed new bodies1085bytes. Three entries were absent
from old inventory; full decode, incoming references, return/CC padding and both
referees are required in dependency replay. No historical TU provenance claim.
The source fixture now checks virtual-array pre-zeroing, row/block preservation,
final-row access and allocation/free accounting. Actual game runtime equivalence
and original-DLL callback ABI acceptance remain separate from host tests.
