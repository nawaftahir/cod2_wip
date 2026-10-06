#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
python3 scratch/codex33_constant_table/check.py --clean
mkdir -p build/codex33_shader_helpers/obj build/codex33_shader_helpers/libraries
cp -a build/codex33_constant_table/obj/. build/codex33_shader_helpers/obj/
cp -a build/codex33_constant_table/libraries/. build/codex33_shader_helpers/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex33_shader_helpers/link.mk -j8 IN_IMAGE=1 B=build/codex33_shader_helpers \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex33_shader_helpers/libraries/native_helpers.obj
python3 scratch/codex33_shader_helpers/check.py
python3 scratch/codex33_shader_helpers/select_link_dependencies.py
cp build/codex33_constant_table/dependencies/new.obj build/codex33_shader_helpers/dependencies/new.obj
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:build\\codex33_shader_helpers\\dependencies\\runtime_new.lib build\\codex33_shader_helpers\\dependencies\\new.obj && wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex33_shader_helpers/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex33_shader_helpers/dependencies/d3dx9.lib && make -f scratch/codex33_shader_helpers/link.mk -j8 IN_IMAGE=1 B=build/codex33_shader_helpers SRCDIR=scratch/codex25_dxerr/link_src build/codex33_shader_helpers/gfx.dll'
