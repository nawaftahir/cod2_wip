# Original C++ runtime survey — no accepted gain

All 58 untouched original VC7.1 C++ runtime files were compiled in ST and MT
mode in image `9147e308…`. Both batches passed. Source/header hashes and compiler
logs are retained; original Microsoft source remains inside the external image.

Complete-section discovery found 13 variants at five addresses, 210 bytes
before any identity/accounting review. These are mostly tiny new-handler and
stream/runtime wrappers. No new binding-certified or disjoint source claim is
made. This cohort contributes **zero** to the coverage counter.

Do not repeat this unchanged source/flag survey as a large-byte shortcut.
`discover.py` reuses the existing hash-pinned CRT complete-section search;
discovery is not acceptance. Original source, executables and objects are not
committed.
