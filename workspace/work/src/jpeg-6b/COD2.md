# IJG6b codec dependency

This is based in part on the work of the Independent JPEG Group. Original
README/copyright retained. Source imported from the authenticated upstream
jpegsrc.v6b.tar.gz, SHA256
75c3ec241e9996504fe02a9ed4d12f16b74ade713972f3db9e65ce95cd27e35d.
`jconfig.h` is the supplied, unchanged `jconfig.vc`: its byte boolean is already
the required Windows configuration, not a new alteration to IJG.

Changes from that distribution:

- jpeglib.h: per-object malloc/free fields and error exit/print callbacks;
  compressor creation receives the allocator pair.
- jcapimin.c: install those allocator callbacks after clearing the object.
- jmemnobs.c: use those callbacks for small/large allocation and release.
- jerror.c: initialize/use application error callbacks instead of process exit
  and stderr output.
- jmorecfg.h: BGR channel order (red2, blue0), matching renderer capture.

These are target-backed CoD2 interfaces, not proof of the original file wording.
VC7.1 checks compressor368/decompressor440/error140, allocator+18/+1c,
destination+20, width+24 and next_scanline+d8. Primary save/load callers and
error/memory handlers independently pin those sizes/offsets. Existing encoder
context research supports the BGR mapping; current referees and native color
fixtures still gate this tree. Do not repeat the old plain-version flag sweeps.
The encoder C files use /O2 /GL /MT /TC and NO_GETENV; primary memory-manager
initialization ends after publishing its state, with no JPEGMEM getenv/parser
branch. This is a supported candidate configuration, not historical flag proof.

Decoder modules now come from the same authenticated upstream archive.
jdapimin.c preserves the per-object allocator pair while clearing the object,
as pinned by PC10049e5b..10049e8b. jdatasrc.c is the original memory-only interface
reconstructed from the PC instructions:32-byte source, init/skip/term callbacks,
resync callback and NULL refill callback. It consumes the complete FS_ReadFile
buffer; it does not provide a streaming/truncated-input recovery adapter.
No stdio adapters are built. proof/jpeg_decoder_origin.json records per-file
upstream/candidate hashes and the one modified upstream decoder module.
Native fixtures decode baseline/progressive images against Pillow, check BGR
expansion/alpha and both texture limits, grayscale/CMYK rejection and ownership.
Library bytes remain separate from authored game credit, even where the old
inventory incorrectly includes early JPEG routines in game ranges.
