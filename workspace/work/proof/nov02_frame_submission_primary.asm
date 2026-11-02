
10020d50/111
10020d50 mov      eax, dword ptr [0x1042e778]
10020d55 mov      edx, dword ptr [eax + 0x30000]
10020d5b mov      ecx, 0x30000
10020d60 sub      ecx, edx
10020d62 cmp      ecx, 4
10020d65 jge      0x10020d71
10020d67 xor      edx, edx
10020d69 mov      dword ptr [eax + 0x30008], edx
10020d6f jmp      0x10020d95
10020d71 lea      ecx, [edx + eax]
10020d74 add      edx, 4
10020d77 mov      dword ptr [eax + 0x30000], edx
10020d7d add      dword ptr [eax + 0x30004], 4
10020d84 mov      dword ptr [eax + 0x30008], ecx
10020d8a xor      edx, edx
10020d8c mov      word ptr [ecx], dx
10020d8f mov      word ptr [ecx + 2], 4
10020d95 mov      eax, dword ptr [0x101da9c8]
10020d9a push     eax
10020d9b mov      dword ptr [eax + 0x249d0c], edx
10020da1 mov      dword ptr [eax + 0x249d10], edx
10020da7 mov      dword ptr [eax + 0x249d14], edx
10020dad call     0x10033d20
10020db2 add      esp, 4
10020db5 call     0x10033b20
10020dba jmp      0x10021040

10020ec0/71
10020ec0 mov      eax, dword ptr [0x1042e778]
10020ec5 mov      edx, dword ptr [eax + 0x30000]
10020ecb mov      ecx, 0x30000
10020ed0 sub      ecx, edx
10020ed2 cmp      ecx, 4
10020ed5 jge      0x10020ee2
10020ed7 mov      dword ptr [eax + 0x30008], 0
10020ee1 ret      
10020ee2 lea      ecx, [edx + eax]
10020ee5 add      edx, 4
10020ee8 mov      dword ptr [eax + 0x30000], edx
10020eee add      dword ptr [eax + 0x30004], 4
10020ef5 mov      dword ptr [eax + 0x30008], ecx
10020efb mov      word ptr [ecx], 0
10020f00 mov      word ptr [ecx + 2], 4
10020f06 ret      

10021f90/86
10021f90 mov      al, byte ptr [0x101d4d00]
10021f95 test     al, al
10021f97 je       0x10021fe5
10021f99 call     0x10032e20
10021f9e call     0x1001e540
10021fa3 call     dword ptr [0x101d4af0]
10021fa9 mov      eax, dword ptr [0x101da9c8]
10021fae add      eax, 0x249d18
10021fb3 push     eax
10021fb4 call     0x100058b0
10021fb9 add      esp, 4
10021fbc call     0x10020d50
10021fc1 mov      eax, dword ptr [0x101d49c4]
10021fc6 test     eax, eax
10021fc8 je       0x10021fe5
10021fca mov      ecx, dword ptr [0x101d49c0]
10021fd0 push     eax
10021fd1 push     ecx
10021fd2 call     dword ptr [0x101d49f0]
10021fd8 add      esp, 8
10021fdb mov      dword ptr [0x101d49c4], 0
10021fe5 ret      

10022040/114
10022040 mov      al, byte ptr [0x101d4d00]
10022045 push     ebx
10022046 xor      ebx, ebx
10022048 cmp      al, bl
1002204a je       0x100220b0
1002204c call     0x10020ec0
10022051 mov      eax, dword ptr [0x101da9c8]
10022056 push     eax
10022057 mov      dword ptr [eax + 0x249d0c], ebx
1002205d mov      dword ptr [eax + 0x249d10], ebx
10022063 mov      dword ptr [eax + 0x249d14], ebx
10022069 call     0x10033d20
1002206e add      esp, 4
10022071 call     0x10033b20
10022076 mov      eax, dword ptr [0x101e4a00]
1002207b mov      ecx, dword ptr [0x101e4a04]
10022081 mov      dword ptr [0x1042e778], eax
10022086 cmp      byte ptr [0x101e4a08], bl
1002208c mov      dword ptr [0x101da9c8], ecx
10022092 je       0x100220a4
10022094 push     1
10022096 mov      byte ptr [0x101e4a08], bl
1002209c call     0x1001e4b0
100220a1 add      esp, 4
100220a4 mov      dword ptr [0x101e4a00], ebx
100220aa mov      dword ptr [0x101e4a04], ebx
100220b0 pop      ebx
100220b1 ret      
