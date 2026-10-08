#!/bin/sh
set -eu
here=scratch/codex30_instructions
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
export LIB='Z:\opt\msvc710\Vc7\lib;Z:\opt\msvc710\Vc7\PlatformSDK\lib;Z:\dxsdk\Lib'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /MT /Gy /Fo"$here/test.obj" "$here/test.cpp"
wine /opt/msvc710/Vc7/bin/link.exe /nologo /out:"$here/test_original.exe" "$here/test.obj" d3dx9.lib gdi32.lib advapi32.lib
wine /opt/msvc710/Vc7/bin/link.exe /nologo /out:"$here/test_source.exe" "$here/test.obj" \
    build/codex30_instructions/libraries/instruction_copy.obj build/codex30_instructions/libraries/shader_profiles.obj \
    build/codex30_instructions/libraries/cparse_cast.obj \
    build/codex30_instructions/libraries/instruction_predicates.obj build/codex30_instructions/libraries/shader_native_constants.obj \
    build/codex30_instructions/libraries/d3dxtok.obj build/codex30_instructions/libraries/d3dxasm.obj build/codex30_instructions/libraries/d3dxshader.obj \
    build/codex30_instructions/libraries/read_typed.obj build/codex30_instructions/libraries/shader_version.obj \
    build/codex30_instructions/dependencies/d3dx9.lib gdi32.lib advapi32.lib
