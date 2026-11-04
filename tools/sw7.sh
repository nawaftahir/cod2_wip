#!/bin/bash
# sw7.sh <relative-file> <signature-start>: copy a function from the 1.3 server source into our tree
R=/home/nawaf/cod2/test/dev/cod2engine/archive/lnxded-1.3/src
W=/home/nawaf/cod2/test/dev/cod2_wip/client-1.3/lab13/w7
python3 $W/tools/swapfn7.py $R/$1 $W/target/src/$1 "$2"
