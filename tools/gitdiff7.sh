#!/bin/bash
# gitdiff7.sh <TU...>: non-blank diff line count and diff of our libwww TU vs libwww-git
S=/home/nawaf/cod2/test/dev/claude_client13/lab13/w7/target/src/libwww/Library/src
G=/home/nawaf/cod2/test/dev/refrences/libwww-git/Library/src
for f in "$@"; do
  n=$(diff -B -w $S/$f.c $G/$f.c | grep '^[<>]' | grep -vc '^[<>] *$')
  echo "== $f $n"
  [ -n "$SHOW" ] && diff -B -w $S/$f.c $G/$f.c
done
