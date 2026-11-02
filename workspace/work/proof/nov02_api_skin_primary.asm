10020400 sub      esp, 0x58
10020403 push     ebx
10020404 push     ebp
10020405 mov      ebp, dword ptr [esp + 0x64]
10020409 push     esi
1002040a push     edi
1002040b push     ebp
1002040c call     dword ptr [0x101d4b48]
10020412 mov      ebx, eax
10020414 add      esp, 4
10020417 xor      edi, edi
10020419 xor      esi, esi
1002041b test     ebx, ebx
1002041d mov      dword ptr [esp + 0x14], ebx
10020421 jle      0x1002043f
10020423 lea      eax, [esp + 0x18]
10020427 push     eax
10020428 push     esi
10020429 lea      ecx, [esp + 0x24]
1002042d push     ecx
1002042e push     ebp
1002042f call     dword ptr [0x101d4b3c]
10020435 add      esp, 0x10
10020438 add      edi, eax
1002043a inc      esi
1002043b cmp      esi, ebx
1002043d jl       0x10020423
1002043f add      edi, ebx
10020441 shl      edi, 2
10020444 push     edi
10020445 call     dword ptr [0x101d49d4]
1002044b mov      ecx, dword ptr [esp + 0x18]
1002044f lea      esi, [eax + ebx*4]
10020452 add      esp, 4
10020455 xor      ebx, ebx
10020457 test     ecx, ecx
10020459 mov      dword ptr [esp + 0x24], eax
1002045d jle      0x1002050e
10020463 mov      dword ptr [esp + 0x10], eax
10020467 jmp      0x10020470
10020469 mov      esi, dword ptr [esp + 0x20]
1002046d lea      ecx, [ecx]
10020470 lea      edx, [esp + 0x18]
10020474 push     edx
10020475 push     ebx
10020476 lea      eax, [esp + 0x24]
1002047a push     eax
1002047b push     ebp
1002047c call     dword ptr [0x101d4b3c]
10020482 mov      ecx, dword ptr [esp + 0x20]
10020486 mov      edi, eax
10020488 lea      edx, [esi + edi*4]
1002048b mov      dword ptr [ecx], esi
1002048d add      esp, 0x10
10020490 xor      esi, esi
10020492 test     edi, edi
10020494 mov      dword ptr [esp + 0x20], edx
10020498 jle      0x100204f2
1002049a lea      ebx, [ebx]
100204a0 push     ebx
100204a1 push     esi
100204a2 push     ebp
100204a3 call     dword ptr [0x101d4b58]
100204a9 add      esp, 0xc
100204ac lea      edx, [esp + 0x28]
100204b0 mov      cl, byte ptr [eax]
100204b2 inc      eax
100204b3 mov      byte ptr [edx], cl
100204b5 inc      edx
100204b6 test     cl, cl
100204b8 jne      0x100204b0
100204ba lea      eax, [esp + 0x28]
100204be push     eax
100204bf call     0x1010a794
100204c4 mov      al, byte ptr [esp + 0x2c]
100204c8 add      esp, 4
100204cb test     al, al
100204cd jne      0x100204d6
100204cf mov      eax, dword ptr [0x101d1b2c]
100204d4 jmp      0x100204e4
100204d6 push     8
100204d8 lea      eax, [esp + 0x2c]
100204dc call     0x10017100
100204e1 add      esp, 4
100204e4 mov      ecx, dword ptr [esp + 0x10]
100204e8 mov      edx, dword ptr [ecx]
100204ea mov      dword ptr [edx + esi*4], eax
100204ed inc      esi
100204ee cmp      esi, edi
100204f0 jl       0x100204a0
100204f2 mov      ecx, dword ptr [esp + 0x10]
100204f6 mov      eax, dword ptr [esp + 0x14]
100204fa inc      ebx
100204fb add      ecx, 4
100204fe cmp      ebx, eax
10020500 mov      dword ptr [esp + 0x10], ecx
10020504 jl       0x10020469
1002050a mov      eax, dword ptr [esp + 0x24]
1002050e pop      edi
1002050f pop      esi
10020510 pop      ebp
10020511 pop      ebx
10020512 add      esp, 0x58
10020515 ret      
