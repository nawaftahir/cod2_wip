#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex30_instructions/obj build/codex30_instructions/libraries
python3 scratch/codex30_reads/check.py
cp -a build/codex30_reads/obj/. build/codex30_instructions/obj/
cp -a build/codex30_reads/libraries/. build/codex30_instructions/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex30_instructions/link.mk -j8 IN_IMAGE=1 B=build/codex30_instructions \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex30_instructions/libraries/instruction_copy.obj \
        build/codex30_instructions/libraries/shader_profiles.obj build/codex30_instructions/libraries/cparse_cast.obj
python3 scratch/codex30_instructions/select_dependencies.py
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex30_instructions/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex30_instructions/dependencies/d3dx9.lib && make -f scratch/codex30_instructions/link.mk -j8 IN_IMAGE=1 B=build/codex30_instructions SRCDIR=scratch/codex25_dxerr/link_src build/codex30_instructions/gfx.dll'
