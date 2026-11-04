# Browser workers: three parallel lanes

Repository: https://github.com/nawaftahir/cod2_wip (private). Radiant is on the `radiant/*` branches.
Base: `radiant/main`. Claude reviews and merges each lane into `radiant/main`.

Three chats run at once. Each chat takes ONE lane, pushes only to its own branch and only edits
the files in its lane. Never touch `main`, `radiant/main`, another lane's branch or another file.

| Lane | Branch | Files (in this order; finish or record blockers, then the next) |
|---|---|---|
| 1 | `radiant/web/1` | EntityListDlg, TextureBar, KeyValueSelectDlg, DialogInfo, TexEdit, CapDialog, DialogThick, DlgEvent, EditWnd, NameDlg, eclass |
| 2 | `radiant/web/2` | VertEditDlg, vertsel, RotateDlg, PatchDensityDlg, TerrainDensityDlg, LstToolBar, NewProjDlg, RADEditWnd, ScaleDialog |
| 3 | `radiant/web/3` | ModelDlg, PrefsDlg, CommandsDlg, cameratargetdlg, FindTextureDlg, TextureLayout, points, win_dlg |

All files are `src/radiant/<name>.cpp`. Their remaining functions: `data/tu_map.tsv` rows for that
file whose address is not in `ledger/matches.tsv`.

## How a lane works
1. Read this file, AGENTS.md, RULES.md and workspace/research/web/README.md.
2. Check workspace/research/q3sweep_game.tsv first: those functions compile byte-identical from
   Q3Radiant (workspace/research/web/references/q3radiant) and only need copying in.
3. Recipe that matched this week: `#include "stdafx.h"` at the top of an MFC file, a minimal class
   declaration with only the members the bodies use (from the Q3Radiant header: same base class,
   same virtual/afx_msg signatures), then the Q3Radiant body as is.
4. Struct fields and offsets come from Q3Radiant or the retail exe, never invented. Unconfirmed names
   stay `FUN_<addr>`.
5. Push to your lane branch. CI is the referee: it builds, verifies every ledger row and posts
   the numbers. A ledger row goes in only for a function CI reports as MATCH.
6. Red CI: fix or revert before the next push.

Real C/C++ only: no asm, `_emit`, byte arrays, forced noinline, fake callers or hardcoded addresses.

## Start with evidence

The binary in binaries/CoD2Radiant.exe is the retail authority. checksums.yml
pins it. workspace/research/web/retail contains all 16 inventoried entries / 1,046 B,
including one AUTO scalar / 33 B. The provisional remaining 15 entries / 1,013 B
are a starting inventory, not automatic game credit. Classify generated and
SDK bodies separately. Expand the inventory if real target evidence requires it.

Read the full Q3Radiant source/header in workspace/research/web/references/q3radiant.
Compare the later Kisak file in workspace/research/web/references/kisak; it is CoD4 and
its behavior/layout cannot be copied blindly. Both references retain licenses
and a SHA-256 provenance manifest. Decompiler types, show.py annotations and
BinDiff names/scores are hints. In particular library labels can be tied or
wrong. Confirm the target code and data, then name the real symbol.

Follow retail function and storage order. Recover the real class, globals,
MFC message map, RTTI/vtable, strings, EH and lifetime routines. Use existing
stdafx.h and reviewed compiler defaults. Keep proper external declarations
and shared headers; report dependencies needing owner changes. Do not invent
fields, ABI annotations, dummy callers/stubs, byte arrays, assembly, forced
noinline, empty same-name header overloads or hardcoded retail addresses.
Numeric offsets in research evidence are fine; executable address casts are not.

## Compile remotely, inspect the result, then iterate

The standard ChatGPT GitHub app is read-only. A live test here fetched the
retail checksum successfully but branch creation returned HTTP 403, "Resource
not accessible by integration". Do not assume tool names establish permission.
Official limitation: https://help.openai.com/en/articles/11145903-connecting-github-to-chatgpt

With a separately write-enabled connection, commit only radiant/web/<lane> (see workspace/TASK_WEB.md).
Otherwise use this working manual handoff: produce complete changed text files
and a unified diff (or downloadable files if the chat supports downloads). The
owner commits them in GitHub's web editor on radiant/web/<lane> (see workspace/TASK_WEB.md), then you read
the resulting Actions logs and iterate. Start the editor at:
https://github.com/nawaftahir/cod2radiant/edit/web/easy/research/web/PROGRESS.md
Use the file tree to add/edit the draft, request and assigned header together.
Do not stop at planning because the app cannot write; produce reviewable source.

The branch has the binary, reference text and workflow. GitHub Actions pulls
the private compiler with its repository token. No OpenAI API key or local
compiler is required. Custom MCP write support depends on account/workspace
permissions; it is not a switch that makes the standard GitHub app writable.

Unmatched source goes in `workspace/research/web/drafts/FindTextureDlg.cpp`; a necessary
new class header may go in `src/radiant/FindTextureDlg.h`. To request a trial,
commit `workspace/research/web/trial.tsv` with exactly these two tab-separated columns:

```
addr	symbol
0x004100a0	?OnSetfocusEditFind@CFindTextureDlg@@IAEXXZ
```

The example symbol is reference-informed: confirm your emitted symbol, rather
than assuming a method signature. Request one or more original inventory
addresses, each with its exact candidate decorated symbol. Every branch commit/push
starts the `radiant` workflow. Read BOTH jobs for that exact commit:

- `gate`: canonical source, all existing ledger matches, regression meter,
  fourteen complete-file audits and required partial binding proofs.
- `web-trial`: installs the draft only inside an isolated CI checkout, runs the
  unchanged referee, then compares precisely the requested retail/symbol pairs.
  It temporarily registers the requested symbols with the existing retail
  address-taken mechanism, then restores canonical source and symbols afterwards. This grants no accepted game credit.

Use GitHub workflow job/log tools, or the Actions web page. Job logs contain
comparison results; artifacts contain JSON, summaries and paired disassembly.
A successful gate with no requested trial proves no new source. A failed trial
is useful feedback: inspect the actual length, first mismatch and callees.
Keep distinct bounded attempts and results in workspace/research/web/PROGRESS.md. Do not
repeat blind syntax sweeps. Eight genuinely different trials is a ceiling,
not a requirement to manufacture eight log lines.

If a dependency is not in the evidence bundle, use the committed analysis data,
retail binary and agreeing references, or request a concrete evidence export
from Codex. Record the address/type/caller and actual result that blocks you.
Do not spend the session producing plans with no tested source.

## Publish a reviewable checkpoint

After exact draft matches, put only matching implementations into canonical
FindTextureDlg.cpp in retail order. Add only its unique verified game rows to
ledger/matches.tsv; separately propose compiler/helper rows for owner review.
Never delete or alter existing ledger rows. Missing/unmatched bodies stay in
workspace/research/web/drafts. Re-run the canonical gate and trial for the final SHA.
Record PASS, FAIL and unchecked evidence honestly. Preserve partial progress.

Allowed edits: the assigned .cpp/new .h; workspace/research/web/drafts/, trial.tsv and
PROGRESS.md; additions for that TU to ledger/matches.tsv. Propose shared-header,
flags, library-name, inventory, linker, referee or workflow changes in the
report, with evidence; do not change them yourself. Do not change masks,
thresholds or baseline numbers to get a green result. Do not commit binaries,
assets, compiler files, build output or analysis projects.

FILE VERIFIED requires every original routine/helper plus metadata/data bindings
and fresh full regression, as specified by AGENTS.md. Passing the submitted
rows is not 100% of a file. Report the exact tested commit, run URL, accepted vs
proposed bytes, missing entries and next blocker. Codex reviews before merging
main. Whole-image SHA, exact placement and boot remain separate milestones.
Continue this same TU until complete or a documented ownership handoff.

## Prompt to paste into a new ChatGPT conversation

> Use the GitHub connection for nawaftahir/cod2radiant on radiant/web/<lane> (see workspace/TASK_WEB.md).
> Read workspace/TASK_WEB.md, AGENTS.md and workspace/research/web/README.md, then reconstruct your
> exclusive FindTextureDlg.cpp from its retail evidence and bundled references.
> Produce a real source draft and trial.tsv; commit them if write tools work,
> otherwise give me complete files to commit through GitHub. Inspect the resulting
> Actions logs and iterate toward exact matches. Keep all other files owned by Codex intact.
> Follow the complete-file contract; report the tested commit/run and remaining
> evidence. Do the work, rather than only describing a plan. State unavailable
> capabilities honestly and use the manual handoff when the connection is read-only.
