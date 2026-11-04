# MRU complete-file review

`src/radiant/mru.cpp` is FILE VERIFIED under relocation normalization: all
15 authored routines / 2,055 bytes in retail order, plus all 105 original
padding bytes in the interval 0x46bcd0..0x46c540 accounted for. There are no
additional emitted helpers, EH routines, global initializers, class metadata,
or source-owned writable globals. Absolute image placement remains PENDING.

The held Gemini `LoadMruInReg` body is restored without changing its logic.
It agrees with the read-only Quake-III-Arena/q3radiant/MRU.CPP lines 600-629
and matches the complete retail 299-byte body. No flags, ABI attributes,
wrappers, assembly, hardcoded source addresses or referee changes are used.
The existing fourteen accepted routines / 1,756 bytes retain MATCH.

## Reviewed inventory correction

The old inventory split 0x46c3e0 / 96 B and 0x46c440 / 203 B is one function.
At 0x46c434, `cmp word ptr [ebx+4],0` sets the flags; the following MOV
preserves them, and 0x46c440 begins with JBE consuming those flags. Its tail
uses the earlier EBP frame, saved cookie and allocated buffer. There is no
independent entry at the split. No pointer to 0x46c440 occurs in the image,
and decoding all inventoried routines finds no external branch to it. A raw
E8/E9 byte scan does produce a false hit at 0x46c43b, the E8 displacement byte
inside the MOV; the committed audit uses decoded instructions instead.

Before editing the inventory, scratch/finish_mru/probe-v1.log checked the
restored source against the full 96+203-byte interval and returned MATCH.
The 96-byte prefix alone correctly failed the unchanged referee at +0x60.
The correction joins both spans in functions_cod2radiant.json and tu_map.tsv;
no byte is removed. The inventory changes from 9,935 to 9,934 entries with
all 1,150,739 inventoried bytes retained and all unrelated entries identical.
The game denominator changes from 3,579 to 3,578 routines; game bytes remain
699,591. This is one newly accepted routine / 299 B, not two routines.

## Bindings and proof

`research/gemini_review/test_mru_complete.py` checks every routine against the
unchanged linked-executable referee, complete source-owned emission inventory,
retail order, target interval/padding and corrected boundary. It additionally
checks 61 Win32 import accesses, six literal references and four bindings to
the actual CRT security cookie, including its initial value. Direct callees
retain the referee's name checks. The structure offsets, 16-byte allocation,
WORD fields and buffer pointer at +12 are preserved by exact machine code;
no speculative shared layout was introduced.

Run inside the pinned toolchain image:

```
python3 tools/verify.py --all
python3 research/gemini_review/test_game_ledger.py
python3 research/gemini_review/test_mru_complete.py
python3 research/codex_density/test_patch_distance.py
python3 research/gemini_review/test_density_partial.py
python3 tools/file_ledger.py
```

The file-ledger tool now reruns this audit with the existing eleven completed
files, yielding 12/102 FILE VERIFIED. Game regression is 545/545, compiler
2/2 / 35 B, zero failures, unchanged 48 unverified bodies and one order warning.
Coverage is 62,859 / 699,591 B (8.99%); functions 545/3,578 (15.23%).
Private checkpoint same-offset is 26,429 / 1,794,048 B (1.473%), report-only.
Whole-executable SHA and GUI boot remain unfinished.

Original and trial evidence remain in scratch/finish_mru. Texturevecs' two
passing preliminary routines and the still-blocked DialogInfo trial were
preserved in scratch/texturevecs_repair; no unmatched body or game credit from
those experiments is in canonical source. Gemini's parked workspace is untouched.
