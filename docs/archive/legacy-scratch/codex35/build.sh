#!/bin/bash
# Build first, then run the unchanged referees and baseline check.
set -euo pipefail
cd /home/nawaf/cod2/test/dev/gfx/target
trial=${1:?trial number required}
[[ $trial =~ ^[0-9]+$ ]]
mode=${2:-verify}
[[ $mode == verify || $mode == link ]]
packet=scratch/codex35
build=build/codex35
exec 9>"$packet/build.lock"
flock -n 9 || { echo "build/codex35 busy; no work started" >&2; exit 1; }
image=sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131
test ! -e "$packet/build_$trial.log"
mkdir -p "$build/tmp"
docker run --rm --pid=host --network none -v "$PWD:/w" \
  -v /home/nawaf/cod2/test/dev/sdk/sum2004:/dxsdk:ro -w /w \
  -e TMP='Z:\w\build\codex35\tmp' -e TEMP='Z:\w\build\codex35\tmp' "$image" \
  make -j4 -f "$packet/profile.mk" IN_IMAGE=1 SRCDIR="$packet/src" B="$build" DBG=1 \
  "$build/gfx.dll" > "$packet/build_$trial.log" 2>&1
docker run --rm --network none -v "$PWD/$build:/w" --entrypoint chown "$image" \
  -R "$(id -u):$(id -g)" /w
if [[ $mode == link ]]; then
  echo "Diagnostic link only; no comparison, binding, regression or coverage credit"
  exit 0
fi
python3 ../tools/cmp.py "$build/gfx.dll" "$build/gfx.map" \
  ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll "$build/cmp.json" \
  > "$packet/cmp_$trial.log"
python3 ../tools/bindcheck.py "$build/gfx.dll" "$build/gfx.map" \
  ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll "$build/cmp.json" \
  --json "$build/bind.json" --pdb "$build/gfx.pdb" > "$packet/bind_$trial.log"
cp "$build/bind.json" "$packet/bind_$trial.json"
python3 "$packet/regression.py" "$build/bind.json"
