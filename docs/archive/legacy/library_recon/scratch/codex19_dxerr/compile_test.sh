#!/bin/sh
set -eu
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib'
wine /w/scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT \
    /DDXGetErrorString9A=CodexErrorString9A \
    /Foscratch/codex19_dxerr/fixture_lookup.obj scratch/codex19_dxerr/group_sdk_leaf.cpp
cl /nologo /O2 /MT /Foscratch/codex19_dxerr/test_lookup.obj \
    /Fescratch/codex19_dxerr/test_lookup.exe scratch/codex19_dxerr/test_lookup.cpp \
    scratch/codex19_dxerr/fixture_lookup.obj /link /LIBPATH:Z:/dxsdk/Lib DxErr9.lib user32.lib
