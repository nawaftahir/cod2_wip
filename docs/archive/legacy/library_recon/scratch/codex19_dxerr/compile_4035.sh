#!/bin/sh
set -eu
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include'
wine /w/scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT \
    /IZ:/dxsdk/Include /IZ:/opt/msvc710/Vc7/PlatformSDK/Include \
    /Foscratch/codex19_dxerr/group_4035_sdk_leaf.obj scratch/codex19_dxerr/group_sdk_leaf.cpp
