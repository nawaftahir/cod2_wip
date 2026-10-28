# Accepted first-TU reconstruction model

The owner approved the first-TU build/model and source corrections; both
are applied. The stock make try, gate and accept checks report 357/357 matches,
46,987 game bytes (6.72%), and 25,428 whole-file same-offset bytes (1.417%).
This adds thirteen functions / 1,589 bytes and 3,540 same-offset bytes.
The original fifty unverified bodies and single order warning remain.

The change preserves existing flags and enables exceptions/RTTI only for
AdvCurveDlg. The linker orders verified functions from this first fixed-map
TU by retail address. Eight leading functions now occupy their exact retail
addresses. Later TU helpers retain their previous ordering. Historical use
of /ORDER and the original spelling of exception flags are not established.

Three MFC destructor identities are pinned by their own vtable stores and
RTTI. The fourth correction, _pow, was tested with five inputs against the
original image. The class layout, twenty-entry message map, focus-loss
notifications and four virtual override declarations come from the target.
Missing handlers and the global instance remain to be reconstructed.

After a normal build, run `test_first_file.py` and `test_model.py` inside the
pinned toolchain image. The first tests the actual linker helper with an
isolated ledger. The second checks live flags and bindings, target RTTI,
message metadata, virtual routing and all eight placed byte matches.
`model_proof.json` records the reviewed measurements; ledger/meter.json is
the current accepted checkpoint. The approved patch hash is retained in the proof.
Approved patches, earlier prototypes and preparation scripts are archived under
scratch/codex_1028_advcurve/order_prototypes and must not be reapplied.

`prove_pow.cpp` maps the original at 0x400000 without running its entry point.
Compile it without CRT startup; commands are in research/codex_notes.md.
No GUI boot or whole-file SHA identity is claimed. No filler, copied code or
post-link retail patches are used.
