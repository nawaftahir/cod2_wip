#!/bin/sh
# base.sh: clean release build of w10-os, log to build/base.log
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w10-os
export ANCHOR=/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004
mkdir -p build
make release > build/base.log 2>&1; echo rc=$?
tail -5 build/base.log
