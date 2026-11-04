# FindTextureDlg evidence and browser workflow

Start with [workspace/TASK_WEB.md](../../TASK_WEB.md). The exclusive assignment is one
CoD2 TU; there is no need to search inaccessible local reference directories.

- [Retail inventory](retail/inventory.tsv): 16 original entries / 1,046 B;
  one AUTO scalar / 33 B is separate from authored game coverage. Each address
  has a text file with exact target instructions and available Ghidra hints.
- [Q3 source](references/q3radiant/FindTextureDlg.cpp) and
  [header](references/q3radiant/FindTextureDlg.h): useful ancestor, not proof
  that CoD2 kept the same fields or behavior. GPL-2.0-or-later notices retained.
- [Kisak source](references/kisak/findtexture.cpp): later CoD4 implementation;
  use as independent structural evidence. GPL-3.0 notice/license retained.
- [Reference provenance](references/provenance.json) pins source commits and
  exact copied-file hashes. [Retail manifest](retail/manifest.json) pins the
  anchor and generated text. Run `python3 workspace/research/web/export_retail.py` inside
  the pinned compiler image to regenerate the retail instruction exports.

Original sources:
https://github.com/id-Software/Quake-III-Arena/tree/dbe4ddb10315479fc00086f08e25d968b4b43c49/q3radiant
https://github.com/SwagSoftware/KisakCOD/tree/1c03702cbe176e9274e486d295edcd035b3c2b5f/src/radiant
https://github.com/xoxor4d/iw3xo-radiant

The local iw3xo checkout does not contain this dialog's implementation. The
existing BinDiff research is in workspace/research/codex_refdiff; similarity is not a
match. Do not invent an IW3x source counterpart or copy later target addresses.

Canonical build context: src/radiant/stdafx.h, data/flags.tsv, link/order.txt,
tools/link.py. Real reviewed MFC examples: NameDlg.cpp, RotateDlg.cpp and
cameratargetdlg.cpp in src/radiant. Read their matching
headers and complete-file proofs. The real registry declarations are in
src/radiant/win_main.h. Shared context is read-only for the web worker.

Baseline: 569 game routines / 68,749 of 699,591 B (9.83%), 15.90% of 3,578
game functions; fourteen complete-file audits, 44 unverified bodies, one order
warning; 26,574 of 1,794,048 same-offset B (1.481%). No code has been credited
for this new assignment. Whole-executable identity and GUI boot are pending.

GitHub Actions uses the private, digest-pinned MSVC 7.1 image. The public repo
contains the existing retail anchor but no compiler image or authentication
secrets. This workflow requires a same-repository branch; fork pull requests
cannot pull the private compiler. It emits text/JSON evidence, never rebuilt
binaries or extracted game assets. No API-paid AI job is configured.

Connection check: GitHub file and Actions job reads work; the connected app's
branch write returned HTTP 403. Ordinary ChatGPT's GitHub app is read-only.
workspace/TASK_WEB.md includes a manual source-file handoff through GitHub's web editor,
which triggers the same compiler/referee workflow. Account/workspace settings
for any separate write-capable app must be configured by the owner. See
https://help.openai.com/en/articles/11145903-connecting-github-to-chatgpt
