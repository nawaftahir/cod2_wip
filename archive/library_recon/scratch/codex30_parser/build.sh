#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
docker run --rm --network none -v "$dev/gfx/target:/w" \
    -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex30_parser/link.mk -j8 IN_IMAGE=1 \
        B=build/codex30_parser SRCDIR=scratch/codex25_dxerr/link_src \
        build/codex30_parser/libraries/d3dxtok.obj \
        build/codex30_parser/libraries/d3dxasm.obj \
        build/codex30_parser/libraries/d3dxshader.obj
python3 "$here/select_dependencies.py"
docker run --rm --network none -v "$dev/gfx/target:/w" \
    -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:build/codex30_parser/dependencies/d3dx9.lib @build/codex30_parser/dependencies/members.rsp && make -f scratch/codex30_parser/link.mk -j8 IN_IMAGE=1 B=build/codex30_parser SRCDIR=scratch/codex25_dxerr/link_src build/codex30_parser/gfx.dll'
docker run --rm --network none -v "$dev/gfx/target/build/codex30_parser:/output" \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    chown -R "$(id -u):$(id -g)" /output
