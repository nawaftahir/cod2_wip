.686
.MODEL FLAT, C
.CODE
FUN_10054d40 PROC
    push ebx
    mov ebx, dword ptr [esp + 16]
    cmp ebx, 03B9AC9F0h
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 20]
    mov eax, dword ptr [edi + 4]
    mov dword ptr [esp + 20], eax
    jbe L0
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 54
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 24], 1
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L0:
    mov eax, ebx
    and eax, 7
    jbe L1
    mov ecx, 8
    sub ecx, eax
    add ebx, ecx
    mov dword ptr [esp + 28], ebx
L1:
    mov esi, dword ptr [esp + 24]
    test esi, esi
    jl L2
    cmp esi, 2
    jl L3
L2:
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 20], 14
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 24], esi
    mov ecx, dword ptr [edi]
    push edi
    call dword ptr [ecx]
    add esp, 4
L3:
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [edx + esi*4 + 52]
    xor ebp, ebp
    test eax, eax
    je L5
    lea ebx, [ebx]
L4:
    cmp dword ptr [eax + 8], ebx
    jae L13
    mov ebp, eax
    mov eax, dword ptr [eax]
    test eax, eax
    jne L4
L5:
    add ebx, 16
    test ebp, ebp
    jne L6
    mov esi, dword ptr [esi*4 + 0101910DCh]
    jmp L7
L6:
    mov esi, dword ptr [esi*4 + 0101910E4h]
L7:
    mov eax, 03B9ACA00h
    sub eax, ebx
    cmp esi, eax
    jbe L8
    mov esi, eax
L8:
    lea eax, [esi + ebx]
    push eax
    call dword ptr [edi + 0x18]
    add esp, 4
    test eax, eax
    jne L11
L9:
    shr esi, 1
    cmp esi, 50
    jae L10
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 54
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 24], 2
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L10:
    lea ecx, [esi + ebx]
    push ecx
    call dword ptr [edi + 0x18]
    add esp, 4
    test eax, eax
    je L9
L11:
    mov ecx, dword ptr [esp + 20]
    mov edi, dword ptr [ecx + 76]
    lea edx, [esi + ebx]
    add edi, edx
    mov edx, dword ptr [esp + 28]
    mov dword ptr [ecx + 76], edi
    add esi, edx
    test ebp, ebp
    mov dword ptr [eax], 0
    mov dword ptr [eax + 4], 0
    mov dword ptr [eax + 8], esi
    mov ebx, edx
    jne L12
    mov edx, dword ptr [esp + 24]
    mov dword ptr [ecx + edx*4 + 52], eax
    jmp L13
L12:
    mov dword ptr [ebp], eax
L13:
    mov ecx, dword ptr [eax + 4]
    lea edx, [ecx + eax + 16]
    add ecx, ebx
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [eax + 8]
    pop edi
    pop esi
    sub ecx, ebx
    pop ebp
    mov dword ptr [eax + 8], ecx
    mov eax, edx
    pop ebx
    ret
FUN_10054d40 ENDP
END
