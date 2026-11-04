#!/bin/sh
set -eu
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /MT \
    /Foscratch/codex30_parser/test_parsers.obj scratch/codex30_parser/test_parsers.cpp
wine /opt/msvc710/Vc7/bin/link.exe /nologo /OPT:REF /OPT:ICF \
    /OUT:scratch/codex30_parser/test_original.exe scratch/codex30_parser/test_parsers.obj \
    d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /OPT:REF /OPT:ICF \
    /OUT:scratch/codex30_parser/test_source.exe scratch/codex30_parser/test_parsers.obj \
    build/codex30_parser/libraries/d3dxtok.obj build/codex30_parser/libraries/d3dxasm.obj \
    build/codex30_parser/libraries/d3dxshader.obj build/codex30_parser/libraries/instruction_predicates.obj \
    build/codex30_parser/libraries/shader_native_constants.obj \
    build/codex30_parser/dependencies/d3dx9.lib gdi32.lib advapi32.lib
