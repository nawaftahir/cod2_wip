# Renderer checkpoint28 — matched slice and row-copy helpers, 2026-09-26

Source slice E840 in saved fresh668lqodd was already exact once its code/table
boundary was audited. Added reusable verify_local_switch in existing memory-size
checker: validates code/full section, target PE and COFF relocation-site equality,
actual local bindings and every section byte after real relocation resolution,
strict instruction-only body, original full-section referee and negative binding.
No object edits/retail patches or table bytes disguised as instructions.

One bounded source experiment scratch/wavelet_row_step moves rowStep=1 from
unconditional entry into the ordinary-format cases, as target branch structure
shows. Fresh pinned MSVC7.1 /O2 /Gy baseline_jpeg_t8vfcrgk compiles, and its full
row-copy274-byte section matches. Natural static caller context, no reg wrappers.

`python3 codex/renderer/check_image_slice.py` PASS:
slice1000e840135 code+1NOP+20jump+31format table bytes, full187 section and5CC;
rows1000e900226 code+2MOV EDI,EDI alignment+16jump+30format table bytes, full274
section and14CC. All13 real bindings across both sections match, every byte
checked after binding; both referees and deliberately incorrect binding rejection.
Packet image_slice_packet.json now covers both matched bodies from the new run.
NEW .text credit361 bytes (135+226); all97 table bytes separately verified,
alignment/padding not code credit. No independent acceptance or whole-DLL claim.

Actual-source32-bit warning-clean tests passed: volume stdcall/log/retry/slices
and row pitched/tight/DXT/guards/unknown-format checks plus reused memory/creator
checks. Row-only fixture uses linker --gc-sections to omit the unused volume
function and its unrelated globals; full volume fixture separately exercises it.
Both exact runnable commands and all four fixture hashes are pinned in packet.

Volume upload remains356vs348DEFER, and tracking unmatched. Matching its two
lower helpers does NOT prove that caller body. Next actual2D/cube upload source
and bounded full caller reconciliation. Existing creator362/mip149/chain135
and alpha134 proofs unchanged, no duplicate credit. No canonical or V4 claim.
