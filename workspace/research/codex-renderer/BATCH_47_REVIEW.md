# Checkpoint47 — larger DirectX error-translator reuse probe

Active objective: at least10% matched renderer code while external DeepSeek
campaign proceeds. Not reached; no narrowing to decompilation or compatibility.
Latest counted subset remains32,471/1,089,680≈2.98%, excluding separately
tracked/unreviewed CRT. This turn adds evidence, not matched-byte credit.

Selected two large source-recoverable library bodies:100efe3c and100f2b25,
inventory9617 bytes each. Second is wide ErrorDescription, NOT ErrorName;
confirmed by decompile wchar_t/L literals. Retail complete boundaries/tables
still require audit; inventory size is not acceptance evidence.

`prepare_dxerr_probe.py` mechanically preserves GLM decompilation in isolated
scratch/codex_dxerr_probe, adjusts observed stdcall declaration and brace style,
records input/output hashes. Decompile probe is explicitly NOT accepted source.
First generator attempt stopped on the unexpected wchar_t signature; corrected
without crediting partial output. Fresh two-TU runbaseline_jpeg_g0jt6np0 compiles
both at/O2/Gy, each10372-byte section, no discovered match. Initial one-TU
runbaseline_jpeg_txeaem5i also no match, no need to repeat it.

`prepare_dxerr_switch.py` compiles the preserved narrow decompile as a HOST
mapping oracle, enumerates646 known mappings and emits readable switch candidates
for narrow/wide output in scratch/codex_dxerr_switch. This is NOT target execution.
Wide mapping correspondence is unverified. Probe provenance labels every generated
source UNVERIFIED. No original retail instruction arrays, copying or patching.

Fresh bounded codegen tests:

| Candidate | Flags | Raw function section | Outcome |
|---|---|---:|---|
| Direct decompile(A/W) |/O2 /Gy|10372 each|DEFER|
| Recovered switch(A/W) |/O2 /Gy|12254 each|DEFER|
| Recovered switch(A/W) |/O1 /Gy|11395 each|DEFER|

Runs respectivelyg0jt6np0,1cuv4ijr,viydevhp. Complete input/commands/object hashes
are in each run. Raw sizes may contain switch data; no prefix/extent shortcut
was used to call these matches. No more arbitrary variants on these candidates
without new target/compiler evidence. Existing JPEG/image source untouched.

The existing generic compiler tool now has optional --optimization O1/O2 with
UNCHANGED defaultO2. This is a bounded probe, not historical flag provenance.
Selected flags remain explicit in every recorded command; no extra build system.

Reproduce preparation and bounded switch build:

```sh
python3 codex/renderer/prepare_dxerr_probe.py
python3 codex/renderer/prepare_dxerr_switch.py
python3 codex/renderer/verify_jpeg_reference.py --reference codex/renderer/scratch/codex_dxerr_switch --optimization O1 --start 0x100efe3c --end 0x100f50c0
```

Avoid rerunning unchanged builds: inspect saved COFF sections and actual target
switch trees/table boundaries. Next useful evidence is authentic matching DXErr
source/version or independently validated case mapping plus real target lowering,
not chasing larger raw dump counts. Local SDK contains DxErr.lib/header but its
version/source equivalence is not established. Release licensing also unapproved.

Goal remains active; no canonical changes, commits,10% claim or runtime proof.
