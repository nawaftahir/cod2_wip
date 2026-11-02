
10024460/70
10024460 cmp      eax, edi
10024462 jbe      0x100244a5
10024464 push     ebx
10024465 push     ebp
10024466 push     esi
10024467 lea      ebx, [edi + 8]
1002446a lea      ebx, [ebx]
10024470 mov      edx, ebx
10024472 cmp      edx, eax
10024474 mov      ecx, edi
10024476 ja       0x10024487
10024478 mov      esi, dword ptr [edx]
1002447a cmp      esi, dword ptr [ecx]
1002447c jbe      0x10024480
1002447e mov      ecx, edx
10024480 add      edx, 8
10024483 cmp      edx, eax
10024485 jbe      0x10024478
10024487 mov      ebp, dword ptr [eax]
10024489 mov      edx, dword ptr [ecx]
1002448b mov      esi, dword ptr [ecx + 4]
1002448e mov      dword ptr [ecx], ebp
10024490 mov      ebp, dword ptr [eax + 4]
10024493 mov      dword ptr [ecx + 4], ebp
10024496 mov      dword ptr [eax], edx
10024498 mov      dword ptr [eax + 4], esi
1002449b sub      eax, 8
1002449e cmp      eax, edi
100244a0 ja       0x10024470
100244a2 pop      esi
100244a3 pop      ebp
100244a4 pop      ebx
100244a5 ret      

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
