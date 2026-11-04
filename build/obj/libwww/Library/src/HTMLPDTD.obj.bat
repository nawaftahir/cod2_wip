@echo off
cd \builds\pc_1.3_1_1\pc
Z:\opt\msvc710\Vc7\bin\cl.exe /nologo /c /O2 /MT /DNDEBUG /DWIN32 /D_WINDOWS /I\builds\pc_1.3_1_1\pc\cod2src\libwww\Library\src  /showIncludes /FoZ:\w\build\obj\libwww\Library\src\HTMLPDTD.obj \builds\pc_1.3_1_1\pc\cod2src\libwww\Library\src\HTMLPDTD.c
