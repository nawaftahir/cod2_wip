# CoD2Radiant.exe reconstruction: agent contract

You are rebuilding `CoD2Radiant.exe` 1.0 (the Call of Duty 2 map editor, 2005) as C/C++ source.
Compiled with the original compiler, the result must be **byte-identical** to the retail exe
(`binaries/CoD2Radiant.exe`, SHA-256 in `checksums.yml`). You work one function at a time.
This file is all you need. Follow it exactly.

## The loop

You work in your own worktree, `.agents/<your-name>/`, on branch `agent/<your-name>`. Stay in it.

1. **Get your rows.** If your task message lists rows, use those. Otherwise run
   `python3 tools/claim.py <your-name> cheap`. It locks one whole source file for you and
   prints up to 5 functions (`addr  source  note`). If it prints nothing, there is no work: stop.
2. **Look at it.** `make show A=<addr>`. It prints:
   - the source file the function belongs to, and which matched functions it goes between;
   - the retail disassembly, with call targets and strings resolved;
   - the Ghidra decompile, if there is one. It's a hint only; its names and types are guesses.
3. **Write it in place.** Edit the real file under `src/` (your worktree is private), between the
   two neighbours `show` named. Every file is its own object, built `/GL` and linked `/LTCG`, exactly
   as retail was: the linker inlines across files and picks calling conventions for the whole program.
   - If `make show` shows the function reading `eax`, `edx`, `esi`, `edi` or `ebx` before writing it, the
     linker gave it **register arguments**. Write it as a normal function; LTCG picks the registers from
     its callers. If they differ and its callers aren't written yet, say so in the defer reason.
4. **Test.** `make try S=<the src file> A=<addr>`. It builds the whole exe and checks the function as
   linked. `MATCH` means done.
   On a mismatch it prints the first differing byte offset; compare with `make show`.
   **At most 8 tries per function.** After the 8th failure, append a row to `ledger/defer.tsv`
   (`addr  your-name  date  what you tried and what still differs`), delete your claim, and go to step 1.
5. **Land it.**
   - Put the function into the real file under `src/` at the same spot.
   - Add a row to `ledger/matches.tsv`: `addr size source symbol name tag`. `symbol` is the
     name in the .obj: `_Name` for C/`extern "C"`, the mangled `?Name@@...` for C++. `make try` prints it.
   - Run `make try S=<the src file> A=<addr>` once more.
6. **Commit (don't push).**
   ```
   git add <the src file> ledger/matches.tsv      # only your files, never `git add -A`
   git commit -m "match <name> <addr>"
   ```
   The lander (`tools/land.sh`) merges your branch into main later. It rejects any commit that
   touches anything except `src/` and `ledger/`. CI then rechecks everything and posts the numbers.
7. Next row. When your rows are done, run `python3 tools/claim.py --release <your-name>` and stop.

## What gets checked when your work lands

- `make try` compares **only your function's bytes** with retail. Where it sits in the exe, its
  address and the other functions in the file don't affect the result. Don't defer because of "slots", "RVA" or "scaffold".
- Every `make try` is recorded. **A deferral with fewer than 8 recorded tries is thrown out** and
  the function goes back to the queue. Use the tries: change types, operand order, locals, loop form,
  `if` vs `?:`, signed vs unsigned, and read the reference source again.
- A deferral reason must say the best % reached and what differs at the first differing offset.
- The referee reruns on your whole tree before merging. One false `MATCH` rejects your entire batch.

## Shell commands you may run

Only these, one command per call: no `&&`, `;` or `|` chains, no `python3`, no `find`, no `rm`.
`make show|try|verify`, `git add|commit|status|diff|log`, `ls`, `cat`, `grep`, `head`, `tail`,
`mkdir`, `cp`, `wc`, `sed`, `sort`, `diff`, `pwd`, `echo`. Anything else gets refused automatically.
Read and edit files with your file tools, not the shell.

## Rules that make it byte-identical

- **Line numbers are part of the binary.** Asserts store `__LINE__`. `make show` prints the
  numbers (`push 0x75 ; 117`). The assert must sit on exactly that line of the file. Use blank
  lines to get there. Never move other functions' lines.
- **Order is part of the binary.** The exe stores a file's functions in the order the compiler emits
  them, which mostly follows the file. Always insert at the spot `make show` names. `make verify`
  prints `WARN-ORD` when the emitted order is off. Note it in your commit message, don't try to fix it.
- **One file = one original source file.** The file list and order come from `link/order.txt`.
  Don't create new `src/` files unless `make show` names one that doesn't exist yet.
- **C vs C++:** files are `.cpp`. Use `extern "C"` only if the ledger's existing symbols in that
  file are plain `_Name`.
- **Compiler flags are fixed** (`data/flags.tsv`). Don't add `#pragma optimize` or change flags.

## Names

- Use the real name only if you can point to evidence: an assert or error string in the
  function, or the same function in a reference with the same logic. Then tag the ledger row
  `PINNED` (string in the binary) or `SUPPORTED` (reference).
- Otherwise name it `FUN_<addr>` (e.g. `FUN_0040b600`) and tag it `UNNAMED`. A wrong name is worse than no name.
- References (read-only), best first:
  - `../refrences/Quake-III-Arena/q3radiant/`: Q3Radiant, the editor CoD2Radiant grew from
  - `../cod2engine/archive/lnxded-1.0/src/`: the finished CoD2 server source, same `src/universal`, `src/xanim`, `src/script` files
  - `../refrences/CoD2rev_Server/src/`
  - `../refrences/iw3xo-radiant/`: the CoD4 radiant, a later version of this editor
  - `../refrences/cod2map/cod2src/` and `../refrences/opencod2/cod2rad/src/`: rebuilt CoD2 map compiler and
    light tool. Same `universal` files (com_math, dvar, q_parse...), so good for names and logic. Their line
    numbers and file layout are not the original ones; use the server source for those.
  - `research/opencode/`: old guesses per address (hints, not evidence)

## Never

- Never use `__asm`, `_emit`, naked functions, or byte arrays of code. The referee rejects them.
- Never edit `tools/`, `data/`, `link/`, `toolchain/`, `binaries/`, `.github/` or this file. If one
  looks wrong, write it in your defer reason and move on.
- Never touch anything outside this `radiant/` folder.
- Never push. Never merge into main. Never rewrite history.
- Never mark something matched that `make try` didn't call `MATCH`.
- Never add a wrapper or fake caller just to make the compiler emit a function. If a `static`
  or inline function only appears when called, defer it until its real caller is written.
- Never leave an unmatched function in `src/`. Drafts stay in `scratch/`. `src/` holds only verified code,
  and CI fails if the count of unverified functions in `src/` goes up.

## Words

- **retail**: the original exe we compare against.
- **TU**: one source file (`.cpp`) = one `.obj` in the original build.
- **MATCH**: our compiled function has the same bytes as retail; addresses of other functions/data are ignored.
- **CALLEE**: bytes match but your code calls a different known function than retail does. Fix the call.
- **lib**: functions from Microsoft's MFC/C runtime (`data/lib_funcs.tsv`). They are linked, never rewritten, never in the queue.
