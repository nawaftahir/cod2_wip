.686
.MODEL FLAT, C
EXTRN sub_1006DD9F:PROC
EXTRN sub_1006DEB0:PROC
EXTRN sub_1006E224:PROC
EXTRN sub_1007D088:PROC
EXTRN sub_1007D614:PROC
EXTRN sub_10081F81:PROC
EXTRN sub_10081FE2:PROC
.CODE
FUN_1007d515 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 16]
    push edi
    mov edi, dword ptr [ebp + 28]
    mov dword ptr [ebp - 4], ecx
    xor ebx, ebx
L0:
    cmp edi, ebx
    je L1
    mov dword ptr [edi], ebx
L1:
    mov eax, dword ptr [ebp + 32]
    cmp eax, ebx
    je L2
    mov dword ptr [eax], ebx
L2:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 4]
    and dword ptr [ebp + 24], 0FFFFFFE7h
    push esi
    mov dword ptr [ecx], eax
    call sub_1006E224
    test eax, eax
    jne L9
    push 13
    pop ecx
    cmp dword ptr [esi + 4], ecx
    jne L11
    mov eax, dword ptr [esi + 24]
    imul eax, dword ptr [esi + 20]
    cmp eax, 1
    mov edx, esi
    ja L12
L3:
    cmp dword ptr [esi + 28], ebx
    jne L5
L4:
    mov esi, dword ptr [esi + 32]
    cmp dword ptr [esi + 4], ecx
    je L3
L5:
    cmp dword ptr [esi + 4], 1
    jne L6
    mov esi, dword ptr [esi + 8]
    cmp esi, ebx
    jne L5
L6:
    cmp dword ptr [esi + 4], ecx
    jne L7
    cmp dword ptr [esi + 28], ebx
    je L4
L7:
    mov eax, dword ptr [esi + 4]
    cmp eax, ecx
    jne L8
    cmp dword ptr [esi + 28], 27
    je L13
L8:
    cmp eax, 14
    jne L20
    cmp dword ptr [esi + 16], 4
    jne L14
    mov eax, dword ptr [esi + 24]
    cmp dword ptr [eax + 4], ecx
    jne L14
    mov esi, eax
    jmp L0
L9:
    cmp esi, ebx
    je L10
    cmp dword ptr [esi + 4], 13
    jne L10
    mov eax, dword ptr [esi + 16]
    cmp eax, ebx
    je L10
    cmp dword ptr [eax + 4], 9
    jne L10
    and byte ptr [eax + 33], 0000000F3h
L10:
    push dword ptr [ebp + 32]
    mov ecx, dword ptr [ebp - 4]
    push edi
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push ebx
    push ebx
    push esi
    push ebx
    push ebx
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1007D088
    jmp L23
L11:
    push 01010FD48h
    push ebx
    push esi
    push dword ptr [ebp - 4]
    call sub_1006DD9F
    mov eax, 080004005h
    jmp L22
L12:
    push 01010FD00h
    push 000000DACh
    push esi
    jmp L21
L13:
    push dword ptr [ebp + 32]
    mov eax, dword ptr [esi + 32]
    mov eax, dword ptr [eax + 24]
    mov esi, dword ptr [esi + 36]
    mov ecx, dword ptr [esi + 32]
    mov esi, dword ptr [esi + 36]
    push edi
    push dword ptr [ebp + 24]
    push eax
    push ebx
    push esi
    push ecx
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1007D614
    jmp L23
L14:
    mov eax, dword ptr [esi + 16]
    cmp eax, 5
    jne L16
    cmp edi, ebx
    je L15
    push edi
    push dword ptr [esi + 28]
    call sub_10081F81
    cmp eax, ebx
    jl L23
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [esi + 28]
    mov edx, dword ptr [eax]
    mov esi, dword ptr [esi + 24]
    push eax
    mov dword ptr [ebp + 24], ecx
    call dword ptr [edx + 0xc]
    mov edi, eax
    mov eax, dword ptr [ebp + 24]
    mov ecx, eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L15:
    mov eax, dword ptr [ebp + 32]
    cmp eax, ebx
    je L19
    mov dword ptr [eax], ebx
    jmp L19
L16:
    cmp eax, 6
    jne L20
    cmp dword ptr [esi + 32], 9
    jne L20
    mov eax, dword ptr [esi + 40]
    cmp eax, ebx
    je L20
    cmp edi, ebx
    je L18
    lea edx, [eax + 1]
L17:
    mov cl, byte ptr [eax]
    inc eax
    cmp cl, bl
    jne L17
    sub eax, edx
    push edi
    inc eax
    push eax
    call sub_10081FE2
    cmp eax, ebx
    jl L23
    mov eax, dword ptr [edi]
    mov edi, eax
    mov dword ptr [ebp + 24], eax
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax + 0x10]
    mov ecx, dword ptr [edi]
    mov esi, dword ptr [esi + 40]
    push edi
    mov dword ptr [ebp + 24], eax
    call dword ptr [ecx + 0xc]
    mov edi, eax
    mov eax, dword ptr [ebp + 24]
    mov ecx, eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L18:
    mov eax, dword ptr [ebp + 32]
    cmp eax, ebx
    je L19
    mov dword ptr [eax], 1
L19:
    xor eax, eax
    jmp L23
L20:
    push 01010FCC8h
    push 000000DACh
    push edx
L21:
    push dword ptr [ebp - 4]
    call sub_1006DEB0
    mov eax, 080004001h
L22:
    add esp, 16
L23:
    pop edi
    pop esi
    pop ebx
    leave
    ret 28
FUN_1007d515 ENDP
END
