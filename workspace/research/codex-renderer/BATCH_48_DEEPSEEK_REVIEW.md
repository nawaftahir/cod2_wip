# Campaign7 preliminary independent review — 2026-09-27

NOT ACCEPTED; reviewed baseline remains57746/1089680 (5.30%).
Read report, source, replay and TU checker. Independently replayed saved r_debug
object under both unchanged referees:10005980/93 and100059e0/93 shape100%, each
has unresolved allocator `_ri_z_malloc_internal` at+39 targeting101d49dc.
Source existence confirmed:3C files+shared header;10 drafted functions.
69-byte10001230 is already counted, not new. Worker claimed255accepted is invalid.

TU checker reports MATCH despite unresolved sites; logs for claimed matches are
overwritten by unmatched replay calls. No independent fresh build/semantic
acceptance performed this review; no new bytes credited or source promoted.
Custom-register evidence is real for reported sites, but only externally visible
cdecl isolated compilation was shown; global LTCG-only necessity is unproven.
Source has substantive unmatched Material_AllocVertexDecl261 at97%; early-return
tail differs at+248. Revision contract specifies bounded investigation plus
remaining5TUs, evidence retention, bindings/negative tests and actual fixtures.

Route DEEPSEEK_CAMPAIGN_7_REVISION.md; worker owns new revision folder only.
