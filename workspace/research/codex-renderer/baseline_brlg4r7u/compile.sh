cl /nologo /c /W3 /O1 /Oy- '/IZ:\inputs\include' 'Z:\inputs\src\tu\tinyD.c' '/FoZ:\out\job000.obj' > /out/job000.log 2>&1
echo $? > /out/job000.status
cl /nologo /c /W3 /O1 /Oy- '/IZ:\inputs\include' 'Z:\inputs\src\tu\tinyH.c' '/FoZ:\out\job001.obj' > /out/job001.log 2>&1
echo $? > /out/job001.status
