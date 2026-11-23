@ECHO OFF

set platform=%1
set treepath=%~2
set mapname=%3
set mpmap=%4
set cmdOptions=%~5

cd %treepath%

if "%mpmap%" == "1" (
	CoD2MP_s.exe +set developer 1 +set logfile 2 +set monkeytoy 0 +set thereisacow 1337 +set com_introplayed 1 +set g_gametype dm +set sv_pure 0 %cmdOptions% +devmap %mapname%
) else (
	CoD2SP_s.exe +set developer 1 +set logfile 2 +set monkeytoy 0 +set thereisacow 1337 +set com_introplayed 1 %cmdOptions% +devmap %mapname%
)