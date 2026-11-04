# Cheap-agent contract (read all of it)

The mandatory file-completion contract in ../CLAUDE.md applies to this role: one active TU,
complete routine/helper inventory, real metadata bindings and a full regression
before FILE VERIFIED. Partial checkpoints remain PARTIAL.

You rebuild one source file of `CoD2Radiant.exe` so it compiles **byte-identical** to retail. You work in
your own folder `.agents/<your-name>/` (a git worktree). Never touch anything outside it.

## Current Gemini assignment

Gemini follows ../TASK_GEMINI.md and GEMINI_QUEUE.tsv. That preassigned queue
replaces the automatic claim step below. Its target is 100% per assigned TU;
a completed file or explicit hard-blocker handoff goes to Codex for review.
Never run claim.sh or reset over unmerged commits. Other cheap workers follow
the general single-file flow below unless assigned otherwise.

## Start
From `~/cod2/test/dev/radiant` run `lanes/claim.sh <your-name>`. It prints your file and its function list.
Then work inside `.agents/<your-name>/`.

## Free wins first
`research/q3sweep_game.tsv` lists retail functions whose Q3Radiant source compiles **byte-identical** as is
(address, size, Q3 object, symbol). If your file has any, copy that function from the named Q3Radiant file
(`../../refrences/Quake-III-Arena/q3radiant/`) first, with the struct/class declarations it needs, and
`make try`. Example: `src/radiant/win_qe3.cpp` (4 functions landed that way).

## For each function, top to bottom in the order listed
1. `make show A=<addr>`: the retail code, strings, assert line numbers, and where it goes in the file.
2. Write it in your file at that spot, in plain readable C/C++.
   - Reference first: if the board says "server source (copy-ready)", copy the function from
     `../../cod2engine/archive/lnxded-1.0/src/<same path>` and adjust. If it says Q3Radiant/iw3xo, use
     `../../refrences/Quake-III-Arena/q3radiant` or `../../refrences/iw3xo-radiant` as a guide.
   - Asserts must land on the line numbers `make show` prints; keep earlier lines from shifting.
   - A function that reads eax/edx/esi/edi/ebx before writing it gets register arguments from the linker;
     write it normally and let its callers exist.
3. `make try S=<your file> A=<addr>`. MATCH means done. At most **8 tries**; then add a row to
   `ledger/defer.tsv` (`addr  <your-name>  date  best % and what differs`) and move on.
4. On MATCH add a row to `ledger/matches.tsv` (`addr size source symbol name tag`; `make try` prints the
   symbol). Name a function only with evidence (assert/string, or the reference); else `FUN_<addr>`, tag UNNAMED.

## Finish
- `make verify` must pass (every row, inside the linked exe).
- `git add <your file> ledger/matches.tsv ledger/defer.tsv lanes/reports/<your-name>.md` and `git commit -m "<file>: N match"`.
- `lanes/reports/<your-name>.md`: file, matched count, deferred count with reasons, anything that looked
  wrong in the layout. Then stop. Codex merges it.

## Never
- Edit `tools/`, `data/`, `link/`, `toolchain/`, `Makefile`, `src/unit.cpp`, other files in `src/`, or these docs.
- Use asm, `_emit`, byte arrays, fake callers, wrappers, `#pragma` or flag changes.
- Mark anything matched that `make try` didn't call MATCH. Push, merge, or rewrite history.
- Revert a real match because the whole-file "bytes in place" number moved; it is report-only.
