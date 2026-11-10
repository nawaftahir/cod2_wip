#!/bin/sh
# w47.sh ADDR N: watch a c2 heap dword during the AddLine compile, log every write (EIP + new value)
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-c
{ echo cont; echo "watch *$1"; i=0; while [ $i -lt $2 ]; do echo cont; i=$((i+1)); done; echo quit; } > build/ra/w.cmd
TMO=1400 bash tools/c2dbg13.sh '?CL_ConsolePrint_AddLine@@YAHW4print_msg_type_t@@PBDHHH@Z' build/ra/w.cmd > /dev/null 2>&1
grep -a Stopped build/ra/dbg.out | awk '{print NR, $6, $NF}' > build/ra/w.out
wc -l < build/ra/w.out
