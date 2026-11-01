# Browser worker: FindTextureDlg.cpp

Repository: https://github.com/nawaftahir/cod2radiant
Branch: `web/reconstruction`. Base: `main`. Owner/integrator: Codex.

Read this file, AGENTS.md, RULES.md, and research/web/README.md first. Your one
exclusive TU is `src/radiant/FindTextureDlg.cpp`, plus its new matching header.
Codex owns PatchDialog, Pmesh, win_main and every other source file. Gemini is
parked. Never merge or push main, overwrite another branch, or pick another TU.

## Start with evidence

The binary in binaries/CoD2Radiant.exe is the retail authority. checksums.yml
pins it. research/web/retail contains all 16 inventoried entries / 1,046 B,
including one AUTO scalar / 33 B. The provisional remaining 15 entries / 1,013 B
are a starting inventory, not automatic game credit. Classify generated and
SDK bodies separately. Expand the inventory if real target evidence requires it.

Read the full Q3Radiant source/header in research/web/references/q3radiant.
Compare the later Kisak file in research/web/references/kisak; it is CoD4 and
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

Use the connected GitHub tools to read and commit files on web/reconstruction.
If your ChatGPT connection only supports reading, say so immediately: ordinary
web browsing cannot commit code or run a compiler. Do not pretend to have run
commands. The branch has the binary, reference text and workflow; the private
compiler is pulled by GitHub Actions with its repository token. No OpenAI API
key or local compiler is required for this path.

Unmatched source goes in `research/web/drafts/FindTextureDlg.cpp`; a necessary
new class header may go in `src/radiant/FindTextureDlg.h`. To request a trial,
commit `research/web/trial.tsv` with exactly these two tab-separated columns:

```
addr	symbol
0x004100a0	?OnSetfocusEditFind@CFindTextureDlg@@IAEXXZ
```

The example symbol is reference-informed: confirm your emitted symbol, rather
than assuming a method signature. Request one or more original inventory
addresses, each with its exact candidate decorated symbol. Every branch push
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
Keep distinct bounded attempts and results in research/web/PROGRESS.md. Do not
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
research/web/drafts. Re-run the canonical gate and trial for the final SHA.
Record PASS, FAIL and unchecked evidence honestly. Preserve partial progress.

Allowed edits: the assigned .cpp/new .h; research/web/drafts/, trial.tsv and
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

> Use the GitHub connection for nawaftahir/cod2radiant on web/reconstruction.
> Read TASK_WEB.md, AGENTS.md and research/web/README.md, then reconstruct your
> exclusive FindTextureDlg.cpp from its retail evidence and bundled references.
> Commit a real source draft and trial.tsv, inspect the resulting Actions logs,
> and iterate toward exact matches. Keep all other files owned by Codex intact.
> Follow the complete-file contract; report the tested commit/run and remaining
> evidence. Do the work, rather than only describing a plan. If write tools or
> Actions logs are unavailable, state that specific blocker immediately.
