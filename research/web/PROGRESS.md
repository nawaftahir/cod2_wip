# Web worker checkpoint

Assignment: src/radiant/FindTextureDlg.cpp, exclusively on web/reconstruction.

## Trial 1 — full reference reconstruction — commit a8d5746

Hosted run 41304519850 completed. The canonical gate passed unchanged at
569/569 game rows, 68,749 B, fourteen verified files, zero failures and one
order warning.

The isolated FindTexture trial matched 13 of 16 inventoried entries exactly:
destructor 0x40fc10; constructor 0x40fca0; scalar deleting destructor 0x40fd60
(AUTO); DoDataExchange 0x40fd90; GetMessageMap 0x40fe00; OnBtnApply 0x40fe10;
OnOK 0x40fe80; show 0x40fef0; setFindStr 0x40ffb0; OnCancel 0x410050;
DestroyWindow 0x410090; and both focus handlers 0x4100a0/0x4100b0.

Three authored bodies remain:
- 0x40fc60 updateTextures: 84%, candidate/retail 57/53 B, first diff +0xb.
- 0x40ff80 isOpen: 72%, candidate/retail 33/36 B, first diff +0x8.
- 0x410000 setReplaceStr: 44%, candidate/retail 85/79 B, first diff +0x0.

## Trial 2 — branch-shape correction

Retail isOpen uses two explicit early-false exits followed by a literal true
return. Trial 1 used the Q3 ternary spelling; the compiler shortened it to 33 B.
The draft now spells the two early exits explicitly. Because updateTextures
inlines/propagates isOpen under the linked build, this is also a bounded attempt
to repair its +0xb divergence. setReplaceStr is retained unchanged: its twin
setFindStr already matches exactly, and its different codegen can depend on the
caller/callee optimization context. Only these three symbols are requested.

No new game credit is claimed until the hosted trial reports exact MATCH.

## Trial 2 result — commit 2e1fc85

Hosted web-trial still failed the same caller group. updateTextures stayed 57/53 B
at 84%; setReplaceStr stayed 85/79 B at 44%. The explicit-return isOpen variant
became worse (32/36 B, 55%): it compiled to early AL returns and SETNE, while
retail uses full EAX constants. That source spelling is rejected and the Q3
ternary is restored.

The paired assembly shows the actionable difference: retail updateTextures calls
both setFindStr and setReplaceStr with the texture pointer already in ESI.
Trial 1/2 emits setFindStr in that register form, but setReplaceStr is compiled
as a normal stack-argument function, forcing `push esi / call / add esp,4` and
making updateTextures four bytes too long. This is compiler/caller context, not
a guessed dialog-field difference.

## Trial 3 — isolate the caller

Only updateTextures is requested. setFindStr, setReplaceStr and isOpen remain
present as its real callees but are not independently appended to data/symbols
by web_trial.py. This tests whether the trial's temporary symbol registration is
what suppresses LTCG's register-argument form for setReplaceStr. No source ABI
annotation or noinline workaround is introduced.

## Trial 3 result — commit 8382e1b

Hosted web-trial MATCHED updateTextures exactly at candidate 0x404160.
The normal gate also passed. This proves the existing Q3-shaped updateTextures
source is correct and its earlier 57/53 mismatch was caused by the multi-symbol
trial context changing setReplaceStr's argument convention.

## Trial 4 — isolate setReplaceStr

Only 0x410000 setReplaceStr is requested. The source is unchanged from the
matching twin setFindStr except for the retail-proven CString member offset
(+0x78 instead of +0x74). This checks whether its prior stack-argument body was
also an artifact of requesting the whole caller/callee group at once.

## Trial 5 queued — isolate isOpen without source changes

The draft keeps the original Q3 ternary spelling. Only 0x40ff80 is requested.
This avoids conflating a real source mismatch with the trial harness's temporary
symbol registration, the same issue already proven for updateTextures.

## Trial 5 result — commit 85e1e45

The isolated Q3-style isOpen still mismatched: 72%, 33/36 B, first difference
+0x8. The candidate returns through AL; retail returns full EAX constants.
The normal gate passed.

## Trial 6 — numeric bool returns

The control flow remains identical, but false/true literals are replaced by
integer 0/1 returns. This is a source-level spelling consistent with the retail
full-EAX return sequence and does not alter ABI, flags, or surrounding callers.
Only isOpen is requested.

## Trial 6 result — commit 9bed7b4

Numeric 0/1 returns did not change isOpen codegen: 72%, 33/36 B, first
difference +0x8. The canonical gate stayed green. The experiment is rejected
and the evidence-backed Q3 ternary spelling is restored.

The remaining discrepancy is now isolated to compiler/LTCG context: retail
returns full EAX constants while the current pinned /GL build emits AL for this
otherwise equivalent bool function. No ABI hack or noinline workaround will be
used.

## Trial 7 — isolate setReplaceStr (rerun after cancelled Trial 4)

Only 0x410000 is requested, with the restored Q3 source. This reruns the earlier
setter isolation without overlapping Actions, so its result is usable.

## Web CI diagnostic update

Owner authorized web-branch CI changes to make reconstruction feedback actionable. The web branch no longer cancels an in-flight web run when the next web commit arrives; main/PR cancellation behavior is unchanged. tools/web_trial.py now adds a diagnostic-only instruction diff to the log, JSON and summary. The existing referee, relocation masks, thresholds, baseline and MATCH decision remain untouched.

## Canonical partial landing

Twelve authored game routines that matched exactly in the hosted isolated trial
and do not require an unmatched callee are promoted to
src/radiant/FindTextureDlg.cpp: 845 game bytes total. The AUTO scalar deleting
destructor at 0x40fd60 remains classified separately and is not counted as game
credit.

updateTextures (0x40fc60) is proven exact in the correct caller context but stays
draft-only because it calls the still-unmatched setReplaceStr. isOpen
(0x40ff80) and setReplaceStr (0x410000) remain draft-only. This avoids putting
an unmatched body into canonical source merely to satisfy a dependency.

## Observe-only LTCG diagnostic

The web trial now supports research/web/observe.tsv. Observe rows are compared
after the same build but are not appended to data/symbols.tsv and do not control
the job exit status. This lets us inspect a callee without changing the very
caller/LTCG context we are trying to reproduce.

The next build requests only updateTextures (already proven exact in that
context) and observes isOpen + setReplaceStr without registering them.

## Final bounded type trial — target-driven isOpen return type

Observe-only context proved updateTextures and setReplaceStr both exact together.
isOpen remained 33/36 B with an otherwise instruction-identical body; the sole
semantic codegen difference is 8-bit bool returns (AL) versus retail full-width
EAX constants. The bool signature is inherited from Q3 reference source, not a
retail symbol.

Trial 8 tests the target-supported MFC type hypothesis: declare isOpen as BOOL
and request the emitted ?isOpen@CFindTextureDlg@@SAHXZ symbol. updateTextures
and setReplaceStr are observe-only to ensure the type change does not regress
their already-proven bodies. No ABI annotation, noinline, assembly or dummy
caller is introduced.

## Target-width BOOL constant trial

The prior BOOL signature still used C++ false/true, so MSVC formed AL and then zero-extended it. This bounded variant keeps the target-supported BOOL signature but uses the MFC integer constants FALSE/TRUE, testing whether MSVC71 emits the retail full-width `xor eax,eax` / `mov eax,1` sequence directly. updateTextures and setReplaceStr remain observe-only.

## All authored game bodies exact

Hosted run 41306787818 proved the final target-driven type correction. `isOpen` is a 32-bit MFC BOOL in CoD2 and uses FALSE/TRUE constants; the result matches retail 0x40ff80 exactly at 36 B. The same build observes updateTextures 0x40fc60 / 53 B and setReplaceStr 0x410000 / 79 B exact.

All fifteen SUPPORTED authored entries are now proven: 1,013 game bytes total. The 33-byte scalar deleting destructor remains AUTO. These final three bodies are promoted to canonical source and game ledger; remaining work is generated lifetime/metadata accounting and complete-file proof, not authored game logic.

## Lifetime thunk probe

All game rows are now in canonical source. The only known meter regression is compiler local `_$E4` emitted by the real global g_TexFindDlg. A diagnostic-only probe now reports the candidate local body and scans retail .text for functions calling the already-proven FindTexture constructor/destructor. This is used to bind the generated helper without changing masks, thresholds or game credit.

## Canonical LTCG regression diagnostic

After adding the final three proven game rows, the full referee compiled updateTextures as 57/53 and setReplaceStr as 85/79 again. This is not a source change: the same draft matched both immediately before ledger promotion. The diagnostic now prints link.address_taken and resulting /INCLUDE decisions for 0x40fc60, 0x40ff80 and 0x410000 to determine whether ledger promotion is incorrectly forcing a stack ABI.

## Diagnostic sequencing fix

The web trial now preserves the exact same referee assertion/exit behavior but constructs the linked-image diagnostic view before asserting the existing ledger. This allows LTCG/lifetime diagnostics to print even when the canonical ledger is the thing under investigation.

## Address-taken false-positive probe

The prior diagnostic proved link.address_taken(0x410000) is true and therefore ledger_includes adds setReplaceStr, even though retail's own body/caller use the LTCG ESI argument convention. The probe now prints every raw occurrence of the three relevant addresses in the retail PE and fixes the lifetime scan to read link.RETAIL. This will distinguish a real code/data pointer from an unrelated resource/byte-pattern hit before changing link.py.

## Evidence-backed address-taken correction

Retail 0x410000 occurs as raw bytes only outside .text. The .rdata/.data hits are all unaligned and the remaining hits are resources, while retail's actual caller passes the argument in ESI. tools/link.py now recognizes address-taken functions from rel32 extlib calls, absolute .text references, or aligned 32-bit .rdata/.data pointer slots; arbitrary .rsrc bytes no longer force /INCLUDE. The full referee will validate all prior rows under this correction.

The lifetime diagnostic also compares rebuilt `_$E4` against the three nearby 11-byte retail startup helpers, with 0x5269b0 favored by placement immediately after the proven 0x526990 FindTexture constructor thunk.

## Generated reference initializer binding

With the corrected address-taken model, the hosted web trial verifies 584/584 game rows. The newly emitted `_$E4` is an 11-byte initializer that stores the g_TexFindDlg object address into the g_dlgFind reference. It matches the retail 11-byte initializer family; ownership is pinned to 0x5269b0 because that helper immediately follows the independently proven 0x526990 / 24 B FindTexture global constructor thunk. The row is added to ledger/compiler.tsv as AUTO and is not counted as game reconstruction credit.

## Complete-file proof

A dedicated FindTexture proof is now registered with the file ledger. It covers the 15 exact game routines / 1,013 B, scalar helper, 86-slot CDialog RTTI/vtable, three message callbacks, retail TU padding, registry literal, constructor EH/unwind tables, g_bFindActive initialization, the g_dlgFind reference initializer, and the global constructor/destructor lifetime routines. The existing CName proof is adjusted only for an LTCG ownership fact exposed by adding this earlier TU: generated destructor aliases may be owned by another object, while all CName game symbols and generated symbols remain required and their existing byte/RTTI checks remain unchanged.

## 2026-11-01 — fresh CI audit of complete-file claim

Checked branch commit `38d6398ca0c6273d3101c884b1de00b4028a02ca`
(run https://github.com/nawaftahir/cod2radiant/actions/runs/41310169673)
and later `4780358c6c9ea88ab2cd9be3d39f7f2d55b1f2b1`
(run https://github.com/nawaftahir/cod2radiant/actions/runs/41310427143).

- The **unchanged full retail referee passes 584/584 game rows**,
  69,762 of 699,591 game bytes (9.97%), and all 4/4 compiler rows. The
  fifteen unique FindTexture game rows / 1,013 B are included. No new
  FindTexture source was needed; the canonical C++ and header are already
  present and must not be rewritten without target-driven evidence.
- **FILE VERIFIED is not yet established.** The complete-file gate fails in
  `research/web/test_findtexture_complete.py` while its shared
  `dialog(...)` helper recursively validates an unregistered external callee:
  `AssertionError: ('0x473940', '$L187386')`. The failure occurs inside
  `blob()` when comparing a retail call target whose address is absent from
  `known_names()`, so the helper tries to compare the other function's
  implementation by bytes. Both retail callers are demonstrably in this TU:
  `OnBtnApply` 0x0040fe10 calls 0x00473940 at +0x54, and
  `OnOK` 0x0040fe80 calls 0x00473940 at +0x54. The authored source calls
  `FindReplaceTextures`; the complete 97 B and 104 B dialog caller
  functions themselves pass the canonical referee.
- **Owner/Codex dependency:** confirm the external callee identity against
  retail's code/callers and the linked map, then add an owner-reviewed
  `data/symbols.tsv` binding and a narrow audit binding check if justified.
  Alternatively reconstruct that callee in its actual owner TU. Do not
  mask the call, weaken the audit, add dummy wrappers, or claim complete-file
  verification from the passing caller rows alone. The web worker's allowed
  edit scope excludes shared audit, symbols, and other source TUs.
- The current `web-trial` CI job runs the generic xmodel request because
  `research/web/target.tsv` exists. Its 0x004acb70 / 193-vs-191 B
  mismatch at +0xa2 is **unrelated** to FindTexture. The proper
  FindTexture `research/web/trial.tsv` still requests the exact proven
  `isOpen` BOOL symbol but is not the active CI selector.
- At this commit, FindTexture remains **PARTIAL for metadata/whole-file
  proof**, despite fifteen exact authored functions. Whole-image SHA and GUI
  boot remain pending. Avoid changing the 15 verified bodies to satisfy an
  unrelated proof dependency.

## Five complete zlib leaf files — 2026-11-01

Hosted run https://github.com/nawaftahir/cod2radiant/actions/runs/41311990123
(at commit `a0988f4aa0c686db29c21d88bb9ebac6920ad408`) **passed the
canonical `gate` job**, preserving 584/584 exact game ledger rows / 69,762 B,
4/4 compiler rows and all other mandatory regression checks. The complete-file
audit reported **19 VERIFIED / 102 files**, up from fourteen.

The five newly verified files, each independently checked by the unmodified
retail byte referee and `research/web/test_zlib_leaf_complete.py`, are:

| Source TU | Exact game routines | Exact game bytes | Retail padding |
|---|---:|---:|---:|
| `src/zlib/adler32.c` | 1 | 297 | 7 |
| `src/zlib/compress.c` | 2 | 169 | 7 |
| `src/zlib/inffast.c` | 1 | 917 | 0 |
| `src/zlib/infutil.c` | 1 | 310 | 0 |
| `src/zlib/uncompr.c` | 1 | 139 | 0 |
| **Total** | **6** | **1,832** | **14** |

The source was already checked into the repository, and the five-file proof
was staged on the branch before this investigation. This checkpoint
**certifies existing source**, rather than claiming six newly written
routines or 1,832 newly recovered game bytes. The game coverage meter does
not increase. The branch's `ledger/files.tsv` was updated to preserve the
five newly proven statuses and the honest `PARTIAL` status of FindTexture.

The earlier overall workflow failure was from the separate generic
`web-trial` testing unfinished xmodel_utils (93% at 0x004acb70), even
though the authoritative `gate` passed. Removed only the generic
`research/web/target.tsv` selector, preserving its xmodel draft and
requests for later experiments. `web-trial` now selects the original
FindTexture request, so any subsequent run proves that isolated dialog
comparison rather than an unrelated unfinished file. Neither threshold
nor comparison mask has been changed.

The FindTexture complete-file audit is intentionally not in the VERIFIED
set: the external `FindReplaceTextures` target at 0x00473940 remains
unimplemented/unbound in the current link. Its diagnostic test is retained
for review and the fifteen matching game bodies remain in the ledger.
Whole-image placement, hash equality, and GUI boot all remain pending.
