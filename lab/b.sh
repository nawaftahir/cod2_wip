#!/bin/sh
# b.sh FN [ctx]: fdiff one fn ours vs retail 1.3 (w7-b)
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b
a=$(grep -F "?$1@" build/release/CoD2MP_s.map | head -1 | awk '{print $3}')
python3 tools/fdiff.py build/release/CoD2MP_s.exe build/release/CoD2MP_s.map ../../binaries/windows/1.3/CoD2MP_s.exe "$1" 0x$a 2000 | grep -B${2:-4} -A${2:-4} "^[-+@]"
