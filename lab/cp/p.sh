#!/bin/sh
# p.sh [V list]: compile p.cpp per V (/O2) and print probe()
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b/lab/cp
L=${*:-0 1 2 3 4 5 6}
docker run --rm -e L="$L" -e F="$F" -v $(pwd):/p -w /p cod2-msvc71-vs2003 sh -c '
for v in $L; do wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /DV=$v $F /Fop$v.obj p.cpp >p$v.log 2>&1; done; chmod 666 *'
for v in $L; do echo "== V$v"; grep -i error p$v.log
  objdump -d -M intel --no-show-raw-insn p$v.obj | awk '/probe/{f=1;next} f&&n<12{sub(/^[ \t]*[0-9a-f]+:\t/,"");print;n++}'
done
