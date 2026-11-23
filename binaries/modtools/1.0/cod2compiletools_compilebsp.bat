@ECHO OFF

set bsppath=%~1
set mapsourcepath=%~2
set treepath=%~3
set mapname=%4
set platform=%5
set parmBSPOptions=%~6
set parmLightOptions=%~7
set compileBSP=%8
set compileLight=%9
shift
set compilePaths=%9
shift
set runmap=%9
shift
set mpmap=%9
shift
set compileVis=%9

if "%parmBSPoptions%" == "-" (
	set parmBSPoptions=
)

if "%parmLightOptions%" == "-" (
	set parmLightOptions=
)

mkdir "%treepath%main\maps\"
mkdir "%treepath%main\maps\mp"

if "%compileBSP%" == "1" (
	copy "%mapsourcepath%%mapname%.map" "%bsppath%%mapname%.map"
	chdir "%treepath%bin"
	cod2map -platform %platform% %parmBSPOptions% "%bsppath%%mapname%"
)

if "%compileVis%" == "1" (
	chdir "%treepath%bin"
	cod2map -vis -platform %platform% "%bsppath%%mapname%"
)

if "%compileLight%" == "1" (
	IF EXIST "%mapsourcepath%%mapname%.grid"	copy "%mapsourcepath%%mapname%.grid" "%bsppath%%mapname%.grid"
	IF EXIST "%mapsourcepath%%mapname%.vclog"	copy "%mapsourcepath%%mapname%.vclog" "%bsppath%%mapname%.vclog"
	IF EXIST "%bsppath%%mapname%.map"			del "%bsppath%%mapname%.map"
	chdir "%treepath%bin"
	cod2rad -platform %platform% %parmLightOptions% "%bsppath%%mapname%"
)

IF EXIST "%bsppath%%mapname%.map"		del "%bsppath%%mapname%.map"
IF EXIST "%bsppath%%mapname%.d3dpoly"	del "%bsppath%%mapname%.d3dpoly"
IF EXIST "%bsppath%%mapname%.vclog"		del "%bsppath%%mapname%.vclog"
IF EXIST "%bsppath%%mapname%.grid"		del "%bsppath%%mapname%.grid"
IF EXIST "%bsppath%%mapname%.lin"		move "%bsppath%%mapname%.lin" "%mapsourcepath%%mapname%.lin"

chdir "%treepath%bin"

if "%compilePaths%" == "1" (
	goto CONNECTPATHS
) else (
	goto RUNMAP
)

:CONNECTPATHS
echo Connecting Paths on %mapname%...
echo runmap value: %runmap%
echo compilePaths value: %compilePaths%
if "%runmap%" == "1" (
	call cod2compiletools_runmap.bat %platform% "%treepath%" %mapname% "+set g_connectpaths 1"
	goto END
) else (
	call cod2compiletools_runmap.bat %platform% "%treepath%" %mapname% "+set g_connectpaths 2"
	goto END
)

:RUNMAP
if "%runmap%" == "1" (
	echo Starting %mapname%...
	call cod2compiletools_runmap.bat %platform% "%treepath%" %mapname% %mpmap%
	goto END
)

:END
pause
::cls