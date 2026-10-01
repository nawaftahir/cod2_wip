# Bounded original C runtime /O2 survey — no accepted gain

The 358-source CRT35 cohort was rebuilt with `/O2`, otherwise retaining the
earlier pinned CRT flags, in ST and MT modes. Each mode produces 356 objects.
`strset.c` conflicts with the enabled intrinsic; `tidprint.c` lacks debug/thread
declarations. Failures are logged, not silently counted as completed sources.

Discovery found eight variants at three addresses / 59 bytes. Only one
12-byte address lies outside CRT35's certified list: `0x10033076`, shared by
`__loaddll` and several mutex no-op shapes. Shape cannot assign that engine
entry a CRT identity. It is **DEFER**, not an accepted function or binding.

This batch contributes **zero** to verified coverage. Do not repeat this
unchanged `/O2` survey. Source remains in the external original CRT input;
generated objects are not committed. `discover.py` reuses the unchanged
hash-pinned CRT complete-section search.
