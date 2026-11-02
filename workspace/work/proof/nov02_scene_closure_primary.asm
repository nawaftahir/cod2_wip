
10021ae0/102
10021ae0 mov      eax, dword ptr [0x1042e778]
10021ae5 mov      edx, dword ptr [eax + 0x30000]
10021aeb push     esi
10021aec mov      ecx, 0x30000
10021af1 sub      ecx, edx
10021af3 mov      esi, 0x48
10021af8 cmp      ecx, esi
10021afa push     edi
10021afb jge      0x10021b0b
10021afd mov      dword ptr [eax + 0x30008], 0
10021b07 xor      eax, eax
10021b09 jmp      0x10021b2e
10021b0b lea      ecx, [edx + eax]
10021b0e add      edx, 0x48
10021b11 mov      dword ptr [eax + 0x30000], edx
10021b17 add      dword ptr [eax + 0x30004], esi
10021b1d mov      dword ptr [eax + 0x30008], ecx
10021b23 mov      word ptr [ecx], 9
10021b28 mov      word ptr [ecx + 2], si
10021b2c mov      eax, ecx
10021b2e mov      esi, dword ptr [esp + 0xc]
10021b32 lea      edi, [eax + 4]
10021b35 mov      ecx, 0x10
10021b3a rep movsd dword ptr es:[edi], dword ptr [esi]
10021b3c mov      ecx, dword ptr [esp + 0x10]
10021b40 pop      edi
10021b41 mov      dword ptr [eax + 0x44], ecx
10021b44 pop      esi
10021b45 ret      

10024a40/53
10024a40 push     0
10024a42 push     0x3f800000
10024a47 push     0x10191488
10024a4c push     6
10024a4e call     0x10022220
10024a53 mov      eax, dword ptr [0x101d1b4c]
10024a58 push     eax
10024a59 push     0x10191488
10024a5e push     0x3f800000
10024a63 push     0x3f800000
10024a68 push     0
10024a6a push     0
10024a6c call     0x10021660
10024a71 add      esp, 0x28
10024a74 ret      

100294e0/70
100294e0 push     esi
100294e1 mov      esi, eax
100294e3 imul     eax, eax, 7
100294e6 add      eax, edx
100294e8 mov      eax, dword ptr [eax*4 + 0x10696c48]
100294ef cmp      eax, -1
100294f2 je       0x100294fd
100294f4 push     eax
100294f5 call     0x10020f70
100294fa add      esp, 4
100294fd imul     esi, esi, 0x1c
10029500 cmp      dword ptr [esi + 0x10696c58], -1
10029507 je       0x10029510
10029509 mov      eax, 1
1002950e pop      esi
1002950f ret      
10029510 mov      byte ptr [esi + 0x10696c40], 1
10029517 call     0x10020f10
1002951c mov      dword ptr [esi + 0x10696c58], eax
10029522 xor      eax, eax
10029524 pop      esi
10029525 ret      
