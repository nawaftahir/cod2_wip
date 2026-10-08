#!/bin/sh
set -eu
here=scratch/codex35_unary
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/math_test.obj" "$here/math_test.cpp"
wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\math_dependencies.lib @build/codex35_unary_math/dependencies/members.rsp
cp /tmp/math_dependencies.lib "$here/math_dependencies.lib"
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/math_original.map" /out:"$here/math_original.exe" "$here/math_test.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/math_source.map" /out:"$here/math_source.exe" "$here/math_test.obj" "$here/obj/math.obj" "$here/math_dependencies.lib" gdi32.lib advapi32.lib
