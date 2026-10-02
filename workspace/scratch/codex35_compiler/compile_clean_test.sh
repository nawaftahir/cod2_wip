#!/bin/sh
set -eu
here=scratch/codex35_compiler
run=build/codex35_compiler
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/clean_test.obj" "$here/test.cpp"
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/clean_original.map" /out:"$here/clean_original.exe" "$here/clean_test.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /map:"$here/clean_source.map" /out:"$here/clean_source.exe" "$here/clean_test.obj" "$run/libraries/"*.obj "$run/dependencies/runtime_new.lib" "$run/dependencies/d3dx9.lib" gdi32.lib advapi32.lib
