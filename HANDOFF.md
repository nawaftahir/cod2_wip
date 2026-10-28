# Radiant handoff (2026-10-28)

Read this first, then `ROADMAP.md` (what's done and what's next), `RULES.md` (facts, all evidence-tagged)
and `AGENTS.md` (the agent contract).
Goal: `CoD2Radiant.exe` 1.0 rebuilt **SHA-256 identical**, structure first, matching second.

## State
- Steps 1 (file map) and 2 (build model) of `ROADMAP.md` are done. Next is matching, file by file.
- 357 ledger rows, all matching inside the linked exe; game code 6.72% (46,987 B); whole file 1.417% in place;
  unverified in src/ 50. Engine files come from the server source (`research/libmatch/import.sh`, RULES.md);
  existing files: com_math, q_shared, dvar, com_memory, q_parse. `/GS` is on (RULES.md).
  com_files now has 38 verified functions (37 net new, 4,555 B gained). File finish is deferred:
  the CRT map incorrectly calls DeleteFileA's wrapper __rmdir; details in research/codex_notes.md.
  Seven caller-dependent trial hits stay in scratch, not src/. A com_shared trial was rejected:
  three normalized matches cost 260 whole-file same-offset bytes. Earlier universal-file work remains deferred; the owner now requests retail-file order,
  starting with AdvCurveDlg (Com_ParseExt is DEFER at 25%).
  assertive now has five verified bodies (three new, 132 B gained). Four additional helper matches
  and three q_shared info-string matches remain in scratch because they lower same-offset bytes.
  Whole-file same-offset progress is strict: do not accept normalized matches that lower it.
  A tested verifier boundary correction is proposed in research/codex_fixes/; tools/verify.py is unchanged
  pending a separate explicit exception. Repeated static map names currently hide boundaries.
  `.rsrc` 99.71% (the rest is section RVAs).
- Retail-order continuation accepted: src/radiant/AdvCurveDlg.cpp has thirteen matches (1,589 B).
  The first eight are at exact retail RVAs 0x401000, 0x401090, 0x4010c0, 0x401180, 0x401310,
  0x401340, 0x401450, 0x401550. The owner explicitly approved tools/link.py plus data/flags.tsv,
  data/lib_funcs.tsv and data/lib_overrides.tsv corrections. Only this first TU is explicitly ordered;
  later TU internals retain their existing ordering. This TU enables C++ exceptions and RTTI.
  Four incorrect library bindings are corrected from direct RTTI/runtime evidence. No comparison
  masks or verifier predicates were changed. The separate verifier boundary proposal is still pending.
  Research/model tests, all thirteen make try checks, make gate, make accept and local CI passed.
  Continue this first file: add its genuine global instance/lifetime accounting and its
  remaining message handlers before proceeding to the next TU. SHA identity and GUI boot remain open.
- Game functions 3,579 (699,591 B), 3,509 with a known file; MFC/CRT 3,940 are linked from libs.
- Fleet stopped. GitHub Actions minutes are out: the workflow is manual-only, and `tools/ci_local.sh` runs the
  same gate and posts to Discord (webhook in `.secrets/`, gitignored).
- This checkpoint is on branch agent/codex in .agents/codex; main is untouched.
  make gate, make accept and local CI passed; all 304 starting matches remain, with the original
  50 unverified bodies and one existing order warning. The eight exact-RVA matches above are verified; whole-file SHA and boot remain open.

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
