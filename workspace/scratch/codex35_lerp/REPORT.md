# Interpolation control-flow batch — 2026-10-02

Actual EmitLerp source, isolated from every previously accepted source/proof.
Target SDK member73 section87 is937 instruction bytes, address1007041A.
The real previously matched EmitTemp callee is supplied in this TU; its28
bytes are retained, not new credit. No padding, fake calls or ABI alterations.

Six fresh pinned4035 compiler objects:

| Object | Source distinction | Bytes | First masked difference |
|---|---|---:|---:|
| lerp_0_0 | tail cleanup, cursor after allocation check |947|97|
| lerp_0_1 | tail cleanup, cursor before allocation check |947|107|
| lerp_1_0 | middle cleanup, cursor after allocation check |947|97|
| lerp_1_1 | middle cleanup, cursor before allocation check |947|107|
| shared_0 | shared final emission, cursor after check |945|29|
| shared_1 | shared final emission, cursor before check |945|29|

All are unmatched and earn **zero source credit**. No independent CPU proof
exists for these new objects; the older expression fixture does not certify
them. Cleanup-label placement alone does not change generated block placement.
Cursor assignment before the first allocation check reproduces the original's
pop-ECX/mov-ECX/test ordering, but not its later cleanup jumps. Sharing the
last instruction in readable source moves the first difference earlier.

Replay compile.sh in pinned image
sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131,
then probe.py OBJECT lerp.cpp from gfx/target. Compiler flags and variant
definitions are explicit in compile.sh; probe files are diagnostics only.
Do not repeat these six unchanged variants or promote them to clean src.
