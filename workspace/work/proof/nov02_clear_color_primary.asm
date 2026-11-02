10024920 push     ecx
10024921 mov      cl, byte ptr [0x101d61c8]
10024927 test     cl, cl
10024929 je       0x10024975
1002492b movzx    ecx, byte ptr [0x101d61ba]
10024932 mov      dword ptr [esp], ecx
10024935 fild     dword ptr [esp]
10024938 fmul     dword ptr [0x1019bd54]
1002493e fstp     dword ptr [eax]
10024940 movzx    edx, byte ptr [0x101d61b9]
10024947 mov      dword ptr [esp], edx
1002494a fild     dword ptr [esp]
1002494d fmul     dword ptr [0x1019bd54]
10024953 fstp     dword ptr [eax + 4]
10024956 movzx    ecx, byte ptr [0x101d61b8]
1002495d mov      dword ptr [esp], ecx
10024960 mov      dword ptr [eax + 0xc], 0x3f800000
10024967 fild     dword ptr [esp]
1002496a fmul     dword ptr [0x1019bd54]
10024970 fstp     dword ptr [eax + 8]
10024973 pop      ecx
10024974 ret      
10024975 mov      ecx, dword ptr [0x101ce798]
1002497b movzx    edx, byte ptr [ecx + 8]
1002497f mov      dword ptr [esp], edx
10024982 fild     dword ptr [esp]
10024985 fmul     dword ptr [0x1019bd54]
1002498b fstp     dword ptr [eax]
1002498d movzx    edx, byte ptr [ecx + 9]
10024991 mov      dword ptr [esp], edx
10024994 fild     dword ptr [esp]
10024997 fmul     dword ptr [0x1019bd54]
1002499d fstp     dword ptr [eax + 4]
100249a0 movzx    ecx, byte ptr [ecx + 0xa]
100249a4 mov      dword ptr [esp], ecx
100249a7 mov      dword ptr [eax + 0xc], 0x3f800000
100249ae fild     dword ptr [esp]
100249b1 fmul     dword ptr [0x1019bd54]
100249b7 fstp     dword ptr [eax + 8]
100249ba pop      ecx
100249bb ret      
