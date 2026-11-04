.686
.MODEL FLAT, C
.CODE
FUN_1004d880 PROC
    push ecx
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 20]
    mov eax, dword ptr [esi + 00000018Ch]
    mov ebx, dword ptr [esi + 0000000CCh]
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [esi + 44]
    xor ebp, ebp
    test eax, eax
    jle L7
    push edi
    add ebx, 12
    jmp L1
L0:
    mov esi, dword ptr [esp + 24]
    jmp L1
    lea ecx, [ecx]
L1:
    mov ecx, dword ptr [ebx + 24]
    imul ecx, dword ptr [ebx]
    mov eax, ecx
    cdq
    idiv dword ptr [esi + 000000120h]
    xor edx, edx
    mov edi, eax
    mov eax, dword ptr [ebx + 32]
    div ecx
    mov esi, edx
    test esi, esi
    jne L2
    mov esi, ecx
L2:
    test ebp, ebp
    jne L3
    lea eax, [esi - 1]
    cdq
    idiv edi
    mov ecx, eax
    mov eax, dword ptr [esp + 16]
    inc ecx
    mov dword ptr [eax + 72], ecx
    jmp L4
L3:
    mov eax, dword ptr [esp + 16]
L4:
    mov edx, dword ptr [eax + 64]
    mov eax, dword ptr [eax + edx*4 + 56]
    mov eax, dword ptr [eax + ebp*4]
    lea edx, [edi + edi]
    test edx, edx
    jle L6
    lea ecx, [eax + esi*4]
    mov eax, ecx
L5:
    mov esi, dword ptr [ecx - 4]
    mov dword ptr [eax], esi
    add eax, 4
    dec edx
    jne L5
L6:
    mov ecx, dword ptr [esp + 24]
    mov eax, dword ptr [ecx + 44]
    inc ebp
    add ebx, 84
    cmp ebp, eax
    jl L0
    pop edi
L7:
    pop esi
    pop ebp
FUN_1004d880 ENDP
END
