.686
.MODEL FLAT, C
EXTRN sub_100F8508:PROC
EXTRN sub_100F8513:PROC
EXTRN sub_100F8566:PROC
EXTRN sub_100F85E1:PROC
EXTRN sub_100F85E9:PROC
EXTRN sub_100F8662:PROC
EXTRN sub_100F866D:PROC
EXTRN sub_100FC4EA:PROC
EXTRN sub_100FC518:PROC
EXTRN sub_100FD833:PROC
EXTRN sub_100FFD68:PROC
EXTRN sub_100FFD9D:PROC
EXTRN sub_100FFDA8:PROC
EXTRN sub_100FFDBD:PROC
EXTRN sub_100FFDF8:PROC
EXTRN sub_100FFDFD:PROC
EXTRN sub_100FFE01:PROC
EXTRN sub_100FFE06:PROC
EXTRN sub_100FFE0B:PROC
EXTRN sub_100FFE15:PROC
EXTRN sub_100FFE28:PROC
EXTRN sub_100FFE34:PROC
EXTRN sub_100FFE4C:PROC
EXTRN sub_100FFE84:PROC
EXTRN sub_100FFEB5:PROC
EXTRN sub_100FFEBA:PROC
EXTRN sub_100FFEC5:PROC
EXTRN sub_101085FB:PROC
EXTRN sub_1010860C:PROC
EXTRN sub_1010861D:PROC
EXTRN EXTRN g_101A4684:DWORD:DWORD
EXTRN EXTRN g_101A509C:DWORD:DWORD
EXTRN EXTRN g_101A50A0:DWORD:DWORD
EXTRN EXTRN g_101A50A4:DWORD:DWORD
EXTRN EXTRN g_101A50CC:DWORD:DWORD
EXTRN EXTRN g_101A50E4:DWORD:DWORD
EXTRN EXTRN g_101A50E8:DWORD:DWORD
EXTRN EXTRN g_101AE168:DWORD:DWORD
EXTRN EXTRN g_101AE19C:DWORD:DWORD
EXTRN EXTRN g_101AE1A0:DWORD:DWORD
EXTRN EXTRN g_101AE1CE:DWORD:DWORD
EXTRN EXTRN g_1076AC8C:DWORD:DWORD
EXTRN EXTRN g_1076AC90:DWORD:DWORD
.CODE
___init_numeric PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    xor xor esi, esi
    cmp cmp dword ptr [g_101AE1A0], esi
    push push edi
    jne L2
    cmp cmp dword ptr [g_101AE19C], esi
    jne L4
    mov mov eax, dword ptr [g_1076AC8C]
    cmp cmp eax, esi
    je L0
    cmp cmp dword ptr [eax], esi
    jne L1
    mov mov ecx, dword ptr [g_101A4684]
    cmp cmp eax, dword ptr [ecx + 44]
    je L3
    push push eax
    call sub_100F8508
    push push dword ptr [g_101AE168]
    call sub_100F8513
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [g_1076AC90], esi
    mov mov dword ptr [g_1076AC8C], esi
    mov mov ebx, 0101A509Ch
    mov mov dword ptr [g_101AE168], esi
    jmp sub_100FFDA8
    push push 48
    push push 1
    call sub_100FD833
    mov mov ebx, eax
L1:
    cmp cmp ebx, esi
    pop pop ecx
    pop pop ecx
    je L6
    mov mov esi, dword ptr [g_101A50CC]
    push push 12
    pop pop ecx
L4:
    mov mov edi, ebx
    push push 4
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_100FC4EA
    xor xor esi, esi
    cmp cmp eax, esi
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    jne L7
    push push ebx
    call sub_100F8566
    pop pop ecx
    xor xor eax, eax
    inc inc eax
    jmp sub_100FFE01
    mov mov dword ptr [eax], esi
    cmp cmp dword ptr [g_101AE1A0], esi
    je sub_100FFD9D
    push push 4
    call sub_100FC518
    cmp cmp eax, esi
    pop pop ecx
    mov mov dword ptr [g_1076AC90], eax
    jne L8
    xor xor esi, esi
    inc inc esi
    jmp sub_100FFD68
    mov mov dword ptr [eax], esi
    movzx movzx esi, word ptr [g_101AE1CE]
    push push ebx
    push push 14
    push push esi
    push push 1
    call sub_101085FB
    mov mov dword ptr [ebp - 4], eax
    lea lea eax, [ebx + 4]
    push push eax
    push push 15
    push push esi
    push push 1
    call sub_1010860C
    or or dword ptr [ebp - 4], eax
    lea lea edi, [ebx + 8]
    push push edi
    push push 16
    push push esi
    push push 1
    call sub_1010861D
    add add esp, 48
    or or eax, dword ptr [ebp - 4]
    je sub_100FFDBD
    push push ebx
    call L5
    pop pop ecx
    or or esi, -1
    push push ebx
    call sub_100F85E1
    push push dword ptr [ebp - 8]
    call sub_100F85E9
    pop pop ecx
    pop pop ecx
    mov mov eax, esi
    jmp sub_100FFE84
    mov mov eax, dword ptr [edi]
    jmp sub_100FFDF8
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 48
    jl sub_100FFE06
    cmp cmp cl, 57
    jg sub_100FFE0B
    sub sub cl, 48
    mov mov byte ptr [eax], cl
    inc inc eax
    cmp cmp byte ptr [eax], 0
    jne sub_100FFDFD
    jmp sub_100FFE4C
    cmp cmp cl, 59
    jne sub_100FFE15
    mov mov esi, eax
    lea lea edi, [esi + 1]
    mov mov cl, byte ptr [edi]
    mov mov byte ptr [esi], cl
    mov mov esi, edi
    cmp cmp byte ptr [esi], 0
    jne sub_100FFE34
    jmp sub_100FFE28
    mov mov eax, dword ptr [g_101A509C]
    mov mov dword ptr [g_1076AC90], esi
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [g_101A50A0]
    mov mov dword ptr [ebx + 4], eax
    mov mov eax, dword ptr [g_101A50A4]
    mov mov dword ptr [ebx + 8], eax
    mov mov eax, dword ptr [g_1076AC8C]
    test test eax, eax
    je sub_100FFEB5
    cmp cmp dword ptr [eax], 0
    jne sub_100FFEBA
L8:
    mov mov ecx, dword ptr [g_101A4684]
    cmp cmp eax, dword ptr [ecx + 44]
    je sub_100FFEC5
    push push eax
    call sub_100F8662
    push push dword ptr [g_101AE168]
    call sub_100F866D
    pop pop ecx
    pop pop ecx
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [g_1076AC8C], eax
    mov mov dword ptr [g_101AE168], ebx
    mov mov dword ptr [g_101A50CC], ebx
    mov mov eax, dword ptr [ebx]
    mov mov al, byte ptr [eax]
    mov mov byte ptr [g_101A50E4], al
    mov mov dword ptr [g_101A50E8], 1
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
___init_numeric ENDP
END
