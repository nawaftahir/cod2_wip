# Renderer checkpoint 11 — omitted JPEG tails, 2026-09-26

Three apparent compiler mismatches were incorrect inventory extents. Target
instruction inspection, complete source-body equality and terminal RET/padding
checks establish these bounded extents without changing the GLM inventory:

| Target/source helper | Old size | Complete body |
|---|---:|---:|
| 0x10055d80 make_odither_array | 102 | 114 |
| 0x10055960 select_ncolors | 225 | 234 |
| 0x100566a0 update_box | 991 | 1003 |

The first old extent stops inside the loop's CMP instruction; the second omits
part of its return tail; update_box omits a second exit tail. Full bodies pass
strict checker AND original referee using in-memory corrected extents. Source
and original-object hashes are rechecked against fresh baseline_jpeg_ux9623q1.
No recompile or source edit was necessary. No abbreviated prefix accepted.

Reproduce: `python3 codex/renderer/check_jpeg_boundaries.py`.
Output: jpeg_boundary_packet.json, three functions/1,351 bytes REVIEWABLE.
The real source256-byte base_dither_matrix matches retail0x101910f0; both its
base and +256 end operands bind correctly. Source12-byte RGB_order matches
retail0x101911f0. update_box has no external relocation. Padding ends at
0x10055e00,0x10055a50,0x10056a90; 0x10055a50 is not an inventory entry, so do
not claim its historical function identity from alignment alone.

Together with the unchanged71-function packet this yields74 distinct JPEG
body candidates/24,874 bytes. They remain library accounting, not canonical
release progress, independent acceptance, or whole-DLL checksum identity.
The old dependency packet still describes71 functions and7 unresolved sites;
it has NOT yet been integrated with these corrected helper proofs. Five of
those sites now have supplemental helper evidence; emit_eobrun and initial_setup
still need actual instruction analysis. Do not report a regenerated graph yet.

## Bounded Boolean experiment

Preserved scratch/jpeg_cppbool copied from jpeg_bgr; only its boolean typedef
changes to bool. verify_jpeg_reference.py adds explicit --cpp (/TP), recorded
in every build command. Four relevant TUs compile fresh in baseline_jpeg_75ziqfw7.
All23 subset matches/5,662B retained, zero new matches; all five helper object
lengths unchanged. C++ name decoration is recorded, not normalized into a fake
C ABI. This result does not establish original bool spelling or historical
translation-unit provenance. Keep jpeg_bgr authoritative.

Next: integrate audited extents into dependency replay with explicit assertions;
inspect the remaining two actual mismatches rather than retrying global Boolean
types. Continue broader engine/TU and link work; no canonical promotion here.
