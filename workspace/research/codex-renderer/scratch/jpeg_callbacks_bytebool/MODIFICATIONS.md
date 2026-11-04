# Research overlay — not canonical source

Copied mechanically from the preserved jpeg_callbacks overlay. Its allocator
changes and IJG notices apply here too. Additional change: jmorecfg.h uses
unsigned char for boolean instead of int.

PINNED local layout evidence: target free_pool at 0x100556f0 accesses virtual
array b_s_open as a byte at +0x22, next pointer +0x24 and backing-store +0x28.
Stock int booleans would place them at +0x28, +0x2c and +0x30. A one-byte
boolean representation gives the observed layout.

The exact historical spelling (bool, unsigned char, etc.) and semantic validity
of this typedef for every library routine remain unproven. This is a bounded
source-layout probe, not permission to globally claim JPEG reconstructed.

Fresh baseline_jpeg_9pcipvfj has eight full shape matches /1,351 bytes from
jmemmgr.c: four prior allocation bodies, request_virt_sarray104,
request_virt_barray104, do_sarray_io148 and do_barray_io151. Relocation bindings,
callback types, independent review and whole-file identity remain separate gates.
