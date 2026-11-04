cl /nologo /c /W3 /O2 /Gy /TP 'Z:\inputs\jcphuff.c' '/FoZ:\out\job000.obj' > /out/job000.log 2>&1
echo $? > /out/job000.status
cl /nologo /c /W3 /O2 /Gy /TP 'Z:\inputs\jdinput.c' '/FoZ:\out\job001.obj' > /out/job001.log 2>&1
echo $? > /out/job001.status
cl /nologo /c /W3 /O2 /Gy /TP 'Z:\inputs\jquant1.c' '/FoZ:\out\job002.obj' > /out/job002.log 2>&1
echo $? > /out/job002.status
cl /nologo /c /W3 /O2 /Gy /TP 'Z:\inputs\jquant2.c' '/FoZ:\out\job003.obj' > /out/job003.log 2>&1
echo $? > /out/job003.status
