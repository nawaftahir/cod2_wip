cl /nologo /c /W3 /O2 /Gy 'Z:\inputs\jcapimin.c' '/FoZ:\out\job000.obj' > /out/job000.log 2>&1
echo $? > /out/job000.status
cl /nologo /c /W3 /O2 /Gy 'Z:\inputs\jdapimin.c' '/FoZ:\out\job001.obj' > /out/job001.log 2>&1
echo $? > /out/job001.status
