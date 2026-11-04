.686
.MODEL FLAT, C
EXTRN sub_1001395B:PROC
EXTRN sub_100168AB:PROC
EXTRN sub_100168E2:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101D7FC8:DWORD:DWORD
.CODE
FUN_10016780 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    add add ebp, ebp
    push push esi
    xor xor eax, eax
    test test ebp, ebp
    push push edi
    jle L1
    mov mov ecx, 119
    mov mov edx, ebp
    jmp L0
    lea lea esp, [esp]
    mov mov esi, dword ptr [esp + 20]
    movzx movzx esi, byte ptr [esi + ecx - 119]
    imul imul esi, ecx
    add add eax, esi
    inc inc ecx
    dec dec edx
    jne L2
    and and eax, 31
    lea lea ebx, [eax + eax*2]
    mov mov ecx, dword ptr [ebx*8 + 0101D7FCCh]
    test test ecx, ecx
    lea lea ebx, [ebx*8 + 0101D7FCCh]
    je L4
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [esp + 24]
    cmp cmp dword ptr [ebx + 4], ecx
    jne L3
    mov mov edi, dword ptr [esp + 20]
    mov mov esi, dword ptr [ebx]
    mov mov ecx, ebp
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100168E2
    inc inc eax
    and and eax, 31
    lea lea ebx, [eax + eax*2]
    mov mov ecx, dword ptr [ebx*8 + 0101D7FCCh]
    test test ecx, ecx
    lea lea ebx, [ebx*8 + 0101D7FCCh]
    jne L5
    cmp cmp dword ptr [g_101D7FC8], 31
    jne sub_100168AB
    push push 31
    push push 0101944A8h
    push push 1
    call sub_1001395B
    add add esp, 12
    mov mov esi, dword ptr [g_101D7FC8]
    inc inc esi
    push push ebp
    mov mov dword ptr [g_101D7FC8], esi
    call dword ptr [fp_101D49D4]
    mov mov esi, dword ptr [esp + 24]
    mov mov ecx, ebp
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    add add esp, 4
    xor xor ecx, ecx
    mov mov edx, ebx
    mov mov dword ptr [edx], ecx
    mov mov dword ptr [edx + 4], ecx
L5:
    mov mov dword ptr [edx + 8], ecx
    mov mov dword ptr [edx + 12], ecx
    mov mov dword ptr [edx + 16], ecx
    mov mov dword ptr [edx + 20], ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [esp + 24]
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebx + 4], eax
    pop pop ebp
    mov mov eax, ebx
    mov mov byte ptr [ecx], 0
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esp + 28]
    pop pop edi
    pop pop esi
FUN_10016780 ENDP
END
