#!/bin/bash
cd /work/src/f
ls *.c | xargs -P 8 -I{} sh -c 'cl /nologo /c /W0 /O2 /Oy- /I../../include "{}" /Fo"../../build/objs_fp/{}.obj" >/dev/null 2>&1'
ls /work/build/objs_fp/*.obj | wc -l
