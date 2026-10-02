# Program flow reconstruction — 2026-10-02

Paused at owner's request;35% goal remains unfinished. Full aggregate PASS
confirms335406/1089680 =30.780229%, including945 new disjoint flow bytes.
Immediate31% checkpoint requires2395 bytes;35% requires45982.

## Clean source / complete gates

../../src/codex_shader_program_flow/flow.cpp contains four complete bodies:

| Method | Retail entry | Instruction bytes |
|---|---|---|
| CompareIndex |100865c6|26|
| ParentChildInfo_ParentInfo |1008ac46|141|
| ParentChildInfo |1008acd3|568|
| CBaseProgram::Initialize |100863a0|210|

Clean V2 verifies complete SDK/source/retail bytes, all relocation field types,
callee identities, addends, boundaries and wrong-byte/wrong-binding negatives.
Private V3 accepts575 source matches while retaining all571. The integrated
public CPU fixture passes1284 full outputs:954 successes and330 errors in each
profile, including shader, diagnostic and constant-buffer outputs. Inputs and
map ownership of all four methods are hashed/checked. No whole-DLL SHA claim.

Full disjoint aggregate replay passed; aggregate.log preserves its output.
These945 source instruction bytes count. SDK/library/table bytes get zero credit.

From gfx/target:

    sh scratch/codex35_program_flow/build.sh
    python3 scratch/codex35_program_flow/check.py --clean
    python3 scratch/codex35_program_flow/check_link.py
    python3 scratch/codex35_program_flow/run_clean_test.py

## Larger real source draft

flow.cpp supplies ten bodies (the four above plus IsVarying,
RemoveDeadCode_Reference, MarkVarying, StripVarying, StripUniform, RemoveDeadCode).
Its separately built source executable passes the same1284 full-output cases,
with strict source ownership and original SDK on the other side. Six bodies
are still byte-mismatched and are deliberately absent from clean source.
CPU agreement does not substitute for bit identity.

Latest whole-section discovery:59/59 for IsVarying,94/94 reference propagation,
606/614 MarkVarying,518/529 StripVarying,408/408 StripUniform,1208/1202 dead code.
Every one remains unmatched. The accepted four are independently compiled in
flow_matched.cpp and checked with a pinned compiler, not cherry-picked prefixes.

## PINNED details / efficiency

- SDK89/90 and target code confirm CInstruction graph access fields at14/18/
  1c/20 (counts and unsigned-index-array pointers). These are access prefixes,
  not complete allocation-size declarations.
- The callback is a26-byte SDK static CompareIndex routine. It cannot be linked
  as an external SDK symbol directly. Selectors rebind only that named static
  definition, after full source/SDK code equality, zero relocations and a check
  that no retained section references its local labels. Other storage classes
  remain strict. Full-link/CPU evidence validates the resulting binding.
- Selector212 distinct source definitions/232 removed archive definitions;
  exact symbol-set equality is checked. Duplicate definitions add no bytes.
- Parent helper has one recursive E8 to its entry. Raw legacy97 is recorded,
  not called100. The pinned decoded referee reports100 and checks instruction
  boundaries, literal internal jumps, immediates, tables and relocation bounds.
  Independent full typed SDK/source/retail proof remains required.
- Base Initialize210 ends with a backward jump to its verified return epilogue
  at+196:pop edi/esi/ebx/ebp;ret4. Its tail and branches are retained in full,
  not trimmed to satisfy a terminal-ret heuristic.
- Exact-byte lru_cache avoids repeated parsing of the same immutable COFF input
  within one proof process. A runnable parity/hit/changed-input-miss check is
  included. It does not cache files by name/mtime or suppress a verification gate.

Separate lifetime experiments live in ../codex35_program_lifetime/. They do not
change accepted sources, object files or proof inputs.
