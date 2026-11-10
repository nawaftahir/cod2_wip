#!/bin/bash
# lab13.sh OBJ...: edit workspace/ or src/, then recompile only the named objs (path under build/obj without .obj, e.g.
# oc/client_mp/cl_scrn_mp) and relink build/ra/ox.exe (~20 s). Diff a function with
# `python3 tools/fdiff.py build/ra/ox.exe build/ra/ox.map <anchor> '<mangled substring>' <retail addr hex>`.
# Lab only: the accept still needs a clean `tools/ratchet13.sh`. Run it only when no release build is running.
W=$(cd "$(dirname "$0")/.." && pwd); cd "$W"
cp -a workspace/. build/tree/ && cp -a src/. build/tree/
T=""
for o in "$@"; do rm -f build/obj/$o.obj; T="$T build/obj/$o.obj"; done
docker run --rm -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh -c "make IN_IMAGE=1 -j4 $T 2>&1 | tail -15; chown -R $(id -u):$(id -g) build"
bash tools/ra13.sh all > /dev/null 2>&1
ls -la build/ra/ox.exe | cut -c1-90
