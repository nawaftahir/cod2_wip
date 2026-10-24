# Radiant handoff (2026-10-24)

Read this first, then `ROADMAP.md` (what's done and what's next), `RULES.md` (facts, all evidence-tagged)
and `AGENTS.md` (the agent contract).
Goal: `CoD2Radiant.exe` 1.0 rebuilt **SHA-256 identical**, structure first, matching second.

## State
- Steps 1 (file map) and 2 (build model) of `ROADMAP.md` are done. Next is matching, file by file.
- 304 ledger rows, all matching inside the linked exe; game code 5.82% (40,711 B); whole file 1.186% in place;
  unverified in src/ 50. Engine files come from the server source (`research/libmatch/import.sh`, RULES.md);
  done so far: com_math, q_shared, dvar, com_memory, q_parse. `/GS` is on (RULES.md). Next: com_files,
  com_shared, assertive, xanim, script, then the asserted functions per file (Com_ParseExt is DEFER at 25%).
  `.rsrc` 99.71% (the rest is section RVAs).
- Game functions 3,579 (699,591 B), 3,509 with a known file; MFC/CRT 3,940 are linked from libs.
- Fleet stopped. GitHub Actions minutes are out: the workflow is manual-only, and `tools/ci_local.sh` runs the
  same gate and posts to Discord (webhook in `.secrets/`, gitignored).

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
