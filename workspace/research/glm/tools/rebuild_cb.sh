#!/bin/sh
# atomic rebuild+verify for cluster TU - NO silent failures
cd /home/nawaf/cod2/test/dev/glm || exit 1
rm -f build/objs_red/cb.obj
docker run --rm -v $PWD:/work -w /work/src/tu cod2-msvc71 sh -c "cl /nologo /W0 /O2 /c clustb.c /Fo../../build/objs_red/cb.obj" 2>&1 | grep -iv wine | grep -iE "error|warning" 
if [ ! -f build/objs_red/cb.obj ]; then echo "BUILD FAILED - obj absent"; exit 1; fi
ls -la build/objs_red/cb.obj | awk '{print "FRESH obj:",$5,"B",$(NF-1),$(NF-2)}'
python3 tools/tu_diff.py objs_red/cb.obj 10060c10=F60c10 1000c910=C910 100171f0=F171f0 1000fa40=FA40 1000f900=Sub_1000f900 1000f2a0=Sub_1000f2a0
