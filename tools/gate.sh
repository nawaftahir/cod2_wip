#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
: "${GFX_IMAGE:=$(cat toolchain/image.txt)}"
export GFX_IMAGE
mkdir -p build
started=$(date +%s)
sh workspace/work/tools/build.sh --rebuild >build/gate.log 2>&1
python3 tools/write_meter.py "$started"
