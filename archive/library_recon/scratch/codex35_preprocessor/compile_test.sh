#!/bin/sh
set -eu
here=scratch/codex35_preprocessor
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/test.obj" "$here/test.cpp"
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/tokenizer.obj" scratch/codex35_lexer/test.cpp
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/regression.obj" scratch/codex30_support/test.cpp
for fixture in test tokenizer regression
do
    wine /opt/msvc710/Vc7/bin/link.exe /nologo /out:"$here/${fixture}_original.exe" "$here/$fixture.obj" \
        build/codex35_preprocessor/dependencies/runtime_new.lib d3dx9.lib gdi32.lib advapi32.lib
    wine /opt/msvc710/Vc7/bin/link.exe /nologo /out:"$here/${fixture}_source.exe" "$here/$fixture.obj" \
        build/codex35_preprocessor/libraries/*.obj build/codex35_preprocessor/dependencies/runtime_new.lib \
        build/codex35_preprocessor/dependencies/d3dx9.lib gdi32.lib advapi32.lib
done
