.686
.MODEL FLAT, C
EXTRN sub_10054E89:PROC
EXTRN sub_10054EA8:PROC
EXTRN sub_10054EEE:PROC
EXTRN sub_10054EF3:PROC
EXTRN sub_10054EF5:PROC
EXTRN sub_10054F84:PROC
EXTRN sub_10054F91:PROC
.CODE
FUN_10054d40 PROC
    push push ebx
    mov mov ebx, dword ptr [esp + 16]
    cmp cmp ebx, 03B9AC9F0h
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 20]
    mov mov eax, dword ptr [edi + 4]
    mov mov dword ptr [esp + 20], eax
    jbe L0
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 20], 54
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 24], 1
    mov mov eax, dword ptr [edi]
    push push edi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, ebx
    and and eax, 7
    jbe L1
    mov mov ecx, 8
    sub sub ecx, eax
    add add ebx, ecx
    mov mov dword ptr [esp + 28], ebx
    mov mov esi, dword ptr [esp + 24]
    test test esi, esi
    jl L2
    cmp cmp esi, 2
    jl L3
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 20], 14
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [eax + 24], esi
    mov mov ecx, dword ptr [edi]
    push push edi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [edx + esi*4 + 52]
    xor xor ebp, ebp
    test test eax, eax
    je L4
    lea lea ebx, [ebx]
    cmp cmp dword ptr [eax + 8], ebx
    jae sub_10054EF3
    mov mov ebp, eax
    mov mov eax, dword ptr [eax]
    test test eax, eax
    jne L5
    add add ebx, 16
    test test ebp, ebp
    jne L6
    mov mov esi, dword ptr [esi*4 + 0101910DCh]
    jmp sub_10054E89
    mov mov esi, dword ptr [esi*4 + 0101910E4h]
    mov mov eax, 03B9ACA00h
    sub sub eax, ebx
    cmp cmp esi, eax
    jbe sub_10054EA8
    mov mov esi, eax
    lea lea eax, [esi + ebx]
    push push eax
    call call dword ptr [edi + 24]
    add add esp, 4
    test test eax, eax
    jne sub_10054EF5
    shr shr esi, 1
    cmp cmp esi, 50
    jae sub_10054EEE
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 20], 54
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 24], 2
    mov mov eax, dword ptr [edi]
    push push edi
    call call dword ptr [eax]
    add add esp, 4
    lea lea ecx, [esi + ebx]
    push push ecx
    call call dword ptr [edi + 24]
    add add esp, 4
    test test eax, eax
    je sub_10054EF5
    mov mov ecx, dword ptr [esp + 20]
    mov mov edi, dword ptr [ecx + 76]
    lea lea edx, [esi + ebx]
    add add edi, edx
    mov mov edx, dword ptr [esp + 28]
    mov mov dword ptr [ecx + 76], edi
    add add esi, edx
    test test ebp, ebp
    mov mov dword ptr [eax], 0
    mov mov dword ptr [eax + 4], 0
    mov mov dword ptr [eax + 8], esi
    mov mov ebx, edx
    jne sub_10054F84
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [ecx + edx*4 + 52], eax
    jmp sub_10054F91
    mov mov dword ptr [ebp], eax
    mov mov ecx, dword ptr [eax + 4]
    lea lea edx, [ecx + eax + 16]
    add add ecx, ebx
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [eax + 8]
L6:
    pop pop edi
    pop pop esi
    sub sub ecx, ebx
    pop pop ebp
    mov mov dword ptr [eax + 8], ecx
    mov mov eax, edx
    pop pop ebx
    ret ret
FUN_10054d40 ENDP
END
