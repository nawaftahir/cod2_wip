Read windows from inventory, not certified full function extents; verify actual tails before integration.

100410b0/92
100410b0 push     ecx
100410b1 mov      ecx, dword ptr [eax]
100410b3 add      ecx, -4
100410b6 cmp      ecx, 5
100410b9 ja       0x1004110a
100410bb jmp      dword ptr [ecx*4 + 0x1004110c]
100410c2 call     0x1003fb50
100410c7 pop      ecx
100410c8 ret      
100410c9 call     0x1003fba0
100410ce pop      ecx
100410cf ret      
100410d0 mov      ecx, eax
100410d2 call     0x10040c00
100410d7 pop      ecx
100410d8 ret      
100410d9 call     0x10041030
100410de pop      ecx
100410df ret      
100410e0 mov      ecx, dword ptr [0x101ce708]
100410e6 cmp      dword ptr [ecx + 8], 2
100410ea push     eax
100410eb jne      0x100410f7
100410ed call     0x100401a0
100410f2 add      esp, 4
100410f5 pop      ecx
100410f6 ret      
100410f7 call     0x1003fdb0
100410fc add      esp, 4
100410ff pop      ecx
10041100 ret      
10041101 push     eax
10041102 call     0x10040f30
10041107 add      esp, 4
1004110a pop      ecx
1004110b ret      

10040f30/245
10040f30 mov      eax, dword ptr [0x1072d9d0]
10040f35 sub      esp, 0x14
10040f38 push     ebx
10040f39 xor      ebx, ebx
10040f3b cmp      eax, ebx
10040f3d push     esi
10040f3e push     edi
10040f3f jne      0x10040f49
10040f41 cmp      dword ptr [0x1072d9e0], ebx
10040f47 je       0x10040f4e
10040f49 call     0x1003a8d0
10040f4e mov      eax, dword ptr [0x101ce7ec]
10040f53 cmp      dword ptr [eax + 8], ebx
10040f56 je       0x10040fa8
10040f58 mov      ecx, dword ptr [0x1072d9bc]
10040f5e mov      edx, dword ptr [ecx]
10040f60 push     edx
10040f61 push     0x1019a458
10040f66 call     0x10060c70
10040f6b mov      ecx, dword ptr [0x101ce7ec]
10040f71 mov      edx, dword ptr [ecx + 8]
10040f74 add      esp, 8
10040f77 cmp      edx, ebx
10040f79 je       0x10040fa8
10040f7b mov      edx, dword ptr [0x10764584]
10040f81 cmp      edx, ebx
10040f83 setne    cl
10040f86 cmp      cl, bl
10040f88 je       0x10040fa8
10040f8a push     eax
10040f8b push     0x10193358
10040f90 push     edx
10040f91 call     0x100f6d05
10040f96 mov      edx, dword ptr [0x10764584]
10040f9c add      esp, 0xc
10040f9f push     edx
10040fa0 call     0x100f6c3d
10040fa5 add      esp, 4
10040fa8 mov      edi, dword ptr [esp + 0x24]
10040fac mov      dword ptr [esp + 0x18], ebx
10040fb0 mov      dword ptr [esp + 0x1c], ebx
10040fb4 mov      dword ptr [esp + 0xc], ebx
10040fb8 mov      dword ptr [esp + 0x10], 0x1000
10040fc0 mov      dword ptr [esp + 0x14], 0x800
10040fc8 call     0x10040df0
10040fcd mov      esi, dword ptr [0x101d49ac]
10040fd3 cmp      dword ptr [0x1076674c], esi
10040fd9 je       0x10040fe0
10040fdb call     0x1003ecb0
10040fe0 mov      eax, dword ptr [0x101d49a8]
10040fe5 cmp      dword ptr [0x10766750], eax
10040feb mov      edi, 0x14
10040ff0 jne      0x10041002
10040ff2 cmp      dword ptr [0x10766754], ebx
10040ff8 jne      0x10041002
10040ffa cmp      dword ptr [0x10766758], edi
10041000 je       0x1004100f
10041002 push     eax
10041003 xor      ebx, ebx
10041005 xor      esi, esi
10041007 call     0x1003ed20
1004100c add      esp, 4
1004100f lea      eax, [esp + 0xc]
10041013 push     eax
10041014 push     2
10041016 call     0x1003a580
1004101b add      esp, 8
1004101e pop      edi
1004101f pop      esi
10041020 pop      ebx
10041021 add      esp, 0x14
10041024 ret      

10040df0/318
10040df0 fld      dword ptr [edi + 0x68]
10040df3 sub      esp, 0x20
10040df6 fld      dword ptr [edi + 0x64]
10040df9 push     ebx
10040dfa fucompp  
10040dfc push     esi
10040dfd fnstsw   ax
10040dff test     ah, 0x44
10040e02 jnp      0x10040e17
10040e04 lea      esi, [edi + 0x48]
10040e07 lea      ebx, [edi + 0x3c]
10040e0a mov      ecx, esi
10040e0c mov      eax, ebx
10040e0e call     0x1003ee10
10040e13 test     eax, eax
10040e15 je       0x10040e33
10040e17 mov      eax, dword ptr [edi + 0x68]
10040e1a fld      dword ptr [edi + 0x64]
10040e1d mov      dword ptr [esp + 0x1c], 0
10040e25 mov      dword ptr [esp + 0x20], 0
10040e2d mov      dword ptr [esp + 0x24], eax
10040e31 jmp      0x10040e99
10040e33 fld      dword ptr [esi]
10040e35 fsub     dword ptr [ebx]
10040e37 fstp     dword ptr [esp + 0xc]
10040e3b fld      dword ptr [esi + 4]
10040e3e fsub     dword ptr [ebx + 4]
10040e41 fstp     dword ptr [esp + 0x10]
10040e45 fld      dword ptr [esi + 8]
10040e48 lea      esi, [esp + 0xc]
10040e4c fsub     dword ptr [ebx + 8]
10040e4f fstp     dword ptr [esp + 0x14]
10040e53 call     0x100590b0
10040e58 fstp     st(0)
10040e5a lea      edx, [esp + 0xc]
10040e5e fld      dword ptr [edi + 0x68]
10040e61 lea      eax, [esp + 0x18]
10040e65 fld      dword ptr [esp + 0xc]
10040e69 fmul     st(1)
10040e6b fstp     dword ptr [esp + 0x18]
10040e6f fld      dword ptr [esp + 0x10]
10040e73 fmul     st(1)
10040e75 fstp     dword ptr [esp + 0x1c]
10040e79 fld      dword ptr [esp + 0x14]
10040e7d fmul     st(1)
10040e7f fstp     dword ptr [esp + 0x20]
10040e83 fstp     st(0)
10040e85 call     0x10040ca0
10040e8a lea      ecx, [esp + 0x18]
10040e8e mov      esi, edi
10040e90 call     0x10040d40
10040e95 fld      dword ptr [esp + 0x18]
10040e99 mov      edx, dword ptr [esp + 0x20]
10040e9d fstp     dword ptr [0x1072dd10]
10040ea3 mov      eax, dword ptr [esp + 0x24]
10040ea7 mov      ecx, dword ptr [esp + 0x1c]
10040eab mov      dword ptr [0x1072dd18], edx
10040eb1 mov      dword ptr [0x1072dd1c], eax
10040eb6 mov      dword ptr [0x1072dd14], ecx
10040ebc movzx    ecx, byte ptr [edi + 0x58]
10040ec0 movzx    edx, byte ptr [edi + 0x59]
10040ec4 movzx    eax, byte ptr [edi + 0x5a]
10040ec8 mov      dword ptr [esp + 8], ecx
10040ecc movzx    ecx, byte ptr [edi + 0x5b]
10040ed0 fild     dword ptr [esp + 8]
10040ed4 mov      dword ptr [esp + 8], edx
10040ed8 pop      esi
10040ed9 fmul     dword ptr [0x1019bd54]
10040edf pop      ebx
10040ee0 fild     dword ptr [esp]
10040ee3 mov      dword ptr [esp], eax
10040ee6 fmul     dword ptr [0x1019bd54]
10040eec fild     dword ptr [esp]
10040eef mov      dword ptr [esp], ecx
10040ef2 fmul     dword ptr [0x1019bd54]
10040ef8 fstp     dword ptr [esp + 0x18]
10040efc mov      edx, dword ptr [esp + 0x18]
10040f00 fild     dword ptr [esp]
10040f03 mov      dword ptr [0x1072dd08], edx
10040f09 fmul     dword ptr [0x1019bd54]
10040f0f fstp     dword ptr [esp + 0x1c]
10040f13 mov      eax, dword ptr [esp + 0x1c]
10040f17 fxch     st(1)
10040f19 mov      dword ptr [0x1072dd0c], eax
10040f1e fstp     dword ptr [0x1072dd00]
10040f24 fstp     dword ptr [0x1072dd04]
10040f2a add      esp, 0x20
10040f2d ret      

10040ca0/158
10040ca0 sub      esp, 0x44
10040ca3 mov      ecx, dword ptr [0x1072ddc8]
10040ca9 push     esi
10040caa mov      esi, dword ptr [ecx + 0x50]
10040cad mov      dword ptr [esp + 0x20], esi
10040cb1 mov      esi, dword ptr [ecx + 0x4c]
10040cb4 mov      dword ptr [esp + 0x14], esi
10040cb8 mov      esi, dword ptr [ecx + 0x48]
10040cbb mov      dword ptr [esp + 0x24], esi
10040cbf mov      esi, dword ptr [ecx + 0x60]
10040cc2 mov      dword ptr [esp + 0x1c], esi
10040cc6 mov      esi, dword ptr [ecx + 0x5c]
10040cc9 mov      dword ptr [esp + 0x10], esi
10040ccd mov      esi, dword ptr [ecx + 0x58]
10040cd0 mov      dword ptr [esp + 8], esi
10040cd4 mov      esi, dword ptr [ecx + 0x70]
10040cd7 mov      dword ptr [esp + 0x18], esi
10040cdb mov      esi, dword ptr [ecx + 0x6c]
10040cde mov      ecx, dword ptr [ecx + 0x68]
10040ce1 mov      dword ptr [esp + 4], ecx
10040ce5 fld      dword ptr [esp + 4]
10040ce9 mov      dword ptr [esp + 0xc], esi
10040ced fmul     dword ptr [eax + 8]
10040cf0 pop      esi
10040cf1 fld      dword ptr [esp + 4]
10040cf5 fmul     dword ptr [eax + 4]
10040cf8 faddp    st(1)
10040cfa fld      dword ptr [esp + 0x20]
10040cfe fmul     dword ptr [eax]
10040d00 faddp    st(1)
10040d02 fstp     dword ptr [edx]
10040d04 fld      dword ptr [esp + 8]
10040d08 fmul     dword ptr [eax + 8]
10040d0b fld      dword ptr [esp + 0xc]
10040d0f fmul     dword ptr [eax + 4]
10040d12 faddp    st(1)
10040d14 fld      dword ptr [esp + 0x10]
10040d18 fmul     dword ptr [eax]
10040d1a faddp    st(1)
10040d1c fstp     dword ptr [edx + 4]
10040d1f fld      dword ptr [esp + 0x14]
10040d23 fmul     dword ptr [eax + 8]
10040d26 fld      dword ptr [esp + 0x18]
10040d2a fmul     dword ptr [eax + 4]
10040d2d faddp    st(1)
10040d2f fld      dword ptr [esp + 0x1c]
10040d33 fmul     dword ptr [eax]
10040d35 faddp    st(1)
10040d37 fstp     dword ptr [edx + 8]
10040d3a add      esp, 0x44
10040d3d ret      

10040d40/161
10040d40 push     ecx
10040d41 fld      dword ptr [edx]
10040d43 fcomp    dword ptr [0x1019bde4]
10040d49 fnstsw   ax
10040d4b test     ah, 5
10040d4e jp       0x10040d75
10040d50 fld      dword ptr [edx + 4]
10040d53 fcomp    dword ptr [0x1019bde4]
10040d59 fnstsw   ax
10040d5b test     ah, 5
10040d5e jp       0x10040d75
10040d60 mov      eax, dword ptr [esi + 0x64]
10040d63 mov      dword ptr [ecx], eax
10040d65 xor      eax, eax
10040d67 mov      dword ptr [ecx + 4], eax
10040d6a fld      dword ptr [esi + 0x68]
10040d6d mov      dword ptr [ecx + 8], eax
10040d70 fstp     dword ptr [ecx + 0xc]
10040d73 pop      ecx
10040d74 ret      
10040d75 fld      dword ptr [edx + 4]
10040d78 fld      dword ptr [edx]
10040d7a fmul     dword ptr [0x1019bda0]
10040d80 fxch     st(1)
10040d82 fstp     dword ptr [ecx]
10040d84 fstp     dword ptr [ecx + 4]
10040d87 fld      dword ptr [edx + 4]
10040d8a mov      edx, dword ptr [edx]
10040d8c fstp     dword ptr [ecx + 0xc]
10040d8f mov      dword ptr [ecx + 8], edx
10040d92 fld      dword ptr [ecx + 4]
10040d95 fld      dword ptr [ecx]
10040d97 fld      st(0)
10040d99 fmul     st(1)
10040d9b fld      st(2)
10040d9d fmul     st(3)
10040d9f faddp    st(1)
10040da1 fsqrt    
10040da3 fstp     st(2)
10040da5 fstp     st(0)
10040da7 fld      dword ptr [0x1019bc78]
10040dad fdiv     st(1)
10040daf fst      dword ptr [esp]
10040db2 fmul     dword ptr [esi + 0x64]
10040db5 fld      st(0)
10040db7 fmul     dword ptr [ecx]
10040db9 fstp     dword ptr [ecx]
10040dbb fmul     dword ptr [ecx + 4]
10040dbe fstp     dword ptr [ecx + 4]
10040dc1 fcomp    dword ptr [esi + 0x64]
10040dc4 fnstsw   ax
10040dc6 test     ah, 5
10040dc9 jp       0x10040ddf
10040dcb fld      dword ptr [esp]
10040dce fmul     dword ptr [esi + 0x64]
10040dd1 fld      st(0)
10040dd3 fmul     dword ptr [ecx + 8]
10040dd6 fstp     dword ptr [ecx + 8]
10040dd9 fmul     dword ptr [ecx + 0xc]
10040ddc fstp     dword ptr [ecx + 0xc]
10040ddf pop      ecx
10040de0 ret      

1003ee10/62
1003ee10 push     ecx
1003ee11 push     esi
1003ee12 mov      esi, eax
1003ee14 xor      edx, edx
1003ee16 sub      esi, ecx
1003ee18 jmp      0x1003ee20
1003ee1a lea      ebx, [ebx]
1003ee20 fld      dword ptr [ecx + esi]
1003ee23 fsub     dword ptr [ecx]
1003ee25 fstp     dword ptr [esp + 4]
1003ee29 fld      dword ptr [esp + 4]
1003ee2d fmul     dword ptr [esp + 4]
1003ee31 fcomp    dword ptr [0x1019bd50]
1003ee37 fnstsw   ax
1003ee39 test     ah, 0x41
1003ee3c je       0x1003ee4f
1003ee3e inc      edx
1003ee3f add      ecx, 4
1003ee42 cmp      edx, 3
1003ee45 jl       0x1003ee20
1003ee47 mov      eax, 1
1003ee4c pop      esi
1003ee4d pop      ecx
