#!/bin/sh
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w11-zs
export ANCHOR=/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004
make release > build_base.log 2>&1; echo rc=$?
python3 tools/shameter.py build/release/CoD2MP_s.exe $ANCHOR | grep -i same | head -2
