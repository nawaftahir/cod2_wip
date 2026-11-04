#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex30_support/obj build/codex30_support/libraries
# Reuse the recorded prior object inputs; the new link verifier checks them again.
cp -a build/codex30_assembler/obj/. build/codex30_support/obj/
cp -a build/codex30_assembler/libraries/. build/codex30_support/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex30_support/link.mk -j8 IN_IMAGE=1 B=build/codex30_support \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex30_support/libraries/alloc.obj build/codex30_support/libraries/errors.obj
python3 scratch/codex30_support/check.py --clean
python3 scratch/codex30_support/select_dependencies.py
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex30_support/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex30_support/dependencies/d3dx9.lib && make -f scratch/codex30_support/link.mk -j8 IN_IMAGE=1 B=build/codex30_support SRCDIR=scratch/codex25_dxerr/link_src build/codex30_support/gfx.dll'
