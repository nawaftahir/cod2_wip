# Renderer checkpoint37 — matched complete file-loader source, 2026-09-26

Audit of release84vs87 shows both category-width branch and memory-zeroing
differences. One bounded memset probe scratch/wavelet_release_clear, fresh
baseline_jpeg_0ya16zgj compiles release80vs87 (worse),file242 unchanged,DEFER.
32-bit reload tests pass; keep probe separate, do not declare aggregate zeroing
historical source or repeat pointless tuning. Preferred release body unchanged.

File comparison reveals actual source-flow discrepancy at targetFAE5:
LEA ESI,[EAX+1c] prepares payload BEFORE checking flags/validating header.
Prior candidate kept file base inESI and added28 later, accounting for difference.
New scratch/wavelet_file_payload preserves reload_group (not failedmemset probe)
and keeps payload=file+sizeof(header) while validation/flags access file base.
No forced register/ABI; both pointers have distinct real roles in target.

Fresh pinned MSVC7.1 /O2 /Gy baseline_jpeg_qqtw3j8j compiles and matches
Image_LoadFromFile1000fa40 complete240 code bytes, RET1000fb2f. NEW240bytes
only. Release84vs87,Reload44vs42 remainDEFER. Header67,dispatcher261/table52,
formatter26 and eight other established1141-byte group matches retained, no
duplicate credit. No independent acceptance or whole-track regression claim.

`python3 codex/renderer/check_image_file.py` PASS both referees, all16 actual
operand bindings, six complete compiled literals, negative wrongfree-slot
rejection and source-selected32-bit fullreload fixture. Retained formatter/
header/dispatch proofs rechecked on same fresh object; image_file_packet.json
embeds their source/header/toolchain/object and transitivefixture identities.
Dispatch fixture runner now explicitly selects recorded source overlay via-D,
so a test cannot accidentally exercise an older snapshot's similar source.
Original default standalone tests/checker snapshots remain available.

Direct matched dependencies: FormatPath60c10,CheckFileHeaderF2A0,LoadFromDataF900.
PINNED extern print61c80/read-slot101d4afc/free-slot101d4b00 do not imply matching
underlying print/filesystem callbacks. Dispatcher's three loader bodies still
unmatched; formatterCRT strict-only86 remainsDEFER. No dependency-closure claim.
File/reload fixtures use returning error, filesystem and COM mocks; neither
real fatal handling nor engine/GPU/Wine runtime proven.

Next remaining actual image-loader/setup/upload/release context, with cheap
group and file proof replay protecting all previous matches. No canonical import
or retail full-file identity. Existing stdlib/checkers/fixtures reused; no new
framework/toolchain dependency or byte-array source.
