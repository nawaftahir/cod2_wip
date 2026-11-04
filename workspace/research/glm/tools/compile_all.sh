#!/bin/bash
# Parallel MSVC compile of every src/f/*.c -> build/objs/
cd /work/src/f
ls *.c | xargs -P 8 -I{} sh -c 'cl /nologo /c /W0 /O2 /I../../include "{}" /Fo"../../build/objs/{}.obj" >/dev/null 2>&1'
ls /work/build/objs/*.obj | wc -l
