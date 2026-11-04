# Parser value casts — 2026-10-04

Clean source: target/src/codex_shader_parse_casts/casts.cpp. Two genuine C++
definitions match209 complete instruction bytes: CastToFloat1009a36a/94,
CastToValue1009ca51/115. Existing IsCast classification is a different function;
these target sites are new, not duplicate coverage.

- clean_packet.json: REVIEWABLE, both original referee scores100, complete
  source/SDK/retail sections, decoded boundaries, explicit relocation names/
  types/addends and source/SDK/retail storage and runtime binding proofs.
  Changed body and wrong-binding negatives pass; no masks were broadened.
- link_packet.json: PASS668 source matches, all666 baseline retained;
  305 selected source definitions and42642 parser proof instruction bytes.
  Full SDK/literal/vtable binding gates retained; no /FORCE or opaque credit.
- fixture_packet.json: PASS1400/zero differences,944 successes456 errors.
  Source executable selects BOTH methods from the fresh CLEAN casts.obj;
  original owners d3dx9:cparse.obj. Full shader/diagnostic/constants and
  HRESULT outputs compared, source/object freshness and identity guards.
- Independent posthash passed17 V2/213 V3/23 CPU identities.

NOT globally accepted yet: no aggregate inclusion for these209 bytes.
The conversion cold audit5151/session69820 remains live; do not edit its
driver or cohort inputs. Bundle these209 with buffer308 after its terminal
review. Full35% remains unfinished and whole-DLL identity is not established.

PINNED original value tag0 bool,1 signed,2 unsigned,3 double; other tags
return0x80004005. Float unsigned conversion has literal4294967296. Value
integer conversion adds/subtracts0.000001 then calls the confirmed __ftol
runtime (opaque dependency, zero credit). Boolean comparison is0.0 != value.
The 0/3/2/1 Float case order matches the original common-store placement;
0/1/2/3 remains94 bytes but does not match. Separate signed/unsigned source
cases reproduce the Value dispatch; merging their labels instead gives117.

No CParse fields or allocation layout are fabricated. Reuse the verified
_D3DXVALUE/node definitions; consolidate the CParse declaration with other
fragments during final integration. CPU fixture is public API behavior, not
proof of every private input, allocation failure, GPU or whole-file identity.

First fixture build failed due an adapted test filename that did not exist;
the error log is retained, not credited. Correct filenames and CLEAN object
selection were rebuilt before the reported pass. No freshness gate was waived.

Replay build.sh, check.py --clean, check_link.py; select_dependencies.py,
fresh compile_fixture.sh in pinned CPU image, then run_fixture.py. Compiler
flags are pinned4035 /O1 /Oy- /hotpatch /MT /Gy /d2QIftol. Test compilation
uses the existing pinned CPU image and original SDK archive/header inputs.
