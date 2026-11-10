#!/bin/sh
# wp.sh N: in the c2dbg13 AddLine run, break at the colour pop hook 0x10782a5e and print node (ebp), id (+0x1c), n16 (+0x40), n17 (+0x44)
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-c
{ echo cont; echo "break *0x10782a5e"; i=0; while [ $i -lt $1 ]; do echo cont; echo 'x /1x $ebp+0x1c'; echo 'x /2x $ebp+0x40'; echo 'p $ebp'; i=$((i+1)); done; echo quit; } > build/ra/w.cmd
TMO=1400 bash tools/c2dbg13.sh '?CL_ConsolePrint_AddLine@@YAHW4print_msg_type_t@@PBDHHH@Z' build/ra/w.cmd > /dev/null 2>&1
grep -a -A4 "Stopped on breakpoint" build/ra/dbg.out | grep -a -v Stopped > build/ra/wp.out
wc -l < build/ra/wp.out
