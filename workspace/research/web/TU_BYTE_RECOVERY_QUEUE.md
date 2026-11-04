# TU recovery work queue — 20% game-byte target

Baseline (canonical CI run 41697928801): 763 exact game functions, 77,308 / 699,591 game bytes (11.05%), 26 / 102 verified translation units. The 20% byte milestone requires at least 139,919 exact game bytes: 62,611 more than baseline.

This is a recovery queue, not MATCH credit. Each candidate must preserve the canonical gate and pass the unmodified retail comparison before ledger promotion. The retail translation-unit boundaries remain authoritative; splitting below refers to recovery tasks, not changing final compile units.

| TU | Total inventory bytes | Already matched | Unmatched | Suggested recovery partition |
| --- | ---: | ---: | ---: | --- |
| radiant/Pmesh.cpp | 80,201 | 677 | 79,524 | independent geometry helpers, then mesh mutation and caller graph |
| radiant/MainFrm.cpp | 54,369 | 45 | 54,324 | leaf UI commands, then dispatch and MFC metadata |
| radiant/brush.cpp | 47,013 | 0 | 47,013 | primitive helpers, geometry updates, then selection dependencies |
| radiant/XYWnd.cpp | 40,524 | 3 | 40,521 | leaf transforms, viewport state, event handlers |
| radiant/select.cpp | 27,211 | 1 | 27,210 | FindReplaceTexture_Brush 301 B, FindReplaceTextures 136 B, then remaining helpers |
| src/universal/dvar.cpp | 24,678 | 1,723 | 22,955 | string setters, leaf conversions, registration, then callers |
| src/universal/com_math.cpp | 27,968 | 8,620 | 19,348 | independent math routines before shared/inlined dependencies |
| src/universal/com_files.cpp | 19,485 | 5,340 | 14,145 | path and I/O leaves, then file-handle and platform dependencies |

Immediate evidence-backed blocker: the select.cpp draft's FindReplaceTextures wrapper emitted 135/136 B with select.cpp-only plain /O2 while preserving accepted dialog callers; its brush helper emitted 302/301 B. These are NOT matches. Compare the actual disassembly and calling graph rather than granting partial credit or forcing ABI/inline annotations.

The canonical ledger is the only source of credited game bytes. Do not merge unrelated workers' branches or modify main.
