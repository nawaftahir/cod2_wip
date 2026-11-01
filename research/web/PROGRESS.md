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
