100257a0 mov      al, byte ptr [0x101d4d00]
100257a5 sub      esp, 8
100257a8 test     al, al
100257aa je       0x1002590f
100257b0 mov      eax, dword ptr [0x101ce7ec]
100257b5 mov      ecx, dword ptr [eax + 8]
100257b8 test     ecx, ecx
100257ba je       0x100257ea
100257bc mov      ecx, dword ptr [0x10764584]
100257c2 test     ecx, ecx
100257c4 setne    al
100257c7 test     al, al
100257c9 je       0x100257ea
100257cb push     0x10196cac
100257d0 push     0x10193358
100257d5 push     ecx
100257d6 call     0x100f6d05
100257db mov      ecx, dword ptr [0x10764584]
100257e1 push     ecx
100257e2 call     0x100f6c3d
100257e7 add      esp, 0x10
100257ea mov      edx, dword ptr [0x101ce600]
100257f0 mov      al, byte ptr [edx + 8]
100257f3 test     al, al
100257f5 jne      0x1002590f
100257fb mov      eax, dword ptr [0x101d1b9c]
10025800 test     eax, eax
10025802 jne      0x10025813
10025804 push     0x10196c8c
10025809 push     1
1002580b call     0x100138c0
10025810 add      esp, 8
10025813 push     ebx
10025814 push     esi
10025815 mov      esi, dword ptr [esp + 0x14]
10025819 mov      eax, dword ptr [esi + 0x48]
1002581c mov      dword ptr [0x10678504], eax
10025821 fild     dword ptr [0x10678504]
10025827 push     edi
10025828 push     esi
10025829 fmul     dword ptr [0x1019bde4]
1002582f fstp     dword ptr [0x10678508]
10025835 mov      ecx, dword ptr [esi + 0x18]
10025838 mov      dword ptr [0x101d4d04], ecx
1002583e mov      edx, dword ptr [esi + 0x1c]
10025841 mov      dword ptr [0x101d4d08], edx
10025847 mov      eax, dword ptr [esi + 0x20]
1002584a mov      dword ptr [0x101d4d0c], eax
1002584f mov      ecx, dword ptr [esi + 0x24]
10025852 mov      dword ptr [0x101d4d10], ecx
10025858 mov      edx, dword ptr [esi + 0x28]
1002585b mov      dword ptr [0x101d4d14], edx
10025861 mov      eax, dword ptr [esi + 0x2c]
10025864 mov      dword ptr [0x101d4d18], eax
10025869 mov      eax, dword ptr [0x101da9c8]
1002586e mov      ecx, dword ptr [eax + 0x217c7c]
10025874 mov      edx, ecx
10025876 imul     edx, edx, 0x14c
1002587c inc      ecx
1002587d lea      ebx, [edx + eax + 0x217c80]
10025884 mov      dword ptr [eax + 0x217c7c], ecx
1002588a call     0x10025570
1002588f mov      eax, dword ptr [esi + 0x50]
10025892 mov      ecx, dword ptr [esi + 8]
10025895 mov      dword ptr [esp + 0x10], eax
10025899 mov      eax, dword ptr [0x101d4c6c]
1002589e add      esp, 4
100258a1 cmp      ecx, eax
100258a3 jne      0x100258b5
100258a5 mov      edx, dword ptr [esi + 0xc]
100258a8 cmp      edx, dword ptr [0x101d4c70]
100258ae mov      byte ptr [esp + 0x10], 1
100258b3 je       0x100258ba
100258b5 mov      byte ptr [esp + 0x10], 0
100258ba mov      eax, dword ptr [0x101ce710]
100258bf mov      cl, byte ptr [eax + 8]
100258c2 test     cl, cl
100258c4 mov      edi, 0x10696a68
100258c9 jne      0x100258cd
100258cb mov      edi, ebx
100258cd call     0x10024080
100258d2 mov      edx, dword ptr [esi + 0x54]
100258d5 lea      ecx, [esp + 0xc]
100258d9 push     ecx
100258da push     ebx
100258db push     edx
100258dc mov      ecx, edi
100258de call     0x10025380
100258e3 mov      ecx, dword ptr [0x101ce824]
100258e9 mov      eax, dword ptr [ecx + 8]
100258ec add      esp, 0xc
100258ef test     eax, eax
100258f1 pop      edi
100258f2 pop      esi
100258f3 pop      ebx
100258f4 je       0x1002590f
100258f6 cmp      dword ptr [0x1067850c], eax
100258fc jle      0x1002590f
100258fe push     0
10025900 push     ecx
10025901 call     dword ptr [0x101d4a6c]
10025907 add      esp, 8
1002590a call     0x10023920
1002590f add      esp, 8
10025912 ret      
