#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex35_output_groups/obj build/codex35_output_groups/libraries
cp -a build/codex35_register_split/obj/. build/codex35_output_groups/obj/
cp -a build/codex35_register_split/libraries/. build/codex35_output_groups/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex35_output_groups/link.mk -j8 IN_IMAGE=1 B=build/codex35_output_groups \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex35_output_groups/libraries/output_groups.obj
python3 scratch/codex35_output_groups/check.py --clean
python3 scratch/codex35_output_groups/select_link_dependencies.py
cp build/codex35_register_split/dependencies/new.obj build/codex35_output_groups/dependencies/new.obj
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:build\\codex35_output_groups\\dependencies\\runtime_new.lib build\\codex35_output_groups\\dependencies\\new.obj && wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex35_output_groups/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex35_output_groups/dependencies/d3dx9.lib && make -f scratch/codex35_output_groups/link.mk -j8 IN_IMAGE=1 B=build/codex35_output_groups SRCDIR=scratch/codex25_dxerr/link_src build/codex35_output_groups/gfx.dll'
