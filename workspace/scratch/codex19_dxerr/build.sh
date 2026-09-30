#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
test -f "$here/compiler/cl.exe"
test -d "$here/link_src" || cp -a verified/src "$here/link_src"
docker run --rm --pid=host --network none \
    -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 \
    sh -ec 'sh scratch/codex19_dxerr/compile_4035.sh; sh scratch/codex19_dxerr/compile_test.sh'
python3 "$here/check.py"
python3 "$here/run_test.py"
docker run --rm --pid=host --network none \
    -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -B -j4 -f scratch/codex19_dxerr/link.mk IN_IMAGE=1 \
    SRCDIR=scratch/codex19_dxerr/link_src B=build/codex19_dxerr \
    XL=scratch/codex19_dxerr/group_4035_sdk_leaf.obj build/codex19_dxerr/gfx.dll
python3 "$here/check_link.py"
