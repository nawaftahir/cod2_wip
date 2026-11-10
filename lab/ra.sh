#!/bin/sh
# ra.sh TAG MANGLED: split the ra log for one fn and print colour picks (w7-b)
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b
T=../../client-1.0/tools/oracle
d=build/ra/$1_$(echo "$2" | tr -dc 'A-Za-z0-9' | cut -c1-24)
rm -rf $d; mkdir -p $d
python3 $T/split_all.py build/ra/$1.txt $d "$2" >/dev/null
f=$(ls $d/*.txt | head -1)
python3 $T/cpick.py $f > $d/pick.out
echo $d; wc -l $d/pick.out
