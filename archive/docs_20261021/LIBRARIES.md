# Library-first reconstruction — 2026-09-27

Target next milestone: 108,968 verified instruction bytes (10%). Current verified
source now80,796 including3434 source-instantiated STL bytes; gap28,172.
Do not add CRT shape matches or SDK objects to
that source figure. Track recovered build dependencies separately, then link.

## IJG JPEG

Official upstream6b archive:
https://www.ijg.org/files/jpegsrc.v6b.tar.gz
SHA25675c3ec241e9996504fe02a9ed4d12f16b74ade713972f3db9e65ce95cd27e35d.
Preserved in scratch/library_sources, extracted as jpeg-6b. Source copyright and
README licensing retained. jconfig.h is an unchanged copy of supplied jconfig.vc.
42 of43 comparable upstream C files are byte-identical to the existing Mac
reference. Only jutils differs: the reference removed an already-disabled table.
No need to reverse these upstream implementations line by line.

Pinned compiler image: sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694.
Builder reused: tools/build_library_reference.py. New artifacts stay in gfx scratch.

| Batch | Flags | Shape results | New verified source |
|---|---|---|---|
| baseline_jpeg_iafwhb7k | /O2 /Gy |20 bodies/7887 bytes |0; all overlap existing proofs |
| baseline_jpeg_59v2tkei | /O1 /Gy |0 |0 |
| baseline_jpeg_47ya93uy | /O2 /Gy /Oy- |0 |0 |

All three compile51 source files; two expected failures are DOS/Mac-specific
jmemdos/jmemmac, not the Windows backend. Raw discovery is not binding acceptance.
Existing modified target source adds BGR/color, private-caller contexts and
renderer allocation/source callbacks; stock6b alone is NOT an exact linked match.
Proven upstream source should be reused with those target-backed adaptations.

### Expanded scan and caller context

Full raw-backed code scan (`0x10001000..0x1010b000`), including boundary and
referenced missing-entry discovery:

- `baseline_jpeg_8gyhbs7j`: reused authenticated C objects;104 shape hits,
  7901 unique hit bytes. All extra destinations are ambiguous1/3-byte helper
  shapes, NOT newly identified JPEG functions. New accepted source:0.
- `baseline_jpeg_3yp4xw0r`: fresh51-file `/O2 /Gy /TP` batch;96 shape hits,
  7901 unique hit bytes;3 compilation failures. No nontrivial new body.
- `baseline_jpeg_s9bxd93g`: genuine single source group of upstream jutils,
  jccolor, jcsample, jcdctmgr and jchuff using the already pinned callback
  prefix/byte-boolean headers.23 bodies/8481 bytes under both referees.
  Every address is already in jpeg_dependency_packet.json: new credit0.
  Full group is NOT promoted into src; unmatched initializers remain.

These results rule out repeating plain upstream C/C++ broad sweeps as a
shortcut to10%. Remaining source work needs target-backed adaptations/caller
context, not more identical library-version builds. One bounded native C++
bool group probe is separate in scratch/jpeg_encoder_bool_context; no inferred
  type change is shipped or credited. `baseline_jpeg_pq2cbf0k` completed that
  `/TP` native-bool probe: same23 bodies/8481 bytes, no gains; do not repeat.

The shared batch wrapper now caches COFF parsing for one exact object byte
string within a process. No path/mtime cache, persisted results or referee
changes. Input/header/toolchain/object hash checks still apply. Runnable check:
`python3 gfx/tools/build_library_reference.py --self-test-cache gfx/scratch/library_runs/baseline_jpeg_iafwhb7k/job000.obj`
passes cached/uncached equality, repeated-input hit and changed-input miss.
`baseline_jpeg_vvc1juj0` replays the original4405-byte float transform with
the cache enabled and both referees100%; no additional coverage credit.

## Source-instantiated VC7.1 STL

Target median-of-nine code agrees with the shipped2003 `algorithm` header.
Do not reverse these standard templates by hand. Source calls std::sort with
opaque pointer element types and target-backed int/byte-result comparator ABIs;
no target struct fields or invented callback bodies. Plain `/O2 /Gy /TP` fresh
probe sp93cwoa matches0. `/O2 /GL /Gy /TP` plus actual `/LTCG` source-only link
matches33 helper shapes/3444 bytes. This is direct evidence of the required
code-generation context for these instances, not an excuse for other mismatches.

`tools/build_stl_sort.py` snapshots source, records source/image/anchor/output
hashes, compiles and links without `/FORCE`/CRT shims, executes the actual source
DLL under Wine, then runs the shared linked-image discovery referee. Current
run stl_sort_gl_r6ekw52i. `tools/check_stl_sort.py` independently proves two
entire515-byte medians: raw bytes equal with NO masking, unique full-body target
hits, full instruction decode, RET/13CC boundaries, internal branches only,
15 indirect comparator calls each, zero absolute relocations/direct dependencies.
Instruction corruption and truncated tails fail. Fresh Wine fixture replayPASS.
Initial1030-byte credit is superseded by24functions/3434bytes in
sort_helpers_packet.json. Helper graph bindings/negative tests, full boundaries,
fresh Wine fixture and shared linked referee100% PASS. Last source function
ends at virtual code extent, not raw zero padding; no masks weakened.
No whole-file/release/runtime-game claim.
Remaining discovery hits are not automatically accepted. Source group remains scratch because wrapper
and other helper bodies are not all verified. Compiler headers remain pinned
toolchain inputs, not copied into release src. See HANDOFF.md for accounting.

## VC7.1 CRT (separate dependency accounting)

Existing historical reference source is glm/crt71, not a new implementation.
Fresh44-file multithreaded batch authcrt_a7m3m_6p uses existing CRT_FLAGS plus/D_MT.
35 matched source jobs,60 function shapes/11789 bytes. These are diagnostic,
not verified engine/source coverage. Six shapes absent from the initial snapshot:
_ftbuf42, _fflush_lk46, __freetlocinfo208, _Gettnames563, _Strftime_mt197,
_Strftime50 (1106 total). Verify complete boundaries, bindings/data and dependencies
before accepting. Do not repeat the unchanged44-file build; reuse its hashed objects.
Reproduce: python3 gfx/tools/build_library_reference.py --crt-snapshot --multithread.
Do not assume modern licensing documentation grants redistribution of2003 CRT
source. SDK/runtime dependency recovery and public source release are separate.

## DirectX/D3DX

UPDATE: downloads completed; Claude extracted dev/sdk/sum2004/{Include,Lib}.
Independently replayed his mask-only discovery: DXErr18/18 sections169373 bytes;
D3DX1527 hits447696 bytes (not unique verified instruction coverage).
Library SHA256s:
DxErr9.lib0dcf72695c4dc029768d2d8fadb5d61d56dcf896bb9683dc936f8a046c608495;
d3dx9.lib3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88.

tools/check_dxerr_dependency.py independently searches all placements and checks
complete masked sections, exact PE absolute-relocation sites, full referenced
strings/data, internal code/table destinations and external identities.
IMPORTANT first-hit mask-only matching misplaces wide functions onto ASCII
bodies: caught real UTF16-vs-ASCII data mismatch. Our graph/data checks resolve
all18 sections uniquely, not by pretending the wrong string pointers match.
Six IAT names/slots checked against actual PE imports; three CRT destination
identities replayed against fresh hashed SDK-origin source/objects:
authcrt_vdh8d47s (vsnprintf86,vsnwprintf111,chkstk61). Nine wrong external bindings
rejected. SDK-bound vsnwprintf100f93bb corrects GLM's ambiguous vswprintf label.
Transitive CRT IO dependency closure remains incomplete. Full SDK section bytes
include compiler tables/data; ZERO new reconstructed-source coverage credited.
Proof: scratch/library_runs/dxerr_dependency_packet.json. Replay:
python3 gfx/tools/check_dxerr_dependency.py.

Shared Makefile now defaults to Summer2004, searches historical flat Lib before
Lib/x86 and links d3dx9.lib/DxErr9.lib as real dependencies. Nothing vendored into
release src or committed. Overall renderer link still needs the real GetRefAPI.
Modern iw3xo SDK headers are useful structural references, but its D3DX43 import
library is not a substitute for the historical static library's actual bytes.
Next extend binding checks to D3DX .lib members and port the real export entry.
Original library members are build dependencies, not
independently reconstructed engine source. No retail-byte transplant.

Local extraction tool prepared without changing system packages:
scratch/library_tools/7zip/usr/lib/7zip/7z (Ubuntu7zip26.00+dfsg-1).
Deb SHA25697dc6694bd7919e163a600dff8a5d7f72d892934f97cb0d7deba285abff779ce.
Raw archives/tools/objects stay git-ignored; no commits made.

Primary references:
https://www.ijg.org/files/
https://learn.microsoft.com/en-us/windows/win32/direct3d9/d3dx
https://learn.microsoft.com/en-us/cpp/windows/redistributing-visual-cpp-files
