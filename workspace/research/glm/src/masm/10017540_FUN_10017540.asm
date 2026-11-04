.686
.MODEL FLAT, C
EXTRN sub_10016DD2:PROC
EXTRN sub_10017477:PROC
EXTRN g_101D7FC8:DWORD
EXTRN g_101DA2D4:DWORD
.CODE
FUN_10017540 PROC
    push esi
    push edi
    call sub_10017477
    xor eax, eax
    mov ecx, 0000000C0h
    mov edi, 0101D7FCCh
    rep stosd dword ptr es:[edi], eax
    xor esi, esi
    mov dword ptr [g_101D7FC8], esi
    call sub_10016DD2
    mov ecx, 000000100h
    xor eax, eax
    mov edi, 0101DA564h
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [g_101DA2D4], esi
L0:
    cmp dword ptr [eax + 0101DA460h], esi
    je L1
    mov dword ptr [eax + 0101DA460h], esi
L1:
    add eax, 4
    cmp eax, 000000100h
    jb L0
    xor eax, eax
L2:
    cmp dword ptr [eax + 0101DA3DCh], esi
    je L3
    mov dword ptr [eax + 0101DA3DCh], esi
L3:
    add eax, 4
    cmp eax, 000000080h
    jb L2
    xor eax, eax
    lea ebx, [ebx]
L4:
    cmp dword ptr [eax + 0101D92D4h], esi
    je L5
    mov dword ptr [eax + 0101D92D4h], esi
L5:
    add eax, 4
    cmp eax, 000001000h
    jb L4
    xor eax, eax
    lea ebx, [ebx]
L6:
    cmp dword ptr [eax + 0101D82D0h], esi
    je L7
    mov dword ptr [eax + 0101D82D0h], esi
L7:
    add eax, 4
    cmp eax, 000001000h
    jb L6
    pop edi
    pop esi
    ret
FUN_10017540 ENDP
END
