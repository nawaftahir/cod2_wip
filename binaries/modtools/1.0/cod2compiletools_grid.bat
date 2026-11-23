@ECHO OFF

set treepath=%~1
set makelog=%2
set cullxmodel=%3
set mapname=%4

mkdir "%treepath%main\maps\"
IF EXIST "%treepath%\map_source\%mapname%.grid"		copy "%treepath%\map_source\%mapname%.grid" "%treepath%main\maps\%mapname%.grid"

cd %treepath%

CoD2SP_s.exe +set developer 1 +set logfile 2 +set r_vc_makelog %makelog% +set r_vc_showlog 16 +set r_cullxmodel %cullxmodel% +set thereisacow 1337 +set com_introplayed 1 +devmap %mapname%

IF EXIST "%treepath%\map_source\%mapname%.grid"         attrib -r "%treepath%\map_source\%mapname%.grid"
IF EXIST "%treepath%main\maps\%mapname%.grid"	move /y "%treepath%main\maps\%mapname%.grid" "%treepath%\map_source\%mapname%.grid"

cls