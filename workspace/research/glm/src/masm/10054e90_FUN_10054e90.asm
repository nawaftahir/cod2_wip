.686
.MODEL FLAT, C
.CODE
FUN_10054e90 PROC
    push ebx
    mov ebx, dword ptr [esp + 16]
    cmp ebx, 03B9AC9F0h
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 20]
    mov ebp, dword ptr [edi + 4]
    jbe L0
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], 54
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 24], 3
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
L0:
    mov eax, ebx
    and eax, 7
    jbe L1
    mov ecx, 8
    sub ecx, eax
    add ebx, ecx
L1:
    mov eax, dword ptr [esp + 24]
    test eax, eax
    jl L2
    cmp eax, 2
    jl L3
L2:
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 20], 14
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 24], eax
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
L3:
    lea eax, [ebx + 16]
    push eax
    call dword ptr [edi + 0x18]
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L4
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 54
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 24], 4
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L4:
    mov eax, dword ptr [ebp + 76]
    lea ecx, [ebx + 16]
    add eax, ecx
    mov dword ptr [ebp + 76], eax
    mov eax, dword ptr [esp + 24]
    mov edx, dword ptr [ebp + eax*4 + 60]
    mov dword ptr [esi + 4], ebx
    mov dword ptr [esi], edx
    mov dword ptr [esi + 8], 0
    mov dword ptr [ebp + eax*4 + 60], esi
    pop edi
    lea eax, [esi + 16]
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10054e90 ENDP
END
