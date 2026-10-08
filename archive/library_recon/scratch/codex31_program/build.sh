#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex31_program/obj build/codex31_program/libraries
cp -a build/codex35_compiler_types/obj/. build/codex31_program/obj/
cp -a build/codex35_compiler_types/libraries/. build/codex31_program/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex31_program/link.mk -j8 IN_IMAGE=1 B=build/codex31_program \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex31_program/libraries/program.obj
python3 scratch/codex31_program/check.py --clean
python3 scratch/codex31_program/select_link_dependencies.py
cp build/codex35_compiler_types/dependencies/new.obj build/codex31_program/dependencies/new.obj
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:build\\codex31_program\\dependencies\\runtime_new.lib build\\codex31_program\\dependencies\\new.obj && wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex31_program/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex31_program/dependencies/d3dx9.lib && make -f scratch/codex31_program/link.mk -j8 IN_IMAGE=1 B=build/codex31_program SRCDIR=scratch/codex25_dxerr/link_src build/codex31_program/gfx.dll'
