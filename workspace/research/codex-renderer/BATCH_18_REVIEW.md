# Renderer checkpoint 18 — real source cluster link, 2026-09-26

## Integrated initializer proof, without another compiler build

verify_wavelet_initializers.py now exposes shared verify_object/recheck_packet
checks. check_wavelet_delta.py validates saved image/anchor identities, complete
source/reference/header/object hashes and all three compiled table ranges on
every replay. It verifies that function and table TUs use the same header hash.
Its source_table_compilation_verified is now true with the complete nested proof,
not a manually toggled field. Generic decoder dependency remains unmatched.

Reproduce: `python3 codex/renderer/check_wavelet_delta.py`.
PASS:134-byte body, both checkers, four bindings, negative destination and
32-bit fixtures; typed table49,152B proof rechecked from existing objects.

## Genuine source-built DLL cluster, not retail DLL reconstruction

link_wavelet_cluster.py links the actual fresh delta_order code object and typed
table object inside pinned MSVC7.1 linker7.10 using /DLL /NOENTRY /NODEFAULTLIB,
/OPT:NOREF /OPT:NOICF, /BASE:0x10000000, /FILEALIGN:4096 and one source export.
No SDK/retail binary linked or byte-patched. Fresh link_probe_wavelet__wtd6zwl
passes, with one definition each of exported decoder and all three tables.
wavelet_link_packet.json records exact flags, object identities and DLL hash.

`python3 codex/renderer/check_wavelet_link.py` replays the existing linked image:
all49,152 data bytes remain exact, and the134-byte alpha helper retains every
unrelocated instruction byte from its source object. Both table operands point
to the actual linked alpha table, and both calls point to the actual linked
generic decoder. These are real source-link bindings, not just relocation masks
or reading a map file. wavelet_link_checked.json contains the checked proof.

Important limits: source table addresses now10002000/10006000/1000a000, helper
100011d0, generic decoder10001120. They are deliberately NOT retail layout.
The DLL includes the unmatched169-byte generic and1459-byte outer decoder;
link success does not turn those into matches. No runtime smoke, retail symbol
ownership, independent acceptance, V4 or new .text credit. The helper packet's
linked_symbol_ownership_verified=false refers to unproved retail ownership;
the separate source-link probe establishes only its explicitly scoped ownership.

## Actual caller ABI and misleading reference implementation

PINNED loader0x1000f380 entry: header ECX, bytes-per-pixel EAX; stack image+4,
data+8, D3D format+12. It saves bytes-per-pixel to EBX at0x1000f391, then loads
format into EAX for setup0x1000ee30 at0x1000f3a9. This distinction explains why
old drafts treating EAX as D3D format were not valid. Target setup receives
image ECX, format EAX, five pushed values width/height/depth/header-byte5/zero.
The fourth setup stack value is tested as bit flags, not the reference's
misleading "semantic" argument label. Header-byte5 is flags, not mipmap count.

PINNED0x1000f4e9/ea push destination/source;0x1000f4eb constructs local decode
state address into ESI;0x1000f4f7 calls outer0x10010d40. Thus it genuinely uses
ESI state and two stack pixel pointers. The decompile corpus only identifies
this loader call, but corpus absence is not proof there are no other binary
references. Do not substitute fastcall/naked glue for real caller/TU work.

Reference r_image_load_obj.c contains WASM adaptation: temporary __Znam copy,
memcpy, __ZdaPv and generic Image_UploadData call. Windows target loader does
not call those; its full call sequence is setup, hunk allocation, decoder,
volume/2D upload helpers, hunk free. Reference names/types may support research;
this edited implementation is NOT a historical-source oracle for Windows1.0.
Do not bulk-import it to manufacture the missing compiler context.

Next draft the actual target loader/setup/upload caller family, with these
verified argument roles and complete target-backed operation sequence; obtain
source-level compiler context without register wrappers. Keep the current
matched helper and source-built table proof fixed while this family is deferred.
JPEG85/29,608B unchanged; canonical/full DLL remains unfinished.
