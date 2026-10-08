#!/bin/sh
set -eu
cl /nologo /O2 /MT /IZ:/dxsdk/Include \
    /Foscratch/codex25_dxerr/oracle.obj /Fescratch/codex25_dxerr/oracle.exe \
    scratch/codex25_dxerr/oracle.cpp /link /LIBPATH:Z:/dxsdk/Lib DxErr9.lib user32.lib
