# Radiant matching lane brief (read fully once)

Target: CoD2Radiant.exe 1.0 rebuilt from readable C/C++ (MSVC 7.1 /O2 /GL + link /LTCG) to byte identity.

## Shell
- Native Linux shell (WSL). No wsl.exe or PowerShell: run make/docker/python directly in your worktree.
- Prefix scratch files with your lane letter (`e_try.sh`).
- Wrong symbol from `make try`: `docker run --rm -v $PWD:/w -w /w -e RADIANT_IN_IMAGE=1 cod2-radiant-msvc71 python3 tools/verify.py <src> <addr> --symbol '<mangled>'` (mangled name from build/CoD2Radiant.map).
- Hint source (read-only): ~/cod2/test/dev/refrences/opencod2_radiant_generated/ (names HYPOTHESIS; `__usercall` register notes useful).

## Setup (once)
In your worktree: `git merge --ff-only radiant/main`.
If `make try` says "Cannot open source file", delete the stale symlinks in `build/edrive/trees/cod2src/` (common, libs, radiant); the build recreates them.
The first `make try` takes about 4 min, later ones about 15 s.

## Rules
- Real C/C++ only. No asm, _emit, byte arrays, noinline or ABI hacks.
- Never fabricate names, types or offsets. Use FUN_<addr> / dword_<addr> when a name is unconfirmed.
- Put each function in retail address order inside its file (the emit-order warnings must not grow).
- Max 3 attempts per function. Then add a ledger/defer.tsv row with the REAL best %, sizes and first diff. A row saying only "blocked" is rejected.
- Never edit tools/, data/flags.tsv, link order or shared headers other lanes use without a clear need. Note any header change in your report.
- Never commit core.* dumps or build_*.tsv files.

## Loop
1. Find unmatched functions: `python3 tools/drift.py --tu <tu as in data/tu_map.tsv>` (rows marked missing). Cross-check ledger/matches.tsv. Work smallest and leaf first.
2. `python3 tools/show.py <addr>`: retail disassembly, neighbours, Ghidra hint.
   - Best reference: the verified CoD2 server source in ~/cod2/test/Refrences/CoD2rev_Server/src/
   - Also: data/refs.tsv
3. Add the ledger/matches.tsv row first, because a function reaches the exe only when its row exists. Keep the file sorted by addr.
4. Then run `make try S=<source> A=<addr>`. 100% = match.
   - make try can pick the wrong symbol when sizes are close. If the result looks wrong, compare disassembly side by side.
5. Every ~10 matches: clean gate.
   - `docker run --rm -v "$PWD/build:/b" alpine sh -c "chown -R $(id -u):$(id -g) /b && rm -rf /b/obj /b/src"`
   - then `RADIANT_CI_NO_NOTIFY=1 bash tools/ci_local.sh > ~/gate-<lane>.log 2>&1`
   - It needs `local CI: success` and 0 failing rows.
   - A flipped older match is an LTCG tie: defer it with evidence.
6. Commit: `git -c user.name=Nawaf commit -m "<file>: +N matches"`. Never push, never merge.

## Known blockers (do not retry)
- I_strncpyz 0x496430 and CopyStringInternal 0x489dd0: register-argument helpers, owned by lane A.
- x87 `fsincos` / bare `fistp`: now ALLOWED as inline `__asm`, but only in small named helpers in the shared math header (see the CLAUDE.md exception, 2026-11-16). Never use asm anywhere else.

## Final reply (short)
Commit hash, rows added, bytes, deferred rows with reasons, gate line, any shared header you changed.
