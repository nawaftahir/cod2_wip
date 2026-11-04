# Renderer checkpoint 17 — compiled typed wavelet tables, 2026-09-26

## Source-built data proof:49,152 bytes

verify_wavelet_initializers.py mechanically rewrites the confirmed reference
constants into readable WaveletHuffmanDecode {value,bits} C arrays, using the
target-backed four-byte struct from the preserved delta_order header. It reads
refrences/cod2-mp-macho/rodata.c, NOT retail bytes, to generate every value.
There are no emitted instruction bytes, retail copying or post-link patches.
Generated tables.c/header/build artifacts stay in an ignored research run,
not canonical release source. The generator is the reproducible source path.

Fresh pinned MSVC /O2 /Gy build baseline_wavelet_data_al1cp9w1 succeeds.
Each complete16,384-byte initialized data range from the fresh COFF object
matches its retail table at10182988/10186988/1018a988. No data relocation falls
inside the ranges. All4096 signed-short pairs per table match, not prefixes.
Generated source, header and object identities were also independently reread
after build. No raw-dump identity substituted for compiler output identity.

Reproduce: `python3 codex/renderer/verify_wavelet_initializers.py`.
wavelet_initializer_packet.json and run/packet.json record source/reference,
header/object hashes, pinned image, exact compiler command, symbols/ranges and
per-table hashes. Do not redo the container build just to inspect those objects.
The three declared symbols now exist in real compiled source, but global link
ownership, independent acceptance and redistributable provenance review remain.
No data bytes added to .text coverage or overall completion percentage.

The older wavelet_delta_packet.json's source_table_compilation_verified=false
describes that checker not yet integrating this separate data-object proof;
it is not a claim that no compiled initializer evidence exists now. Do not
silently flip that flag without rechecking this object/source identity and
integrating symbol ownership into the function packet.

## Bounded helper experiment — still DEFER

scratch/wavelet_state_updates expresses bit-position advancement as direct
state updates and computes refill's sum before byte reading. Fresh pinned
baseline_jpeg_2px9pg4r compiles, zero added matches. Refill105, generic decoder162
(target168), outer1459 (target1471). Alpha134 still passes strict full-body
check, but is not counted twice. The entire32-bit small-image, ordinary/escape
and synthetic alpha/wrap fixture passes for this overlay too. These behavioral
checks do not override either byte referee. Preserve delta_order authoritative.

Replayed check_wavelet_delta.py:134-byte helper still passes both checkers,
operand bindings, negative wrong destination and fixtures. Code progress remains
the single134-byte codec candidate plus the unchanged earlier engine/JPEG work.
No canonical promotion or whole-DLL identity.

Next: connect compiled table-object proof/ownership to the matched helper packet;
bring genuine image-loader caller and refill/generic helper context into the
source build, with target ABI evidence. Avoid another narrow type-only sweep.
