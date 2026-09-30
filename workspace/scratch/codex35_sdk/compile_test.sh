#!/bin/sh
set -eu
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /MT \
    /Foscratch/codex35_sdk/test_predicates.obj scratch/codex35_sdk/test_predicates.cpp
wine /opt/msvc710/Vc7/bin/link.exe /nologo /OPT:REF /OPT:ICF \
    /OUT:scratch/codex35_sdk/test_predicates.exe scratch/codex35_sdk/test_predicates.obj \
    d3dx9.lib gdi32.lib advapi32.lib
wine scratch/codex35_sdk/test_predicates.exe
