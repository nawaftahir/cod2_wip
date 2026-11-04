# Review: gemini2, src/radiant/draw.cpp (commit ac14641), 2026-11-04

Verdict: **bytes good, merge after two fixes.**

## Checked
- Full gate on agent/gemini2: `verify: 789/789 rows match, 0 failures` (main 786, +3). No existing row broke.
- The 3 new rows (0x40be30 19 B, 0x40bf80 77 B, 0x40bfd0 24 B) match inside the linked exe.
- No asm, `_emit`, `noinline`, byte arrays or retail addresses. Assert lines 33-35 kept (R_Add3DLine still matches).
- Report is clear: counts, the deferral with best %, first differing byte and the caller it needs.

## Fix before merge
1. **Names without evidence.** `R_Flush3DPoints`, `R_Add3DLine`, `R_Add2DLine`, `R_Flush3DLines`, `R_Add3DPoint`,
   `R_AddCmd_Line3D/Points3D`, `GfxPointVertex`, `orientation_t`, `g_editorOrientation`, `OrientationPosToWorld`
   appear in neither the retail strings, Q3Radiant nor iw3xo. Rule: names need a target string or an agreeing
   reference, else `FUN_<addr>` / tag UNNAMED. Rename the functions to `FUN_<addr>` (ledger name + tag UNNAMED,
   symbol updated from `make try`); give types and globals neutral names (`draw_vertex_t`, `g_drawOrient` …)
   with a one-line comment that the name is provisional. If CoD4 code (e.g. Kisak) is the source of the names,
   cite the file and line in the report instead and tag SUPPORTED.
2. **Unmatched body in src/.** `R_Add3DPoint` (0x40bde0, deferred at 27%) is still compiled, raising the unverified
   count from 41 to 42. Move its body to `scratch/gemini2/draw_0040bde0.cpp` and leave only a declaration, if one is needed.

## Next time (improvements)
- Run `make gate` (not only `make verify`) before each commit and paste its meter lines in the report. It also checks
  the unverified count.
- Put the evidence for every name in the report (string, reference file, or "none: FUN_ name").
- Keep going file by file: after these fixes, continue with `csg.cpp` (Q3Radiant `CSG.CPP`); check
  `workspace/research/q3sweep_game.tsv` for its free wins first.
