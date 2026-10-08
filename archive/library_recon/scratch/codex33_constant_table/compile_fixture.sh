#!/bin/sh
set -eu
here=scratch/codex33_constant_table
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/test_constants.obj" "$here/test_constants.cpp"
wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\constant_dependencies.lib @build/codex33_constant_table/fixture/dependencies/members.rsp
cp /tmp/constant_dependencies.lib "$here/constant_dependencies.lib"
wine /opt/msvc710/Vc7/bin/link.exe /nologo /OPT:NOREF /OPT:NOICF /map:"$here/original.map" /out:"$here/original.exe" "$here/test_constants.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /OPT:NOREF /OPT:NOICF /map:"$here/source.map" /out:"$here/source.exe" "$here/test_constants.obj" build/codex33_constant_table/libraries/matched.obj "$here/constant_dependencies.lib" gdi32.lib advapi32.lib
