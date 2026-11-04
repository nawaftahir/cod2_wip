#!/bin/sh
set -eu
here=scratch/codex35_unary
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/trig_test.obj" scratch/codex35_expression/test.cpp
wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\trig_dependencies.lib @build/codex35_unary_trig/dependencies/members.rsp
cp /tmp/trig_dependencies.lib "$here/dependencies.lib"
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/original.map" /out:"$here/original.exe" "$here/trig_test.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/source.map" /out:"$here/source.exe" "$here/trig_test.obj" "$here/obj/trig_ordered.obj" "$here/dependencies.lib" gdi32.lib advapi32.lib
