# Verified renderer source

Only audited C/C++ files whose **every emitted function** passes both retail
byte and binding checks belong here. Each source-level function in these files
also has an accepted emitted body. Mixed or unmatched files stay outside this
folder in target/work/src/. No assembly wrappers or copied reference tree.

This is an immutable source snapshot for inspection and eventual release
assembly, not a second development tree. The files are byte-for-byte copies
of the source used by the verified original-toolchain build. Develop in the
working tree; replace a snapshot only after fresh verification of the entire
file. This folder does not yet contain the complete renderer or its build
headers, and is not independently buildable. Header/support dependencies remain
in the working tree and are not being labelled verified source files here.

Verification means relocation-normalized function bytes and correct bindings.
It does not mean that the C++ text is the lost original text, that we have
proved every historical translation-unit boundary, or that the entire DLL
matches its retail SHA. No partial file is promoted just because some of its
functions match. These snapshots add no new coverage by being copied here.

Run from gfx:

    python3 tools/check_verified_source.py

The pinned build evidence and per-file/function manifest are in
proof/verified_source_20261102/. Current whole-renderer progress is PROGRESS.md.

The JPEG unit is now included with all10 emitted functions verified. Five sparse
callbacks use producer-derived placements; the pinned proof includes their
relocation certificate, original discovery and independent old-referee replay.
These are genuine source bodies, not emitted retail bytes or assembly wrappers.

The complete r_texturemem.cpp and r_buffers.cpp are also included: all six
emitted functions in each pass. Separate per-file evidence preserves the earlier
snapshots. Ten files,61 emitted functions; copying them here adds no coverage.
