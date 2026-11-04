#!/bin/sh
# Build (unless 'nobuild') and measure vs build/cmp_base.json. Run from anywhere.
cd /home/nawaf/cod2/test/dev/cod2_wip/client-1.0 || exit 1
[ "$1" = nobuild ] || { make > build/b.txt 2>&1; grep -i ' error' build/b.txt | head -5; }
python3 tools/cmp.py build/CoD2MP_s.exe build/CoD2MP_s.map ../binaries/windows/1.0/CoD2MP_s.exe build/cmp.json >/dev/null
python3 tools/cov.py build/cmp.json | head -1
python3 tools/delta.py build/cmp_base.json build/cmp.json 30
