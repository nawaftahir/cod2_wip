# Structural references

## Local clones

### `dev/refrences/Quake-III-Arena/q3radiant`

Historical Q3Radiant source. Best for editor architecture and legacy naming:
application/document/view flow, main frame, camera/XY/Z windows, brushes,
entities, patches, CSG, preferences, texture windows, plugin interfaces, and
command routing.

Use it to infer likely CoD2 Radiant subsystem boundaries, prototypes, globals,
and call graphs. It cannot prove byte identity or exact CoD2 behavior.

### `dev/refrences/iw3xo-radiant` — secondary only

Modern CoD4-oriented Radiant extension, mostly extending/modernizing the CoD4
Radiant rather than preserving its original implementation. Use it sparingly for
IW-specific concepts and feature naming; do not use its architecture as a model
for historical recovery.

It is a heavily modernized ImGui/Detours project and is not a historical CoD2
source. Q3Radiant is the primary structural reference; iw3xo is secondary.

## Prioritization consequence

The Ghidra inventory shows IW/application code is concentrated below
`0x004c0000` (2,519 functions / 663,771 bytes), while later ranges contain most
MFC, ATL, CRT, locale, exception, string conversion, and runtime support. We will
therefore prioritize the low range first and use the two references to name and
cluster its unnamed functions.
