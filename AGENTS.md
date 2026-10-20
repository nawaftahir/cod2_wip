# CoD2Radiant.exe reconstruction: agent contract

You are rebuilding `CoD2Radiant.exe` 1.0 (the Call of Duty 2 map editor, 2005) as C/C++ source.
Compiled with the original compiler, the result must be **byte-identical** to the retail exe
(`binaries/CoD2Radiant.exe`, SHA-256 in `checksums.yml`). You work one function at a time.
This file is all you need. Follow it exactly.

## The loop

1. **Pick a row.** Open `queue/queue.tsv` and take the first row (top = easiest) that has no
   file in `queue/claims/`. Claim it: `echo <your-name> > queue/claims/<addr>`. One row at a time.
2. **Look at it.** `make show A=<addr>`. It prints:
   - the source file the function belongs to, and which matched functions it goes between;
   - the retail disassembly, with call targets and strings resolved;
   - the Ghidra decompile, if there is one. It's a hint only; its names and types are guesses.
3. **Draft.** Copy the target file to `scratch/<your-name>/` and write the function there,
   between the two neighbours `show` named. `scratch/` is never committed or linked.
4. **Test.** `make try S=scratch/<your-name>/<file>.cpp A=<addr>`. `MATCH` means done.
   On a mismatch it prints the first differing byte offset; compare with `make show`.
   **At most 8 tries per function.** After the 8th failure, append a row to `ledger/defer.tsv`
   (`addr  your-name  date  what you tried and what still differs`), delete your claim, and go to step 1.
5. **Land it.**
   - Put the function into the real file under `src/` at the same spot.
   - Add a row to `ledger/matches.tsv`: `addr size source symbol name tag`. `symbol` is the
     name in the .obj: `_Name` for C/`extern "C"`, the mangled `?Name@@...` for C++. `make try` prints it.
   - Run `make try S=<the src file> A=<addr>` once more.
   - Then `make verify`. Every row must still pass.
6. **Commit and push.**
   ```
   git add <the src file> ledger/matches.tsv      # only your files, never `git add -A`
   git commit -m "match <name> <addr>"
   git pull --rebase && git push
   ```
   CI rechecks everything and posts the numbers. Check it with `gh run list -L 1`.
   **If your push turned CI red, fix it or `git revert` your commit before you claim anything else.**
7. Delete your claim file. Go to step 1.

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
  - `research/opencode/`: old guesses per address (hints, not evidence)

## Never

- Never use `__asm`, `_emit`, naked functions, or byte arrays of code. The referee rejects them.
- Never edit `tools/`, `data/`, `link/`, `toolchain/`, `binaries/`, `.github/` or this file. If one
  looks wrong, write it in your defer reason and move on.
- Never touch anything outside this `radiant/` folder.
- Never push a commit that breaks `make verify`. Never force-push. Never rewrite history.
- Never mark something matched that `make try` didn't call `MATCH`.

## Words

- **retail**: the original exe we compare against.
- **TU**: one source file (`.cpp`) = one `.obj` in the original build.
- **MATCH**: our compiled function has the same bytes as retail; addresses of other functions/data are ignored.
- **CALLEE**: bytes match but your code calls a different known function than retail does. Fix the call.
- **lib**: functions from Microsoft's MFC/C runtime (`data/lib_funcs.tsv`). They are linked, never rewritten, never in the queue.
