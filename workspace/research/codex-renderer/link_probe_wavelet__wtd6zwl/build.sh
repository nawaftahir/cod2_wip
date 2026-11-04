set -e
wine /opt/msvc710/Vc7/bin/link.exe /DLL /NOENTRY /NODEFAULTLIB /MACHINE:X86 /OPT:NOREF /OPT:NOICF /BASE:0x10000000 /FILEALIGN:4096 /EXPORT:Wavelet_DecompressLevel '/OUT:Z:\out\wavelet.dll' '/IMPLIB:Z:\out\wavelet.lib' '/MAP:Z:\out\wavelet.map' 'Z:\functions\job000.obj' 'Z:\tables\tables.obj'
