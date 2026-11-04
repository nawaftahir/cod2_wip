# Renderer checkpoint24 — complete memory-size switch proof, 2026-09-26

The checkpoint23 mip-size mismatch was a code/table boundary mismatch, not
wrong source. Reuses its fresh baseline_jpeg_v9fqhj84 object without recompiling
unchanged inputs. New runnable verifier: check_image_memory_size.py.

PINNED target1000ef40 code ends RET1000efd4:149 bytes. Following3-byte LEA
alignment atEFD5 precedes four jump addresses atEFD8 (16bytes), then51-byte
format-to-jump-index map atEFE8. Whole219-byte extent ends1000f01b, followed
five CC bytes beforeF020. The compiled function COMDAT contains all219 bytes;
generic discovery demanded raw-section length==code length and skipped it.

`python3 codex/renderer/check_image_memory_size.py` PASS:
strict instruction checker on complete149-byte body (in-memory section view,
original object untouched); original GLM referee on full219-byte code/table
extent (memory-only inventory override); all six actual relocation bindings,
including four local jump destinations, independently resolved with addends;
every byte of the whole source-generated219-byte section equals target after
actual relocation binding, not merely masking; negative wrong table address
rejected. This also checks complete16+51 table bytes and3 alignment bytes.
Only149 code bytes credited; no padding/table bytes passed off as instructions.

Packet image_memory_size_packet.json pins source/header/toolchain/object hashes,
fixture/include hashes, diagnostics and local symbol bindings. Replays actual
source32-bit C89 memory/creator fixture from checkpoint23 warning-clean. No
synthetic retail byte table: MSVC itself generated the switch tables from C.

149 new engine .text bytes REVIEWABLE. Memory-chain123vs135 and tracking163vs200
remain DEFER; no acceptance by reference behavior alone. Creator362 bytes and
alpha134 existing matches unchanged and not recounted. Source interfaces/group
are research context, not proof of exact historical TU or independent acceptance.

Next inspect F020/CA70 caller/callee context before limited compiler/source
experiments; then upload row-copy/SDK lock dependencies. Whole-DLL link/layout,
identity and actual runtime remain unfinished. Do not repeatedly recompile the
same correct149-byte switch merely because its COMDAT includes tables.
