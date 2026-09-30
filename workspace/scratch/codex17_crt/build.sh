#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
docker run --rm --network none -v "$dev/glm:/crt:ro" -v "$dev/gfx/target:/w" -w /w \
    sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 \
    sh /w/scratch/codex17_crt/compile.sh
docker run --rm --network none -v "$dev/glm:/crt:ro" -v "$dev/gfx/target:/w" -w /w \
    sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 \
    sh /w/scratch/codex17_crt/compile.sh globals
python3 "$here/discover.py"
python3 "$here/check.py"
