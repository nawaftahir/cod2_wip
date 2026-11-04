# Research overlay — not canonical source

All .c/.h files copied mechanically from
`refrences/cod2-mp-macho/PC/jpeg-6`. Original notices remain intact.
The accompanying release-6b README was supplied from
`refrences/Quake-III-Arena/code/jpeg-6/README`, unmodified.

Only two source files changed:

- jpeglib.h: common prefix now includes source-owned target_alloc(size_t) at
  offset24 and target_free(void*,size_t) at offset28. Names are our descriptive
  names, not claims of original historical identifier recovery.
- jmemmgr.c: four JPEG get/free macros route to those callbacks. Ordinary
  JPEG memory-availability/backing-store/init/term functions remain unchanged.

PINNED target evidence: allocation calls at 0x10054df9, 0x10054e28 and
0x10054ef8 push one argument and use cinfo+0x18, caller cleanup4. Free calls
at 0x100557a2 and 0x100557de push pointer,size and use cinfo+0x1c; caller
cleanup8 at 0x100557aa and 0x100557e6. cdecl declarations follow those bytes.

Four allocation bodies match in baseline_jpeg_a1_gw6ay: alloc_small325,
alloc_large185, alloc_sarray167, alloc_barray167. No other callback source
function is claimed matched merely because this overlay compiles.
Replay check_jpeg_allocators.py; no independent promotion or V4.
