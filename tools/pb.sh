#!/bin/sh
# pb.sh <srcdir> <builddir>: closed.mk verify that is safe to run in parallel.
# cl names its _CL_* temps in the cwd by PID; --pid=host keeps concurrent containers from colliding.
cd "$(dirname "$0")/../target" || exit 1
S=$1; B=$2
mkdir -p "$B/tmp"
W=$(echo "Z:/w/$B/tmp" | tr / '\\')
timeout 590 docker run --rm --pid=host --network none -v "$PWD":/w -v "$(cd ../../sdk/sum2004 && pwd)":/dxsdk:ro -w /w \
  -e TMP="$W" -e TEMP="$W" cod2-msvc71-build \
  sh -c "make -f closed.mk -j\$(nproc) IN_IMAGE=1 SRCDIR=$S B=$B DBG=1 $B/gfx.dll; s=\$?; chown -R $(id -u):$(id -g) build; exit \$s" 2>&1 \
  | grep -E "error|warning C4700" | head -20
python3 ../tools/cmp.py $B/gfx.dll $B/gfx.map ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll $B/cmp.json >/dev/null &&
python3 ../tools/bindcheck.py $B/gfx.dll $B/gfx.map ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll $B/cmp.json --json $B/bind.json --pdb $B/gfx.pdb 2>&1 | grep "verified source"
