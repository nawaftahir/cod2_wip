#!/bin/sh
set -eu
here=scratch/codex30_support
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/test.obj" "$here/test.cpp"
wine /opt/msvc710/Vc7/bin/link.exe /nologo /out:"$here/test_original.exe" "$here/test.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /out:"$here/test_source.exe" "$here/test.obj" \
    build/codex30_support/libraries/*.obj build/codex30_support/dependencies/d3dx9.lib gdi32.lib advapi32.lib
