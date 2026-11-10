#!/bin/sh
# rt.sh A B: retail disasm A..B
objdump -d -M intel --no-show-raw-insn --start-address=$1 --stop-address=$2 /home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe | sed -n '8,$p' | cut -f2-
