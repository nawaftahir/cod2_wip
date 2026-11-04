#!/bin/sh
# What __FILE__ MSVC 7.1 writes for an #included .cpp vs a .cpp named on the command line.
# Run from radiant/: docker run --rm -v $PWD:/w -w /w/research/filemap/probe/once/radiant cod2-radiant-msvc71 sh ../run.sh
cl() { wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 "$@" >/dev/null; }
cl /Fou.obj unit.cpp; cl /Foe.obj .\\ed.cpp; cl /Foe2.obj ed.cpp; cl /Fom.obj ..\\src\\universal\\m.cpp
for o in u e e2 m; do echo "== $o"; grep -ao '[a-z:.\\/]*[a-z_]*\.\(cpp\|h\)' $o.obj | sort -u; rm -f $o.obj; done
