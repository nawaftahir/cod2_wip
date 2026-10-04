#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
python3 scratch/codex35_shader_buffers/check.py --clean
mkdir -p build/codex35_parse_casts/obj build/codex35_parse_casts/libraries
cp -a build/codex35_shader_buffers/obj/. build/codex35_parse_casts/obj/
cp -a build/codex35_shader_buffers/libraries/. build/codex35_parse_casts/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex35_parse_casts/link.mk -j8 IN_IMAGE=1 B=build/codex35_parse_casts \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex35_parse_casts/libraries/casts.obj
python3 scratch/codex35_parse_casts/check.py --clean
python3 scratch/codex35_parse_casts/select_link_dependencies.py
cp build/codex35_shader_buffers/dependencies/new.obj build/codex35_parse_casts/dependencies/new.obj
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:build\\codex35_parse_casts\\dependencies\\runtime_new.lib build\\codex35_parse_casts\\dependencies\\new.obj && wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex35_parse_casts/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex35_parse_casts/dependencies/d3dx9.lib && make -f scratch/codex35_parse_casts/link.mk -j8 IN_IMAGE=1 B=build/codex35_parse_casts SRCDIR=scratch/codex25_dxerr/link_src build/codex35_parse_casts/gfx.dll'
