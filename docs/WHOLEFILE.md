# CoD2MP_s.exe 1.0: what a byte-identical file still needs

Current numbers: `STATUS.md`. History of the layout push (10-21..10-24, 12% -> 98%): `archive/WHOLEFILE_10-24.md`.

| Part | State | Needs |
|---|---|---|
| PE header | only the Rich block (0x80-0x107) differs | entry order (28,9466)/(25,9466) follows first mss reference in LTCG output; 6 real code-free TU identities |
| `.text` | 314 B off at same offset | the remaining functions in `STATUS.md` |
| `.rdata` | float-pool and +4 group residue | stand-ins gone (com_endParseSessionUnderflow), 720.0f slot |
| `.data`, `.rsrc` | 100% | - |
| mixerGetRecordLevel | 2 B | documented post-link step (owner decision) |
| Timestamp, PDB GUID | pinned (faketime, guidpin) | - |

## Rules that got the layout here (PINNED, details in KNOWLEDGE.md)
- Structure first: function set per TU, link order, one body per helper, data ownership.
- Tiny unreferenced retail functions are real: dump retail bytes in each gap before adding a stub, and
  check whether one of ours already has that body elsewhere (move it).
- .bss: name order inside a TU, `= 0` end group, ALIGNED(128) on definition and externs.
- Link-order (`tus.txt`) changes move .rdata/.data: measure whole-file every time.
