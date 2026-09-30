#!/bin/sh
set -eu
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include'
mkdir -p scratch/codex30_parser/obj
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy \
    /Foscratch/codex30_parser/obj/ scratch/codex30_parser/d3dxtok.cpp \
    scratch/codex30_parser/d3dxasm.cpp scratch/codex30_parser/d3dxshader.cpp
