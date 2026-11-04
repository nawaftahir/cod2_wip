.686
.MODEL FLAT, C
EXTRN sub_10016DD2:PROC
EXTRN sub_10017477:PROC
EXTRN sub_100175F6:PROC
EXTRN sub_100175F8:PROC
EXTRN sub_10017636:PROC
EXTRN sub_10017638:PROC
EXTRN sub_10017676:PROC
EXTRN sub_10017678:PROC
EXTRN EXTRN g_101D7FC8:DWORD:DWORD
EXTRN EXTRN g_101DA2D4:DWORD:DWORD
.CODE
FUN_10017540 PROC
    push push esi
    push push edi
    call sub_10017477
    xor xor eax, eax
    mov mov ecx, 0C0h
    mov mov edi, 0101D7FCCh
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor esi, esi
    mov mov dword ptr [g_101D7FC8], esi
    call sub_10016DD2
    mov mov ecx, 0100h
    xor xor eax, eax
    mov mov edi, 0101DA564h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [g_101DA2D4], esi
    cmp cmp dword ptr [eax + 0101DA460h], esi
    je L0
    mov mov dword ptr [eax + 0101DA460h], esi
    add add eax, 4
    cmp cmp eax, 0100h
    jb L1
    xor xor eax, eax
    cmp cmp dword ptr [eax + 0101DA3DCh], esi
    je sub_100175F6
    mov mov dword ptr [eax + 0101DA3DCh], esi
    add add eax, 4
    cmp cmp eax, 080h
    jb sub_100175F8
    xor xor eax, eax
    lea lea ebx, [ebx]
    cmp cmp dword ptr [eax + 0101D92D4h], esi
    je sub_10017636
    mov mov dword ptr [eax + 0101D92D4h], esi
    add add eax, 4
    cmp cmp eax, 01000h
    jb sub_10017638
    xor xor eax, eax
    lea lea ebx, [ebx]
    cmp cmp dword ptr [eax + 0101D82D0h], esi
    je sub_10017676
    mov mov dword ptr [eax + 0101D82D0h], esi
    add add eax, 4
    cmp cmp eax, 01000h
    jb sub_10017678
    pop pop edi
    pop pop esi
    ret ret
FUN_10017540 ENDP
END
