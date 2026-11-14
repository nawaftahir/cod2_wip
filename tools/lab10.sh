#!/bin/bash
# lab10.sh OBJ...: recompile only the named objs (path under build/obj without .obj) and relink the release exe,
# copied to build/ra/ox.exe + ox.map for tools/fdiff.py / psweep10.py. Lab only: accept still needs a clean ratchet10.sh.
W=$(cd "$(dirname "$0")/.." && pwd); cd "$W"; mkdir -p build/ra
cp -a workspace/. build/tree/ && cp -a src/. build/tree/
for o in "$@"; do rm -f build/obj/$o.obj; done
rm -f build/release/CoD2MP_s.exe
docker run --rm -v $W:/w -v $W/build/tree:/w/src -w /w cod2-msvc71-vs2003 sh -c "make IN_IMAGE=1 -j4 build/release/CoD2MP_s.exe 2>&1 | tail -5; chown -R $(id -u):$(id -g) build" > build/ra/lab10.log
cp build/release/CoD2MP_s.exe build/ra/ox.exe && cp build/release/CoD2MP_s.map build/ra/ox.map
