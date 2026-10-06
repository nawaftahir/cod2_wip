# Native shader helpers — pending acceptance

Five ordinary C++ routines reproduce616 complete instruction bytes in the
original SDK patterns. They cover a write-mask check, two pool initializers,
register swapping and legacy pixel-shader capability initialization.
Full V2 passes; the linked renderer preserves700 previous source matches and
accepts705. All13952 CPU differential cases agree with the original SDK.
Aggregate acceptance is pending; zero new accepted coverage is claimed here.
The cold audit stopped without terminal PASS; no audit is currently running.
helpers.h is an access view, not a complete
SDK allocation layout. Unmatched drafts stay in scratch/codex33_shader_helpers.
