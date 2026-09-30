# Remaining original CRT C survey — 2026-09-30

Result: **29 new disjoint complete bodies / 3,004 instruction bytes** after
the aggregate excludes earlier source proofs. These are authentic original
VC7.1 CRT C functions, not newly recovered game renderer logic. Original
Microsoft source is external, not committed or promoted to the release tree.

358 previously unbuilt source files were compared byte-for-byte with the
pinned compiler image and compiled in single-threaded and multithreaded
modes. Two response-file invocations replace hundreds of compiler startups.
357 objects per mode were produced; `tidprint.c` fails on unavailable
debug/thread declarations in both modes and is excluded. Compiler output
is retained in `compile_st.log` and `compile_mt.log`.

`discover.py` found 160 full-section candidates across 91 target entries.
Discovery is not acceptance. `check.py` reuses the unchanged hash-pinned
CRT19 complete-body, relocation/binding, data-layout and negative-test
verifier. Old hash-verified dependency objects are copied into `obj/prior19`;
they are checked again and are not credited twice. Malformed branch decoding
is recorded as rejection, not silently tolerated.

The combined packet accepts 243 complete bodies / 43,206 pre-dedup bytes,
with 134 used objects and 424 data proofs. 30 attempted variants fail the
proof and are in `rejected.json`. `interior_rejected.json` separately rejects
a misleading `_amsg_exit` discovery at 0x100f7840: it is a suffix inside the
already proved 51-byte body at 0x100f7832, not a new entry. BSS similarity
does not justify shifted function or global identities.

## Replay

From `gfx/target`, with the pinned Docker image already installed:

```sh
sh scratch/codex35_crt/build.sh
mkdir -p scratch/codex35_crt/obj/prior19
cp -a scratch/codex19_crt/obj/. scratch/codex35_crt/obj/prior19/
python3 scratch/codex35_crt/check.py
cd ../..
python3 gfx/tools/check_ten_percent.py
```

CRT19 source/object inputs must still satisfy their packet hashes; rebuild
that dependency batch using its existing `build.sh` if necessary. The new
packet records complete original source/header/object/tool hashes and the
derived plan; generated binaries and original Microsoft source are not
committed. `sources.txt`, frozen `discovery.json`, `plan.json`, `packet.json`,
and rejection records preserve the work. Do not regenerate discovery with
cached prior objects included and call it a fresh source gain.

The final aggregate is **312,453 / 1,089,680 = 28.673831%**, including SDK35.
The requested 35% threshold is not reached. No new assembly, opaque library
coverage, whole-DLL identity or runtime claim is made.
