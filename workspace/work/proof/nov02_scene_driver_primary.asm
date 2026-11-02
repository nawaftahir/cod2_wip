10025380 push     ebp
10025381 mov      ebp, esp
10025383 and      esp, 0xfffffff8
10025386 mov      eax, 0x16ec
1002538b call     0x100f8830
10025390 push     ebx
10025391 push     esi
10025392 push     edi
10025393 mov      esi, ecx
10025395 call     0x10007d60
1002539a mov      ecx, dword ptr [0x101d1b9c]
100253a0 test     ecx, ecx
100253a2 je       0x100253b9
100253a4 mov      edx, dword ptr [ecx + 0x100]
100253aa test     edx, edx
100253ac je       0x100253b9
100253ae push     eax
100253af mov      edi, esi
100253b1 call     0x1000a8d0
100253b6 add      esp, 4
100253b9 call     dword ptr [0x101d4c00]
100253bf call     dword ptr [0x101d4c64]
100253c5 mov      esi, dword ptr [0x10678ab8]
100253cb mov      ebx, dword ptr [0x10678abc]
100253d1 mov      eax, esi
100253d3 mov      ecx, ebx
100253d5 call     0x100244b0
100253da mov      eax, dword ptr [0x101ce708]
100253df cmp      dword ptr [eax + 8], 2
100253e3 jne      0x100253e9
100253e5 xor      edi, edi
100253e7 jmp      0x10025442
100253e9 mov      ecx, dword ptr [0x101ce7c4]
100253ef mov      al, byte ptr [ecx + 8]
100253f2 test     al, al
100253f4 je       0x100254f5
100253fa mov      edi, dword ptr [ebp + 0xc]
100253fd lea      edx, [esp + 0x10]
10025401 push     edx
10025402 push     edi
10025403 mov      dword ptr [esp + 0x14], 1
1002540b call     0x10027d00
10025410 push     0x10027170
10025415 push     0x18
10025417 lea      eax, [esp + 0xe0]
1002541e push     eax
1002541f lea      ecx, [esp + 0x24]
10025423 push     ecx
10025424 call     0x10028170
10025429 lea      edx, [esp + 0x28]
1002542d push     edx
1002542e push     edi
1002542f lea      edi, [esp + 0xf0]
10025436 call     0x10027f40
1002543b add      esp, 0x20
1002543e mov      edi, dword ptr [esp + 0xc]
10025442 mov      ecx, dword ptr [0x101ce708]
10025448 mov      edx, dword ptr [ecx + 8]
1002544b xor      eax, eax
1002544d cmp      edx, 2
10025450 je       0x10025476
10025452 mov      edx, dword ptr [0x101ce6fc]
10025458 mov      ecx, dword ptr [edx + 8]
1002545b test     ecx, ecx
1002545d je       0x10025476
1002545f lea      eax, [esp + 0xaf8]
10025466 push     eax
10025467 push     esi
10025468 push     ebx
10025469 mov      eax, 0x100
1002546e call     0x10014fc0
10025473 add      esp, 0xc
10025476 push     eax
10025477 mov      eax, dword ptr [ebp + 0x10]
1002547a lea      ecx, [esp + 0xafc]
10025481 push     ecx
10025482 lea      edx, [esp + 0xd8]
10025489 push     edx
1002548a mov      edx, dword ptr [ebp + 8]
1002548d push     edi
1002548e push     ebx
1002548f push     eax
10025490 mov      eax, dword ptr [ebp + 0xc]
10025493 mov      ecx, esi
10025495 call     0x10025300
1002549a mov      ecx, dword ptr [0x101ce6e4]
100254a0 mov      eax, dword ptr [ecx + 8]
100254a3 add      esp, 0x18
100254a6 test     eax, eax
100254a8 je       0x100254d2
100254aa test     al, 2
100254ac je       0x100254c4
100254ae push     0
100254b0 push     0x3f800000
100254b5 push     0x10191488
100254ba push     6
100254bc call     0x10022220
100254c1 add      esp, 0x10
100254c4 push     0
100254c6 push     0x1d
100254c8 push     esi
100254c9 push     ebx
100254ca call     0x10021890
100254cf add      esp, 0x10
100254d2 call     0x1001e540
100254d7 cmp      edi, 1
100254da jne      0x100254ee
100254dc mov      edx, dword ptr [0x101ce730]
100254e2 mov      al, byte ptr [edx + 8]
100254e5 test     al, al
100254e7 je       0x100254ee
100254e9 call     0x10027c80
100254ee pop      edi
100254ef pop      esi
100254f0 pop      ebx
100254f1 mov      esp, ebp
100254f3 pop      ebp
100254f4 ret      
100254f5 mov      dword ptr [esp + 0xc], 0
100254fd jmp      0x1002543e
