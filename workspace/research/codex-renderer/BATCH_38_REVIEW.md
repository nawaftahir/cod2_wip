# Renderer checkpoint38 — target-backed image allocation/registry source, 2026-09-26

New scratch/wavelet_image_alloc preserves matched file_payload group, adds
actual image allocation CC10 and empty-registry-slot search CB40. No copied
retail bytes, invented allocator semantics or imported browser/hash wrappers.

PINNED CC10 allocates36+strlen(name)+1 through callback101d49d4, name pointer32
points to trailing string atimage+36, copies terminating NUL, writes category
byte30/semantic10/track12, and stores image in registry101cea68 at CB40 result.
This independently proves allocation header36; the research prefix has matching
sizeof/known offsets but complete historical type/provenance is still not assumed.
NO memset/zero initialization inserted: allocator may provide initialization,
but that behavior is not established merely by caller source.

PINNED CB40 hashes SIGNED bytes (MOVSX ECX,CL), weights index+119, masks2047,
then linear probes occupied slots with wrap2047. This is an empty-slot search,
not a case-insensitive lookup or generic R_HashAssetName equivalence. A full
registry loops forever in original; no new guard/rehash/growth behavior inserted.

IMPORTANT inventory boundaries truncated: CB40 actualRETcb91 =>82 code bytes,
14CC tocbA0, not legacy72. CC10 actualRETcc7c =>125 bytes, not legacy109.
Old109 comparison is invalid full-body evidence. Fresh pinned /O2 /Gy
baseline_jpeg_x6fy50yp produces slot82,allocation109. Corrected82 slot check
stillDEFER: relocation site target44 vsobject46 (other target73/object73).
Allocator109vs actual125DEFER. No matches credited from equal legacy109 size.

Runnable check:
`gcc -m32 -std=c89 -Wall -Wextra -Werror -Wno-unused-parameter codex/renderer/test_image_alloc.c -o /tmp/cod2_image_alloc`
then `/tmp/cod2_image_alloc`.
PASS target-backed sizeof36,empty/a/high-byte signed hash,occupied-slot probing,
exact38-byte allocation for one-char name, trailingnamepointer/copy/guard,
byte truncation category257->1/semantic-1->255/track260->4,registry insertion.
Allocator mock fillsA5 and check confirms caller leaves unrelated mapType bytes
unchanged. Reuses actual file/reload/upload/memory/creator fixtures; no live
Hunk allocator behavior or entire-engine runtime/struct proof.

verify_image_family.py --run baseline_jpeg_x6fy50yp retains8 prior/1141 code,
no new credit. Preferred matched file/header/dispatcher/formatter snapshots and
checks unchanged. Next reconcile allocation/caller/hash context and audited true
extents, or continue bigger renderer family with these explicit dependencies.
Stdlibstrlen/memcpy and existing fixtures reused, no new framework/dependency.
No canonical import, independent acceptance or whole-file identity claim.
