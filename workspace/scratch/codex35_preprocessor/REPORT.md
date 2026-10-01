# Preprocessor batch

Clean-source V2 and private linked regression pass: 25 bodies, 2,199 code bytes;
548 linked source matches retain all 523 preceding matches. Full-output CPU
comparison passes 2,283 new cases plus 9,976 unchanged regressions. The whole
coverage audit is the authority for accepting these ranges into the percentage.

Accepted source: `../../src/codex_shader_preprocessor/preprocessor.cpp`.
`clean_packet.json`, `link_packet.json`, `fixture_packet.json` contain hashes
and evidence; `aggregate.log` records the full coverage replay. The clean
module README explains build commands, layouts and the narrow recursive-call
and string-boundary proof handling. Canonical source/referees were unchanged.

The integration initially selected libcpmt's 36-byte operator new instead of
the target's 14-byte libcmt implementation and lost five prior matches.
Explicit selection of the pinned, authentic source-rebuilt CRT dependency
restored every prior match. Its library bytes receive zero additional credit.
One synthetic string-end label also shadowed a real adjacent string symbol;
the proof map now retains the real symbol as the already-known boundary.

Preserved drafts: End 90 vs 92 bytes, IsDefineRecursive 153 vs 153 with wrong
block order, DoPragmaDef 786 vs 793, DoPragmaWarning 946 vs 1,000, and critical
section methods with a wrong static-global identity. None count. Do not repeat
the recorded unchanged source/flag experiments or call a masked match proof.

This is not a release, boot proof, whole-DLL SHA match or proof of original
historical source grouping. The active goal remains 35% verified coverage.

## Following batch (uncredited)

The full `preprocessor.cpp` draft now has three CPreProcessor source-loading
wrappers and CPPInclude::InitializeFromMemory with complete masked sections
equal on the first compile: 126 + 115 + 112 + 59 = 412 bytes. Declared CPPInclude
constructor/destructor names and all initializer signatures are confirmed in
SDK member 94. The generated 33-byte include deleting helper also matches in
the full draft, but comes from the unmatched GetToken method; do not promote
that helper in isolation through an artificial emitter or marker function.
These additions have not passed independent V2, link or CPU acceptance.

New larger drafts: GetToken is 854 vs 838 bytes, with an extra string-pointer
spill and altered register allocation. For-loop versus explicit-error while
and shared EOF return produced the same 854-byte body. DoError improved from
245 to 223 vs 228 after reproducing the target's for/do-while control flow;
separate continuation checks still produce 223, omitting a target redundant
comparison. AreDefinesIdentical improved from 564 to 571 vs 620 after replacing
the switch with target-confirmed signed ranges and a boolean parameter marker.
Both full source attempts remain readable and preserved. No flag/ABI excuses
or partial-body credit. Inspect fresh `probe_preprocessor.json` and `diff.py`
before repeating these experiments.
