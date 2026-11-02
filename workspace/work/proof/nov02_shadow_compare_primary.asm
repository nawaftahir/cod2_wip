10027170 mov      eax, dword ptr [esp + 4]
10027174 fld      dword ptr [eax + 4]
10027177 mov      ecx, dword ptr [esp + 8]
1002717b fcomp    dword ptr [ecx + 4]
1002717e fnstsw   ax
10027180 test     ah, 5
10027183 jp       0x1002718b
10027185 mov      eax, 1
1002718a ret      
1002718b xor      eax, eax
1002718d ret      
1002718e int3     
1002718f int3     
10027190 mov      eax, esi
10027192 mov      ecx, edi
10027194 call     0x100244b0
10027199 mov      eax, dword ptr [esp + 4]
1002719d push     0
1002719f push     eax
100271a0 push     esi
100271a1 push     edi
100271a2 call     0x10021890
100271a7 add      esp, 0x10
100271aa ret      
100271ab int3     
100271ac int3     
100271ad int3     
100271ae int3     
100271af int3     
