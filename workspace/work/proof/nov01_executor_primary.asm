10033d20 push     ebp
10033d21 mov      ebp, esp
10033d23 and      esp, 0xfffffff8
10033d26 sub      esp, 0x14
10033d29 mov      eax, dword ptr [0x101d0a8c]
10033d2e push     ebx
10033d2f push     esi
10033d30 push     edi
10033d31 xor      edi, edi
10033d33 cmp      eax, edi
10033d35 mov      dword ptr [0x106d3194], edi
10033d3b jne      0x10033f79
10033d41 mov      al, byte ptr [0x101d492c]
10033d46 test     al, al
10033d48 jne      0x10033d71
10033d4a mov      eax, dword ptr [0x101d1bf8]
10033d4f mov      ecx, dword ptr [eax]
10033d51 push     eax
10033d52 call     dword ptr [ecx + 0xc]
10033d55 cmp      eax, 0x88760868
10033d5a je       0x10033d63
10033d5c cmp      eax, 0x88760869
10033d61 jne      0x10033d6c
10033d63 mov      al, 1
10033d65 mov      byte ptr [0x101d492c], al
10033d6a jmp      0x10033d71
10033d6c mov      al, byte ptr [0x101d492c]
10033d71 test     al, al
10033d73 mov      bl, al
10033d75 je       0x10033d84
10033d77 call     0x100137f0
10033d7c test     al, al
10033d7e je       0x10033f79
10033d84 mov      edx, dword ptr [ebp + 8]
10033d87 mov      dword ptr [0x106d3194], edx
10033d8d call     0x10033c50
10033d92 call     0x10033a90
10033d97 test     bl, bl
10033d99 je       0x10033da0
10033d9b call     0x10035890
10033da0 mov      eax, dword ptr [0x101ce750]
10033da5 mov      cl, byte ptr [eax + 8]
10033da8 test     cl, cl
10033daa jne      0x10033df0
10033dac mov      eax, dword ptr [0x106d3194]
10033db1 add      eax, 0x219d0c
10033db6 mov      dword ptr [esp + 0x10], eax
10033dba mov      dword ptr [esp + 0x14], edi
10033dbe mov      ax, word ptr [eax]
10033dc1 cmp      ax, di
10033dc4 je       0x10033e58
10033dca lea      ebx, [ebx]
10033dd0 lea      edx, [esp + 0x10]
10033dd4 movzx    ecx, ax
10033dd7 push     edx
10033dd8 call     dword ptr [ecx*4 + 0x10190518]
10033ddf mov      eax, dword ptr [esp + 0x14]
10033de3 movzx    eax, word ptr [eax]
10033de6 add      esp, 4
10033de9 cmp      ax, di
10033dec jne      0x10033dd0
10033dee jmp      0x10033e58
10033df0 mov      al, byte ptr [0x1072debc]
10033df5 test     al, al
10033df7 je       0x10033e00
10033df9 call     0x1003e9b0
10033dfe mov      edi, edi
10033e00 mov      ecx, dword ptr [0x101ce7ec]
10033e06 cmp      dword ptr [ecx + 8], edi
10033e09 je       0x10033e3b
10033e0b mov      eax, dword ptr [0x10764584]
10033e10 cmp      eax, edi
10033e12 setne    cl
10033e15 test     cl, cl
10033e17 je       0x10033e3b
10033e19 push     0x10197964
10033e1e push     0x10193358
10033e23 push     eax
10033e24 call     0x100f6d05
10033e29 mov      edx, dword ptr [0x10764584]
10033e2f add      esp, 0xc
10033e32 push     edx
10033e33 call     0x100f6c3d
10033e38 add      esp, 4
10033e3b mov      eax, dword ptr [0x101d1bf8]
10033e40 mov      ecx, dword ptr [eax]
10033e42 push     edi
10033e43 push     edi
10033e44 push     edi
10033e45 push     1
10033e47 push     edi
10033e48 push     edi
10033e49 push     eax
10033e4a call     dword ptr [ecx + 0xac]
10033e50 cmp      dword ptr [0x1076a830], edi
10033e56 jne      0x10033e00
10033e58 cmp      dword ptr [0x1072d9d0], edi
10033e5e jne      0x10033e68
10033e60 cmp      dword ptr [0x1072d9e0], edi
10033e66 je       0x10033e6d
10033e68 call     0x1003a8d0
10033e6d mov      eax, dword ptr [0x1072ddc8]
10033e72 cmp      eax, edi
10033e74 je       0x10033e86
10033e76 mov      edx, dword ptr [0x101ce7d8]
10033e7c cmp      dword ptr [edx + 8], edi
10033e7f je       0x10033e86
10033e81 call     0x10034840
10033e86 cmp      dword ptr [0x1076674c], edi
10033e8c je       0x10033e95
10033e8e xor      esi, esi
10033e90 call     0x1003ecb0
10033e95 cmp      dword ptr [0x10766750], edi
10033e9b jne      0x10033ead
10033e9d cmp      dword ptr [0x10766754], edi
10033ea3 jne      0x10033ead
10033ea5 cmp      dword ptr [0x10766758], edi
10033eab je       0x10033ec0
10033ead push     edi
10033eae xor      edi, edi
10033eb0 xor      ebx, ebx
10033eb2 xor      esi, esi
10033eb4 call     0x1003ed20
10033eb9 add      esp, 4
10033ebc lea      esp, [esp]
10033ec0 mov      eax, dword ptr [0x101ce7ec]
10033ec5 mov      ecx, dword ptr [eax + 8]
10033ec8 test     ecx, ecx
10033eca je       0x10033efc
10033ecc mov      eax, dword ptr [0x10764584]
10033ed1 test     eax, eax
10033ed3 setne    cl
10033ed6 test     cl, cl
10033ed8 je       0x10033efc
10033eda push     0x10197ec0
10033edf push     0x10193358
10033ee4 push     eax
10033ee5 call     0x100f6d05
10033eea mov      ecx, dword ptr [0x10764584]
10033ef0 add      esp, 0xc
10033ef3 push     ecx
10033ef4 call     0x100f6c3d
10033ef9 add      esp, 4
10033efc mov      eax, dword ptr [0x101d1bf8]
10033f01 mov      edx, dword ptr [eax]
10033f03 push     eax
10033f04 call     dword ptr [edx + 0xa8]
10033f0a mov      eax, dword ptr [0x1076a830]
10033f0f test     eax, eax
10033f11 jne      0x10033ec0
10033f13 mov      eax, dword ptr [0x101ce75c]
10033f18 mov      byte ptr [0x101d492d], 0
10033f1f mov      ecx, dword ptr [eax + 8]
10033f22 test     ecx, ecx
10033f24 jle      0x10033f3d
10033f26 call     0x100335d0
10033f2b mov      ecx, dword ptr [0x101ce75c]
10033f31 push     0
10033f33 push     ecx
10033f34 call     dword ptr [0x101d4a6c]
10033f3a add      esp, 8
10033f3d mov      edx, dword ptr [0x101ce74c]
10033f43 mov      eax, dword ptr [edx + 8]
10033f46 test     eax, eax
10033f48 jle      0x10033f60
10033f4a call     0x100339b0
10033f4f mov      eax, dword ptr [0x101ce74c]
10033f54 push     0
10033f56 push     eax
10033f57 call     dword ptr [0x101d4a6c]
10033f5d add      esp, 8
10033f60 mov      eax, dword ptr [0x101d4810]
10033f65 cmp      eax, 3
10033f68 je       0x10033f74
10033f6a cmp      eax, 2
10033f6d jne      0x10033f79
10033f6f call     0x10032cd0
10033f74 call     0x10032d10
10033f79 pop      edi
10033f7a pop      esi
10033f7b pop      ebx
10033f7c mov      esp, ebp
10033f7e pop      ebp
10033f7f ret      
