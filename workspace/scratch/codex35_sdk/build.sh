#!/bin/sh
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dev=$(CDPATH= cd -- "$here/../../../.." && pwd)
docker run --rm --network none -v "$dev/gfx/target:/w" \
    -v "$dev/sdk/sum2004:/dxsdk:ro" -w /w \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    make -f scratch/codex35_sdk/link.mk -j8 IN_IMAGE=1 \
        B=build/codex35_sdk SRCDIR=scratch/codex25_dxerr/link_src build/codex35_sdk/gfx.dll
docker run --rm --network none -v "$dev/gfx/target/build/codex35_sdk:/output" \
    sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131 \
    chown -R "$(id -u):$(id -g)" /output
