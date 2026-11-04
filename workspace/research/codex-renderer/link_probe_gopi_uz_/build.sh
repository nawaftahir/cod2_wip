set -e
cl /nologo /W3 /O2 /c 'Z:\inputs\dxsdk_probe.cpp' '/IZ:\dxsdk\Include' '/FoZ:\out\probe.obj'
wine /opt/msvc710/Vc7/bin/link.exe /DLL /NOENTRY /NODEFAULTLIB /MACHINE:X86 '/OUT:Z:\out\probe.dll' '/IMPLIB:Z:\out\probe.lib' /FILEALIGN:4096 /BASE:0x10000000 'Z:\out\probe.obj' 'Z:\dxsdk\Lib\x86\d3d9.lib'
wine /opt/msvc710/Vc7/bin/dumpbin.exe /headers /imports 'Z:\out\probe.dll'
