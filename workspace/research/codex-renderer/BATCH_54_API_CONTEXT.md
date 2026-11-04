# API/input/marker source context — 2026-09-27

Accepted coverage unchanged61416/1089680≈5.64%. This pass adds source-context
evidence and a substantive full-block candidate, not yet new accepted bytes.

Own overlay scratch/codex_jpeg_api_input_group copies the accepted API/memory
source and adds the actual jdinput/jdmarker modules. jutils is included once,
through jmemmgr; jdinput's duplicate textual include removed. The target's
jinit_marker_reader is called separately with cinfo inESI; this overlay declares
it private/noinline before its real CreateDecompress caller. No invented caller,
ABI shim, emitted retail bytes, /GL or claim of historical declaration spelling.

Fresh baseline_jpeg_j1kw2vhc:34shape matches/8466bytes, zero compilation failures,
all15prior API/memory group shapes retained. New initializer1004f7c0/131 matches
both unchanged referees. It is HELD: reset_marker_reader, read_restart_marker,
skip_variable already supported; read_markers needs a full-block proof and
get_interesting_appn326 is one of BATCH_8's old legacy-mask-bug gated functions.
Do not re-derive/retry that known E9-ModRM defect or weaken the original gate.

CreateDecompress remains unmatched: input setup now actually inlines, reducing
the real structural gap (old266, input-context312, marker-context311, target310).
Its target uses EDX/EAX/ECX parameters, while current source is externally visible
cdecl. These byte sizes are diagnosis, NOT closeness metrics or accepted prefixes.
Actual raw direct-call candidate10014a18 lies inside R_LoadJpg10014940/785;
verify caller instructions/types before any private Create experiment. Reference
r_jpeg.c contains modern changes and different struct offsets; don't paste it.
CreateCompress10041710 has no raw E8 candidate/PE-pointer references in the DLL;
that absence does not establish compiler impossibility or authorize fake callers.

## Next immediate proof: read_markers

Fresh object _read_markers is882bytes. Address1004f280 is absent from inventory;
the initializer's real pointer references it. With explicitly scoped full-block
extent882, unchanged original referee100% on the entire block.
Object/control inspection shows code563through RET at+562, oneNOP alignment,
16switch destinations64bytes at+564, and254byte selector map at+628..881.
Actual indirectdispatch uses map index after cmp0xfd and selects the16-entry
table. These are compiler-generated source switch tables, not authored hex.

Need runnable instruction-aware full-block proof, same strict principles as
check_jpeg_idct_block: full code decode/branches/RET, every table destination on
instruction boundary, map values within16entries and exact whole map equality,
exact relocation site/type maps, local and actual source-callee bindings,
wrong-binding rejection, full input/object hashes, both unchanged referees,
regression. Calls include first_marker,next_marker,get_soi,get_sof,get_dht,
get_dqt,get_dri,skip_variable,get_sos. Pin all from existing source proofs, never
inventory labels alone. Code credit would be563, not882(table319excluded).
Initializer131 remains gated independently by the known get_interesting_appn issue.

Intermediate baseline_jpeg_c7v9ih6j showed21retained shapes but its source overlay
was subsequently extended: not a current replay source. Initial mq_9i8lh failed
duplicate jutils compilation and is not proof. Latest j1kw2vhc hashes are current.
Do not edit this overlay without a fresh build; accepted old overlays untouched.

No release/progress repository or external worker edits/commits.
