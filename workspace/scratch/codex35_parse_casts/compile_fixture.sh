#!/bin/sh
set -eu
here=scratch/codex35_parse_casts
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/test_evaluator.obj" "$here/test_evaluator.cpp"
wine /opt/msvc710/Vc7/bin/lib.exe /nologo /out:Z:\\tmp\\casts_dependencies.lib @build/codex35_parse_casts/dependencies/members.rsp
cp /tmp/casts_dependencies.lib "$here/casts_dependencies.lib"
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/original.map" /out:"$here/original.exe" "$here/test_evaluator.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/source.map" /out:"$here/source.exe" "$here/test_evaluator.obj" build/codex35_parse_casts/libraries/casts.obj "$here/casts_dependencies.lib" gdi32.lib advapi32.lib
