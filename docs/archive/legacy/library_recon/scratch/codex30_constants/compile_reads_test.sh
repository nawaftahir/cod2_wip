#!/bin/sh
set -eu
here=scratch/codex30_constants
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy \
    /Fo"$here/obj/shader_metadata.obj" "$here/shader_metadata.cpp"
for mode in original source
do
    definition=''
    if test "$mode" = original
    then
        definition='/DORIGINAL'
    fi
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy $definition \
        /Fo"$here/obj/test_$mode.obj" "$here/test_reads.cpp"
    wine /opt/msvc710/Vc7/bin/link.exe /nologo /out:"$here/test_$mode.exe" \
        "$here/obj/test_$mode.obj" d3dx9.lib gdi32.lib advapi32.lib
done
