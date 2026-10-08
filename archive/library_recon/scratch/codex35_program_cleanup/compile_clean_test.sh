#!/bin/sh
set -eu
here=scratch/codex35_program_cleanup
run=build/codex35_program_cleanup
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/clean_test.obj" scratch/codex35_expression/test.cpp
wine /opt/msvc710/Vc7/bin/link.exe /nologo /OPT:NOREF /map:"$here/original_clean.map" /out:"$here/original_clean.exe" "$here/clean_test.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /OPT:NOREF /map:"$here/source_clean.map" /out:"$here/source_clean.exe" "$here/clean_test.obj" "$run/libraries/"*.obj "$run/dependencies/runtime_new.lib" "$run/dependencies/d3dx9.lib" gdi32.lib advapi32.lib
