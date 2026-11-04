# Deflate completion, 2026-11-01

All seventeen original routines / 5,938 B match the unchanged linked-executable
referee. Four newly accepted helpers add 2,460 game bytes: fill_window (279),
deflate_stored (433), deflate_fast (758), deflate_slow (990). There are no extra
emitted helper, initialization or EH routines from this C TU. The original
0x4ad1a0..0x4ae960 interval contains 142 B of verified alignment padding.

## Source/compiler model

The base is the existing licensed zlib 1.1.4 source; the independent Q3Radiant,
OpenCoD2-Plus and KisakCOD reference copies agree with its algorithm. Retail
also contains the exact 1.1.4 version and copyright strings. No borrowed later
zlib behavior, assembly, invented ABI, stub callee or binary patch is used.

The measured TU profile is /O2 /GS /GL /Ob1. Ordinary __inline hints on the
public deflateInit_ and deflate definitions retain the observed expansion in
compress2 and deflateParams. They do not force inlining. The first stored-block
flush expresses its pending-output copy directly in C; the other two flushes
retain flush_pending calls. Target instructions pin this distinction: the first
copy occupies +0x89..+0xe9, and later calls are at +0x12d and +0x181. The direct
copy preserves the zero-length branch, all stream/state counters and the DEBUG
trace. It shares the actual zlib state and memcpy intrinsic with flush_pending.
This is a tested reconstruction source form, not a claim that these exact
annotations or the explicit expansion appeared in the historical source.

The valid bounded trials are retained in trials/. Default /Ob2 expanded read_buf
inside fill_window and too many pending copies. /Ob1 alone recovered three
helpers but regressed deflateParams and compress2. The two normal public hints
restore those callers, giving 16/17 matches with zero prior-row failures.
Hinting flush_pending also expands it inside fast/slow and fails; /Os broadly
changes code and fails. Expressing the one observed copy directly gives all
17 and preserves all 548 prior game matches. Failed profiles were restored
before the canonical owner flag change and fresh full build.

## Complete-file proof

Run inside cod2-radiant-msvc71:

    python3 tools/verify.py --all
    python3 research/codex_deflate/test_complete.py
    python3 research/gemini_review/test_game_ledger.py
    python3 tools/meter.py --gate
    python3 tools/file_ledger.py

The supplementary proof requires the exact seventeen ledger/inventory entries,
all emitted symbols and original routine order; it checks every direct control
transfer and every absolute data/callback operand, including internal branch
destinations. Nothing is admitted through an unexplained relocation mask.

It verifies the entire 120 B configuration table: all four ushort fields and
all ten actual compression-function pointers. It also compares the full 512 B
distance-code and 256 B length-code tables owned by trees.c, all ten z_errmsg
strings and their actual table binding, the mutable local version pointer and
its full 1.1.4 string, the copyright object, and both default allocator callback
identities. No data address from the TU is left unaccounted for. CDialog/MFC
metadata is inapplicable to this C file; the complete emission inventory excludes
extra generated helpers, initializers and EH code.

The game ledger remains separate from SDK/compiler accounting. Existing complete
file audits must pass against the same fresh executable. Absolute image placement,
whole-executable SHA identity and GUI boot remain pending.
