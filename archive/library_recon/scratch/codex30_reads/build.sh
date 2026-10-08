#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex30_reads/obj build/codex30_reads/libraries
# Reuse only the independently hash-verified prior source objects.
python3 scratch/codex30_parser/check.py --clean
cp -a build/codex30_parser/obj/. build/codex30_reads/obj/
cp -a build/codex30_parser/libraries/. build/codex30_reads/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex30_reads/link.mk -j8 IN_IMAGE=1 B=build/codex30_reads \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex30_reads/libraries/read_typed.obj \
        build/codex30_reads/libraries/shader_version.obj
python3 scratch/codex30_reads/select_dependencies.py
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex30_reads/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex30_reads/dependencies/d3dx9.lib && make -f scratch/codex30_reads/link.mk -j8 IN_IMAGE=1 B=build/codex30_reads SRCDIR=scratch/codex25_dxerr/link_src build/codex30_reads/gfx.dll'
