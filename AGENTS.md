# CoD2MP_s.exe 1.3 client: agent brief

Goal: C/C++ source that recompiles with the original compiler to the retail Call of Duty 2 **1.3**
multiplayer client, byte for byte. This worktree (`~/cod2/test/dev/claude_client13`, branch
`client-1.3`) is YOURS. The 1.0 client (`~/cod2/test/dev/claude_client`, branch `master`) is
finished separately by the main session: never touch it, its `lab/` slots or `cod2engine/`.

Target: `../cod2engineold/binaries/windows/1.3/CoD2MP_s.exe` (read only), built 2006-05-02,
PDB `c:\builds\pc_1.3_1_1\pc\cod2\pc\CoD2MP_s.pdb`, .text 1,646,592 B (1.0: 1,409,024).
Same toolchain as 1.0 (MSVC 7.1 /O2 /GL, link /LTCG, Wine in docker image `cod2-msvc71-vs2003-ft`).

## Hard rules
1. Real, readable C/C++ only. No `__asm`, `_emit`, byte arrays, copied retail bytes or post-link patches.
2. Never fabricate. A callee name, constant, struct offset or string must come from evidence:
   the 1.3 binary itself, the Mac 1.3 client decompile (`../refrences/cod2-mp-macho`, STABS names
   and types: the best 1.3 oracle), the Linux server 1.3 source (`../cod2engine/archive/lnxded-1.3/src`,
   SHA-identical, shares bg/game/script/xanim/qcommon code), the 1.0 client tree. No evidence: skip it
   and write the reason in `NOTES_1.3.md`.
3. Only `./ratchet13.sh` decides. Commit only after `RATCHET OK`, then run `./ratchet13.sh accept`.
   `RATCHET REJECT` = revert your change (`git checkout -- <the files you changed>`).
4. Git: `git -c user.name=Nawaf commit`, short message, no Co-Authored-By. Never push. Never commit
   binaries (.exe .dll .lib .obj .pdb), Ghidra projects or game files.
5. One agent per area at a time. Write your area at the top of `NOTES_1.3.md` before starting.
6. Long builds (~10-15 min) run in the background; read the next function meanwhile.

## Loop
1. `./ratchet13.sh` once to see the current number (best is in `ratchet13.best`, history in `ratchet13.log`).
2. Pick ONE area (see "Where the bytes are"). Compare retail vs ours for one function at a time.
3. Edit the source, run `./ratchet13.sh "short tag"`. OK: commit + accept. REJECT: revert.
4. Append what you learned to `NOTES_1.3.md`: what paid (+bytes), what did not, and why. Tag facts
   PINNED (measured), SUPPORTED (a reference agrees) or HYPOTHESIS (never ship on it alone).

## Where the bytes are (best first)
- **1.3 code that 1.0 does not have**: the Linux 1.3 server diff (`../cod2engine/archive/lnxded-1.3/README.md`
  "Source" lists it: protocol 118, 128 KB MAX_MSGLEN, LargeLocal buffers, 32-bit fragment offsets, voice size
  checks, PunkBuster). Port every shared change into the client files that compile the same code.
- **Client-only 1.3 changes**: diff the Mac 1.3 decompile against our 1.0 source for cgame/ui/client files.
- **Link order and layout** (`target/src/tus.txt`): 1.3 adds libwww 5.3.2 and PunkBuster TUs. The 1.0
  `unknown/empty_N.cpp` TUs were removed here: 1.3's Rich header decides its own count.
- `target/Makefile`: the 1.0 mixerGetRecordLevel post-link patch is disabled; do not re-add it.

## Knowledge to read first (1.0 lessons apply: same compiler)
- `CLIENT_KNOWLEDGE.md`, `LESSONS.md` (tail = newest), `~/.claude/skills/client-recon/SKILL.md`
  (fix-pattern catalogue), `tools_oracle/REGALLOC.md`, `../lab/w200/inl_notes.txt`.
- Strongest levers: copy the reference text exactly (server SHA source, Q3, Speex upstream), keep the
  inline/estimator rules, first-reference order decides imul/x87 operands, server-equal spelling for shared code.
