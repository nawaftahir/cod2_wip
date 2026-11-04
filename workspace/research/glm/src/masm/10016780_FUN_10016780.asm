.686
.MODEL FLAT, C
EXTRN sub_1001395B:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101D7FC8:DWORD
.CODE
FUN_10016780 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 16]
    add ebp, ebp
    push esi
    xor eax, eax
    test ebp, ebp
    push edi
    jle L1
    mov ecx, 119
    mov edx, ebp
    jmp L0
    lea esp, [esp]
L0:
    mov esi, dword ptr [esp + 20]
    movzx esi, byte ptr [esi + ecx - 119]
    imul esi, ecx
    add eax, esi
    inc ecx
    dec edx
    jne L0
L1:
    and eax, 31
    lea ebx, [eax + eax*2]
    mov ecx, dword ptr [ebx*8 + 0101D7FCCh]
    test ecx, ecx
    lea ebx, [ebx*8 + 0101D7FCCh]
    je L4
    lea ebx, [ebx]
L2:
    mov ecx, dword ptr [esp + 24]
    cmp dword ptr [ebx + 4], ecx
    jne L3
    mov edi, dword ptr [esp + 20]
    mov esi, dword ptr [ebx]
    mov ecx, ebp
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L6
L3:
    inc eax
    and eax, 31
    lea ebx, [eax + eax*2]
    mov ecx, dword ptr [ebx*8 + 0101D7FCCh]
    test ecx, ecx
    lea ebx, [ebx*8 + 0101D7FCCh]
    jne L2
L4:
    cmp dword ptr [g_101D7FC8], 31
    jne L5
    push 31
    push 0101944A8h
    push 1
    call sub_1001395B
    add esp, 12
L5:
    mov esi, dword ptr [g_101D7FC8]
    inc esi
    push ebp
    mov dword ptr [g_101D7FC8], esi
    call dword ptr [fp_101D49D4]
    mov esi, dword ptr [esp + 24]
    mov ecx, ebp
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    add esp, 4
    xor ecx, ecx
    mov edx, ebx
    mov dword ptr [edx], ecx
    mov dword ptr [edx + 4], ecx
    mov dword ptr [edx + 8], ecx
    mov dword ptr [edx + 12], ecx
    mov dword ptr [edx + 16], ecx
    mov dword ptr [edx + 20], ecx
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esp + 24]
    pop edi
    pop esi
    mov dword ptr [ebx + 4], eax
    pop ebp
    mov eax, ebx
    mov byte ptr [ecx], 0
    pop ebx
    ret
L6:
    mov eax, dword ptr [esp + 28]
    pop edi
    pop esi
FUN_10016780 ENDP
END
