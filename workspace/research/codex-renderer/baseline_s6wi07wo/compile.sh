cl /nologo /c /W3 /O1 '/IZ:\inputs\include' 'Z:\inputs\src\tu\tinyZ.c' '/FoZ:\out\job000.obj' > /out/job000.log 2>&1
echo $? > /out/job000.status
cl /nologo /c /W3 /O1 '/IZ:\inputs\include' 'Z:\inputs\src\tu\tinyX.c' '/FoZ:\out\job001.obj' > /out/job001.log 2>&1
echo $? > /out/job001.status
cl /nologo /c /W3 /O1 '/IZ:\inputs\include' 'Z:\inputs\src\tu\tinyY.c' '/FoZ:\out\job002.obj' > /out/job002.log 2>&1
echo $? > /out/job002.status
cl /nologo /c /W3 /O1 '/IZ:\inputs\include' 'Z:\inputs\src\tu\tiny21.c' '/FoZ:\out\job003.obj' > /out/job003.log 2>&1
echo $? > /out/job003.status
cl /nologo /c /W3 /O1 '/IZ:\inputs\include' 'Z:\inputs\src\tu\tiny22.c' '/FoZ:\out\job004.obj' > /out/job004.log 2>&1
echo $? > /out/job004.status
cl /nologo /c /W3 /O1 '/IZ:\inputs\include' 'Z:\inputs\src\tu\tinyT.c' '/FoZ:\out\job005.obj' > /out/job005.log 2>&1
echo $? > /out/job005.status
