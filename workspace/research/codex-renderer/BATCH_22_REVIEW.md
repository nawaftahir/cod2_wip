# Renderer checkpoint22 — all three texture creators, 2026-09-26

Fresh scratch/wavelet_create_format preserves checkpoint21 inputs and corrects
one argument in the 3D failure diagnostic: format, NOT usage. This corrects my
earlier analysis; no source/register tuning was necessary. The community reference
was right on this argument despite its unrelated null-device guard and ABI issues.

PINNED full target trace: entry1000cf00 saves EBX/EBP/EDI (12bytes). The COM
stdcall invocation restores its argument stack; HRESULT-description helper
100efe3c returns with RET4. At1000cf5b description is pushed (another4bytes).
1000cf5c reads[esp+1c], therefore entryESP+12 = format, NOT entryESP+8 = usage.
Old object read[esp+18] because it printed usage. This was the only normalized
byte difference. Do not preserve checkpoint21's incorrect usage inference.

Fresh pinned MSVC7.1 /O2 /Gy baseline_jpeg_4un7pbxe matches all three bodies:
2D1000ce80/113, 3D1000cf00/130, cube1000cf90/119. Total362 .text bytes, only
130 new since checkpoint21. Original GLM referee plus strict checker agree.
3D RET1000cf81 plus14 CC bytes tocf90 audited, padding not counted.

`python3 codex/renderer/check_image_create.py` passes: source/header/object/image
identity; all13 instruction bindings across three bodies; complete compiled
diagnostic strings; target boundaries; deliberate wrong device binding rejection;
32-bit C89 warning-clean actual-source COM success/failure mock fixture. Its
updated packet supersedes checkpoint21 image_create_packet.json. Default fixture
source is corrected create_format; old create_family remains preserved but its
3D behavior is knowingly incorrect. Never copy that old body into a release TU.

All362 bytes remain REVIEWABLE, not independently accepted. No liveGPU/retail
link/full-file identity claim. Error dependencies remain unmatched; custom creator
register interfaces arise naturally from source definitions sharing the caller TU.

Next dependency locations pinned by setup1000ee30 call chain:
tracking1000ca70, memory-accounting1000f020, pixel-size helper1000ef40;
2D/cube upload1000ea20, volume upload1000ec00, row-copy1000e900,
volume source-slice sizing1000e840. Target tracking globals begin101d0a74;
track byte12 gates accounting with track>1 && track!=4. Target upload includes
logging/retry globals101ce7ec,10764584,1076a830, not simplified reference calls.
Verify complete custom-register arguments and SDK lock signatures before writing
those bodies; current Ghidra prototypes omit arguments and are not adequate.

Original alpha/table/partial-source link proof is unchanged, no duplicate credit.
Next actual tracker/memory and upload group source, not arbitrary marker variants.
