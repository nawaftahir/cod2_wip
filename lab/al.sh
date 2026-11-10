#!/bin/sh
# al.sh TAG: split the ra log for CL_ConsolePrint_AddLine and print colour picks
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-c
T=../../client-1.0/tools/oracle
rm -rf build/ra/al_$1; mkdir -p build/ra/al_$1
python3 $T/split_all.py build/ra/$1.txt build/ra/al_$1 '?CL_ConsolePrint_AddLine@@YAHW4print_msg_type_t@@PBDHHH@Z' >/dev/null
f=$(ls build/ra/al_$1/*.txt | head -1)
python3 $T/cpick.py $f > build/ra/al_$1/pick.out
wc -l build/ra/al_$1/pick.out
