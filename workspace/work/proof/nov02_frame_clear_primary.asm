100249c0 mov      eax, dword ptr [0x101d4818]
100249c5 sub      esp, 0x10
100249c8 test     eax, eax
100249ca push     esi
100249cb je       0x100249fb
100249cd mov      eax, dword ptr [esp + 0x18]
100249d1 mov      esi, 1
100249d6 cmp      eax, esi
100249d8 je       0x10024a00
100249da mov      eax, dword ptr [0x101ce708]
100249df cmp      dword ptr [eax + 8], 2
100249e3 je       0x100249fb
100249e5 mov      ecx, dword ptr [0x101ce694]
100249eb mov      al, byte ptr [ecx + 8]
100249ee test     al, al
100249f0 je       0x100249fb
100249f2 mov      eax, dword ptr [0x101d489c]
100249f7 test     eax, eax
100249f9 jne      0x10024a00
100249fb mov      esi, 7
10024a00 lea      eax, [esp + 4]
10024a04 call     0x10024920
10024a09 push     0
10024a0b push     0x3f800000
10024a10 mov      edx, eax
10024a12 push     edx
10024a13 push     esi
10024a14 call     0x10022220
10024a19 add      esp, 0x10
10024a1c pop      esi
10024a1d add      esp, 0x10
10024a20 ret      
