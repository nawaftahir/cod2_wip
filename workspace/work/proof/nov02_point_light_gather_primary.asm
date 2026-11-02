
10014d90/184
10014d90 dec      eax
10014d91 fld      dword ptr [esp + 8]
10014d95 fmul     dword ptr [esp + 8]
10014d99 push     ebp
10014d9a mov      ebp, dword ptr [esp + 8]
10014d9e fstp     dword ptr [esp + 0xc]
10014da2 js       0x10014e46
10014da8 push     ebx
10014da9 push     esi
10014daa push     edi
10014dab lea      edi, [ecx + eax*8]
10014dae lea      ebx, [eax + 1]
10014db1 mov      edx, dword ptr [edi + 4]
10014db4 mov      eax, dword ptr [edx]
10014db6 mov      ecx, dword ptr [eax*4 + 0x101a5a8c]
10014dbd test     ecx, ecx
10014dbf je       0x10014e39
10014dc1 mov      eax, dword ptr [edi]
10014dc3 test     eax, eax
10014dc5 jns      0x10014dcc
10014dc7 shr      eax, 0x13
10014dca jmp      0x10014dcf
10014dcc shr      eax, 4
10014dcf and      eax, 0xfff
10014dd4 cmp      eax, 0x800
10014dd9 jl       0x10014de0
10014ddb mov      eax, 0x7fe
10014de0 push     eax
10014de1 push     edi
10014de2 call     ecx
10014de4 add      esp, 8
10014de7 test     eax, eax
10014de9 je       0x10014e39
10014deb lea      esi, [eax + 0xc]
10014dee mov      edx, eax
10014df0 mov      ecx, ebp
10014df2 call     0x1005a270
10014df7 fcomp    dword ptr [esp + 0x18]
10014dfb fnstsw   ax
10014dfd test     ah, 0x41
10014e00 je       0x10014e39
10014e02 mov      ecx, dword ptr [edi]
10014e04 mov      eax, dword ptr [0x10678ab8]
10014e09 mov      edx, dword ptr [0x10678abc]
10014e0f mov      dword ptr [edx + eax*8], ecx
10014e12 mov      ecx, dword ptr [edi + 4]
10014e15 mov      edx, dword ptr [0x10678ab8]
10014e1b mov      eax, dword ptr [0x10678abc]
10014e20 mov      dword ptr [eax + edx*8 + 4], ecx
10014e24 mov      edx, dword ptr [0x10678ab8]
10014e2a mov      eax, dword ptr [0x101da9c8]
10014e2f inc      edx
10014e30 mov      dword ptr [0x10678ab8], edx
10014e36 inc      dword ptr [eax + 4]
10014e39 sub      edi, 8
10014e3c dec      ebx
10014e3d jne      0x10014db1
10014e43 pop      edi
10014e44 pop      esi
10014e45 pop      ebx
10014e46 pop      ebp
10014e47 ret      

10014e50/212
10014e50 sub      esp, 0x20
10014e53 mov      edx, dword ptr [ecx + 0x10]
10014e56 mov      dword ptr [esp], edx
10014e59 fld      dword ptr [esp]
10014e5c fmul     dword ptr [esp]
10014e5f mov      edx, dword ptr [eax + 0x10]
10014e62 mov      dword ptr [esp], edx
10014e65 fstp     dword ptr [esp + 0xc]
10014e69 fld      dword ptr [esp]
10014e6c fmul     dword ptr [esp]
10014e6f fstp     dword ptr [esp + 0x10]
10014e73 fld      dword ptr [0x101d4d04]
10014e79 fsub     dword ptr [ecx + 4]
10014e7c fstp     dword ptr [esp]
10014e7f fld      dword ptr [0x101d4d08]
10014e85 fsub     dword ptr [ecx + 8]
10014e88 fstp     dword ptr [esp + 4]
10014e8c fld      dword ptr [0x101d4d0c]
10014e92 fsub     dword ptr [ecx + 0xc]
10014e95 fstp     dword ptr [esp + 8]
10014e99 fld      dword ptr [esp + 8]
10014e9d fmul     dword ptr [esp + 8]
10014ea1 fld      dword ptr [esp + 4]
10014ea5 fmul     dword ptr [esp + 4]
10014ea9 faddp    st(1)
10014eab fld      dword ptr [esp]
10014eae fmul     dword ptr [esp]
10014eb1 faddp    st(1)
10014eb3 fstp     dword ptr [esp]
10014eb6 fld      dword ptr [0x101d4d04]
10014ebc fsub     dword ptr [eax + 4]
10014ebf fstp     dword ptr [esp + 0x14]
10014ec3 fld      dword ptr [0x101d4d08]
10014ec9 fsub     dword ptr [eax + 8]
10014ecc fstp     dword ptr [esp + 0x18]
10014ed0 fld      dword ptr [0x101d4d0c]
10014ed6 fsub     dword ptr [eax + 0xc]
10014ed9 fstp     dword ptr [esp + 0x1c]
10014edd fld      dword ptr [esp + 0x1c]
10014ee1 fmul     dword ptr [esp + 0x1c]
10014ee5 fld      dword ptr [esp + 0x18]
10014ee9 fmul     dword ptr [esp + 0x18]
10014eed faddp    st(1)
10014eef fld      dword ptr [esp + 0x14]
10014ef3 fmul     dword ptr [esp + 0x14]
10014ef7 faddp    st(1)
10014ef9 fstp     dword ptr [esp + 4]
10014efd fld      dword ptr [esp + 4]
10014f01 fmul     dword ptr [esp + 0xc]
10014f05 fld      dword ptr [esp]
10014f08 fmul     dword ptr [esp + 0x10]
10014f0c fcompp   
10014f0e fnstsw   ax
10014f10 test     ah, 0x41
10014f13 jp       0x10014f1e
10014f15 mov      eax, 1
10014f1a add      esp, 0x20
10014f1d ret      
10014f1e xor      eax, eax
10014f20 add      esp, 0x20
10014f23 ret      

10014f30/131
10014f30 push     ebx
10014f31 push     ebp
10014f32 push     esi
10014f33 push     edi
10014f34 mov      edi, eax
10014f36 mov      ebx, dword ptr [esp + 0x14]
10014f3a mov      ebp, dword ptr [edi]
10014f3c xor      esi, esi
10014f3e mov      edi, edi
10014f40 inc      esi
10014f41 cmp      esi, ebx
10014f43 jge      0x10014f53
10014f45 mov      ecx, dword ptr [edi + esi*4]
10014f48 mov      eax, ebp
10014f4a call     0x10014e50
10014f4f test     al, al
10014f51 jne      0x10014f40
10014f53 dec      ebx
10014f54 cmp      ebx, esi
10014f56 jl       0x10014f78
10014f58 mov      eax, dword ptr [edi + ebx*4]
10014f5b mov      ecx, ebp
10014f5d call     0x10014e50
10014f62 test     al, al
10014f64 jne      0x10014f53
10014f66 cmp      esi, ebx
10014f68 jg       0x10014f78
10014f6a mov      ecx, dword ptr [edi + ebx*4]
10014f6d mov      eax, dword ptr [edi + esi*4]
10014f70 mov      dword ptr [edi + esi*4], ecx
10014f73 mov      dword ptr [edi + ebx*4], eax
10014f76 jmp      0x10014f40
10014f78 cmp      esi, dword ptr [esp + 0x14]
10014f7c jne      0x10014f89
10014f7e mov      edx, dword ptr [edi + ebx*4]
10014f81 mov      eax, dword ptr [edi]
10014f83 mov      dword ptr [edi], edx
10014f85 mov      dword ptr [edi + ebx*4], eax
10014f88 dec      esi
10014f89 mov      eax, dword ptr [esp + 0x18]
10014f8d cmp      esi, eax
10014f8f je       0x10014fae
10014f91 jge      0x10014fa8
10014f93 mov      edx, dword ptr [esp + 0x14]
10014f97 sub      edx, esi
10014f99 sub      eax, esi
10014f9b lea      edi, [edi + esi*4]
10014f9e mov      dword ptr [esp + 0x14], edx
10014fa2 mov      dword ptr [esp + 0x18], eax
10014fa6 jmp      0x10014f36
10014fa8 mov      dword ptr [esp + 0x14], esi
10014fac jmp      0x10014f36
10014fae pop      edi
10014faf pop      esi
10014fb0 pop      ebp
10014fb1 pop      ebx
10014fb2 ret      

10014fc0/193
10014fc0 mov      ecx, dword ptr [0x10678514]
10014fc6 sub      esp, 0x80
10014fcc push     ebx
10014fcd push     ebp
10014fce push     esi
10014fcf mov      esi, eax
10014fd1 xor      ebx, ebx
10014fd3 xor      eax, eax
10014fd5 test     ecx, ecx
10014fd7 push     edi
10014fd8 jle      0x10014ff6
10014fda mov      edx, 0x10678518
10014fdf nop      
10014fe0 cmp      byte ptr [eax + 0x10678a98], 0
10014fe7 jne      0x10014fee
10014fe9 mov      dword ptr [esp + ebx*4 + 0x10], edx
10014fed inc      ebx
10014fee inc      eax
10014fef add      edx, 0x2c
10014ff2 cmp      eax, ecx
10014ff4 jl       0x10014fe0
10014ff6 mov      eax, dword ptr [0x101ce6fc]
10014ffb mov      eax, dword ptr [eax + 8]
10014ffe cmp      eax, esi
10015000 jge      0x10015004
10015002 mov      esi, eax
10015004 cmp      ebx, esi
10015006 jle      0x10015018
10015008 push     esi
10015009 push     ebx
1001500a lea      eax, [esp + 0x18]
1001500e call     0x10014f30
10015013 add      esp, 8
10015016 mov      ebx, esi
10015018 xor      ebp, ebp
1001501a xor      edi, edi
1001501c test     ebx, ebx
1001501e jle      0x10015074
10015020 mov      esi, dword ptr [esp + 0x9c]
10015027 add      esi, 4
1001502a lea      ebx, [ebx]
10015030 mov      eax, dword ptr [esp + edi*4 + 0x10]
10015034 mov      dword ptr [esi - 4], eax
10015037 mov      ecx, dword ptr [0x10678ab8]
1001503d mov      dword ptr [esi], ecx
1001503f mov      edx, dword ptr [eax + 0x10]
10015042 mov      ecx, dword ptr [esp + 0x94]
10015049 add      eax, 4
1001504c push     edx
1001504d push     eax
1001504e mov      eax, dword ptr [esp + 0xa0]
10015055 call     0x10014d90
1001505a mov      eax, dword ptr [0x10678ab8]
1001505f mov      ecx, dword ptr [esi]
10015061 add      esp, 8
10015064 sub      eax, ecx
10015066 mov      dword ptr [esi + 4], eax
10015069 je       0x1001506f
1001506b inc      ebp
1001506c add      esi, 0xc
1001506f inc      edi
10015070 cmp      edi, ebx
10015072 jl       0x10015030
10015074 pop      edi
10015075 pop      esi
10015076 mov      eax, ebp
10015078 pop      ebp
10015079 pop      ebx
1001507a add      esp, 0x80
10015080 ret      

1000a840/129
1000a840 push     ecx
1000a841 mov      eax, dword ptr [0x10678514]
1000a846 push     ebp
1000a847 mov      ebp, dword ptr [esp + 0xc]
1000a84b push     edi
1000a84c xor      edi, edi
1000a84e test     eax, eax
1000a850 jle      0x1000a8b6
1000a852 push     esi
1000a853 mov      esi, 0x10678520
1000a858 xor      edx, edx
1000a85a test     ebx, ebx
1000a85c jle      0x1000a89a
1000a85e fld      dword ptr [esi + 8]
1000a861 lea      ecx, [ebp + 4]
1000a864 fchs     
1000a866 fstp     dword ptr [esp + 0xc]
1000a86a lea      ebx, [ebx]
1000a870 fld      dword ptr [ecx - 4]
1000a873 fmul     dword ptr [esi - 4]
1000a876 fld      dword ptr [ecx + 4]
1000a879 fmul     dword ptr [esi + 4]
1000a87c faddp    st(1)
1000a87e fld      dword ptr [esi]
1000a880 fmul     dword ptr [ecx]
1000a882 faddp    st(1)
1000a884 fadd     dword ptr [ecx + 8]
1000a887 fcomp    dword ptr [esp + 0xc]
1000a88b fnstsw   ax
1000a88d test     ah, 5
1000a890 jnp      0x1000a8ba
1000a892 inc      edx
1000a893 add      ecx, 0x14
1000a896 cmp      edx, ebx
1000a898 jl       0x1000a870
1000a89a xor      eax, eax
1000a89c cmp      eax, 2
1000a89f sete     al
1000a8a2 mov      byte ptr [edi + 0x10678a98], al
1000a8a8 mov      eax, dword ptr [0x10678514]
1000a8ad inc      edi
1000a8ae add      esi, 0x2c
1000a8b1 cmp      edi, eax
1000a8b3 jl       0x1000a858
1000a8b5 pop      esi
1000a8b6 pop      edi
1000a8b7 pop      ebp
1000a8b8 pop      ecx
1000a8b9 ret      
1000a8ba mov      eax, 2
1000a8bf jmp      0x1000a89c
