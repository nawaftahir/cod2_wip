# Buffer callback checkpoint — 2026-10-04

Four genuine Stage2 template callbacks pass scratch V2,308 total bytes:
1007ddd9/61,1007de16/100,1007de7a/86,1007ded0/61. Distinct callback ownership
comes from the complete SDK/retail CConstant::Create carrier, not first-match
search. Native source0/source3 have equal bodies but distinct target sites.
No duplicates from the older Stage0/1 families are counted here.

PINNED: ID3DXBuffer::GetBufferPointer dispatch is slot3/offset0xc. Destination
is buffer pointer + start*16; copy length count*16. Conversion writes scratch
first, then copies original input (including alias cases), returns0. These
are original behaviors, not newly designed fixes. No assembly or hex bodies.

clean_packet.json: scratch REVIEWABLE4/308, both referees100, complete bounds,
carrier identities and negative checks. fixture_packet.json: PASS256 CPU
cases/zero differences; selected source owners buffers.obj vs original
d3dx9:cconstanttable.obj, full input/scratch/destination contents, HRESULT and
GetBufferPointer call count. CPU-only mock buffer, not GPU/whole-file proof.

No linked regression yet; build.sh currently ends after scratch V2. Nothing
is promoted into clean src or included in the aggregate driver. ZERO accepted
coverage. Finish strict private link from conversion baseline662 toward666,
303 selected definitions and42433 parser bytes, retaining all662. These are
expected gates, not results. Add pinned selector/bindings/vtable/link proof;
then promote only this file, rebuild clean and repeat all gates before a new
aggregate. Do not alter the currently running conversion audit inputs.

Replay CPU after fresh compile_fixture.sh in the pinned image:

```sh
python3 target/scratch/codex35_shader_buffers/run_fixture.py
```

Reports/proof tools and scratch source are saved for continuation. Generated
objects, executables, maps and full transcripts remain local, not committed.
