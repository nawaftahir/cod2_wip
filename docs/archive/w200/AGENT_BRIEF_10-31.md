# Agent brief (10-31 wave): CoD2MP_s.exe 1.0 client reconstruction

Project: byte-identical CoD2 MP client 1.0 from real C/C++ (MSVC 7.1 /O2 /GL + link /LTCG, Wine in docker).
Repo /home/nawaf/cod2/test/dev/claude_client (WSL; from a Windows shell use `wsl.exe -e bash -lc "..."`).
Read /home/nawaf/cod2/test/dev/CLAUDE.md first. State: whole exe 1,434 differing bytes (99.916%).

## Rules (hard)
- Real readable C/C++ only: no asm/_emit/byte arrays, no post-link patching. Never fabricate callees, constants,
  struct offsets: evidence first (retail binary, Mac 1.3 STABS, server source, Q3/CoD1/CoD4 references).
- Do NOT edit claude_client/target/src, do NOT commit, do NOT run ~/lv.sh, ~/rl.sh, lab/gate_w18.sh.
  The main session full-builds, gates and commits your spec files.
- Use ONLY your assigned workspace lab/w200/fp_tN and lmvN.sh; never touch other fp_t*, claude_client/target, lab/r2w,
  the cod2engine archive. Name your spec files with your assigned prefix.
- Shell quoting: NEVER put backticks or $(...) inside text you append via a double-quoted `bash -lc "..."` heredoc;
  the outer shell executes them. Append notes with a python script file or the Edit tool. Do not truncate
  shared files (inl_notes.txt): only append.
- Report measured numbers only. Tag findings PINNED / SUPPORTED / HYPOTHESIS.

## Tools (lab/w200)
- lmvN.sh FILE_REL SPEC.py FN : copy main's source file into fp_tN/src, apply SPEC (python file with
  R = [(old, new[, count])] exact replacements), rebuild that object, relink under the inline oracle (~1 min).
  NOTE: it restores the source copy afterwards but leaves the variant .obj; run an empty spec (lab/w200/nop.py) on a
  file to reset its object before measuring something else.
- fcmps.py fp_tN '?FN@' [-v] : symbolic retail-vs-ours diff of one function (addresses as symbol+offset; 0 = match).
- fcmpobj.py fp_tN OBJ.obj : per-function masked difflines + TOTAL for an object (masks addresses: use fcmps for
  operand/address swaps). Record the baseline; candidates must not regress other functions.
- ordq_fn.py fp_tN/build/ordq.txt '?FN@' : inline decisions (callee, inlined, count, size, c0, c1, r).
- srvcheck.sh TAG REL SPEC.py : apply SPEC to the Linux server 1.0 copy of REL in /tmp/srv_TAG, rebuild with GCC
  3.3.4 (image cod2engine-linux-2005) and print 'SHA256 IDENTICAL' or the failure (~4 min). Shared bg/game/server/
  xanim/script code must keep the server SHA-identical.
- RA probe: apwr_rd.sh / chx_rd.sh / rd8.sh (copy and point at your fp_tN), cpick.py; hooks in inl_notes.txt
  'CG_AddPlayerWeapon RA (agent 10-30 night)'. Model: claude_client13/tools_oracle/REGALLOC.md; scheduler
  research SCHED.md. Side-by-side: sbs8.py, slots8.py, slotmask8.py, hoistscan8.py, tinyfn.py, sites.py.
- ~/rl.sh / ~/rlx.sh exist (relink lab) but are main-session only.

## Pinned tonight (use these)
- Server-equal source is a CONSTRAINT, not one spelling: GCC 3.3.4 -O0 compiles identically (a) one result local +
  if/else-if/else vs direct returns, (b) 'return a ? a : b;' vs 'cs = a; if (!a) cs = b; return cs;'. Verify any
  shared-code re-spelling with srvcheck.sh (it also rejects wrong shapes).
- RA: priority n3 per region (referenced candidates + units*k, live-unreferenced - k), n16 per reference (a piece
  needs n16 > 0), colour by n3 (ties n17), regs eax ecx edx esi edi ebx ebp. Splitting/CSE changes decide it.
- add vs lea is chosen at lowering; a repeated getter makes a shared CSE that lowers to lea (flags-free).
- x87: the lower-numbered value (first reference) becomes the memory operand; a dead '= 0.0f' init flips it.
- Unnamed 0-caller constant stubs (tinyfn.py: CL_Zero_40b4d0, Key_Zero_40b450, CL_True_40b610, SND_Stub_44a6a0,
  CG_Stub_4c0160, GScr_Stub, G_Unused, Sys_ReturnFalse_45f960/970) are local-client helpers = genuine vanished
  callees (Item_Getter_5338c0 textRect[CL_Zero_40b4d0()] fixed the rect static placement, +116).
- LTCG estimator: entry 1e8, if-arms halve, '||' gives 3/4, loop header 10x, 'for' with an increment = non-natural
  (flag spreads outward), while/do-while natural; inline r rule in inl_notes.txt.
- Some 2-4 line register/load swaps follow the linker's global numbering (count of objects before a TU); not source.
- Local statics / float pool / string literals are emitted at compile time (LTCG DFS/sweep order); see LESSONS
  10-24 rules and rd_notes.txt.
- History and tried lists: claude_client/LESSONS.md (newest at the end), CLIENT_KNOWLEDGE.md, lab/w200/inl_notes.txt,
  rd_notes.txt, align_notes.txt. Read the entries for your functions before trying anything.

## Deliverable
Best spec file(s) with measured fcmps difflines per target function and object TOTAL before/after; srvcheck result
for shared files; the explanation (numbers) or measured evidence why nothing natural works. Append an evidence-tagged
section to lab/w200/inl_notes.txt under the heading you were given (append only, via python or Edit).
