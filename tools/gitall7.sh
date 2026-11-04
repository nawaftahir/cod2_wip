#!/bin/bash
# gitall7.sh: every libwww .c file whose non-blank diff vs libwww-git is more than the Id line
S=/home/nawaf/cod2/test/dev/claude_client13/lab13/w7/target/src/libwww/Library/src
G=/home/nawaf/cod2/test/dev/refrences/libwww-git/Library/src
for p in $S/*.c; do
  f=$(basename $p)
  [ -f $G/$f ] || { echo "$f NOT-IN-GIT"; continue; }
  n=$(diff -B -w $p $G/$f | grep '^[<>]' | grep -v '^[<>] *$' | grep -vc '@(#)')
  [ "$n" != 0 ] && echo "$f $n"
done
