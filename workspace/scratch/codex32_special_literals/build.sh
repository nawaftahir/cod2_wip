#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex32_special_literals/obj build/codex32_special_literals/libraries
cp -a build/codex32_program_diagnostics/obj/. build/codex32_special_literals/obj/
cp -a build/codex32_program_diagnostics/libraries/. build/codex32_special_literals/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex32_special_literals/link.mk -j8 IN_IMAGE=1 B=build/codex32_special_literals \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex32_special_literals/libraries/special_literals.obj
python3 scratch/codex32_special_literals/check.py --clean
python3 scratch/codex32_special_literals/select_link_dependencies.py
cp build/codex32_program_diagnostics/dependencies/new.obj build/codex32_special_literals/dependencies/new.obj
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:build\\codex32_special_literals\\dependencies\\runtime_new.lib build\\codex32_special_literals\\dependencies\\new.obj && wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex32_special_literals/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex32_special_literals/dependencies/d3dx9.lib && make -f scratch/codex32_special_literals/link.mk -j8 IN_IMAGE=1 B=build/codex32_special_literals SRCDIR=scratch/codex25_dxerr/link_src build/codex32_special_literals/gfx.dll'
