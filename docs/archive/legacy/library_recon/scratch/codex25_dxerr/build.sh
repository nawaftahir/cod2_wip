#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
test -f scratch/codex19_dxerr/compiler/cl.exe
test -d "$here/link_src" || cp -a verified/src "$here/link_src"
docker run --rm --pid=host --network none \
    -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -B -j4 -f scratch/codex25_dxerr/link.mk IN_IMAGE=1 \
    SRCDIR=scratch/codex25_dxerr/link_src B=build/codex25_dxerr build/codex25_dxerr/gfx.dll
docker run --rm --network none -v "$dev/gfx/target:/w" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    chown -R "$(id -u):$(id -g)" build/codex25_dxerr
python3 "$here/check.py"
python3 "$here/check_link.py"
docker run --rm --pid=host --network none \
    -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 \
    sh scratch/codex25_dxerr/compile_test.sh
python3 "$here/run_test.py"
