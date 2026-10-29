# Radiant handoff (2026-10-28)

Read this first, then `ROADMAP.md` (what's done and what's next), `RULES.md` (facts, all evidence-tagged)
and `AGENTS.md` (the agent contract).
Goal: `CoD2Radiant.exe` 1.0 rebuilt **SHA-256 identical**, structure first, matching second.

## State
- Latest main: cf9e736, reviewed Gemini dialog snapshot landed without touching
  its active MRU work. +13 game routines / 271 B; 467/467 (13.05% functions),
  56,094 B (8.02% game code), same-offset 26,054 B (1.452%). Compiler 2/35 B,
  zero failures, unverified 48, warning one. Generated helper/RTTI leftovers
  transfer to Codex; the three whole-TU completion claims are not accepted.
- Latest integrated main: baaf02a, all three Gemini memory commits merged and
  pushed. +25 game routines / 2,935 B; 454/454 passing (12.69% functions),
  55,823 B (7.98% game code), 25,555 B (1.424% whole-file same-offset).
  Compiler 2 / 35 B, failures zero, warning one, unverified 48. Stock worker
  verification, merged CI and live memory-binding review pass. Gemini keeps
  com_memory for five remaining routines; TU byte coverage is 77.7%.
- Latest: Gemini com_shared merged and pushed (6012019). 429/429 game rows,
  11.99% of game functions; 52,888 B / 7.56% game code; 26,164 B / 1.458%
  whole-file same-offset. Corrected worker referee and combined CI pass.
  Nine unsupported deferral claims were removed. Gemini next owns com_memory.
- Latest integrated checkpoint: 424/424 game matches, 11.85% of functions;
  52,447 / 699,591 game bytes (7.50%); whole-file same-offset 25,947 B (1.446%).
  Five CamWnd methods and three q_shared routines add 1,207 B; gates, binding checks and local CI pass.
  Compiler 2 / 35 B; failures zero, unverified 50, order warnings one.
  Gemini is actively continuing com_shared; Codex recovered the three q_shared offset-only rejects.
- The 407-row camera-window checkpoint is integrated after independent gate and
  data-binding checks in .agents/overseer. Worker local CI passed. Zero failures,
  unchanged 50 unverified bodies and one order warning; compiler helpers 2 / 35 B.
- Gemini's next assignment is root TASK_GEMINI.md, including the narrow TexWnd
  caller scope. Drafts and review evidence are preserved under
  research/gemini_delivery/20261028. The read group remains blocked at 39% and
  regresses two existing wrappers; four helper hits are research only.
- The owner resumed Codex under lanes/CODEX_MERGE.md. Codex integrates reviewed
  deliveries and pushes after merges; same-offset bytes are report-only.
- Camera-target dialog: all five dialog game routines match (212 B), independently
  rebuilt in .agents/overseer. RTTI, message-map, constructor and library bindings
  pass. Logs: build/cameratarget-review-{gate,tests}.log in that worktree.
  That preceding checkpoint had 397 game matches plus 2 compiler helpers / 35 B.
- Codex is now overseer and main-tree integrator. Gemini owns com_files.cpp/h
  in .agents/gemini; Codex owns AdvCurveDlg.cpp and shared build/library/layout
  work in .agents/codex. See WORK_ASSIGNMENTS.md and TASK_GEMINI.md.
- The combined editor/filesystem wave adds nine functions / 1,210 B and 242
  whole-file same-offset bytes over 747a45c. Independent stock gates, binding
  tests and local CI pass in .agents/overseer. No push or GUI boot was run.
- The owner resumed work. The verified eighteen-function / 1,305 B batch is
  included in checkpoint `AdvCurveDlg: 18 functions match` (parent 3330005).
  Continue the same first retail TU.
- Steps 1 (file map) and 2 (build model) of `ROADMAP.md` are done. Next is matching, file by file.
- 416 ledger rows, all matching inside the linked exe; game code 7.32% (51,240 B); whole file 1.433% in place (25,711 B);
  unverified in src/ 50. Engine files come from the server source (`research/libmatch/import.sh`, RULES.md);
  existing files: com_math, q_shared, dvar, com_memory, q_parse. `/GS` is on (RULES.md).
  com_files now has 41 verified functions. Gemini 754c328 adds three functions / 438 B.
  The CRT map is corrected: 0x4dad56 is _remove, calling DeleteFileA. Gemini owns
  the pending filesystem source; see SHARED_UPDATES.md.
  Seven caller-dependent trial hits stay in scratch, not src/. A com_shared trial was rejected:
  three normalized matches cost 260 whole-file same-offset bytes. Earlier universal-file work remains deferred; the owner now requests retail-file order,
  starting with AdvCurveDlg (Com_ParseExt is DEFER at 25%).
  assertive now has five verified bodies (three new, 132 B gained). Four additional helper matches
  and three q_shared info-string matches remain in scratch because they lower same-offset bytes.
  The owner selected retail-file order after the counter-policy question: retain verified
  code in that file and report same-offset changes. The earlier rejected offset trials remain
  historical evidence; do not resume broad unrelated batches.
  The owner approved the verifier boundary fix with the global-dialog proposal.
  All map function starts now bound repeated local names; compiler helpers are verified
  separately through ledger/compiler.tsv, never added to game coverage.
  `.rsrc` 99.71% (the rest is section RVAs).
- Retail-order continuation accepted: src/radiant/AdvCurveDlg.cpp has thirty-nine matches (3,447 B).
  The first ten are at exact retail addresses 0x401000, 0x401090, 0x4010c0, 0x401180, 0x401310,
  0x401340, 0x401450, 0x401550, 0x401560, 0x401580. The owner explicitly approved tools/link.py plus data/flags.tsv,
  data/lib_funcs.tsv and data/lib_overrides.tsv corrections. Only this first TU is explicitly ordered;
  later TU internals retain their existing ordering. This TU enables C++ exceptions and RTTI.
  Four incorrect library bindings are corrected from direct RTTI/runtime evidence. No comparison
  masks or per-function byte/callee predicates were changed. The boundary correction was subsequently approved and applied with compiler accounting.
  The six additional handlers add 333 B and 172 same-offset bytes. Cancel, window closing,
  scroll changes and placement saving now match; the 453 B edit-reading body and its two callers
  remain drafts with a calling-convention mismatch. The live model test also checks shared global
  bindings and all known message callbacks. Normal per-function checks, gate, accept, both model tests and local CI pass.
  The scale setter (81 B) and color/alpha swatch handler (139 B) also match. This pair
  moves same-offset bytes from 25,600 to 25,134 (-466), while retaining all ten exact addresses.
  Native retail log tests and two linked _log call-site bindings pass; no flags or library data
  changed. Plain-TU and noinline experiments for the edit-handler gap failed and stay in scratch.
  Eighteen more functions now match (1,305 B): OnInitDialog and its real window callback,
  selection helpers, visibility/check queries, color/alpha accessors and numeric text methods.
  Seven selection records and seventeen subclass records are typed from raw retail data,
  placed before the existing control table. Full regression is 383/383 and same-offset rises
  from 25,134 to 25,329 (+195). Model checks verify all three tables, their relative order,
  referenced globals and callbacks. The genuine global dialog instance is now restored. Its 24-byte initializer and
  11-byte cleanup match, are registered through the actual CRT table, and bind the same
  object. Two compiler matches / 35 B are separate from the unchanged 383 game matches.
  Same-offset becomes 25,291 (-38); all ten leading game addresses remain exact.
  Continue this first file with its remaining handlers. SHA identity and GUI boot remain open.
- Game functions 3,579 (699,591 B), 3,509 with a known file; MFC/CRT 3,940 are linked from libs.
- Fleet stopped. GitHub Actions minutes are out: the workflow is manual-only, and `tools/ci_local.sh` runs the
  same gate and posts to Discord (webhook in `.secrets/`, gitignored).
- This checkpoint is on branch agent/codex in .agents/codex; main is untouched.
  make gate, make accept and local CI passed; all 304 starting matches remain, with the original
  50 unverified bodies and one existing order warning. The ten matches at exact addresses above are verified; whole-file SHA and boot remain open.

## Structure facts that drive everything (details in RULES.md)
1. **One object per file, `/GL` + `/LTCG`.** The old "one unity unit" claim is refuted (`__FILE__` forms,
   `research/filemap/probe/once/run.sh`). LTCG inlines across files and gives register arguments to functions
   whose callers it sees, so check functions only as linked.
2. A function with no visible caller gets register arguments; retail keeps the stack form for any function
   whose address is taken. link.py adds `/INCLUDE` for those until the code taking the address is written.
3. zlib 1.1.4 + IW unzip (stdio, not FS_*) are `/GL` C files after xmodel_utils (`src/zlib`).
4. Resources: `src/res/CoD2Radiant.rc` gives all 172 resources byte-identical. Assets are extracted to build/res.
5. Link: no `/OPT` (retail keeps identical functions apart), `/DEBUG`, PDB `e:\trees\cod2\bin\CoD2Radiant.pdb`
   (Wine's E: is mapped into build/).

## Commands
`make show A=0x...` · `make try S=src/file.cpp A=0x...` (builds the exe, checks one function) · `make verify` ·
`make gate` · `make build` · `make sections` · `make meter` · `tools/ci_local.sh` (gate + Discord).
Everything runs in the image `cod2-radiant-msvc71` (`toolchain/build.sh`). Files written by Docker come out
root-owned. Chown them back (`docker run --rm -v $PWD:/w alpine chown -R $(id -u):$(id -g) /w/build /w/src /w/ledger`).

## Gotchas
- After editing a script with a Windows editor, `chmod +x tools/*.sh fleet/*.sh` (the exec bit gets lost).
- `fleet.sh start` refuses while loops still run; `fleet.sh stop` waits for the current batch.
- Regenerate `queue/queue.tsv` (`make queue`) before restarting the fleet; old deferrals may match now.
- Commit identity Nawaf, no Co-Authored-By. Push only on the owner's "push it" (the lander pushes landings).
