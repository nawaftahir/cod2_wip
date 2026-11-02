
10007d60/93
10007d60 mov      eax, dword ptr [0x101d1b9c]
10007d65 test     eax, eax
10007d67 jne      0x10007d78
10007d69 push     0x101925cc
10007d6e push     1
10007d70 call     0x100138c0
10007d75 add      esp, 8
10007d78 mov      eax, dword ptr [0x101d1b9c]
10007d7d mov      ecx, dword ptr [eax + 0xc]
10007d80 cmp      dword ptr [ecx], -1
10007d83 jne      0x10007db9
10007d85 mov      eax, dword ptr [ecx + 0xc]
10007d88 fld      dword ptr [eax + 8]
10007d8b fmul     dword ptr [esi + 8]
10007d8e fld      dword ptr [eax + 4]
10007d91 fmul     dword ptr [esi + 4]
10007d94 faddp    st(1)
10007d96 fld      dword ptr [eax]
10007d98 fmul     dword ptr [esi]
10007d9a faddp    st(1)
10007d9c fsub     dword ptr [eax + 0xc]
10007d9f fcomp    dword ptr [0x1019bc84]
10007da5 fnstsw   ax
10007da7 test     ah, 0x41
10007daa jne      0x10007db1
10007dac mov      ecx, dword ptr [ecx + 0x10]
10007daf jmp      0x10007db4
10007db1 mov      ecx, dword ptr [ecx + 0x14]
10007db4 cmp      dword ptr [ecx], -1
10007db7 je       0x10007d85
10007db9 mov      eax, dword ptr [ecx + 8]
10007dbc ret      

1000a8d0/399
1000a8d0 sub      esp, 0x7c
1000a8d3 push     ebx
1000a8d4 push     ebp
1000a8d5 push     esi
1000a8d6 push     0x1000
1000a8db call     dword ptr [0x101d4a10]
1000a8e1 mov      ebp, eax
1000a8e3 add      esp, 4
1000a8e6 push     ebp
1000a8e7 call     dword ptr [0x101d4a18]
1000a8ed add      esp, 4
1000a8f0 push     0x1e000
1000a8f5 mov      esi, eax
1000a8f7 call     dword ptr [0x101d4a10]
1000a8fd add      esp, 4
1000a900 push     eax
1000a901 mov      dword ptr [esp + 0x10], eax
1000a905 call     dword ptr [0x101d4a18]
1000a90b mov      edx, dword ptr [0x101ce64c]
1000a911 mov      dword ptr [0x101ce5cc], eax
1000a916 mov      eax, dword ptr [0x101ce6a4]
1000a91b mov      dword ptr [0x101ce5c4], esi
1000a921 mov      cl, byte ptr [eax + 8]
1000a924 mov      esi, dword ptr [0x101ce654]
1000a92a mov      byte ptr [0x101ce5ec], cl
1000a930 mov      al, byte ptr [edx + 8]
1000a933 mov      byte ptr [0x101ce5ed], al
1000a938 mov      bl, byte ptr [esi + 8]
1000a93b xor      ecx, ecx
1000a93d add      esp, 4
1000a940 cmp      bl, cl
1000a942 mov      dl, 1
1000a944 je       0x1000a950
1000a946 cmp      al, cl
1000a948 mov      byte ptr [0x101ce5f0], dl
1000a94e jne      0x1000a956
1000a950 mov      byte ptr [0x101ce5f0], cl
1000a956 mov      esi, dword ptr [0x101ce760]
1000a95c cmp      byte ptr [esi + 8], cl
1000a95f je       0x1000a96b
1000a961 cmp      al, cl
1000a963 mov      byte ptr [0x101ce5ee], dl
1000a969 jne      0x1000a971
1000a96b mov      byte ptr [0x101ce5ee], cl
1000a971 mov      esi, dword ptr [0x101ce65c]
1000a977 cmp      byte ptr [esi + 8], cl
1000a97a je       0x1000a986
1000a97c cmp      al, cl
1000a97e mov      byte ptr [0x101ce5ef], dl
1000a984 jne      0x1000a98c
1000a986 mov      byte ptr [0x101ce5ef], cl
1000a98c mov      dword ptr [0x101ce5c0], ecx
1000a992 lea      eax, [edi + 0xc8]
1000a998 lea      ecx, [edi + 0x108]
1000a99e push     4
1000a9a0 push     0x10182948
1000a9a5 lea      edx, [esp + 0x18]
1000a9a9 mov      dword ptr [0x101ce5b8], eax
1000a9ae mov      dword ptr [0x101ce5bc], ecx
1000a9b4 call     0x10006be0
1000a9b9 fld      dword ptr [0x1019bc84]
1000a9bf fld      dword ptr [edi + 0xc4]
1000a9c5 add      esp, 8
1000a9c8 fucompp  
1000a9ca fnstsw   ax
1000a9cc test     ah, 0x44
1000a9cf jp       0x1000a9da
1000a9d1 mov      ecx, edi
1000a9d3 call     0x1000a3c0
1000a9d8 jmp      0x1000a9e1
1000a9da mov      eax, edi
1000a9dc call     0x1000a550
1000a9e1 mov      eax, 4
1000a9e6 lea      edx, [esp + 0x10]
1000a9ea call     0x100062a0
1000a9ef mov      ecx, dword ptr [esp + 0x8c]
1000a9f6 lea      edx, [esp + 0x10]
1000a9fa push     edx
1000a9fb mov      ebx, eax
1000a9fd mov      dword ptr [0x101d7e90], edi
1000aa03 call     0x1000a680
1000aa08 add      esp, 4
1000aa0b lea      eax, [esp + 0x10]
1000aa0f push     ebx
1000aa10 push     eax
1000aa11 call     0x1000a780
1000aa16 lea      ecx, [esp + 0x18]
1000aa1a push     ecx
1000aa1b call     0x1000a840
1000aa20 mov      edx, dword ptr [0x101ce6d4]
1000aa26 mov      eax, dword ptr [edx + 8]
1000aa29 add      esp, 0xc
1000aa2c test     eax, eax
1000aa2e je       0x1000aa40
1000aa30 lea      eax, [esp + 0x10]
1000aa34 push     ebx
1000aa35 push     eax
1000aa36 mov      eax, edi
1000aa38 call     0x10035cd0
1000aa3d add      esp, 8
1000aa40 mov      ecx, dword ptr [esp + 0xc]
1000aa44 push     ecx
1000aa45 call     dword ptr [0x101d4a14]
1000aa4b add      esp, 4
1000aa4e push     ebp
1000aa4f call     dword ptr [0x101d4a14]
1000aa55 add      esp, 4
1000aa58 pop      esi
1000aa59 pop      ebp
1000aa5a pop      ebx
1000aa5b add      esp, 0x7c
1000aa5e ret      

100244b0/301
100244b0 sub      esp, 0xf4
100244b6 cmp      eax, 2
100244b9 push     esi
100244ba mov      esi, ecx
100244bc jl       0x100245d5
100244c2 push     ebx
100244c3 push     edi
100244c4 xor      ebx, ebx
100244c6 mov      edi, esi
100244c8 mov      dword ptr [esp + 0xc], ebx
100244cc lea      esi, [esi + eax*8 - 8]
100244d0 push     ebp
100244d1 mov      eax, esi
100244d3 sub      eax, edi
100244d5 sar      eax, 3
100244d8 shr      eax, 3
100244db inc      eax
100244dc cmp      eax, 8
100244df jg       0x10024500
100244e1 mov      eax, esi
100244e3 call     0x10024460
100244e8 dec      ebx
100244e9 mov      dword ptr [esp + 0x10], ebx
100244ed js       0x100245d2
100244f3 mov      edi, dword ptr [esp + ebx*4 + 0x14]
100244f7 mov      esi, dword ptr [esp + ebx*4 + 0x8c]
100244fe jmp      0x100244d1
10024500 mov      ebx, dword ptr [edi]
10024502 cdq      
10024503 sub      eax, edx
10024505 sar      eax, 1
10024507 mov      ecx, dword ptr [edi + eax*8]
1002450a mov      edx, dword ptr [edi + eax*8 + 4]
1002450e lea      eax, [edi + eax*8]
10024511 mov      dword ptr [eax], ebx
10024513 mov      ebx, dword ptr [edi + 4]
10024516 mov      dword ptr [eax + 4], ebx
10024519 mov      dword ptr [edi], ecx
1002451b mov      dword ptr [edi + 4], edx
1002451e mov      ecx, edi
10024520 lea      eax, [esi + 8]
10024523 add      ecx, 8
10024526 cmp      ecx, esi
10024528 ja       0x10024530
1002452a mov      edx, dword ptr [ecx]
1002452c cmp      edx, dword ptr [edi]
1002452e jbe      0x10024523
10024530 sub      eax, 8
10024533 cmp      eax, edi
10024535 jbe      0x1002453d
10024537 mov      edx, dword ptr [eax]
10024539 cmp      edx, dword ptr [edi]
1002453b jae      0x10024530
1002453d cmp      eax, ecx
1002453f mov      ebp, dword ptr [eax]
10024541 jb       0x10024557
10024543 mov      edx, dword ptr [ecx]
10024545 mov      ebx, dword ptr [ecx + 4]
10024548 mov      dword ptr [ecx], ebp
1002454a mov      ebp, dword ptr [eax + 4]
1002454d mov      dword ptr [ecx + 4], ebp
10024550 mov      dword ptr [eax], edx
10024552 mov      dword ptr [eax + 4], ebx
10024555 jmp      0x10024523
10024557 mov      edx, dword ptr [edi]
10024559 mov      ebx, dword ptr [edi + 4]
1002455c mov      dword ptr [edi], ebp
1002455e mov      ebp, dword ptr [eax + 4]
10024561 mov      dword ptr [edi + 4], ebp
10024564 mov      dword ptr [eax], edx
10024566 mov      dword ptr [eax + 4], ebx
10024569 mov      edx, eax
1002456b sub      edx, edi
1002456d mov      ebx, esi
1002456f sub      ebx, ecx
10024571 sub      edx, 8
10024574 and      ebx, 0xfffffff8
10024577 and      edx, 0xfffffff8
1002457a cmp      edx, ebx
1002457c mov      ebx, dword ptr [esp + 0x10]
10024580 jl       0x100245ab
10024582 lea      edx, [eax - 8]
10024585 cmp      edi, edx
10024587 jae      0x1002459c
10024589 add      eax, -8
1002458c mov      dword ptr [esp + ebx*4 + 0x14], edi
10024590 mov      dword ptr [esp + ebx*4 + 0x8c], eax
10024597 inc      ebx
10024598 mov      dword ptr [esp + 0x10], ebx
1002459c cmp      ecx, esi
1002459e jae      0x100244e8
100245a4 mov      edi, ecx
100245a6 jmp      0x100244d1
100245ab cmp      ecx, esi
100245ad jae      0x100245bf
100245af mov      dword ptr [esp + ebx*4 + 0x14], ecx
100245b3 mov      dword ptr [esp + ebx*4 + 0x8c], esi
100245ba inc      ebx
100245bb mov      dword ptr [esp + 0x10], ebx
100245bf lea      ecx, [eax - 8]
100245c2 cmp      edi, ecx
100245c4 jae      0x100244e8
100245ca lea      esi, [eax - 8]
100245cd jmp      0x100244d1
100245d2 pop      ebp
100245d3 pop      edi
100245d4 pop      ebx
100245d5 pop      esi
100245d6 add      esp, 0xf4
100245dc ret      

10025300/126
10025300 push     ebx
10025301 mov      ebx, dword ptr [esp + 0xc]
10025305 push     esi
10025306 mov      esi, dword ptr [0x101ce6d0]
1002530c cmp      byte ptr [esi + 8], 0
10025310 je       0x10025321
10025312 push     ecx
10025313 push     ebx
10025314 push     eax
10025315 push     edx
10025316 call     0x10024d90
1002531b add      esp, 0x10
1002531e pop      esi
1002531f pop      ebx
10025320 ret      
10025321 mov      esi, dword ptr [0x101ce708]
10025327 push     edi
10025328 cmp      dword ptr [esi + 8], 2
1002532c jne      0x1002533c
1002532e push     ecx
1002532f push     edx
10025330 call     0x10024c80
10025335 add      esp, 8
10025338 pop      edi
10025339 pop      esi
1002533a pop      ebx
1002533b ret      
1002533c mov      esi, dword ptr [0x101ce6ac]
10025342 mov      edi, dword ptr [esi + 8]
10025345 test     edi, edi
10025347 je       0x10025357
10025349 push     ecx
1002534a push     ebx
1002534b call     0x10024f60
10025350 add      esp, 8
10025353 pop      edi
10025354 pop      esi
10025355 pop      ebx
10025356 ret      
10025357 mov      esi, dword ptr [esp + 0x24]
1002535b push     esi
1002535c mov      esi, dword ptr [esp + 0x24]
10025360 push     esi
10025361 mov      esi, dword ptr [esp + 0x24]
10025365 push     esi
10025366 mov      esi, dword ptr [esp + 0x1c]
1002536a push     ebx
1002536b push     esi
1002536c push     eax
1002536d mov      eax, dword ptr [esp + 0x30]
10025371 push     edx
10025372 call     0x10025040
10025377 add      esp, 0x1c
1002537a pop      edi
1002537b pop      esi
1002537c pop      ebx
1002537d ret      
