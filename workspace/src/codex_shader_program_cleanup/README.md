# Shader cleanup

cleanup.cpp contains two complete reconstructed C++ definitions:
PropagateMovs10089562/410 and DeadLinkRemove1008ba48/406,816 instruction bytes.
Complete clean V2, private V3/599 retaining597 and1284 actual full shader/error/
constant-table CPU comparisons pass with current input hashes.

DeadLinkRemove's complete406-byte body ends in a backward jump to its exact
pop/pop/pop/leave/ret sequence at394..398. The checker admits only that named
function, full size, jump destination and decoded sequence; it never truncates
the body or skips the allocation-failure tail. Opaque argument44 remains a
DWORD access, not a claimed original historical field name.

Full aggregate inclusion is pending. No whole-DLL identity or GPU claim.
