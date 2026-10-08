#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
cd "$dev/gfx/target"
mkdir -p build/codex35_preprocessor/obj build/codex35_preprocessor/libraries
cp -a build/codex35_lexer/obj/. build/codex35_preprocessor/obj/
cp -a build/codex35_lexer/libraries/. build/codex35_preprocessor/libraries/
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex35_preprocessor/link.mk -j8 IN_IMAGE=1 B=build/codex35_preprocessor \
        SRCDIR=scratch/codex25_dxerr/link_src build/codex35_preprocessor/libraries/preprocessor.obj
python3 scratch/codex35_preprocessor/check.py --clean
python3 scratch/codex35_preprocessor/select_dependencies.py
python3 - <<'PY'
from pathlib import Path
import hashlib
source = Path('scratch/codex30_cpp/obj/mt/new.obj')
assert hashlib.sha256(source.read_bytes()).hexdigest() == 'b50d9802dcd8d135e5159c0de26fff5cf8bd43e99af1244bd609d743ebb8723a'
Path('build/codex35_preprocessor/dependencies/new.obj').write_bytes(source.read_bytes())
PY
docker run --rm --network none -v "$dev/gfx/target:/w" -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    sh -c 'wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:build\\codex35_preprocessor\\dependencies\\runtime_new.lib build\\codex35_preprocessor\\dependencies\\new.obj && wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\d3dx9_source.lib @build/codex35_preprocessor/dependencies/members.rsp && cp /tmp/d3dx9_source.lib build/codex35_preprocessor/dependencies/d3dx9.lib && make -f scratch/codex35_preprocessor/link.mk -j8 IN_IMAGE=1 B=build/codex35_preprocessor SRCDIR=scratch/codex25_dxerr/link_src build/codex35_preprocessor/gfx.dll'
