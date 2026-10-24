#!/bin/sh
# A /GL function with no callers gets a register convention under /LTCG. Does /INCLUDE keep it on the stack?
# Run from radiant/: docker run --rm -v $PWD:/w -w /w/research/filemap/probe/addr cod2-radiant-msvc71 sh run.sh
cl() { wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Oy- /Op "$@" >/dev/null; }
cl /GL a.cpp; cl m.c
for opt in "" "/INCLUDE:?ShortSwap@@YAFF@Z"; do
  wine /opt/msvc710/Vc7/bin/link.exe /nologo /LTCG /DEBUG /MAP:t.map /OUT:t.exe m.obj a.obj $opt >/dev/null
  a=$(grep 'ShortSwap' t.map | awk '{print $3}')
  python3 -c "
import pefile; pe=pefile.PE('t.exe'); print('$opt' or 'none', pe.get_data(int('$a',16)-0x400000,12).hex())"
done
