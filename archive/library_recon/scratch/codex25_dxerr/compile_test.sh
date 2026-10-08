#!/bin/sh
set -eu
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib'
for stem in name name_w description_a description_w
do
    wine /w/scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT \
        /DDXGetErrorString9A=CodexNameA /DDXGetErrorString9W=CodexNameW \
        /DDXGetErrorDescription9A=CodexDescriptionA /DDXGetErrorDescription9W=CodexDescriptionW \
        "/Foscratch/codex25_dxerr/fixture_$stem.obj" "src/codex_libraries/dxerr9_$stem.cpp"
done
cl /nologo /O2 /MT /IZ:/dxsdk/Include \
    /Foscratch/codex25_dxerr/test_lookup.obj /Fescratch/codex25_dxerr/test_lookup.exe \
    scratch/codex25_dxerr/test_lookup.cpp scratch/codex25_dxerr/fixture_name.obj \
    scratch/codex25_dxerr/fixture_name_w.obj scratch/codex25_dxerr/fixture_description_a.obj \
    scratch/codex25_dxerr/fixture_description_w.obj /link /LIBPATH:Z:/dxsdk/Lib DxErr9.lib user32.lib
