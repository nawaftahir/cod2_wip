cl /nologo /c /W3 /O1 /Gy 'Z:\inputs\j_dxerr_a.c' '/FoZ:\out\job000.obj' > /out/job000.log 2>&1
echo $? > /out/job000.status
cl /nologo /c /W3 /O1 /Gy 'Z:\inputs\j_dxerr_w.c' '/FoZ:\out\job001.obj' > /out/job001.log 2>&1
echo $? > /out/job001.status
