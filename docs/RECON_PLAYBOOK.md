# Byte-identical reconstruction playbook

Lessons from the CoD2 1.0 client (`CoD2MP_s.exe`, MSVC 7.1 `/O2 /GL` + `link /LTCG`), written so the
next target (renderer, Radiant, another game) starts right instead of re-learning them. Read this
before planning any new reconstruction. Target-specific details live in each target's
`docs/KNOWLEDGE.md` and `docs/TRIED.md` (e.g. `client-1.0/docs/`).

## The one big mistake

We matched code function by function for weeks and left the **whole-program structure** for later:
which functions each file defines, link order, library order, duplicate helper copies. With whole-program
optimisation (`/GL` + `/LTCG`) that structure changes how the compiler handles *other* functions. Fixing it
late kept breaking functions that already matched, and about 10 KB of "tie" functions flipped on every
structural change. The server reconstruction hit the same wall.

**Rule: fix the structure first, or at least alongside the code, never at the end.**

## Day-one setup (before matching any function)

1. **Pinned toolchain image** with the exact compiler, SDKs and libraries (verify import hints and a clean
   rebuild reproduce the same bytes twice).
2. **CI that builds and judges every change** (GitHub Actions + a private image holding the compiler,
   proprietary libs and the retail anchor; nothing proprietary in git). One gate job (build, referee,
   ratchet, meters) and one batch job (up to 20 candidate patches in parallel). Local machines hang and
   slots go stale; CI gave 20 builds in ~4 minutes.
3. **A ratchet**: a change may never lose a function that already matched. Keep a short tie list.
4. **Three meters from the start**, reported in every update:
   - code matched (functions, % of `.text`),
   - real matches excluding tie functions (only goes up),
   - whole file at the same offset as retail, per section, measured on the **release** build.
5. **Progress page** built by CI from the meters (cod2_wip: GitHub Pages) so the owner sees numbers without asking.
6. **Accept only clean builds** (fresh object dir). An incremental build once read +5.5 KB off the clean
   number of the same source (client 1.0, 10-19); a worktree that copied `build/` from an experiment got a
   fake baseline (client 1.3, 11-04).

## Structure checklist (do these early)

- **Function set per file = retail's.** Under LTCG, "tie" functions are decided by the count of
  non-static functions defined before them in link order. Extra helpers, merged functions or missing
  functions in early files flip functions much later. Build a per-file inventory (our non-static functions
  vs retail's functions in that file's address range) and fix differences first.
- **Link order** of objects = retail (matched functions follow it in address order).
- **Library member order** (e.g. libcmt): the linker scans libraries before `OLDNAMES`; using `_stricmp`
  instead of `stricmp` pulls CRT members early. Spell CRT calls the way the original did.
- **One copy per shared helper.** This toolchain emits a standalone body for every `static` /
  `static inline` function in every file that defines it, even with no callers. Retail has one copy.
  Use plain `inline` / `__inline` for shared header helpers; never paste `static` copies into `.cpp` files.
- **Data ownership**: each table/constant lives in the file retail puts it in; string-pool order follows
  file order.

## Matching: what paid vs what wasted usage

Paid (most bytes per token): **find one shared cause, then fix every function that shows it.**
- Compiler rules found by small probe compiles, then applied across functions (x87 operand order:
  first-reference numbering; field pointers keep store/load order; loop-site inlining).
- Using the original/verified sibling source text exactly (server source for shared game code).
- Restoring real call structure: separate early returns, real calls where retail calls, no
  decompiler-shaped loops (`while (2) { ... continue; }` changes inlining).
- Agents with a 25-minute box, 3 builds per function max, concrete target + known lever.

Wasted:
- Respelling one function in dozens of variants when the residue is a register/order tie decided by
  the whole program (64 variants, 0 bytes).
- Open-ended "rule research" without a group of functions it would unlock.
- Long agent boxes (45-60 min): matches land in 7-20 minutes or not at all.
- Trusting stale build slots, debug-build layout numbers, or reference tables with wrong addresses
  (check the referee's own matched list before targeting a function).
- Background slot rebuilds that got killed half way: run them in the foreground.

## Never

- Commit retail binaries, decompiles, SDK libraries or compiler files to a repo (private image only).
- Invent function names, struct types or constants; derive them from the binary or a reference.
- Byte arrays, inline asm or post-link patching as "source".
- Count tie flips as progress.

## Order for a new target

1. Toolchain image + CI gate + batch + meters + notifications.
2. Function and data inventory per file vs retail; link order; library order; helper copies.
3. Bulk matching by shared cause (agents on CI), structure kept in step.
4. Final pass: exact offsets, padding, headers, whole-file SHA-256.
