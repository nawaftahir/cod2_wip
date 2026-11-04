.686
.MODEL FLAT, C
EXTRN sub_1006DD9F:PROC
EXTRN sub_1006DEB0:PROC
EXTRN sub_1006E224:PROC
EXTRN sub_1007D088:PROC
EXTRN sub_1007D7A6:PROC
EXTRN sub_1007D7EC:PROC
EXTRN sub_1007D7F3:PROC
EXTRN sub_1007D81B:PROC
EXTRN sub_1007D831:PROC
EXTRN sub_1007D834:PROC
EXTRN sub_1007D870:PROC
EXTRN sub_1007D871:PROC
EXTRN sub_1007D88E:PROC
EXTRN sub_1007D89A:PROC
EXTRN sub_1007D89E:PROC
EXTRN sub_1007D8A7:PROC
EXTRN sub_1007D8AD:PROC
EXTRN sub_1007D8B4:PROC
EXTRN sub_1007D8EB:PROC
EXTRN sub_1007D8FF:PROC
EXTRN sub_1007D928:PROC
EXTRN sub_10081F81:PROC
EXTRN sub_10081FE2:PROC
.CODE
FUN_1007d515 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 16]
    push push edi
    mov mov edi, dword ptr [ebp + 28]
    mov mov dword ptr [ebp - 4], ecx
    xor xor ebx, ebx
    cmp cmp edi, ebx
    je L0
    mov mov dword ptr [edi], ebx
    mov mov eax, dword ptr [ebp + 32]
    cmp cmp eax, ebx
    je L1
    mov mov dword ptr [eax], ebx
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 4]
    and and dword ptr [ebp + 24], -25
    push push esi
    mov mov dword ptr [ecx], eax
    call sub_1006E224
    test test eax, eax
    jne L8
    push push 13
    pop pop ecx
    cmp cmp dword ptr [esi + 4], ecx
    jne L12
    mov mov eax, dword ptr [esi + 24]
    imul imul eax, dword ptr [esi + 20]
    cmp cmp eax, 1
    mov mov edx, esi
    ja L13
    cmp cmp dword ptr [esi + 28], ebx
    jne L3
    mov mov esi, dword ptr [esi + 32]
    cmp cmp dword ptr [esi + 4], ecx
    je L2
    cmp cmp dword ptr [esi + 4], 1
    jne L7
    mov mov esi, dword ptr [esi + 8]
    cmp cmp esi, ebx
    jne L5
    cmp cmp dword ptr [esi + 4], ecx
    jne L9
    cmp cmp dword ptr [esi + 28], ebx
    je L6
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, ecx
    jne L11
    cmp cmp dword ptr [esi + 28], 27
    je L18
    cmp cmp eax, 14
    jne sub_1007D7A6
    cmp cmp dword ptr [esi + 16], 4
    jne L19
    mov mov eax, dword ptr [esi + 24]
    cmp cmp dword ptr [eax + 4], ecx
    jne L20
    mov mov esi, eax
    jmp L4
    cmp cmp esi, ebx
    je L14
    cmp cmp dword ptr [esi + 4], 13
    jne L15
    mov mov eax, dword ptr [esi + 16]
    cmp cmp eax, ebx
    je L16
    cmp cmp dword ptr [eax + 4], 9
    jne L17
    and and byte ptr [eax + 33], 0F3h
    push push dword ptr [ebp + 32]
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push dword ptr [ebp + 24]
L6:
    push push dword ptr [ebp + 20]
    push push ebx
L7:
    push push ebx
    push push esi
    push push ebx
    push push ebx
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1007D088
    jmp sub_1007D81B
    push push 01010FD48h
    push push ebx
    push push esi
    push push dword ptr [ebp - 4]
    call sub_1006DD9F
    mov mov eax, 080004005h
    jmp sub_1007D831
    push push 01010FD00h
    push push 0DACh
    push push esi
    jmp sub_1007D834
    push push dword ptr [ebp + 32]
    mov mov eax, dword ptr [esi + 32]
    mov mov eax, dword ptr [eax + 24]
    mov mov esi, dword ptr [esi + 36]
    mov mov ecx, dword ptr [esi + 32]
    mov mov esi, dword ptr [esi + 36]
    push push edi
    push push dword ptr [ebp + 24]
    push push eax
    push push ebx
    push push esi
    push push ecx
    push push dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call L10
    jmp sub_1007D871
    mov mov eax, dword ptr [esi + 16]
    cmp cmp eax, 5
    jne sub_1007D7F3
    cmp cmp edi, ebx
    je sub_1007D7EC
    push push edi
    push push dword ptr [esi + 28]
    call sub_10081F81
    cmp cmp eax, ebx
    jl sub_1007D88E
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [esi + 28]
    mov mov edx, dword ptr [eax]
    mov mov esi, dword ptr [esi + 24]
    push push eax
    mov mov dword ptr [ebp + 24], ecx
    call call dword ptr [edx + 12]
    mov mov edi, eax
    mov mov eax, dword ptr [ebp + 24]
    mov mov ecx, eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp + 32]
L15:
    cmp cmp eax, ebx
    je sub_1007D89A
    mov mov dword ptr [eax], ebx
    jmp sub_1007D89E
    cmp cmp eax, 6
    jne sub_1007D8A7
L17:
    cmp cmp dword ptr [esi + 32], 9
    jne sub_1007D8AD
    mov mov eax, dword ptr [esi + 40]
    cmp cmp eax, ebx
    je sub_1007D8B4
    cmp cmp edi, ebx
    je sub_1007D8A7
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    cmp cmp cl, bl
    jne sub_1007D870
    sub sub eax, edx
    push push edi
    inc inc eax
    push push eax
    call sub_10081FE2
    cmp cmp eax, ebx
    jl sub_1007D8EB
    mov mov eax, dword ptr [edi]
    mov mov edi, eax
    mov mov dword ptr [ebp + 24], eax
    mov mov eax, dword ptr [edi]
    push push edi
    call call dword ptr [eax + 16]
    mov mov ecx, dword ptr [edi]
    mov mov esi, dword ptr [esi + 40]
    push push edi
    mov mov dword ptr [ebp + 24], eax
    call call dword ptr [ecx + 12]
    mov mov edi, eax
    mov mov eax, dword ptr [ebp + 24]
    mov mov ecx, eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L19:
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp + 32]
    cmp cmp eax, ebx
L20:
    je sub_1007D8FF
    mov mov dword ptr [eax], 1
    xor xor eax, eax
    jmp sub_1007D928
    push push 01010FCC8h
    push push 0DACh
    push push edx
    push push dword ptr [ebp - 4]
    call sub_1006DEB0
    mov mov eax, 080004001h
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 28
FUN_1007d515 ENDP
END
