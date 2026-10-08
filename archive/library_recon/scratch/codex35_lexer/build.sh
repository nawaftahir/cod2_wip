#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex35_lexer/obj build/codex35_lexer/libraries
cp -a build/codex30_support/obj/. build/codex35_lexer/obj/
cp -a build/codex30_support/libraries/. build/codex35_lexer/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex35_lexer/link.mk -j8 IN_IMAGE=1 B=build/codex35_lexer \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex35_lexer/libraries/lexer.obj
python3 scratch/codex35_lexer/check.py --clean
python3 scratch/codex35_lexer/select_dependencies.py
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex35_lexer/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex35_lexer/dependencies/d3dx9.lib && make -f scratch/codex35_lexer/link.mk -j8 IN_IMAGE=1 B=build/codex35_lexer SRCDIR=scratch/codex25_dxerr/link_src build/codex35_lexer/gfx.dll'
