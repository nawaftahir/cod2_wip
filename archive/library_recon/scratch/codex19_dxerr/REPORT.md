# Source reconstruction checkpoint — DXGetErrorString9A

Accepted: **48,427 newly reconstructed SDK-derived C++ instruction bytes**.
The complete source-built 72,524-byte section matches the renderer anchor;
24,097 table bytes are checked but excluded. All 8,899 relocation bindings,
source strings, branch targets and negative tests pass. The original masked
referee reports 100%. This is not Microsoft's recovered historical source.
Clean source: `gfx/target/src/codex_libraries/dxerr9_name.cpp`.

The important source shape is shared case labels for identical returned names,
with return groups ordered by the SDK's actual code relocation/return-leaf
order. Numeric group order missed the target despite identical functionality;
COFF string-section ordering was not the same test. Authentic compiler
13.10.4035 with `/O1 /Oy- /hotpatch /MT` produces the full correct body.
No target-byte copying, machine-code injection or post-link patches are used.

Failed attempts retained locally:

- Earlier ungrouped switches differed in default-case checks/section length.
- `/Og-` produced 97,876 bytes, not the 72,524-byte target. Zero credit.
- Shared groups in numeric order still differed by 48/47 instruction bytes;
  actual SDK leaf ordering gives zero differences.
- Building the winning helper with the default `/ML` runtime matched its
  own section but introduced a LIBC/LIBCMT conflict and lost 42 prior source
  matches in the closed renderer link. Rebuild with `/MT` resolved that.
- An initial `/MT` rerun reused a stale DLL because `XL` is not a dependency
  in `closed.mk`. The private `link.mk` adds the exact object dependency.
  Only the real subsequent relink is accepted.

`check_link.py` replays standard `cmp.py` and `bindcheck.py` on the private
no-FORCE link. All 359 baseline accepted source functions retain their exact
target ranges; this helper is the sole new source match (360). It hashes
source/header inputs, fresh objects, compiler/build/referee inputs and outputs.
No canonical source or standard referee changes were required.

The executable fixture compares against the original SDK lookup: all 5,467
named cases and +/-1 neighbours produce 6,560 distinct inputs; another
100,000 deterministic random values produce **106,560 passing comparisons**.
The renamed fixture object is separate from the accepted normal-name object.
`fixture_packet.json` pins fixture inputs, objects, executable and result.

Compiler provenance: official Server 2003 SP1 DDK `1830_usa_ddk.iso`, SHA-256
`7a27263e4c3c89dee113eba75dc9145bf7019b43a2c5e24bc9382dbde79f7f8b`.
Download URL:
`https://download.microsoft.com/download/9/0/f/90f019ac-8243-48d3-91cf-81fc4093ecfd/1830_usa_ddk.iso`.
`extract_compiler.py /path/to/ddk.iso` verifies the ISO and the embedded
`COMMON/X86DBINS.CAB`, then extracts only seven hash-pinned compiler files.
They are a private local build dependency, never committed. No install is needed.

Replay source proof/regression: `python3 scratch/codex19_dxerr/check.py` and
`python3 scratch/codex19_dxerr/check_link.py` from `gfx/target`.
Fresh rebuild including the behavioral fixture and renderer link:
`sh scratch/codex19_dxerr/build.sh`. Requires existing canonical source,
SDK and pinned toolchain images, plus this compiler cache. These files are
not a standalone release tree. The aggregate replay is
`python3 gfx/tools/check_ten_percent.py` from the workspace root.

New library gains total 52,927 disjoint bytes including CRT19; aggregate
**239,955 / 1,089,680 = 22.020685%**. No complete DLL SHA identity or game
rendering-function gain is claimed. Next: independent review/canonical
integration coordination, then target-backed game renderer cohorts.
