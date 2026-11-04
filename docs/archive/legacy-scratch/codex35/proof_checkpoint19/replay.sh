#!/bin/bash
# Fresh objects, unchanged referees and exact accepted game extents.
set -euo pipefail
cd /home/nawaf/cod2/test/dev/gfx/target
packet=scratch/codex35/proof_checkpoint19
sha256sum --quiet -c "$packet/inputs.sha256"
replay_build=$(mktemp -d -p build codex35_checkpoint19_XXXXXX)
mkdir "$replay_build/tmp"
image=sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131
docker run --rm --pid=host --network none -v "$PWD:/w" \
  -v /home/nawaf/cod2/test/dev/sdk/sum2004:/dxsdk:ro -w /w \
  -e TMP="Z:\\w\\${replay_build//\//\\}\\tmp" \
  -e TEMP="Z:\\w\\${replay_build//\//\\}\\tmp" "$image" \
  make -j4 -f "$packet/profile.mk" IN_IMAGE=1 SRCDIR="$packet/src" \
  B="$replay_build" DBG=1 "$replay_build/gfx.dll" > "$replay_build/build.log" 2>&1
docker run --rm --network none -v "$PWD/$replay_build:/w" --entrypoint chown "$image" \
  -R "$(id -u):$(id -g)" /w
python3 ../tools/cmp.py "$replay_build/gfx.dll" "$replay_build/gfx.map" \
  ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll "$replay_build/cmp.json" \
  > "$replay_build/cmp.log"
python3 ../tools/bindcheck.py "$replay_build/gfx.dll" "$replay_build/gfx.map" \
  ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll "$replay_build/cmp.json" \
  --json "$replay_build/bind.json" --pdb "$replay_build/gfx.pdb" > "$replay_build/bind.log"
python3 "$packet/regression.py" "$replay_build/bind.json"
python3 - "$packet/bind.json" "$replay_build/bind.json" <<'PY'
import hashlib, json, sys
assert hashlib.sha256(open(sys.argv[1],'rb').read()).hexdigest() == '1fb20f50ac075d846fdd0a2963744c9a8e4320f30e1a637b7f2b1a1a59fbdf49'
assert hashlib.sha256(open(sys.argv[2],'rb').read()).hexdigest() == '1fb20f50ac075d846fdd0a2963744c9a8e4320f30e1a637b7f2b1a1a59fbdf49'
def game(path):
    return {r['t']:r['n'] for n,r in json.load(open(path)).items()
            if not r['why'] and '@std@@' not in n and
            (0x10001000 <= int(r['t'],16) < 0x10041db0 or
             0x10057990 <= int(r['t'],16) < 0x10062200)}
old,new=game(sys.argv[1]),game(sys.argv[2])
assert old == new, 'cold game address/extent set changed'
assert len(new)==544 and sum(new.values())==95156
assert sum(new.values())-403==94753
intervals=sorted((int(va,16),int(va,16)+size) for va,size in new.items())
assert all(end <= following for (_,end),(following,_) in zip(intervals,intervals[1:]))
baseline=game('scratch/codex35/proof_checkpoint9/bind.json')
assert len(baseline)==513 and all(new.get(va)==size for va,size in baseline.items())
print('PASS: independent cold build: 544 bodies / 94,753 code bytes, 403 table/padding excluded; all 513 checkpoint9 extents retained, no overlaps')
PY
python3 "$packet/audit_switch_tables.py" > "$replay_build/switch_table_audit.json"
for check in "$packet"/test_*.py; do python3 "$check"; done
sha256sum --quiet -c "$packet/inputs.sha256"
mkdir "$packet/cold"
cp "$replay_build"/gfx.dll "$replay_build"/gfx.map "$replay_build"/gfx.pdb \
  "$replay_build"/bind.json "$replay_build"/cmp.json "$replay_build"/build.log \
  "$replay_build"/bind.log "$replay_build"/cmp.log "$replay_build"/switch_table_audit.json "$packet/cold/"
printf 'Replay artifacts: %s\n' "$replay_build"
