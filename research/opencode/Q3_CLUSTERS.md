# Q3Radiant-led naming hypotheses

These are working labels for xref investigation. They are not accepted names.

## Immediate low-range candidates

| Address | Bytes | Hypothesis | Evidence |
|---|---:|---|---|
| `0x00401310` | 34 | wrapper calling helper + optional cleanup | shape matches Q3-style paired setup/teardown wrappers |
| `0x00401c90` | 24 | debug/log/message call with constant `0x500` | stack constant then call |
| `0x00401cb0` | 24 | same family with constant `0x501` | adjacent duplicate |
| `0x00407980` | 14 | virtual/global accessor tail-call | arg push + distant call |
| `0x00407cb0` | 16 | two-field setter | stores `[ecx]` and `[ecx+4]` |
| `0x0040aea0` | 13 | class field setter at offset `0x5c` | thiscall-like store |

## Next reference-driven questions

1. Does the entry/init chain call a cluster matching Q3Radiant
   `CRadiantApp::InitInstance`, then `CMainFrame::OnCreate/CreateQEChildren`?
2. Do repeated adjacent setter families near view windows correspond to MFC
   message-map helpers or actual editor classes?
3. Which low-range globals receive constants such as `0x500/0x501`, likely IDs,
   modes, or resource/command values?

## Duplicate-family leads

| Byte shape | Addresses | Interpretation hypothesis |
|---|---|---|
| 24-byte three-field setter | `0x0040b600`, `0x0040baa0`, `0x004986c0` | shared struct initializer/setter template; likely same class family |
| 29-byte list/node iterator | `0x00402750`, `0x00402770` | adjacent container helpers |
| 51-byte string/list append | `0x004b4530`, `0x004be450` | later mixed-range utility, lower priority |
| 8-byte identity getter | `0x00496020`, `0x004961c0` | already matched |
| 22-byte paired wrapper | `0x0041f2b0`, `0x00464b30` | likely MFC forwarding helper |
| 10-byte import tail-call pair | `0x00495f70`, `0x00495fb0` | CRT/framework indirect call |
| 26-byte virtual dispatch + add | `0x004027e0`, `0x0043bfd0` | editor object method wrapper family |
| 54-byte null-check/string helper | `0x00402af0`, `0x00409500` | candidate map/entity text handling |

## Shape-only note

The 24-byte three-field setter shape is byte-identical at all three addresses and
has no relocations, but it is not yet compiler-matched to a fresh MSVC object.
It remains **shape-only**, not accepted.

## Decompilation duplicate analysis

Fresh Ghidra export produced **1,792** decompiled functions below `0x4c0000`
with size <=256 bytes. Normalized structural comparison found:

- **30+ exact duplicate decompilation families**
- Largest family: **54 functions**
- Other large families: **28**, **15**, **9**, **7**, **6**, and multiple four-function groups

This is the highest-value next target: one compiler-verified implementation can
often validate an entire family, then be instantiated at each address after xref
and type review.

## Priority family details

### 54-member scalar deleting destructor family

Representative bytes:

```asm
56 8B F1 E8 rel32
F6 44 24 08 01
74 09
56
E8 rel32
83 C4 04
8B C6
5E
C2 04 00
```

Semantics: thiscall destructor helper; calls the actual destructor, frees `this`
when flag bit 0 is set, and returns `this`.

### 28-member global-load tail-call / forwarding family

Representative forms include:

```asm
55 8B EC 8B 0D abs32 5D E9 rel32   ; load global then tail-jump
55 8B EC 5D E9 rel32               ; frame-preserving tail jump
```

This is likely a message-map/command-forwarding or MFC routing family rather than
one semantic operation. It must be split by callee/global before acceptance.

## Exact-byte duplicate inventory

Across all non-thunk functions:

- 16 exact byte-duplicate groups
- 34 functions total in those groups
- 1,021 bytes represented

The largest exact groups are the three-member 24-byte setter and three-member
7-byte thunk. The 54-member decompilation family differs by callee addresses, so
it is structurally identical but not byte-identical.

## Destructor family refinement

After masking only relative-call displacements, the scalar-deleting destructor
family resolves to:

- 30-byte variant: **41** exact-shape members, plus smaller singleton groups
- 33-byte variant: **28** exact-shape members
- Combined candidate functions: **89**
- Combined bytes if all validate: **2,772**

This is the next compiler target. Two source templates should cover the two main
variants; remaining singletons likely differ by calling convention or extra
callee cleanup.

## Family manifest and draft templates

The reproducible family inventory now lives in `data/destructor_family.json`:

- **17 normalized shape groups**
- **85 functions**
- **2,646 bytes** if every group validates
- Main groups:
  - 30-byte variant: **41 members**
  - 33-byte variant: **28 members**

Draft canonical templates are present at:

- `src/f/destructor_helper_30.c`
- `src/f/destructor_helper_33.c`

They are **not accepted yet** because Docker access is still unavailable and the
naked-asm bodies have not been compiled by MSVC 7.1. They become candidates only
after compilation and reloc-normalized equality against the target addresses.


## CDC wrapper blocker

The CDC SetBkColor/SetBkMode family shares this proven pattern:

1. Save or invalidate a cached state field at `[esi+4]`.
2. Compare it against `[esi+8]`.
3. Call through a global function pointer.
4. Conditionally restore state using `[esi+8]` and another cached pointer.

Before reconstruction, xrefs must prove:
- exact meaning of offsets `+4`, `+8`, and the cached pointer field,
- identity of both indirect callees,
- whether each wrapper uses one or two conditional restores.
