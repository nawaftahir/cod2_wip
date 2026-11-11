#!/bin/sh
# oall.sh: probe under each optimisation setting
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w11-zs/lab_dl/zp
sh o.sh o2 "/O2"
sh o.sh os "/Os"
sh o.sh o1 "/O1"
sh o.sh o2os "/O2 /Os"
sh o.sh oxos "/Ox /Os"
sh o.sh o2oy "/Og /Oi /Os /Oy /Ob2 /Gs /GF /Gy"
sh o.sh pts "/O2 /DPS"
sh o.sh ptoff "/O2 /DPT"
sh o.sh pboth "/O2 /DPS /DPT"
