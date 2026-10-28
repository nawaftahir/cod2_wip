# Radiant handoff (2026-10-28)

Read this first, then `ROADMAP.md` (what's done and what's next), `RULES.md` (facts, all evidence-tagged)
and `AGENTS.md` (the agent contract).
Goal: `CoD2Radiant.exe` 1.0 rebuilt **SHA-256 identical**, structure first, matching second.

## State
- The owner resumed work. The verified eighteen-function / 1,305 B batch is
  included in checkpoint `AdvCurveDlg: 18 functions match` (parent 3330005).
  Continue the same first retail TU.
- Steps 1 (file map) and 2 (build model) of `ROADMAP.md` are done. Next is matching, file by file.
- 383 ledger rows, all matching inside the linked exe; game code 6.98% (48,845 B); whole file 1.412% in place;
  unverified in src/ 50. Engine files come from the server source (`research/libmatch/import.sh`, RULES.md);
  existing files: com_math, q_shared, dvar, com_memory, q_parse. `/GS` is on (RULES.md).
  com_files now has 38 verified functions (37 net new, 4,555 B gained). File finish is deferred:
  the CRT map incorrectly calls DeleteFileA's wrapper __rmdir; details in research/codex_notes.md.
  Seven caller-dependent trial hits stay in scratch, not src/. A com_shared trial was rejected:
  three normalized matches cost 260 whole-file same-offset bytes. Earlier universal-file work remains deferred; the owner now requests retail-file order,
  starting with AdvCurveDlg (Com_ParseExt is DEFER at 25%).
  assertive now has five verified bodies (three new, 132 B gained). Four additional helper matches
  and three q_shared info-string matches remain in scratch because they lower same-offset bytes.
  The owner selected retail-file order after the counter-policy question: retain verified
  code in that file and report same-offset changes. The earlier rejected offset trials remain
  historical evidence; do not resume broad unrelated batches.
  A tested verifier boundary correction is proposed in research/codex_fixes/; tools/verify.py is unchanged
  pending a separate explicit exception. Repeated static map names currently hide boundaries.
  `.rsrc` 99.71% (the rest is section RVAs).
- Retail-order continuation accepted: src/radiant/AdvCurveDlg.cpp has thirty-nine matches (3,447 B).
  The first ten are at exact retail addresses 0x401000, 0x401090, 0x4010c0, 0x401180, 0x401310,
  0x401340, 0x401450, 0x401550, 0x401560, 0x401580. The owner explicitly approved tools/link.py plus data/flags.tsv,
  data/lib_funcs.tsv and data/lib_overrides.tsv corrections. Only this first TU is explicitly ordered;
  later TU internals retain their existing ordering. This TU enables C++ exceptions and RTTI.
  Four incorrect library bindings are corrected from direct RTTI/runtime evidence. No comparison
  masks or verifier predicates were changed. The separate verifier boundary proposal is still pending.
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
  referenced globals and callbacks. Continue this first file: add its genuine global instance/lifetime accounting and its
  remaining message handlers before proceeding to the next TU. SHA identity and GUI boot remain open.
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
