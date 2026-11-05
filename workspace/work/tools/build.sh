#!/bin/sh
set -eu
case "${1-}" in
  ''|--rebuild) ;;
  --help) echo 'build.sh [--rebuild]: one pinned build, both referees, regression and layout'; exit 0 ;;
  *) echo 'Usage: build.sh [--rebuild]' >&2; exit 2 ;;
esac
target=$(CDPATH= cd -- "$(dirname "$0")/../.." && pwd)
cd "$target"
build=build/codex_boundsoutside_1016_02
logical=scratch/codex_boundsoutside_1016
image=${GFX_IMAGE:-sha256:093ff3cf41bff5ef6b7ef1dafce5ace185814c694066cdeef2686042d5324c7d}
sdk=${DXSDK:?Set DXSDK to the Summer 2004 SDK directory}
sdk=$(cd "$sdk" && pwd)
anchor=$(python3 ../tools/renderer_anchor.py)
mkdir -p "$build/tmp" work/proof/latest
exec 9>"$build/trial.lock"
flock -n 9 || { echo 'Renderer build already running' >&2; exit 1; }
# Preserve the established compiler-visible paths, not a second source tree.
config=$({ printf '%s\n' "$image"; sha256sum closed.mk work/src/profile.mk;
  rg --files work/src src/shims src/opencod2/headers "$sdk/Include" "$sdk/Lib" \
    -g '*.h' -g '*.inc' -g '*.inl' | sort | xargs sha256sum;
} | sha256sum | cut -d ' ' -f1)
force=
if [ "${1-}" = --rebuild ] || [ ! -f "$build/work-config" ] ||
   [ "$(sed -n '1p' "$build/work-config" 2>/dev/null)" != "$config" ]; then
  force=-B
fi
docker run --rm --pid=host --network none -v "$target:/w" \
  -v "$target/work/src:/w/$logical" \
  -v "$sdk:/dxsdk:ro" -w /w \
  -e TMP='Z:\w\build\codex_boundsoutside_1016_02\tmp' \
  -e TEMP='Z:\w\build\codex_boundsoutside_1016_02\tmp' "$image" \
  sh -c "make $force -W $logical/roots.txt -W $logical/tus.txt -j4 -f $logical/profile.mk IN_IMAGE=1 SRCDIR=$logical B=$build DBG=1 $build/gfx.dll; result=\$?; chown -R $(id -u):$(id -g) $build; exit \$result" \
  >"$build/build.log" 2>&1
printf '%s\n' "$config" >"$build/work-config"
# A failed diagnostic probe avoids the full scan; a success still runs every gate.
if [ -n "${GFX_PROBE_SYMBOL-}" ]; then
  python3 ../tools/cmp.py "$build/gfx.dll" "$build/gfx.map" "$anchor" "$build/probe.json" --pdb "$build/gfx.pdb" --symbol "$GFX_PROBE_SYMBOL" >"$build/probe.log"
  python3 work/tools/probe_match.py "$build/probe.json" "$GFX_PROBE_SYMBOL"
fi
python3 ../tools/cmp.py "$build/gfx.dll" "$build/gfx.map" "$anchor" "$build/cmp.json" --pdb "$build/gfx.pdb" >"$build/cmp.log"
python3 ../tools/bindcheck.py "$build/gfx.dll" "$build/gfx.map" "$anchor" "$build/cmp.json" \
  --json "$build/bind.json" --pdb "$build/gfx.pdb" >"$build/bind.log"
python3 work/tools/regression.py "$build/bind.json" >work/proof/latest/regression.json
python3 work/tools/check_checkpoint.py "$build/bind.json"
python3 work/tools/source_coverage.py "$build" >work/proof/source_coverage_current.json.pending
mv work/proof/source_coverage_current.json.pending work/proof/source_coverage_current.json
python3 work/tools/layout.py "$build/gfx.dll" >work/layout/current.json
cp "$build/bind.json" "$build/cmp.json" work/proof/latest/
cp "$build/gfx.map" work/layout/current.map
echo 'Build, referees and checkpoint regression passed; layout/current.json updated.'
