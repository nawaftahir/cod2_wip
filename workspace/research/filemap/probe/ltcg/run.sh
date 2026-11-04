#!/bin/sh
# Does LTCG inline a forwarding wrapper from another file? (zcfree -> Z_FreeInternal -> free)
# Run from radiant/: docker run --rm -v $PWD:/w -w /w/research/filemap/probe/ltcg cod2-radiant-msvc71 sh run.sh
cl() { wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Oy- /Op /GL /MT "$@" >/dev/null; }
cl mem.cpp; cl zutil.c
wine /opt/msvc710/Vc7/bin/link.exe /nologo /LTCG /DEBUG /MAP:t.map /OUT:t.exe mem.obj zutil.obj >/dev/null
grep -i "zcfree\|Z_FreeInternal\| _free \|FileSeek\|seekend\| _fseek " t.map; python3 dis.py
