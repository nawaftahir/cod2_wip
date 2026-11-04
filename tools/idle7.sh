#!/bin/bash
# idle7.sh: wait until no build (make release / cl.exe / link.exe) runs anywhere (max ~9 min)
for i in $(seq 1 54); do
  [ -z "$(pgrep -f 'make release|cl\.exe|link\.exe')" ] && { echo idle; exit 0; }
  sleep 10
done
echo busy
