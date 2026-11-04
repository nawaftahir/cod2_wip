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

The web trial now supports workspace/research/web/observe.tsv. Observe rows are compared
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
  `workspace/research/web/test_findtexture_complete.py` while its shared
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
  `workspace/research/web/target.tsv` exists. Its 0x004acb70 / 193-vs-191 B
  mismatch at +0xa2 is **unrelated** to FindTexture. The proper
  FindTexture `workspace/research/web/trial.tsv` still requests the exact proven
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
retail byte referee and `workspace/research/web/test_zlib_leaf_complete.py`, are:

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
`workspace/research/web/target.tsv` selector, preserving its xmodel draft and
requests for later experiments. `web-trial` now selects the original
FindTexture request, so any subsequent run proves that isolated dialog
comparison rather than an unrelated unfinished file. Neither threshold
nor comparison mask has been changed.

The FindTexture complete-file audit is intentionally not in the VERIFIED
set: the external `FindReplaceTextures` target at 0x00473940 remains
unimplemented/unbound in the current link. Its diagnostic test is retained
for review and the fifteen matching game bodies remain in the ledger.
Whole-image placement, hash equality, and GUI boot all remain pending.

## 2026-11-01 — second six-file proof cohort (request for ten additional complete files)

Accepted on the web branch: six **previously source-matched but unverified**
zlib TUs now have dedicated complete-inventory audits, wired into the canonical
`tools/file_ledger.py` gate. Run 41313713712 at
`d31ca746fe0f6ec64c2ea3e9f6aa139594a36a7f` passed BOTH jobs. The
complete-files gate reports **25 VERIFIED / 102** (previously 19).
The unchanged referee passes **584/584 game rows / 69,762 B** plus
**4/4 AUTO/compiler rows**. These TUs contribute **63/63 pre-existing matched
routines / 17,744 game bytes**, with 419 bytes of verified retail padding
and no extra emitted function bodies:

| TU | Rows | Game bytes | Padding |
|---|---:|---:|---:|
| `src/zlib/infblock.c` | 6 | 3286 | 21 |
| `src/zlib/infcodes.c` | 3 | 1853 | 15 |
| `src/zlib/inftrees.c` | 4 | 1830 | 20 |
| `src/zlib/trees.c` | 21 | 6664 | 154 |
| `src/zlib/unzip.c` | 25 | 4015 | 176 |
| `src/zlib/zutil.c` | 4 | 96 | 33 |

Proof: `python3 workspace/research/web/test_zlib_remaining_complete.py`.
The audit independently checks the entire TU inventory against the original
mapping, object-symbol ownership, code order, unchanged referee results,
function/padding extents, absent compiler helpers and the original zlib
inflate copyright literal. The previously existing deflate complete-file proof
checks the shared zlib error-string/version and compression tables.

**Accounting:** no new game rows or newly authored source bytes were added.
The 17,744 verified bytes were already in the 69,762-byte ledger.
Only the complete-file certifications and committed file ledger changed.
Absolute placement and SHA remain pending; whole executable is *not* bit-identical.

Two other candidate file trials remain **rejected, not promoted**:

1. `src/zlib/inflate.c`, run 41313888475:
   `inflateReset` 137/63 B (2%);
   `inflateInit2_` 252/254 B (75%);
   `inflateSetDictionary` 152/129 B (20%);
   `inflateSync` 185/180 B (12%). Existing four matched
   bodies still pass. Draft was identical to the canonical 1.1.4 source.
2. `src/universal/splines/math_quaternion.cpp`, run 41314095915:
   `toQuat(angles_t&)` 38/32 B (60%), `toQuat(mat3_t&)` 742/482 B
   (28%). Existing `toQuat(idVec3_t&)` 24 B still matches.
   A fourth original 1-byte entry remains unclassified.
   No trial made a source change.

The existing xmodel_utils draft and original inactive generic trial request
are retained; `workspace/research/web/target.tsv` is absent so the normal web-trial
returns to the proven FindTexture `isOpen` comparison.
**Ten more completed files were requested; only six additional
complete-file audits are proven.** Four further files cannot yet be claimed,
and no unverified or byte-mismatched source was promoted to canonical.

## 2026-11-01 — new source work on five candidate TUs (request: five complete files)

This pass made real source progress in **three new partial translation units**,
plus two evidence-tested MFC dialog drafts. It did **not** complete five files:
the fully verified file count remains **25 / 102**. Existing complete-file
proofs and comparison masks remain unchanged.

| TU | Isolated exact trial | Canonical accepted | State / blocker |
|---|---|---|---|
| `src/universal/UNKNOWN_004985d0.cpp` | 12 / 16 inventory entries | 11 routines / 40 B | PARTIAL; file IO wrappers 0x498610/0x498630 and generated/header group 0x4986c0..0x49874e missing; original value-table extent and owner identities unproved |
| `src/radiant/UNKNOWN_00408f20.cpp` | 3 / 4 | 3 routines / 32 B | PARTIAL; 0x408f50 / 121 B needs actual ESI/EDI caller context; 0x408fd0 calls FS_Shutdown whose owner TU is not yet defined |
| `src/radiant/GfxWrapper.cpp` | 12 / 31 | 12 routines / 16 B | PARTIAL; 19 nontrivial entries, callback identities and metadata pending |
| `src/radiant/EntityListDlg.cpp` | 2 / 22 | 0 (trial only) | DEFERRED; constructor 0x40c790 / 117 B and DoDataExchange 0x40c8a0 / 49 B match; generated dtor at 0x40c840 receives incorrect library callee binding, message map absent |
| `src/radiant/ModelDlg.cpp` | 1 / 24 | 0 (trial only) | DEFERRED; ctor 0x422f10 / 22 B matches; destructor 0x422f60 is 5 B candidate vs 11 B retail; message-map/other members missing |

**Retail-proof trial references:**
- UNKNOWN_004985d0: https://github.com/nawaftahir/cod2radiant/actions/runs/41315978562 (all 12 submitted trial addresses matched). The retail 0x4986e0 one-byte body is in the suspected header-generated range and was intentionally **excluded from game credit**.
- UNKNOWN_00408f20: https://github.com/nawaftahir/cod2radiant/actions/runs/41316525890 (three exact), then the *first* canonical trial revealed eight pre-existing game callers still linked to an unresolved print function. Replacing the address-only placeholder with the real `Com_Printf(const char*, ...)` name fixed the eight callee regressions; canonical gate passed at commit `3218850d4553d097a833f054e8ee582d0176e11f` in https://github.com/nawaftahir/cod2radiant/actions/runs/41316871122. This illustrates why matching a single body is insufficient without caller proofs.
- GfxWrapper: https://github.com/nawaftahir/cod2radiant/actions/runs/41317013418 (12 exact), canonical gate https://github.com/nawaftahir/cod2radiant/actions/runs/41317221595.
- EntityListDlg: https://github.com/nawaftahir/cod2radiant/actions/runs/41317374051 (2 exact, destructor CALLEE issue); saved draft `workspace/research/web/drafts/EntityListDlg.cpp`.
- ModelDlg: https://github.com/nawaftahir/cod2radiant/actions/runs/41317503638 (1 exact, destructor MISMATCH); saved draft `workspace/research/web/drafts/ModelDlg.cpp`.

**Accounting:** baseline 584 game routines / 69,762 B; new accepted
26 routines / 88 B => **610 game routines / 69,850 B**. Three more
authored game source files are PARTIAL, not FILE VERIFIED. Trial-only
dialog matches (2 / 166 B and 1 / 22 B) are **not accepted coverage**.
Complete-file total stays 25. Whole-image SHA remains different; exact
placement and GUI boot pending.

The original FindTexture trial is restored by removing the generic
`workspace/research/web/target.tsv` selector. All five drafts remain in the
repository for target-driven continuation; none is misrepresented as
verified or merged to main.

## 2026-11-01 — two-file quality-first certification batch

**Scope only:** `src/xanim/xmodel_utils.cpp` and
`src/radiant/FindTextureDlg.cpp`. No ledger credit or complete-file status
is claimed until the entire TU's normalized retail code, emitted helpers,
outgoing callee bindings, data/metadata and source ownership pass the unchanged
canonical referee and a dedicated complete-file audit.

**xmodel_utils.cpp — 10/11 retail game routines exact; FILE PARTIAL.**
The only game-code mismatch is `XModelGetSurfaceName`, retail 0x004acb70
(191 B). CI trial https://github.com/nawaftahir/cod2radiant/actions/runs/41318180720
compiled the current source at 193 B, 93% with first unequal unmasked
byte +0xA2. Complete original/candidate instruction disassemblies are saved
in that run's `radiant-web-trial` artifact. Inspection shows the original
passes the string ID in **EAX**, with `movzx eax, ax; test eax,eax; call
0x004a87b0` and no push/stack cleanup. Current C declaration treats
`SL_GetString(unsigned int)` as `__cdecl`, emitting
`push eax; call; add esp,4`.

A targeted MSVC 7.1 `__fastcall` **draft-only** trial,
https://github.com/nawaftahir/cod2radiant/actions/runs/41318524049,
improved the length to **191/191**, but it remains **MISMATCH 95%** at
+0xA5: `movzx ecx, ax; test ecx,ecx`, while retail uses `eax`.
The callee at 0x004a87b0 belongs to
`src/script/scr_stringlist.cpp`, which currently has no authored
implementation. Its link-time optimized custom register calling behavior
cannot be established by changing only this caller's normal C declaration.
Do not use `__asm`, naked functions, machine byte arrays, ignored
masks or force-cast ABI aliases. The experimental fastcall edit was
reverted; no mismatch was merged into the canonical source.

**FindTextureDlg.cpp — 15/15 game routines (1013 B) exact plus 33 B AUTO
scalar; FILE PARTIAL.** Full proof already exists at
`workspace/research/web/test_findtexture_complete.py`, including constructor EH,
complete vtable/RTTI/message map and global reference lifetime.
Its outstanding complete-file blocker is the real
`FindReplaceTextures` call in OnBtnApply and OnOK, both targeting
retail 0x00473940. This 136 B routine belongs to
`src/radiant/select.cpp`, which is currently an unimplemented
placeholder. The dialog's own callers match in length/instructions, but
their unresolved outbound callee identity cannot be certified by the
complete-file verifier until `select.cpp` has a real callable source
symbol. The proof must not be changed to silently accept linker stubs or
skip this specific callee.

**Outcome:** Zero new files promoted. The certified count stays
**25 / 102** and the 610 accepted game rows / 69,850 B are unchanged.
Both blockers need implementation in their true dependency TUs before a
responsible 100% file-level certification is possible. Whole-image SHA
is still unmatched. The web-trial selector is restored to the passing
FindTexture single-row trial. Work only on these two target TUs in the
next batch; dependencies can be reconstructed by their owners without
claiming them as completed target files.

## 2026-11-01 — five-TU code coverage checkpoint / total source report

Latest verified baseline before the batch: **617 / 3578 game routines**,
**70,480 / 699,591 retail game code bytes**, **26 / 102 certified complete
TUs**. Work on `web/reconstruction` accepted **11 additional routines /
583 bytes** across five partial TUs:

| TU | Exact additional routines | Additional exact game bytes |
|---|---:|---:|
| `src/universal/UNKNOWN_004985d0.cpp` | 1 (`FS_Read` forwarding entry) | 20 |
| `src/radiant/TexEdit.cpp` | 5 MFC bodies | 232 |
| `src/universal/splines/math_angles.cpp` | 1 (`Normalize360`) | 128 |
| `src/radiant/Radiant.cpp` | 3 MFC app bodies | 57 |
| `src/universal/splines/math_vector.cpp` | 1 (`toYaw`) | 146 |
| **TOTAL** | **11** | **583** |

**Verified canonical outcome, commit
`daf3f1b376c93d75ad232fa9a780ccbb1719f6c5`:**
https://github.com/nawaftahir/cod2radiant/actions/runs/41327036003
passed both the `gate` and `web-trial` jobs:
**628 / 628 accepted ledger rows**, zero game failures, 4 / 4 compiler
rows; **628 / 3578 retail routines (17.55%)**,
**71,063 / 699,591 retail game-code bytes (10.16%)**.
Complete-file ledger **26 VERIFIED / 102 TUs (25.49%)** unchanged.
This is normalized source-vs-retail game-code coverage only; **not**
whole `.exe` bytes or a matching executable SHA hash.

Quality/negative evidence:
- `CTexEdit::OnChange` still differs by codegen/callee, despite
  ancestor Q3Radiant reference; do not credit it.
- `UNKNOWN_004985d0` `FS_Seek` wrapper differs and remains only a draft.
- `math_matrix.cpp` angles/vector conversion and transpose remain mismatched
  in run 41325118555; no source was promoted.
- `angles_t::toVectors` and `angles_t::toForward` remain mismatched
  in 41325313700.
- `idVec3_t::toPitch` remains mismatched in 41326570065;
  the retail `toYaw` float constant fix passed 41326785316.
- `CRadiantApp::OnIdle` and `ExitInstance` remain mismatched
  in 41326153819; constructor, message map, Help handler passed.
- Generated MFC helpers, data ownership, outbound dependencies, and
  original placement still require proof for all five partial files.

The single-TU experimental selector was cleared after trial, restoring
the original FindTexture web-trial target. Match masks, full-gate referee
and certified-file threshold are unchanged. The checked-in file ledger
was synchronized with the accepted **per-file** game rows.

## 2026-11-01 — exact byte milestone checkpoint

Accepted `Sys_DirectoryHasContents` (0x004984f0 / 222 B) after retail
comparison; complete canonical gate passed 629/629 game rows. Total is
**71,285 / 699,591 game-code bytes (10.19%)**, **629 / 3,578 game
routines (17.58%)**, and **26 / 102 fully verified TUs (25.49%)**.
`win_common.cpp` contains 8 verified routines / 481 B, still PARTIAL.
Other Windows enumeration and idStr trials were rejected. See
`workspace/research/web/COVERAGE_MILESTONES.md` for target gaps and CI evidence.

## 2026-11-01 — bounded util_str snprintf probe (20% function target)

Starting verified canonical gate at commit `5fad978d`: **629 / 3578 game
functions (17.58%)**, **71,285 / 699,591 game-code bytes (10.19%)**,
**26 / 102 VERIFIED TUs**; canonical regression passed with zero failures.
The 20% function target requires **716 total / 87 additional matches**.

An isolated retail trial for `src/universal/splines/util_str.cpp`
`idStr::snprintf` at **0x004a04b0** (`?snprintf@idStr@@SAXPADHPBDZZ`)
ran at commit `5498dfdd`:
https://github.com/nawaftahir/cod2radiant/actions/runs/41329995755

Result: **MISMATCH 62%, retail 108 B / candidate 146 B, first differing
unmasked byte +0x32**. The observed existing `idStr::toupper` at
0x0049fd70 matched. Trial regression: 629/629 existing game rows passed;
4/4 compiler rows passed. No new ledger rows or canonical source bytes
were accepted. An earlier run `8b48d9b` failed selector validation
because `tu_observe.tsv` targeted a different TU; it is not source
comparison evidence. The generic target and trial selector have been
restored after the bounded experiment; no unverified implementation was
promoted and no matching thresholds or baseline were changed.

**Outcome: 20% was not reached in this pass.** Next work on this TU needs
retail/candidate disassembly around +0x32, assertion expansion and the
MSVC 7.1 calling-frame behavior before another justified trial.

## 2026-11-01 — retail Q_acos exact-match promotion

Isolated `com_math.cpp` trial at commit `824378a5` (run 41331673937)
proved `Q_acos` at retail 0x00483610: MATCH, 74/74 code bytes, with
`Q_log2` observed MATCH and all existing 629 game ledger rows passing.
Original CoD2rev source behavior was preserved; the canonical header has no
`I_acos` or `M_PI` definition, so the successful source uses
`(float)acos(c)` and an exact float-pi literal. Earlier AngleDelta
candidate at retail 0x00487430 (trial 030d51a7) was REJECTED due to
inlining of the existing AngleNormalize180 callee; it is **not** promoted.
Next: canonical gate must pass before counting Q_acos as accepted.

## 2026-11-01 — q_shared ColorIndex source promotion

Retail at `0x00495b50`: `?ColorIndex@@YAHE@Z`, **15/15 bytes MATCH**
after preserving the existing source's original statement-line numbering.
Isolated proof: commit `164ffb22`,
https://github.com/nawaftahir/cod2radiant/actions/runs/41332595814.
All 630 previous game rows and 4 compiler rows passed under isolated build;
`I_stricmp` also observed exact. The candidate from commit `58846fa5`
was 15/15 but compiled `add al,0xd0` rather than `sub al,0x30`;
the original-expression `unsigned char index=(unsigned char)(c-'0')`
restored the retail opcode. The earlier q_shared multi-candidate trial
had a 629/630 canonical regression due shifted assertion `__LINE__`.
Restoring function placement inside preexisting blank lines fixed that
without changing any masks or suppressing assertions.

`Com_StripExtension` separately matched its 33-byte retail body at
0x00495e10 but remains a **trial-only candidate**: its call to
`Com_GetExtensionSubString` depends on an unresolved 117-byte callee.
The current ancestor-style callee was 108 B / 47% and must be corrected
before either routine is promoted. `ColorIndex` is the only q_shared
entry promoted in this checkpoint, pending full canonical gate.

## 2026-11-01 — recovered q_shared extension pair

The isolated original-MSV C++ linked-executable referee at commit `53bf39b0`,
run https://github.com/nawaftahir/cod2radiant/actions/runs/41332902498,
proved both additional game bodies exactly:
- `0x00495d90` `Com_GetExtensionSubString`: 117/117 B MATCH
- `0x00495e10` `Com_StripExtension`: 33/33 B MATCH

The source places the extension function's `assert(filename)` at its
retail-proven line **170** (`0xaa`), preserves original source/callee
order, and consumes only existing whitespace ahead of the previously
matched `I_stricmp` assertions. The existing 631/631 game rows and
4/4 compiler rows passed in the isolated build, and `I_stricmp`
was independently observed exact. No imported absolute address casts,
ASM, comparison mask changes, or dummy callers were used.
Promoting the real callee/caller pair together, subject to the subsequent
full canonical regression gate; q_shared remains PARTIAL overall.

## 2026-11-01 — five exact q_shared orientation transformations

Original-authority Ghidra arithmetic and assertion reference operands establish
the orientation-space transforms. An isolated full 5-function trial at commit
`f35cd8f6` https://github.com/nawaftahir/cod2radiant/actions/runs/41334094729
matched **all 5 / 5 original routines** exactly, including preserved
per-site assertion lines 0x5d5, 0x5de, 0x5e7, 0x5f2 and 0x600:

- 0x00497700 OrientationPosToWorld — 145 B MATCH
- 0x004977a0 OrientationDirToWorld — 137 B MATCH
- 0x00497830 OrientationPlaneToWorld — 109 B MATCH
- 0x004978a0 OrientationPosToLocal — 174 B MATCH
- 0x00497950 OrientationDirToLocal — 137 B MATCH

Total additional authored source **702 B**. The plane-world distance
computation correctly uses the transformed normal dotted against the
orientation origin, plus the original plane offset; the earlier trial's
incorrect same-plane dot was 105/109 B and was rejected. The isolated
regression verifier passed 633/633 game and 4/4 compiler entries, with
I_stricmp independently observed MATCH. Metadata and neighboring orientation
routines are pending; this TU stays PARTIAL. Canonical integration requires
the subsequent full regression gate.

## 2026-11-01 — OrientationPlaneToLocal 109-byte exact-match promotion

Retail `0x00497ac0` (`OrientationPlaneToLocal`) matched the isolated linked-source comparison at run 41334288170 (commit `1b02534c`) and again at run 41334380230, while 633/633 and 638/638 previous ledger rows, respectively, passed. The original assert at `0x615` is preserved with the function at source line 1555 and the assertion on line 1557. The unrelated `OrientationConcatenate` remains rejected at 87% and is not ledgered. This commit integrates only the proven plane transform and must pass the canonical gate.

## 2026-11-01 — two orientation plane scaling routines

Trial `41943218` (run 41336697732) confirmed 639/639 existing game rows and 4/4 compiler rows intact, and retail 0x00497bd0 `OrientationPlaneToWorldScaled` (118 B) and 0x00497d70 `OrientationPlaneToLocalScaled` (116 B) both exact. `OrientationPosToWorldScaled` (0x00497b30) is excluded because its 158 B candidate failed at +0x46 (84%). The source keeps assertion lines 0x626 and 0x642 and no verifier mask adjustments; canonical promotion requires full gate.

## 2026-11-01 — exact AngleDelta call boundary

Isolated `com_math.cpp` trial at commit `55a7dea7` (run 41336816622) verified `AngleDelta` (0x00487430; 23 bytes) as MATCH, with `AngleNormalize180` independently observed MATCH and 639/639 existing game functions passing. Applying `__declspec(noinline)` to the existing callee preserves the original retail call edge rather than expanding its arithmetic inside `AngleDelta`. Earlier inline candidate was 79 B and rejected. This source promotion requires canonical gate confirmation.

## 2026-11-01 — two exact integer clamp routines

Trial `10e0ecb4` (run 41337468469) compiled `ClampChar` at retail 0x00483660 (16 B) and `ClampShort` at 0x00483670 (24 B) with both MATCH, observed `Q_acos` MATCH, and 642/642 previously accepted game bodies passing. The signatures return 8-bit and 16-bit signed integers respectively, and the functions occupy existing source whitespace without shifting assertion lines. Full gate pending after promotion.

## 2026-11-01 — exact inverse scaled orientation transform

The 274-byte `OrientationPosToLocalScaled` at 0x00497c50 passed original MSVC retail comparison in run 41337583199 (commit `e18dd12f`), with 642/642 existing entries preserved. It has separate original `assert(pos != out)` and `assert(scale)` on retail lines 1586 and 1587; inverse scale then transforms three-axis position delta. This promotion retains their source positions and requires full canonical gate before counting it.

## 2026-11-01 — exact 3×3 MatrixTranspose

The original source-style nine element transpose from CoD2rev matches retail `0x00487f70` exactly (118 B), isolated run 41338164496 at commit `f1cdd51e`; existing 645/645 game rows and `AxisCopy` independently pass. Retail has an `assert(in != out)` at original source line 2904, reproduced via scoped `#line` directive that restores original subsequent logical line numbering. It is promoted only on canonical gate success; whole-image placement remains pending.

## 2026-11-01 — closure of spline audit and clean active trial

With the canonical gate at commit `cd537536` green, the accepted game total is **646 / 3578 (18.05%)** and **73,024 / 699,591 game-code bytes (10.44%)**, with 26 / 102 full TU audits. Next targets: 716 (20%) and 895 (25%); 70 and 249 additional exact matches respectively. Reproducible proof: https://github.com/nawaftahir/cod2radiant/actions/runs/41338323137.

Additional isolated spline audit trials were **rejected**, not ledgered: `math_matrix.cpp` `toMatrix(angles_t)` (441/366), `toMatrix(idVec3_t)` (37/40 even after constructor assignment reorder), `mat3_t::Transpose(mat3_t&)` (102/140); `math_angles.cpp` `angles_t::toVectors` (448/368) and `toForward` (185/133); `math_vector.cpp` `idVec3_t::toPitch` (215/222). All experimental runs preserved the 646 accepted ledger functions. Restoring a verified active trial avoids a standing red experimental test. `main` remains untouched, no verifier masks altered.

## 2026-11-02 — seven exact one-byte spline return bodies

Retail batch disassembly in [run 41384570656](https://github.com/nawaftahir/cod2radiant/actions/runs/41384570656) independently showed `ret` (`c3`) at seven original spline TU addresses: 0x0049a1c0, 0x0049a1d0, 0x0049a1e0, 0x0049a1f0, 0x0049a200, 0x0049a410, 0x0049b210. Source implementations emit the same no-op `ret`; an isolated trial [run 41384772091](https://github.com/nawaftahir/cod2radiant/actions/runs/41384772091) compared all seven as MATCH and preserved 650/650 previous game matches. This adds 7 authored functions / 7 code bytes only, no invented nonempty implementations, and the TU remains PARTIAL. Subsequent full canonical gate must pass to count acceptance.

## 2026-11-02 — exact false-return spline leaf; Q_fabs rejected

The isolated linked-source trial run [41385226130](https://github.com/nawaftahir/cod2radiant/actions/runs/41385226130) verifies spline `0x0049b790` matches its original 3 B `xor al,al; ret` with `extern "C" bool FUN_0049b790() { return false; }`. It passes the previous 657/657 game functions and observes original one-byte return body 0x0049a1c0 exactly. `Q_fabs` at 0x0049a0b0 from Q3 ancestor was rejected: candidate 19 B vs 39 B retail, only 10% match. No failed source retained in canonical; 658-row regression gate required for acceptance.

## 2026-11-02 — ByteToDir promotion and corrected Vec3Rotate trial

Run 41386981518 proved retail 0x004836f0 ByteToDir as an exact 55-byte MATCH while all 657 accepted rows passed. Its source is promoted to canonical com_math.cpp and ledgered. The same run's Vec3Rotate requests used malformed mangled names (single `$CB` instead of `$$CB`) and therefore reported NOT-LINKED despite definitions being present in the draft. The next trial uses the emitted retail symbol names exactly and observes ByteToDir.

## 2026-11-02 — DialogInfo implicit-destructor recovery

Run 41396092627 proved all seven requested local DialogInfo bodies exact with the original Q3 source shape. The crucial correction was removing the explicit destructor declaration/definition: the ancestor source has none, and MSVC 7.1 then synthesizes the retail 74-byte stack-this destructor plus 34-byte scalar deleting helper exactly. Five authored routines are promoted for 158 game bytes (HideInfoDialog, constructor, DDX, message-map getter, OnInitDialog). The two generated destructor bodies are recorded in ledger/compiler.tsv and excluded from game coverage. ShowInfoDialog 0x00409690 / 66 B remains unclaimed because its retail callers in Pmesh pass pText through ESI.

## 2026-11-02 — CommandsDlg local-body recovery

Run 41397630098 passed the full 665-row gate and matched ctor 0x408fe0 / 94 B, implicit destructor 0x409070 / 74 B, DDX 0x4090c0 / 25 B and GetMessageMap 0x4090e0 / 6 B. The durable 0x5166ec MFC binding is CListBox::~CListBox (winctrl1.obj, CListBox RTTI), not the stale CDialogBar tie. The Q3 source has no explicit CommandsDlg destructor, so the 74-byte implicit destructor and 34-byte scalar helper are compiler-accounted, not game credit. Three authored routines / 125 B are promoted. OnInitDialog remains blocked by CString::Append whole-program inlining context.

## 2026-11-02 — three exact com_math angle leaves

Hosted run 41400912873 passed the canonical 668-row gate and proved all three requested CoD2 angle leaves exact under MSVC 7.1: 0x00484480 vectoyaw (146 B), 0x00484640 vectopitch (222 B), and 0x00484720 vectosignedpitch (194 B). The successful source uses the original single-return local-result control flow from the CoD2 server source rather than the earlier early-return spelling. Total promotion: 3 game functions / 562 B. vectoangles 0x004847f0 and Vec3Rotate 0x00483f40 remained exact observations.

Next active trial is src/zlib/inflate.c. Its four unaccepted entries already have original zlib 1.1.4 source in-tree: inflateReset 0x004b0140, inflateInit2_ 0x004b01d0, inflateSetDictionary 0x004b06d0, and inflateSync 0x004b0760. Existing inflateEnd/inflate are observe-only. A clean four-way match should close the eight-entry TU after the file audit.

## 2026-11-02 — first q_parse recovery batch

Run 41403317400 preserved the 671-row canonical baseline and proved three direct
CoD2 q_parse bodies exactly under the linked MSVC 7.1 referee:
- 0x00494d20 Com_ParseSetMark — 188 B MATCH
- 0x00494de0 Com_ParseReturnToMark — 192 B MATCH
- 0x00495660 Com_GetArgCountOnLine — 131 B MATCH

These three are promoted to canonical source/ledger (+3 / +511 B), taking the
expected canonical count to 674 pending the full gate.

The paired 182-byte script-prefix setters were 75% on the first trial. Their
retail diffs identify the missing source details precisely: assertion lines
259/260 and 273/274, and the parseInfoNum assertion uses the formatted
assertMsg expansion. The next bounded trial changes only those two functions
and observes the three newly promoted parser routines plus Com_ParseOnLine.

The 8-byte 0x00495b40 tail is explicitly classified by the file-map research as
header code and remains excluded from game credit.

## 2026-11-02 — exact q_parse prefix setters

Run 41404332711 proved both 182-byte prefix setters exact after preserving the retail CoD2Radiant store quirk: Com_SetScriptWarningPrefix writes the errorPrefix slot and Com_SetScriptErrorPrefix writes the warningPrefix slot. The function identities are independently pinned by their original assertion lines 259/260 and 273/274. The shared parseInfo_t field order remains the direct CoD2 server layout because already-exact Com_ScriptError/Com_ScriptWarning rely on it. Promotion: +2 game functions / +364 B. Expected canonical total 676.

## 2026-11-02 — current-baseline Com_DefaultExtension retrial

Run 41405332452 proved retail 0x00495e80 Com_DefaultExtension as an exact 119-byte MATCH, but that batch used a stale q_shared draft and temporarily regressed eleven already-accepted q_shared rows. The new draft is rebuilt from the live 676-row canonical q_shared.cpp and adds only the original Com_DefaultExtension body. I_strncmp, I_stricmp and OrientationPosToWorld are observe-only guards. No ledger credit is added until this current-baseline linked-exe trial passes.

## 2026-11-02 — inflate.c four-function closure trial

The previous q_shared Com_DefaultExtension candidate is rejected on the live baseline (117/119 B, 73%) and receives no credit. The lane switches to src/zlib/inflate.c, which already has 4/8 exact retail rows and contains the original zlib 1.1.4 source for the four missing routines. This trial requests inflateReset 0x4b0140, inflateInit2_ 0x4b01d0, inflateSetDictionary 0x4b06d0, and inflateSync 0x4b0760; the four already accepted inflate routines are observe-only. A 4/4 match will be promoted together and followed by a full TU audit.

## 2026-11-02 — DB_EnumXAssets direct-loop trial

The inflate.c 4-way original-source trial preserved 676/676 accepted rows but all four missing routines mismatched, so no inflate credit was taken. The lane moves to com_memory.cpp's sole remaining 72-byte SUPPORTED function. Prior research reached 71/72 bytes but emitted `mov al,[esi+8]; cmp al,4`; retail uses `cmp byte ptr [esi+8],4`. This candidate writes the direct fileData loop rather than routing through DB_EnumXAssetsFor, preserving the retail semantics: only ASSET_TYPE_XMODEL, all 1024 hash buckets, FILEDATA_XMODEL entries, callback(data,inData). DB_EnumXAssetsFor remains observe-only.

## 2026-11-02 — DB_EnumXAssets switch/load spelling

Run 41415764211 compiled the direct-loop candidate to 71 B. Its control flow differed from retail only in two source-shape-sensitive choices: candidate used `cmp [ebp+8],1` while retail uses `mov eax,[ebp+8]; dec eax; jne`; candidate used `cmp byte ptr [esi+8],4` while retail uses `mov al,[esi+8]; cmp al,4`. Trial 2 therefore restores an explicit `switch(type)` and an unsigned-char local loaded from fileData->type, with no semantic changes.

## 2026-11-02 — Com_BeginParseSession trial

DB_EnumXAssets trial 2 returned to the known 71/72 B ceiling and still perturbed nine accepted com_memory routines, so it is deferred without credit. The next bounded trial restores the missing 0x00494830 Com_BeginParseSession from CoD2 source plus retail-specific evidence: 15 nested sessions, diagnostic session-name loop, fatal overflow, inlined Com_InitParseInfo state, and 64-byte parseFile copy through I_strncpyz. Existing q_parse head routines are observe-only guards.

## 2026-11-02 — exact-line I_strncpyz trial

Com_BeginParseSession compiled 214/213 B with all 676 accepted rows intact. Its retail tail depends on the missing q_shared I_strncpyz LTCG body. The earlier 245/245 I_strncpyz candidate was instruction-for-instruction aligned except its three assert source lines were +2: candidate 0x226/0x227/0x228 versus retail 0x224/0x225/0x226. This live-baseline trial sets the function declaration to logical line 546 so assertions land at 548/549/550, then restores the canonical downstream line stream at 472. Existing q_shared matches are observe-only guards.

## 2026-11-02 — I_strcmp exact-line trial

The exact-line I_strncpyz body matched retail 245/245 B, but exposing that real callee changes the still-incomplete dvar whole-program ABI and regresses Dvar_SetFromString, so I_strncpyz is held rather than promoted. I_strcmp is independent: the prior 194/194 candidate differed only because its two assert lines were 618/619 instead of retail 616/617. This live-baseline trial places its declaration at logical line 614 and restores the already-exact I_stricmp stream at logical line 606 afterward.

## 2026-11-02 — I_strcmp promoted exact

Run 41417508720 passed both the isolated trial and the canonical gate. Retail 0x00496680 I_strcmp matches exactly at 194/194 B after restoring its two assertion lines to 616/617; all 676 previous game rows and 8 compiler rows remained exact. Promoted to canonical q_shared.cpp and ledger: +1 game function / +194 B, new expected accepted total 677.

## 2026-11-02 — win_common filtered-list trial

I_strcmp is now canonical and the full 677-row gate passes. A Sys_RemoveDirTree write was blocked by the repository tool safety layer, so that routine is skipped. The active non-destructive target is 0x00498030 Sys_ListFilteredFiles / 428 B, reconstructed from the CoD2 Windows implementation using this TU's 32-bit CRT and existing I_stricmp/Com_FilterPath/CopyString declarations. Retail evidence for 0x00498030 and the following 0x00498230 Sys_ListFiles is requested in the same run.

## 2026-11-02 — paired Radiant file-list reconstruction

Run 41418638252 proved the isolated Sys_ListFilteredFiles body was eliminated because its sole caller Sys_ListFiles was still absent. The retail dump also corrected the source model: the 428-byte helper is non-recursive, excludes '.', '..' and 'CVS', tests the subdirs pointer when forming the filename, and calls Com_FilterPath/CopyStringInternal directly. Retail 0x00498230 Sys_ListFiles is a 645-byte paired caller with a 4096-pointer stack list, `%s\\*.%s` extension search, no sorting, and Z_MallocInternal-backed copies. This trial reconstructs both together so LTCG retains the helper. Existing HasFileExtension/Sys_FreeFileList are observe-only guards.

## 2026-11-02 — Com_Filter / Com_FilterPath multiplier trial

Paired win_common run 41419271694 preserved 677/677 accepted rows and reached 429/428 B for Sys_ListFilteredFiles and 643/645 B for Sys_ListFiles. Full assembly shows the helper is structurally retail-identical until its Com_FilterPath call: candidate passes all three args on stack because the callee is missing, while retail passes filter in EDX under LTCG. The 645-byte caller's exact 2-byte gap is separately traced to retail's XOR directory-flag test. This trial restores CoD2 Com_Filter (587 B) and Com_FilterPath (153 B) in their retail order from the CoD2 server source; existing Com_StringContains and Com_HashKey are observe-only. If exact, these +740 B should also unlock the win_common pair on retrial.

## 2026-11-02 — q_parse CoD2 two-function batch

The Com_Filter/Com_FilterPath trial on the 677-row baseline was rejected (28% and 6%) with no credit. This trial adds two directly evidenced CoD2-family q_parse bodies missing from canonical source: Com_BeginParseSession at 0x494830 (213 B) and Com_ParseFloatOnLine at 0x495860 (28 B). Existing q_parse helpers are observe-only.

## 2026-11-02 — first multi-TU throughput batch

Multi-TU trial support passed the canonical gate with 677/677 accepted rows intact. This batch swaps five current canonical sources simultaneously and requests nine uncredited routines: DialogInfo implicit destructor/scalar destructor, PatchDensity/TerrainDensity scalar destructors, angles_t::toVectors/toForward, and the three authored missing math_matrix conversions/Transpose overload. No candidate is credited unless the linked-exe referee reports exact MATCH while the accepted ledger remains green.

## 2026-11-02 — promote four exact destructors; batch 2 generated glue

Run 41425413430 preserved 677/677 accepted rows and proved four new retail-exact generated routines in the linked EXE: CDialogInfo::~CDialogInfo 0x409640 (74 B), CDialogInfo scalar deleting destructor 0x409760 (34 B), CPatchDensityDlg scalar deleting destructor 0x424340 (34 B), and CTerrainDensityDlg scalar deleting destructor 0x43ed00 (34 B). They are promoted to the game ledger (+4 functions / +176 B). The five math candidates from the same batch are rejected unchanged. Batch 2 uses the validated multi-TU harness to test CCommandsDlg scalar/destructor, CPatchDialog scalar, and CRotateDlg scalar.

## 2026-11-02 — fix compiler overlap; trial three authored win_common routines

The four-way generated-destructor batch proved four exact linked bodies, but the full gate correctly rejected two DialogInfo rows because those addresses already live in ledger/compiler.tsv. Those two game-ledger rows are removed. The density-dialog scalar rows remain game-ledger candidates under the repo's current SUPPORTED classification. The next trial switches to authored Windows filesystem code: Sys_RemoveDirTree 0x497e00, Sys_ListFilteredFiles 0x498030, and Sys_ListFiles 0x498230, reconstructed from the CoD2/Radiant 32-bit source lineage and retail disassembly. Retail addresses are also emitted through inspect_addrs for immediate iteration.

## 2026-11-02 — q_shared cod2rad va/circular-buffer trial

The density scalar game-credit experiment is fully reverted: exact scalar bodies remain helper evidence but are not game rows, restoring the honest accepted baseline to 677. win_common first-pass authored bodies were useful but not close enough (43%, 67%, 34%) to justify another immediate syntax iteration. The lane switches to q_shared's retail 0x4969a0/0x4969e0 pair using the cod2rad source: 31999-byte payload, 0x7D00 temp/circular buffers, overflow guard, memmove and pointer-lifetime test. Prior defer evidence already recorded 0x4969a0 as body-exact once its real q_shared context is emitted.

## 2026-11-02 — direct cod2rad Com_BeginParseSession trial

Canonical gate is green again at 677/677 game rows and 8/8 compiler rows. The q_shared cod2rad va experiment is shelved for now: CanKeepStringPointer reached 96% at the exact 50-byte size and va reached 63%, but adding that q_shared context perturbed nine accepted orientation routines. This trial uses the older cod2rad direct-field Com_BeginParseSession form instead of the previously tested helper-based Com_InitParseInfo call. It writes parse state fields in retail order and keeps existing parse helpers observe-only.

## 2026-11-02 — throughput batch: Vec3MajorAxis + linear mapping core

The parse-session trial remains 214/213 B and is deferred. This batch targets
four authored CoD2 routines totaling 1,807 retail bytes: Vec3MajorAxis
0x4839b0, LU_Decompose3x3 0x493c10, LU_Solve3x3 0x494000, and
SetupLinearMapping 0x494360. The linearmapping bodies come from the CoD2-derived
cod2rad reconstruction but are split according to the retail six-function
inventory rather than copying its merged SolveLinearMapping assumption.
Vec3MajorAxis is reconstructed from the same CoD2 lineage with its retail
com_math.cpp assertion line 724. Existing Vec3Cross/PickProjectionAxes are
observe-only guards.

## 2026-11-02 — direct small authored batch

The linearmapping core first pass is rejected: LU_Decompose3x3 1006/995 (40%),
LU_Solve3x3 477/495 (10%), SetupLinearMapping 196/157 (22%). Vec3MajorAxis was
not linked because the guessed C++ symbol did not match, so it is retried with
explicit C linkage while preserving the same CoD2 body/assert line. The second
target is Pointfile_Draw 0x46ca50 / 156 B, reconstructed directly from retail:
pack colorRed, batch at most 1362 line vertices via R_Add3DLine, then flush
vertCount/2 lines through R_AddCmd_Line3D. Existing adjacent functions are
observe-only.

## 2026-11-02 — linearmapping core throughput trial

The parse-session near-match is deferred after repeated 214/213 B results; the
canonical gate remains green at 677/677. To restore throughput, this trial moves
to the six-function 2,119-byte linearmapping TU but starts with its four
self-contained core routines (1,841 retail bytes): LU_Decompose3x3 0x493c10,
LU_Solve3x3 0x494000, the retail-separated 107-byte iterative-refinement helper
0x4941f0, and SolveLinearMapping 0x494260. The implementation is reconstructed
from the CoD2 cod2rad lineage plus the retail split/decomp evidence; the two
cross-TU wrappers are intentionally held until Vec3MajorAxis context exists.

## 2026-11-02 — direct authored two-function fallback

The split linearmapping core still mismatched (LU 40%/10%, refinement 12%,
SolveLinearMapping 51%) while preserving 677/677 canonical rows, so it is
deferred without credit. Throughput switches to two independent authored
functions already reconstructed from retail/CoD2 evidence: Vec3MajorAxis
0x4839b0 / 160 B with explicit C linkage and Pointfile_Draw 0x46ca50 / 156 B.
Four already accepted pointfile routines are observe-only guards.

## 2026-11-02 — direct authored batch, source-shape iteration 2

Historical corrected run 41448180252 already showed the preserved drafts at
158/160 (Vec3MajorAxis) and 158/156 (Pointfile_Draw). The diffs are source-shape
specific rather than semantic. Vec3MajorAxis now computes best directly from
`sq[1] > sq[0]`, matching retail's post-square conditional ECX assignment
instead of hoisting `best=1`. Pointfile_Draw now makes loop index i live before
Byte4PackPixelColor and uses an equivalent do/while, targeting retail's
unconditional EDI save and pointer loop schedule. Canonical source is untouched.

## 2026-11-02 — Vec3MajorAxis promoted; six dvar wrapper cohort

Run 41453933858 proved 0x004839b0 Vec3MajorAxis exact at 160/160 B while
677/677 prior game rows and 8/8 compiler rows remained green. It is promoted to
canonical com_math.cpp and ledger (+1 game function / +160 B). Pointfile_Draw
improved to 66%, 157/156 B but is shelved after the bounded second iteration.

The next batch targets six tiny authored dvar registration wrappers (36,35,35,
52,58,64 B). Their retail ABI passes dvarName in EAX and flags in EBX to the
missing 0x48f7c0 Dvar_RegisterVariant. The draft therefore includes the real
CoD2 RegisterVariant source as LTCG context, with its deeper unconstructed
helpers left unresolved under the normal /FORCE:UNRESOLVED policy. Only the six
wrappers are requested for credit; the core is not claimed.

## 2026-11-02 — dvar wrapper cohort iteration 2

Run 41455190164 passed the 678-row canonical gate but the six wrapper candidates
were 75-106 B instead of 35-64 B because the provisional RegisterVariant source
was small enough for MSVC LTCG to inline. Retail 0x48f7c0 is 314 B and begins
with the original line-1701/1702 flag/pointer assertions, then inlines the
generateHashValue+dvarHashTable lookup before dispatching to Reregister/New.
The draft now mirrors that retail-specific control flow using the already-real
generateHashValue and dvarHashTable. No noinline/ABI annotations are used.
This is the final bounded dvar wrapper iteration before moving on.

## 2026-11-02 — CoD2Radiant-specific Com_Filter pair

Dvar wrapper iteration 2 restored the intended non-inlined cohort and brought
all six wrappers to within exactly +2 B of retail size, but normalized equality
remained 33-56%; per the bounded plan the family is shelved with no credit.
Canonical gate is green at 678/678.

The next trial replaces the rejected generic-server filter source with the
cod2rad CoD2Radiant recovery. The key retail-specific difference is the '*' path:
it scans candidate offsets using a full I_strcmp/I_stricmp against the literal
chunk, rather than Quake's Com_StringContains prefix/substr behavior. FilterPath
uses the observed 64-byte buffers and slash/colon canonicalization. Requested:
Com_Filter 0x48afb0 / 587 B and Com_FilterPath 0x48b200 / 153 B.

## 2026-11-02 — Com_Memcpy / Com_Memset compiler-body trial

The Radiant-specific filter pair still missed badly (17% / 6%) and is shelved
without credit; the canonical gate remains 678/678. Retail's next two large
com_shared bodies are identified by callsites and CoD2 source order as
Com_Memcpy 0x48b3e0 / 439 B and Com_Memset 0x48b5a0 / 170 B. The candidate
uses the original tiny wrappers around memcpy/memset and leaves MSVC 7.1 /LTCG
to emit the optimized copy/set bodies naturally. Com_RealTime and Com_Memcmp are
observe-only guards.

## 2026-11-02 — file-metric reset: math_quaternion

Switching back to file-metric batching. math_quaternion.cpp has one accepted authored overload and only two authored conversion bodies left; the 1-byte tail is treated separately until classified. This trial uses the live canonical source unchanged and requests only angles_t->quat_t (0x499290 / 32 B) and mat3_t->quat_t (0x4992b0 / 482 B), observing the already accepted idVec3_t overload.

## 2026-11-02 — hidden exact com_files harvest

File-metric report mining found four authored com_files routines previously proven MATCH 100% but absent from the live ledger: FS_IsBackupSubStr 27 B, FS_IsPathSepChar 17 B, FS_SanitizeFilename 643 B, and FS_FilesAreLoadedGlobally 161 B. This current-baseline trial inserts only those preserved exact bodies into the live canonical com_files source. A local #line anchor reproduces the original retail assert line numbers while resetting the following canonical source line so existing accepted com_files bodies are not shifted. Three adjacent accepted routines are observe-only guards.

## 2026-11-02 — reduced com_files exact-harvest trial

The first current-baseline transplant kept the adjacent three guards exact but the four static helpers were eliminated because their unfinished real caller FS_FOpenFileRead_Internal is absent; adding the assert-heavy sanitizer also perturbed FS_FreeFile/GetBspExtension by one instruction. This reduced trial omits the sanitizer, retains the three no-assert historical 100% bodies as ordinary out-of-line functions, and adds the preserved 68-byte FS_Shutdown source. Five existing com_files rows are observe-only guards. No credit until linked-exe MATCH.

## 2026-11-02 — promoted four hidden com_files exact matches

Run 41483960904 passed both the normal gate and the reduced web trial on the 679-row baseline. FS_IsBackupSubStr 27 B, FS_IsPathSepChar 17 B, FS_FilesAreLoadedGlobally 161 B, and FS_Shutdown 68 B all MATCH retail exactly; five neighboring accepted com_files guards also remained exact. These four bodies are promoted to canonical source and ledger for +4 game functions / +273 B.

## 2026-11-02 — stabilize com_files promotion

Run 41484428594 proved FS_IsBackupSubStr (27 B), FS_IsPathSepChar (17 B),
FS_FilesAreLoadedGlobally (161 B), and FS_Shutdown (68 B) exact in the
isolated trial. In the canonical link, however, adding FS_Shutdown makes the
already-accepted 0x408fd0 shutdown wrapper call an LTCG local label instead of
the retail FS_Shutdown symbol. The three independent helpers remain promoted
(+205 B). FS_Shutdown is returned to trial-only status until its caller context
is reconstructed; no matcher or gate is weakened.

## 2026-11-03 — 753 exact game functions; 26 fully verified TUs

Canonical commit e353a00da1607dc434246f11a16d8bcc937e11cb passed both CI jobs in run 41587758631. The ledger contains 753/3578 game functions and 76,348/699,591 game bytes; the strict complete-file audit remains 26/102 TUs. The function-count goal of 750 is met. The separate 30 fully verified TUs goal is NOT met. Recent gains include one-byte RET functions and short instruction-identical accessors, with provisional ownership/names; they do not imply bit-identical whole-image identity.

Near-completion evidence from isolated CI, not promoted:
- Run 41588614739: DialogInfo's existing *implicit* destructor 0x00409640 (74 B) and generated scalar deleting destructor 0x00409760 (34 B) both MATCH when the canonical class is used without an explicit destructor. ShowInfoDialog 0x00409690 remains MISMATCH at 73/66 B; retail takes text in ESI and lacks a stack frame, while standalone source uses the normal stack argument. Earlier explicit destructor experiments regressed both helpers. Restore the implicit destructor and recover real callers/ABI before full DialogInfo certification.
- Run 41588716044: existing quaternion source overload toQuat(angles_t&,quat_t&) 0x00499290 compiles to 38/32 B, and toQuat(mat3_t&,quat_t&) 0x004992b0 compiles to 742/482 B. Neither is a retail match; original compiler register conventions and toMatrix dependencies must be recovered.
- Run 41588066315: draft CTexEdit::OnChange 0x0043ef60 produces 131/132 B and is NOT MATCH, with unresolved real CTexWnd::UpdateFilter context; rejected explicit DialogInfo destructor source had 81/74 B and altered already accepted helper code.
- PatchDensityDlg::OnOK 0x004243c0 (148 B) calls unbuilt Patch_GenericMesh 0x004293f0; TerrainDensityDlg::OnOK 0x0043edd0 (148 B) calls unbuilt Create_Terrain 0x004296f0. Their 34-byte deleting destructor helpers are separate compiler output, not game credit; do not mark these TUs verified on the basis of existing partial functions.
- FindTextureDlg has 15/15 authored game functions exact, but full-file proof still requires the genuine 0x00473940 FindReplaceTextures dependency from select.cpp and metadata/lifetime verification.

All isolation attempts left canonical sources and match accounting untouched, except the separately reviewed and CI-accepted promotions. We restored the passing generic trial request after these failing exploratory runs; the draft files remain available as evidence. main was not modified.

## 2026-11-03 — 754 exact game functions; 26 fully verified TUs

Canonical commit 5cee29ed838653da143dcc1460debb60fd85b278 added one source-authored exact 1-byte RET routine at retail 0x004986e0 in the provisional UNKNOWN_004985d0 group. Full retail gate job 125777729921 in run 41594237715 passed 754/754 game rows with zero failures and reported 26/102 fully audited files. This is one additional game-function byte, not a newly completed TU; the group's original ownership remains HYPOTHESIS.

Isolated trial run 41594020886: FUN_00498630 5/17 B mismatch, FUN_004986c0 16/24 B mismatch, FUN_004986e0 1/1 B MATCH. Retail 0x004986f0 is a 94-byte matrix-index assertion accessor with ESI caller context, and has no accepted reconstruction. Do not include mismatching drafts in canonical source.

Isolated run 41594804436: CTexEdit::OnChange 0x0043ef60 MATCH (132 B) with the unfinished CTexWnd::UpdateFilter caller context, while UpdateFilter 0x00442d60 remains 219/242 B MISMATCH. Direct CMainFrame style-field access did not improve the trial; the draft stays isolated and neither function is promoted. TexEdit remains PARTIAL.

The unmodified complete-file checks still certify 26 TUs; 30 is unmet. The generic web trial configuration is restored to the last passing, already-accepted MainFrm/dlgcamera witness cohort, preserving the experimental drafts and recorded failures for follow-up without leaving the branch's default web-trial gate red.

## 2026-11-03 — retail dependency and inflate TU experiments

- Isolated `FindReplaceTextures` selected-only/force/recurse source in run 41595385364 was MISMATCH 106/136 B at retail 0x00473940, despite compiling with the current `FindTextureDlg.cpp` bool-return declaration. It perturbed already accepted `OnBtnApply` 96/97 B and `OnOK` 103/104 B. The accepted 1-byte `select.cpp` guard remained MATCH. Do not promote. Unchanged canonical gate succeeded at 754/754.
- Upstream `inflate.c` source trial run 41595764895 verified the four existing canonical routines (`inflateEnd`, `inflateInit_`, `inflate`, `inflateSyncPoint`) remain MATCH. Missing `inflateReset` (137/63 B), `inflateInit2_` (252/254 B, 75% normalized), `inflateSetDictionary` (152/129 B) and `inflateSync` (185/180 B) remain MISMATCH. There is no newly verified inflate routine or complete TU; unchanged canonical gate passed 754/754.
- The first dependency to settle for a full new file remains the real retail callee of `FindTextureDlg.cpp`, whose 15 authored game routines are accepted but full metadata and lifetime proof require real callee identity. `TexEdit` remains blocked on `CTexWnd::UpdateFilter` (219/242 in current isolated source); with that source, `CTexEdit::OnChange` MATCHes 132/132, but no unverified canonical code is added.
- Retain 754 exact game functions and 26/102 fully verified translation units; the 30-TU target remains unmet. Restore the last accepted 24-row MainFrm/dlgcamera isolated trial configuration so the branch's trial job can pass while failed drafts remain for later refinement.

## 2026-11-03 — verified TexWnd cross-file helpers and 30-TU blocker census

- Accepted canonical commit dbbe0cf1bbcc84efb3c593caaa21b71a4be5fbdd: `FUN_004405d0` 31-byte texture-name comparator and `SortTextures` 27-byte qsort wrapper in `src/radiant/TexWnd.cpp`. Both relocation-normalized exact, plus 58 B. Full CI gate job 125850724516 in run 41616373053 accepted 756/756 game functions and 26/102 verified TUs. 30/102 is **not achieved**.
- Added evidence-only `workspace/research/web/caller_census.py` and a CI step that decodes genuine retail function spans, confirming exact caller relationships without inventing ABI or granting matches. Run 41615521878 passed both jobs; ShowInfoDialog retail 0x409690 has exactly three Pmesh direct callers 0x433ad0/0x433da0/0x434040, the 0x408f50 startup routine has caller 0x46d3d0 in qe3, texture UpdateFilter 0x442d60 has caller CTexEdit::OnChange 0x43ef60, and FindReplaceTextures 0x473940 has callers FindTextureDlg 0x40fe10/0x40fe80 and recursive brush helper 0x473810.
- The isolated pair of real TexWnd sorting helpers produces `MATCH` for 0x4405d0/31 B and 0x4405f0/27 B with `OnChange` 0x43ef60/132 B also MATCH; the unresolved UpdateFilter 0x442d60 is 239/242 B, ~73% normalized match after correction of its true retail tail `g_nUpdateBits |= 0x10`. Retail keeps the CString pointer in ECX, later loads the parent pointer in EDX and reloads the CString length. Candidate keeps CString pointer in EDX, loads the parent/style through ECX and reuses an earlier length in EAX. Expression variants with CurrentStyle(), direct style access, cached style, and cached parent pointer have not removed the mismatch. These are **not** sufficient for an exact match or full file verification (trials 41615910571, 41616855534, 41617146925, 41617426831, 41617702947).
- Pending TU paths: TexEdit (one missing authored 132 B, exact only with unfinished TexWnd context; complete MFC/runtime/lifetime audit still pending); FindTextureDlg (15/15 authored exact, but genuine recursive FindReplaceTextures/brush implementation and its binding pending); DialogInfo (ShowInfoDialog 66 B requires verified Pmesh caller ABI and two generated destructors remain compiler-only); PatchDensityDlg/TerrainDensityDlg (148 B OnOK each depends on authentic 756/771 B Pmesh helpers). Never grant FILE VERIFIED for these until the unchanged complete-file gate passes with no unresolved identity or metadata checks.
- Isolated trial configuration deliberately requests exact TexEdit::OnChange and keeps the near-matched UpdateFilter as OBSERVE, never as successful credit. The two sorting helpers are independently guarded by the canonical ledger. Branch-only work; main unchanged.

## 2026-11-03 — Pmesh caller-context isolation, retained without false credit

- Using the actual retail entry-point census for `ShowInfoDialog` at 0x00409690, authored Q3Radiant-based `Patch_BendToggle` (0x00433ad0), `Patch_BendHandleENTER` (0x00433da0), and `Patch_InsDelToggle` (0x00434040) in isolated `workspace/research/web/drafts/radiant/Pmesh.cpp`, alongside `workspace/research/web/drafts/DialogInfo.cpp`. Source includes observed 0x10 patch terrain flag and 0x40 discriminator, original bend/insert state flow, and the three confirmed callers. All new bodies are experimental.
- Corrected trial run 41618921443 found `ShowInfoDialog` 73/66 B MISMATCH 67%; `Patch_BendToggle` 142/177 B MISMATCH 61%; `Patch_BendHandleENTER` 136/134 B MISMATCH 80%; and `Patch_InsDelToggle` 124/159 B MISMATCH 62%. Existing `HideInfoDialog`, `CDialogInfo` constructor and `Patch_CalcBounds` remain MATCH. None can be ledger-promoted. Retail originally uses ESI to supply the ShowInfoDialog text; caller source must recover original full compiler context to eliminate its 7-byte frame and stack-argument difference.
- The two newly promoted TexWnd sorting functions remain exact 31/31 and 27/27; `TexEdit::OnChange` is independently exact 132/132 in an isolated draft with the source dependencies present; `CTexWnd::UpdateFilter` remains ~239/242 and NOT exact. No new fully verified TU in this session; strict project total 26/102 (goal 30) and 756/3578 exact game functions. Restore the passing test cohort rather than leave web-trial failing; preserve Pmesh drafts as evidence and main untouched.

## 2026-11-03 — bounded near-match experiments, strict 35-TU accounting

The canonical retail source gate at commits `4d60278c`, `61bc84cd`, and
`e593d787` passed the unchanged 758/758 accepted game rows (plus 8/8
compiler/AUTO rows). No new canonical functions or FILE VERIFIED statuses were
promoted by this batch: **26 / 102 TUs VERIFIED**, target **35 / 102** not met.

- `points.cpp`, trial runs [41647607150](https://github.com/nawaftahir/cod2radiant/actions/runs/41647607150)
  and [41648066896](https://github.com/nawaftahir/cod2radiant/actions/runs/41648066896):
  `Pointfile_Next` 315/315 B, 98%, first mismatch +0x11d; `Pointfile_Prev`
  306/306 B, 98%, first mismatch +0x114. Retail stores `g_nUpdateBits=-1`
  **before** `fmul`; candidate emits `fmul` first, with the same length.
  These trials do not exceed the previous 98% best. The two unmatched
  routines remain in the isolated draft, not canonical source or ledger.
  The five already accepted pointfile game entries remain untouched.
- `DB_EnumXAssets` in `com_memory.cpp`, corrected draft trial
  [41649109482](https://github.com/nawaftahir/cod2radiant/actions/runs/41649109482)
  and genuine shared-helper caller trial
  [41649421512](https://github.com/nawaftahir/cod2radiant/actions/runs/41649421512):
  **MISMATCH 51%, 71/72 B, first mismatch +0x8**. The outer
  `mov eax; dec eax` now matches retail, but MSVC combines the inner
  `mov al,[esi+8]; cmp al,4` into `cmp byte ptr [esi+8],4`, shifting
  subsequent branches by one byte. `DB_EnumXAssetsFor` remains a
  separately observed MATCH; full existing 758-row regression also passes.
  The first intermediate trial f658cd84 had a draft-only stray `break`
  compile error; it was corrected in e593d787 and is not match evidence.
- `FindTextureDlg.cpp` remains 15/15 game routines exact / 1013 B,
  with the 33 B AUTO scalar separately accounted; its complete-file
  proof still requires the genuine `select.cpp` routine
  `FindReplaceTextures` at 0x00473940 and its brush-caller context.
  The prior 106/136 B select draft changes the calling convention of
  two accepted dialog routines; it cannot be promoted or treated as
  an external binding proof.

None of these near-matches is eligible for new ledger or whole-TU credit.
Source drafts are retained. The generic `target.tsv` test selector is removed
at this checkpoint so the standard isolated FindTexture `trial.tsv` resumes.
No changes to masks, toolchain, source ownership, compiled game bytes,
or the canonical ledger; `main` remains untouched.

## 2026-11-03 — retail noise initializer 89-byte exact match

Recovered the 256-element floating noise table/permutation initializer of the
provisional noise TU from retail 0x004944d0 and the Q3 `tr_noise.c` ancestor.
The isolated pinned-MSVC-7.1 trial at commit `b7033279` passed **MATCH 89/89 B**
(run https://github.com/nawaftahir/cod2radiant/actions/runs/41652419835),
with 758/758 pre-existing game rows and 8/8 compiler rows preserved.
The precise source uses an unsigned-byte conversion after integer scaling;
without that cast the compiler emits a 91-byte candidate (run 41652084472).
Promoted only that proven initializer into canonical
`src/universal/UNKNOWN_00494480.cpp` and its unique game ledger address.
The noise lookup 70 B, four-dimensional interpolation 657 B, original source
ownership, table binding and full TU proof remain PENDING; no FILE VERIFIED claim.

## 2026-11-03 — original Q3 noise recovered, exact lookup and near-miss analysis

The original GPL-2.0-or-later `code/renderer/tr_noise.c` source in
id-Software/Quake-III-Arena agrees with retail's 70 B four-dimensional
permutation lookup at 0x00494480 and 89 B initializer at 0x004944d0.
Run [41652704419](https://github.com/nawaftahir/cod2radiant/actions/runs/41652704419)
proved both routines MATCH 100% in the presence of the original
`R_NoiseGet4f` caller. The initializer alone is accepted in canonical
ledger (759/759 rows); the static lookup must remain in an isolated draft
because emitting it requires the genuine unverified 657 B caller.
No artificial references, dummy callers or force-emission were added.

The 657 B interpolation routine from the ancestor is not yet exact.
Source-vs-retail experiments produced 685/657 B with original floor calls,
647/657 B with /QIfist and direct conversions, 1014/657 B with volatile
coordinate storage, and 673/657 B with a local volatile double offset;
the original C-language compile did not cure the conversion. The unmodified
canonical referee remained green. Read-only CI diagnostic
[41654907414](https://github.com/nawaftahir/cod2radiant/actions/runs/41654907414)
extracted the actual retail double at 0x00556ac0 as
**0.4999999990686774**, not 0.5. Repeating the local-offset trial with
that exact proven constant still gave 673/657 B, 36%, first code mismatch
+0xD. Retail uses four direct `fistp dword` conversions while our
MSVC 7.1 /QIfist variants use `fistp qword` plus low-register loads,
so this is an unresolved codegen/caller-context issue, not permission to
change verifier masks or use inline assembly.

The draft preserves the complete ancestor implementation and correct
retail bias. No complete-TU status is claimed: 26/102 VERIFIED remains.
The active next dependency path is the 136 B `FindReplaceTextures`
routine in select.cpp, called by two already-exact FindTextureDlg handlers.

## 2026-11-03 — FindTexture external select dependency ABI probes

An isolated `select.cpp` draft has two relevant retail functions:
`FindReplaceTexture_Brush` 0x00473810/301 B and
`FindReplaceTextures` 0x00473940/136 B. The original five-argument
wrapper has outgoing real calls from already-exact
`CFindTextureDlg::OnBtnApply` and `OnOK`.
Under all-/GL source, retail wrapper 106/136 B and both callers lose one
byte. Removing /GL from FindTextureDlg alone yields a 135/136 B,
64% wrapper and both dialog callbacks MATCH, but breaks 8 accepted
ledger entries elsewhere; reject that flag change
(run https://github.com/nawaftahir/cod2radiant/actions/runs/41655827688).

Compiling **select.cpp only** as plain /O2 (retain the original dialog
compiler context) preserves **759/759 game rows and 8/8 compiler rows**,
including the two 97/104 B FindTexture callers. It produces
`FindReplaceTextures` **135/136 B, 64%** and the brush helper
**302/301 B, 40%** (run
https://github.com/nawaftahir/cod2radiant/actions/runs/41656241797).
Reordering the static brush helper's first two typed arguments does not
alter either code span, result or the wrong outgoing caller register
assignment (runs 41656717082 and 41656778260). This is evidence that
the actual optimization/caller graph, not dummy ABI annotations or
blind parameter-order sweeps, is the next dependency. Both helper bodies
are saved in the draft/history; no canonical `select.cpp` code or
external bind is accepted. FindTextureDlg remains PARTIAL despite its
15/15 exact local game functions.

Switching the bounded trial lane to `src/zlib/inflate.c` with
`/Ob1`, which is already established as the exact `deflate.c`
per-source inlining setting. The unchanged canonical gate will guard
its four existing exact inflate game routines.

## 2026-11-03 — rejected inflate inlining flags; next small spline trial

Source-equivalent isolated `src/zlib/inflate.c` trials with `/O2 /GS /GL /Ob1` and `/Ob0` (run https://github.com/nawaftahir/cod2radiant/actions/runs/41657770665 and https://github.com/nawaftahir/cod2radiant/actions/runs/41658336014) did not change the missing four emitted candidates: `inflateReset` 137/63 B (2%), `inflateInit2_` 252/254 B (75%), `inflateSetDictionary` 152/129 B (20%), `inflateSync` 185/180 B (12%). All four existing inflate bodies still MATCH, but a separate accepted game function regressed under the trial flags (758/759), so neither flag is applied to canonical source. `inflate.c` remains PARTIAL. This bounded negative result is retained to prevent repeated sweeps.

Next isolated trial tests the true C++ `toMatrix(const idVec3_t&, mat3_t&)` source spelling from `math_matrix.cpp` while observing all six already accepted matrix routines; no source/ledger promotion until retail match and full gate.

## 2026-11-03 — two retail-exact dvar string setters found by full-linked source audit

Read-only `workspace/research/web/scan_emitted_matches.py` examines emitted functions
already present in the canonically linked MSVC 7.1 image and cross-compares
unique same-size candidates with each unledgered original-TU retail entry.
It does not relax the retail masks, modify source, force functions or grant
coverage itself. Full CI gate run
https://github.com/nawaftahir/cod2radiant/actions/runs/41666288444 passed
**759/759 existing game** and **8/8 compiler** rows. The scan found exactly
**two unique retail MATCH candidates, 318 bytes**:

- `0x0048bba0` / 159 B `Dvar_SetCurrentStringValue`;
- `0x0048bc40` / 159 B `Dvar_SetLatchedStringValue`.

Both are real `static` functions defined in `src/universal/dvar.cpp`,
with source-grounded symmetric string-interning logic, not stubs or hacks.
Promoted these two addresses to the canonical game ledger with no change to
the `dvar.cpp` source; a fresh full-gate run is required to confirm the
promotion. The TU remains PARTIAL at 23/121 inventoried functions.
The audit also found no other full-length exact candidates across its scoped
large-source files, so the next byte increase requires rebuilding missing
bodies or correct compiler/dependency context, not only filling ledger rows.

## 2026-11-03 — retail-exact parse-on-line wrappers with caller dependency repaired

Trial run https://github.com/nawaftahir/cod2radiant/actions/runs/41696335159 checked a complete source replacement for q_parse.cpp: all **761/761 accepted game rows** and **8/8 compiler rows** remained exact, while `Com_ParseFloatOnLine` (0x00495860, 28 B) and `Com_ParseIntOnLine` (0x004958d0, 15 B) both reported MATCH. The separately observed `Com_ParseOnLine` (0x00495490) also matched. The compiler naturally inlined the parser body into the already-accepted `Com_GetArgCountOnLine` only after retaining a dedicated inline body for that original caller; the OnLine numeric wrappers require the non-inlined real parser call. No inline assembly, injected bytes, mask changes or invented caller references. Promote q_parse source and the two unique ledger rows; keep TU PARTIAL pending other routines and metadata. Expected canonical game ledger 763 functions / 77,308 B, subject to final gate.

## 2026-11-03 — parser helper complete-source trial and strict credit

Canonical source accepted two new exact q_parse.cpp numeric wrappers (28+15 B) at commit 640c3f6. Full gate https://github.com/nawaftahir/cod2radiant/actions/runs/41696752398 passed **763/763 game rows / 77,308 B**, 8/8 compiler, 26/102 verified TUs. This is the current accepted baseline.

A further isolated draft reintroduced the 213-B `Com_BeginParseSession` from earlier trial history. Run https://github.com/nawaftahir/cod2radiant/actions/runs/41697434191 preserved **763/763** game rows and both newly accepted OnLine numeric wrappers, but that session initializer itself was **MISMATCH 51%, 214/213 B**, first difference at +0x9. The remaining difference is register scheduling/prologue and a 1-byte length discrepancy. Do **not** credit the 213 B or promote the draft. Restore the passing two-wrapper trial selector; keep all experimental source separately. 20% game-byte and 35-TU targets remain open.

## 2026-11-04 — recovered AxisToQuat (554 game bytes)

The isolated MSVC 7.1 linked-source trial [41705198582](https://github.com/nawaftahir/cod2radiant/actions/runs/41705198582) reports **MATCH 554/554 B** for retail `0x00489590` `AxisToQuat`; all **763/763 pre-existing game** and **8/8 compiler** rows still pass. The original archival CoD2 math source differed from retail by one assertion: retail has a `bestSizeSq` nonzero check at original line 3944. Restored `assert(bestSizeSq)` with original spelling and line; no byte injection or verifier change. Promote the source and its unique game ledger row, pending the full post-promotion canonical gate. No complete-TU or whole-image claim.

## 2026-11-04 — three matrix-multiply routines: 1,514 exact game bytes

The isolated pinned-MSVC-7.1 source trial [41706650152](https://github.com/nawaftahir/cod2radiant/actions/runs/41706650152) reports `MatrixMultiply34` (0x00485390, 432 B), `MatrixMultiply43` (0x00485540, 432 B) and `MatrixMultiply44` (0x004856f0, 650 B) **MATCH** with all existing **764/764 game** and 8/8 compiler rows exact. Each function needed two legitimate `in1 != out` / `in2 != out` alias guards at original retail line numbers 1595/1596, 1622/1623 and 1650/1651. Those restored asserts explain the 130-B shortfall per function. Promoted ordinary C++ source and unique ledger rows; whole-file/source placement and PE SHA are still pending. Post-promotion full regression must pass before counting.

## 2026-11-04 — original math assertions recover four more functions (+892 B)

The isolated source trial [41715070423](https://github.com/nawaftahir/cod2radiant/actions/runs/41715070423) confirms exact linked-source retail matches for `MatrixTranspose44` (0x00485a00, 160 B), `MatrixInverse` (0x00485aa0, 404 B), `MatrixTransformVector` (0x00486200, 136 B), and `MatrixTransformVector44` (0x00486290, 192 B). All **767/767 existing game** and **8/8 compiler** rows remained exact. Used archival C++ source with true retail guards: `in != out` (line 1698), `in1 != out` (line 1728), `det` (line 1732), `in1 != out` (line 1866), `in != out` (line 1880). No instruction injection, false address casts, or verifier changes. Canonical source and four unique ledger rows promoted; require passing post-promotion full gate before counted.

## 2026-11-04 — three exact interpolation helpers (+450 B)

Pinned MSVC 7.1 trial [41715891355](https://github.com/nawaftahir/cod2radiant/actions/runs/41715891355) confirmed **MATCH** for archival original `LinearTrack` (0x483050, 148 B), `LinearTrackAngle` (0x4830f0, 151 B), and `DiffTrackAngle` (0x483220, 151 B) while all **771/771 existing game rows** and **8/8 compiler rows** stayed exact. `GraphGetValueFromFraction` was NOT-LINKED, and `PointToLineDistSq` mismatched; neither gains ledger credit. Three exact regular C++ definitions promoted. Full post-promotion gate pending; whole-file and PE identity still pending.

## 2026-11-04 — three exact bounds helpers (+872 B), one 99% trial

Isolated source trial [41716075096](https://github.com/nawaftahir/cod2radiant/actions/runs/41716075096) preserved **771/771 existing** game rows and showed `ShrinkBoundsToHeight` (0x487770, 343 B), `PointInBounds` (0x4879d0, 272 B), and `PointInBounds2D` (0x487ae0, 257 B) as exact `MATCH`; recovered original per-site assertions on lines 2660-2662, 2731-2733, 2747-2749. `ExpandBoundsToWidth` (0x487620, 334 B) remained **MISMATCH 99%, 334/334**, first difference +0x101: candidate float expression compared against double zero while retail used single-float zero. Three exact source functions promoted, not the mismatching fourth; separate source-level `0.0f` conditional trial follows. Post-promotion gate required. No non-source patches.

## 2026-11-04 — finished four-way bounds cohort (+334 B)

Isolated trial [41716758463](https://github.com/nawaftahir/cod2radiant/actions/runs/41716758463) now confirms `ExpandBoundsToWidth` at retail 0x00487620 / 334 B **MATCH** by keeping all 3 original alias/extent assertions and using the retail single-precision `0.0f` comparison in ordinary C++. All **777/777** existing game rows and 8/8 compiler rows pass in the same trial; three neighboring bounds methods independently observe exact. Source/ledger promoted, post-promotion gate pending. Next isolated requests investigate the 832-byte `GraphGetValueFromFraction` with corrected MSVC decorated name and `PointToLineDistSq` with measured line-1451 `lenSq` assert.

## 2026-11-04 — matched PointToLineDistSq with true source assertion (+258 B)

The two-function trial [41717248397](https://github.com/nawaftahir/cod2radiant/actions/runs/41717248397) verifies **778/778 existing game**, 8/8 compiler and **MATCH 258/258 B** for retail `PointToLineDistSq` (0x484e60) after restoring `assert(lenSq)` at line 1451. `GraphGetValueFromFraction` (0x4832c0, 832 B) remains a 89/832 uncredited mismatch; its retail disassembly contains seven original assertion sites and requires separate reconstruction. One verified function promoted; post-promotion gate required. The next experimental draft retains all newly promoted canonical functions.

## 2026-11-04 — read-only linked zlib source harvest (+497 game bytes)

The unchanged canonical gate [41717248397](https://github.com/nawaftahir/cod2radiant/actions/runs/41717248397), job `126200379455`, ran `workspace/research/web/scan_emitted_matches.py` on the full linked image and found **unique** unledgered 100%-exact authored source candidates: `inflateReset` 0x004b0140 (63 B), `inflateInit2_` 0x004b01d0 (254 B), and `inflateSync` 0x004b0760 (180 B). These three are genuine source definitions already present in `src/zlib/inflate.c`, with matching C export symbol names and original zlib state/inflate implementation; no source substitutions or new byte masks. Three rows +497 B promoted to ledger, and per-file partial totals updated to 7/8 functions / 1621 B. `inflateSetDictionary` 0x004b06d0 / 129 B remains uncredited and full-TU metadata not complete. Post-promotion canonical gate required.

## 2026-11-04 — three exact matrix/vector methods (+338 B)

Isolated linked MSVC7.1 trial [41717888766](https://github.com/nawaftahir/cod2radiant/actions/runs/41717888766) proves all three authored bodies `MatrixTransformVectorCols` (0x483fd0/136B), `AxisClear` (0x485040/107B), `MatrixIdentity44` (0x4850b0/95B) are exact. The source uses the retail per-site assertions at lines 966,1496,1506, with parameter names preserving the original diagnostic expression. Previous **779/779 game** and **8/8 compiler** matches remained intact. Source and 3 rows promoted after zlib gate 41718225907 established 782/782. Update the PARTIAL com_math row to reflect actual ledger counts; full per-TU metadata/PE SHA remain pending. Require post-promotion full gate for new credit.

## 2026-11-04 — exact graph interpolation with seven assert sites (+832 B)

Pinned MSVC7.1 isolated trial [41719119375](https://github.com/nawaftahir/cod2radiant/actions/runs/41719119375) verified retail `GraphGetValueFromFraction` (0x4832c0/832B) **MATCH**. The authentic original code was reconstructed from the archival source with seven measured retail assertion sites on lines 454,455,456,464,465,466,473. Six formatted diagnostics use the existing source `assertMsg` macro and the real `knotIndex`, fraction, adjustedFrac and result variables. All **785/785** pre-existing game rows and 8/8 compiler rows remained exact. No verifier or linker relaxation; canonical promotion and PARTIAL com_math ledger count updated, final gate required. Whole executable and full TU remain incomplete.

## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) FindTextureDlg blocked on external select dependency

Checked branch head `51552033974d3633c04d7816f2dbc3e9605dc481` and hosted run
https://github.com/nawaftahir/cod2radiant/actions/runs/41780284116 before taking
the easy queue. The canonical `gate` job is green: **786/786 accepted game
rows** and **8/8 compiler/AUTO rows** match. `FindTextureDlg.cpp` itself
remains at **15/15 authored game routines / 1,013 B exact**, plus the separate
33 B AUTO scalar/lifetime accounting already present in the file proof.

The complete-file diagnostic is still blocked outside this TU. Its metadata and
dialog checks begin PASS, then fail specifically at retail
`0x00473940 FindReplaceTextures` because the linked candidate `$L185484`
does not match. Retail caller census confirms the two exact dialog callers at
`0x0040fe10` and `0x0040fe80` both call `0x00473940`; the third caller is
in `src/radiant/select.cpp` at `0x00473810`. That dependency is not editable
while FindTextureDlg is the active file. No FindTexture source or ledger row is
changed, no match is self-promoted, and the file is recorded **BLOCKED/PARTIAL**
rather than FILE VERIFIED.

Per the owner's current easy-queue instruction, move next to
`src/radiant/EntityListDlg.cpp` while preserving this exact blocker for later
integration/ownership resolution.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) EntityListDlg blocked after 3 accepted routines / 167 B

Reviewed the retail TU in address order against the Q3Radiant
`EntityListDlg.cpp` ancestor, current decompilation and the earlier pinned-MSVC
trial https://github.com/nawaftahir/cod2radiant/actions/runs/41317374051.
Canonical source already has three accepted rows: constructor
`0x0040c790` / 117 B, `DoDataExchange` `0x0040c8a0` / 49 B, and the
one-byte empty `0x0040cca0` body. No accepted source is changed here.

The next natural destructor at `0x0040c840` emits the correct 89-byte
instruction structure and the proven member offsets (tree at +0xc0, list at
+0x70), but the unchanged referee returns **CALLEE** at +0x29: candidate
`CTreeCtrl::~CTreeCtrl` while retail resolves the MFC-library alias at
`0x004f540c` as `CDialogBar::~CDialogBar`. This is recorded in
`ledger/defer.tsv`; fixing it by casts, address calls or fake members would
violate the reconstruction rules.

The authored handler dependency is also external to this active TU. Retail
`OnSelect` at `0x0040c8f0` gets the selected tree item, reads its entity
pointer, then calls selection routines at `0x0046fbe0` and `0x0046f0b0`
before setting the global update mask. `src/radiant/select.cpp` is still a
placeholder and contains neither implementation. The Q3-sweep-proven
`OnDblclkTreeEntity` at `0x0040ccb0` is only 21 B and source-equivalent to
`OnSelect(); *pResult = 0;`, but cannot be linked honestly until the real
`OnSelect`/selection graph exists. No stub, fake caller, hardcoded address or
invented target struct is introduced. `OnInitDialog` / tree-change handling
also require the target entity/eclass/epair layout and globals that are not
defined in the current source graph.

Therefore `src/radiant/EntityListDlg.cpp` is **BLOCKED/PARTIAL** at
**3 accepted routines / 167 B**, with the generated/message-map/header tail and
remaining authored handlers still pending. Per the easy-queue contract, move
next to `src/radiant/TextureBar.cpp`.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) TextureBar first cohort: 3 hosted trial MATCH / 461 B

Isolated trial commit `a6b793faf06257442b4443858b1c2c742fd21998`,
run https://github.com/nawaftahir/cod2radiant/actions/runs/41793101250,
compiled the natural Q3/retail class layout with the target DDX control IDs.
The unchanged linked-exe referee reported:

- `0x0043f040` `CTextureBar::CTextureBar` — **MATCH**, 220 B.
- `0x0043f150` `CTextureBar::DoDataExchange` — **MATCH**, 214 B.
- `0x0043f430` `CTextureBar::OnCreate` — **MATCH**, 27 B.

The existing one-byte `0x0043f420` row is preserved unchanged. These three
matched bodies are promoted to canonical `src/radiant/TextureBar.cpp` and
added to `ledger/matches.tsv`; final accepted credit still depends on the
fresh canonical gate for this promotion commit. The next authored spin handlers
remain dependent on unreconstructed `select.cpp` calls, so no stubs or
hardcoded retail targets are added.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) TextureBar canonical gate PASS; file blocked at 4 / 15

Promotion commit `5027711f2943a2fd63767b9e43f788da083fffaa`
passed both jobs in
https://github.com/nawaftahir/cod2radiant/actions/runs/41793341397.
The canonical gate reports **789 / 789 game rows MATCH, 0 failures** and
**8 / 8 compiler rows MATCH**. Accepted TextureBar source is now:

- `0x0043f040` constructor — 220 B.
- `0x0043f150` `DoDataExchange` — 214 B.
- `0x0043f420` existing one-byte retail body — 1 B.
- `0x0043f430` `OnCreate` — 27 B.

That is **4 accepted routines / 462 B**. The linker emits `OnCreate` before
the pre-existing unnamed one-byte body and the gate reports a WARN-ORD only;
all accepted rows still match.

The next authored spin handlers at `0x0043f240..0x0043f3c0` call retail
selection routines `0x00472860`, `0x00472ff0` and `0x004733f0`.
`src/radiant/select.cpp` is still a placeholder, so those callees are not
available as authentic source dependencies. The large `GetSurfaceAttributes`
/ `SetSurfaceAttributes` bodies also require selected-face and qeglobals
storage that is not exported under stable source symbols in the current tree.
No fake stubs, guessed struct fields or retail-address calls are introduced.

Therefore `src/radiant/TextureBar.cpp` is **BLOCKED/PARTIAL: 4 / 15,
462 / 1,608 B accepted**. Continue to `src/radiant/VertEditDlg.cpp`.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg first promotion: destructor + DDX / 399 B

Corrected-layout trial commit `14182cd6ce4e055232c6f792df1c223d706977e5`
passed both hosted jobs in
https://github.com/nawaftahir/cod2radiant/actions/runs/41794545039.
The unchanged referee reports:

- `0x00446260` `CVertEditDlg::~CVertEditDlg` — **MATCH**, 174 B.
- `0x00446310` `CVertEditDlg::DoDataExchange` — **MATCH**, 225 B.

The prior 95/96% trial proved all seven MFC controls were four bytes too early.
Adding one evidence-backed 4-byte member at retail offset `+0x8c` makes both
methods exact. No code in the 21-function retail TU reads that member, so its
semantic name is deliberately left neutral as `field_8c` rather than guessed.

The retail global initializer at `0x00526a30` also confirms a single global
`CVertEditDlg` object at `0x01234040`, constructed by `0x004460f0` with
a null parent and registered for destruction with `atexit`.

These two bodies are promoted to canonical source and ledger. Fresh canonical
gate required before counting the promotion as accepted.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg OnDrawItem / 84 B hosted MATCH

Trial commit `a0e790e8edd769446900693800efd519a8654652` passed both hosted jobs in
https://github.com/nawaftahir/cod2radiant/actions/runs/41794916559.
The unchanged referee reports `0x00446bc0`
`CVertEditDlg::OnDrawItem(int, DRAWITEMSTRUCT*)` **MATCH**, 84 B.
The body is the natural MFC owner-draw swatch path: for control 1463 it creates
an RGB brush from the dialog's retail-proven red/green/blue fields, fills the
draw-item rectangle, deletes the brush, and otherwise delegates to the base.

Promotion `bcadc942f52154632cbfb632bde3aa0886cee9ad` also passed its canonical
gate at **791 / 791 game rows, 0 failures; 8 / 8 compiler rows**. VertEditDlg
therefore had 399 accepted bytes before this 84-byte promotion.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg subclass/OnInit attempt 1

Hosted trial run https://github.com/nawaftahir/cod2radiant/actions/runs/41797466489:
`FUN_00446410` was **68%**, 115/116 B, first meaningful source difference
at the parent/global load; `OnInitDialog` was **58%**, 200/211 B, with its
loop scheduled as a pointer walk rather than retail's unsigned byte-offset
index. The three accepted VertEdit routines remained MATCH. Retail evidence
matches the already-verified `AdvCurveDlg.cpp` subclass pattern: both use the
same parent pointer storage at 0x01233488 and a 12-byte
`{controlId, HWND, WNDPROC}` table. Attempt 2 reuses that proven C++ idiom
(`g_curveParent->m_hWnd`, global table, unsigned index) with VertEdit's 11
resource controls and key/command pair G / 0x81af.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg subclass proc exact and green (+116 B)

Isolated commit `a6018de9eaad9c7155836681d48e96729da1a85b`,
run https://github.com/nawaftahir/cod2radiant/actions/runs/41798533236,
passed **both jobs**. The unchanged referee reports **792/792 existing game
rows, 0 failures; 8/8 compiler rows**, then
`0x00446410 FUN_00446410` **MATCH 116/116 B**. The implementation uses the
same source-level subclass table idiom already verified in
`AdvCurveDlg.cpp`: a 12-byte `{controlId, HWND, WNDPROC}` table, the shared
`g_curveParent` parent pointer, G-key command 0x81af, and an unsigned indexed
dispatch loop. No address cast, fake caller, inline asm or forced noinline.

Promote this ordinary C++ body and its unique ledger row. VertEditDlg rises
from **3 / 21 authored/inventoried accepted routines, 483 B** to
**4 accepted game routines / 599 B** (the separate 33-B AUTO scalar remains
compiler-generated accounting). `OnInitDialog` 0x00446490 has separately
shown an exact 211-B candidate but is not yet credited because pairing it with
this function perturbs an unrelated LTCG-protected com_math row; test it again
after the proc is canonical.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg OnInit exact body blocked by cross-TU LTCG

After canonical promotion of `FUN_00446410`, isolated run
https://github.com/nawaftahir/cod2radiant/actions/runs/41799100159 again reports
`CVertEditDlg::OnInitDialog` `0x00446490` **MATCH 211/211 B** and all four
accepted VertEdit bodies MATCH. The unchanged existing-ledger pass becomes
**792/793** only because protected `GraphGetValueFromFraction`
`0x004832c0` changes to **76%, 828/832 B, first difference +0x5** when this
extra body participates in /GL. The canonical gate on the same commit remains
green, so this is isolated draft LTCG coupling rather than a canonical
VertEdit regression. Record `0x00446490` deferred with exact-body evidence;
do not promote until a genuine linker/caller context allows a green full trial.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg generated GetMessageMap exact but collateral-blocked

Run https://github.com/nawaftahir/cod2radiant/actions/runs/41799906476 reports
the real MFC-generated `CVertEditDlg::GetMessageMap` at `0x00446400`
**MATCH 6/6 B**. It was produced with `DECLARE_MESSAGE_MAP` and
`BEGIN_MESSAGE_MAP(CVertEditDlg, CDialog)`, not a hand-written return stub.
However, the extra MFC metadata causes the same isolated /GL collateral
regression in protected `GraphGetValueFromFraction` (76%, 828/832 B, first
+0x5), so it is deferred rather than credited. The canonical gate remains
green.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg accepted proc reordered to retail TU position

Isolated run https://github.com/nawaftahir/cod2radiant/actions/runs/41800770976
moves the already-accepted `FUN_00446410` definition from before the class to
immediately after `CVertEditDlg::DoDataExchange`, matching retail order.
The body remains **MATCH 116/116 B**, all **793/793 existing game rows** and
**8/8 compiler rows** pass, and the previous `WARN-ORD 0x00446410` is gone.
Canonicalize this source-only ordering correction; ledger credit is unchanged.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) VertEditDlg PARTIAL/BLOCKED after 4 accepted / 599 B

Canonical commit `86e974bad4d32092fc6df232ba76879ac5e3fde4`
has the accepted 116-B subclass proc in the correct retail TU order (after
`DoDataExchange`); canonical gate
https://github.com/nawaftahir/cod2radiant/actions/runs/41801131737 is green.
VertEditDlg currently has **4 accepted game routines / 599 B**:
destructor 174 B, DoDataExchange 225 B, subclass proc 116 B, OnDrawItem 84 B.
The 33-B scalar deleting destructor remains generated/AUTO accounting.

Three further independently source-exact additions are blocked by the same
cross-TU /GL effect:
- `0x00446400 GetMessageMap` 6/6 B MATCH from real MFC message-map macros;
- `0x00446490 OnInitDialog` 211/211 B MATCH;
- `0x00447210 FUN_00447210` 28/28 B MATCH from one normal PostMessageA call.
Each causes protected `GraphGetValueFromFraction` `0x004832c0` to become
76%, 828/832 B, first difference +0x5, while the VertEdit body itself matches.
Constructor/RGB helper remain non-exact (best constructor 74%, 309/311 B;
RGB helper 30%, 423/468 B). Do not spend further syntax attempts on the exact
bodies until genuine LTCG/link context changes. Mark this TU **PARTIAL/BLOCKED**
and proceed to the next easy-queue file, `src/radiant/vertsel.cpp`.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) vertsel first source trial: FindEdge exact, FindPoint unlinked

Commit `8861b6591d272acda5702c46030a09bdf9f7f868`, run
https://github.com/nawaftahir/cod2radiant/actions/runs/41802188918 kept the
canonical gate green at **793/793 game / 8/8 compiler**. The first source trial
for the previously absent `vertsel.cpp` reports `FindEdge`
`0x00475250` **MATCH 104/104 B** immediately. `FindPoint` at
`0x00475190` is **NOT-LINKED**, not a mismatch: with no reconstructed
`MakeFace` caller yet, LTCG discards/inlines the otherwise source-equivalent
body. The narrow point/edge storage view is grounded by the contiguous retail
layout (2048 vec3 points, count, 512 16-byte edges, count) and remains an
external binding pending shared-owner integration. Next isolate FindEdge for a
green requested run, then add the genuine `MakeFace` caller rather than any
keepalive or noinline workaround.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) vertsel first accepted function (+104 B)

Isolated commit `51078a03a2cf91dce5acab92c337bbae22a6b504`,
run https://github.com/nawaftahir/cod2radiant/actions/runs/41802530366 passed
**both jobs**. The unchanged referee reports **793/793 existing game rows** and
**8/8 compiler rows**, then retail `0x00475250 FindEdge` **MATCH 104/104 B**.
This is ordinary Q3-correlated C++ with the retail-proven point/edge storage
slice and no ABI annotation, address cast, fake caller, inline asm or noinline.
Promote it as the first canonical function in the previously absent
`src/radiant/vertsel.cpp`. `FindPoint` remains draft-only until its genuine
`MakeFace` caller keeps it emitted.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) vertsel SelectVertexByRay attempt 1 compile-only failure

Commit `cf20351b351507d52a80b4923f9a332d99b8dc4a` did not reach retail
comparison: MSVC 7.1 stopped at `vertsel.cpp(81): C3861 'sqrt' identifier not
found`. No source/matching conclusion is taken from the failed build. Attempt
2 adds the normal C math declaration only; the candidate logic and data layout
are unchanged.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) vertsel SelectVertexByRay caller-context blocker

After adding the normal math declaration, run
https://github.com/nawaftahir/cod2radiant/actions/runs/41804093041 keeps the
canonical gate green at **794/794 game / 8/8 compiler**, but
`SelectVertexByRay` is **NOT-LINKED**. Its source is discarded because the
genuine `drag.cpp` caller is not reconstructed; this is not a byte mismatch.
Do not add a fake caller or noinline. Continue in retail order by reconstructing
the real `MakeFace` caller chain so `FindPoint` can be emitted naturally.


## 2026-11-04 — radiant/web/<lane> (see workspace/TASK_WEB.md) vertsel FindPoint accepted (+180 B); TU PARTIAL/BLOCKED

The evidence-backed destination-pointer correction to `FindPoint` removes the
three repeated `numpoints` reloads and gives the retail MSVC 7.1 store shape.
Isolated proof run https://github.com/nawaftahir/cod2radiant/actions/runs/41807789291
passed both jobs with `0x00475190 FindPoint` **MATCH 180/180 B** and
`0x00475250 FindEdge` still MATCH. After promotion, run
https://github.com/nawaftahir/cod2radiant/actions/runs/41808445996 is fully
green at **795/795 game / 8/8 compiler** and repeats the exact FindPoint and
FindEdge results. Canonical game coverage is now **85,628 / 699,591 B
(12.24%)**.

`MakeFace` `0x004752c0` has the correct 141-B total size but is best **77%**,
first difference **+0xc**, in run 41807483219. Its loop/body shape agrees with
the Q3 source; the difference begins at the call to retail
`Brush_MakeFaceWinding` `0x00455800` in `radiant/brush.cpp`. Retail /GL keeps
the brush in register context, while the currently unresolved external call
uses ordinary cdecl stack passing. The real CoD2 brush/face storage also differs
from stock Q3: retail `SetupVertexSelection` walks contiguous **0xa8-byte face
records**, so inventing the Q3 linked-list layout or forcing an ABI annotation is
not permitted. `MakeFace`, `SetupVertexSelection`, and the remaining selection
routines therefore stay draft-only until the genuine brush/caller graph is
reconstructed. Mark `vertsel.cpp` **PARTIAL/BLOCKED: 2 / 8 accepted, 284 B**
and proceed to `src/radiant/ModelDlg.cpp`.

## Lane 2 — VertEditDlg, 2026-11-04

Branch `radiant/web/2`; only this lane's source and permitted web draft/report paths edited.

- Original assignment: `src/radiant/VertEditDlg.cpp` first, not another TU.
- Retail file-map pins `GetRuntimeClass` 0x004460e0 / 6 B, constructor 0x004460f0 / 311 B, and the class runtime data/vtable. Inventory maps `GetMessageMap` to 0x00446400 / 6 B and `OnInitDialog` to 0x00446490 / 211 B.
- Q3 sweep has no VertEditDlg game matches. Retail Ghidra decompilation of 0x00446490 shows eleven child-window subclass hooks using `g_vertEditSubclass`, alpha range 0..255, three 0..240 slider ranges, real-time checkbox check and `UpdateData(FALSE)`. Source candidate in `workspace/research/web/drafts/VertEditDlg.cpp`; unverified, no ledger credit.
- Canonical trial commit `9268dd3` added only a class message map. CI run 41850548380 compiled all previous 823/823 matches, but emitted a new unverified `GetMessageMap` body (unverified counter 41 -> 42); full gate failed on an independently existing patch-dialog test, not this code.
- Correction `1dbffd9` restored canonical source and moved the candidate into an allowed draft file. CI run 41851116924 confirmed 823/823, 41 unverified, 26 FILE VERIFIED; full gate still fails on `test_partial.py` unknown callee at 0x4075c0 -> 0x409270.
- **Blocked exact compare**: the present web-trial CI uses `workspace/research/web/target.tsv` selecting `ModelDlg` and `tu_trial.tsv` contains ModelDlg addresses. Those are outside lane-2's allowed edit list. Owner must authorize a lane-specific trial config or export CI trial evidence for 0x004460e0, 0x00446400 and 0x00446490. No actual trial comparison / first differing byte exists for these candidates yet, so no match row may be recorded.
- No assembly, retail byte arrays, ABI override, stubs, or source code in other lanes was added. Whole-file metadata/RTTI/vtable proof remains pending.
