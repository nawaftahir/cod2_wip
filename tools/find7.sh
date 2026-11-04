#!/bin/bash
# find7.sh <regex>: where a function definition starts, in the 1.3 server source and in our tree
D=/home/nawaf/cod2/test/dev
for f in "$@"; do
  echo "== $f"
  grep -rn "^$f" $D/cod2engine/archive/lnxded-1.3/src --include=*.cpp --include=*.c | cut -c1-140 | sed "s#$D/cod2engine/archive/lnxded-1.3/src#SRV#"
  grep -rn "^$f" $D/claude_client13/lab13/w7/target/src --include=*.cpp --include=*.c | cut -c1-140 | sed "s#$D/claude_client13/lab13/w7/target/src#OUR#"
done
