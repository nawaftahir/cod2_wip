.686
.MODEL FLAT, C
.CODE
FUN_10048630 PROC
    sub esp, 20
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [eax]
    cmp ecx, dword ptr [esp + 36]
    push ebp
    mov ebp, dword ptr [esp + 28]
    push esi
    mov esi, dword ptr [ebp + 00000014Ch]
    mov dword ptr [esp + 24], esi
    jae L16
    push ebx
    push edi
L0:
    mov eax, dword ptr [esp + 60]
    mov edx, dword ptr [esp + 64]
    cmp dword ptr [eax], edx
    jae L15
    mov ecx, dword ptr [esp + 48]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [esp + 52]
    mov ebx, dword ptr [ebp + 0000000E4h]
    mov edi, dword ptr [esi + 52]
    sub eax, ecx
    sub ebx, edi
    cmp ebx, eax
    jb L1
    mov ebx, eax
L1:
    mov eax, dword ptr [esi + 52]
    mov edx, dword ptr [ebp + 000000158h]
    push ebx
    push eax
    mov eax, dword ptr [esp + 52]
    lea edi, [esi + 8]
    push edi
    lea ecx, [eax + ecx*4]
    push ecx
    push ebp
    call dword ptr [edx + 4]
    mov eax, dword ptr [esp + 68]
    add dword ptr [eax], ebx
    mov edx, dword ptr [esi + 52]
    mov ecx, dword ptr [esi + 48]
    add edx, ebx
    add esp, 20
    sub ecx, ebx
    mov dword ptr [esi + 52], edx
    mov eax, edx
    mov dword ptr [esi + 48], ecx
    jne L6
    cmp eax, dword ptr [ebp + 0000000E4h]
    jge L6
    mov eax, dword ptr [ebp + 68]
    test eax, eax
    mov dword ptr [esp + 16], 0
    jle L5
    mov dword ptr [esp + 20], edi
    lea ecx, [ecx]
L2:
    mov ecx, dword ptr [ebp + 0000000E4h]
    mov edx, dword ptr [esi + 52]
    cmp edx, ecx
    mov eax, dword ptr [ebp + 36]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 28], ecx
    mov eax, edx
    jge L4
    lea esp, [esp]
L3:
    mov ecx, dword ptr [esp + 24]
    mov edi, dword ptr [ebx + eax*4]
    mov esi, dword ptr [ebx + edx*4 - 4]
    mov ebp, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebp
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [esp + 28]
    inc eax
    cmp eax, ecx
    jl L3
    mov esi, dword ptr [esp + 32]
    mov ebp, dword ptr [esp + 40]
L4:
    mov eax, dword ptr [esp + 16]
    mov edi, dword ptr [esp + 20]
    mov ecx, dword ptr [ebp + 68]
    inc eax
    add edi, 4
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], edi
    jl L2
L5:
    mov ecx, dword ptr [ebp + 0000000E4h]
    mov dword ptr [esi + 52], ecx
L6:
    mov edx, dword ptr [esi + 52]
    cmp edx, dword ptr [ebp + 0000000E4h]
    mov ebx, dword ptr [esp + 60]
    jne L7
    mov edx, dword ptr [ebx]
    mov eax, dword ptr [esp + 56]
    mov ecx, dword ptr [ebp + 00000015Ch]
    push edx
    push eax
    push 0
    lea eax, [esi + 8]
    push eax
    push ebp
    call dword ptr [ecx + 4]
    mov dword ptr [esi + 52], 0
    mov eax, dword ptr [ebx]
    add esp, 20
    inc eax
    mov dword ptr [ebx], eax
L7:
    mov eax, dword ptr [esi + 48]
    test eax, eax
    jne L8
    mov ecx, dword ptr [ebx]
    cmp ecx, dword ptr [esp + 64]
    jb L9
L8:
    mov eax, dword ptr [esp + 48]
    mov edx, dword ptr [esp + 52]
    cmp dword ptr [eax], edx
    jb L0
    pop edi
    pop ebx
    pop esi
    pop ebp
    add esp, 20
    ret
L9:
    mov eax, dword ptr [ebp + 68]
    test eax, eax
    mov edi, dword ptr [ebp + 76]
    mov dword ptr [esp + 16], 0
    jle L14
    add edi, 12
    mov dword ptr [esp + 52], edi
L10:
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [esp + 60]
    mov eax, dword ptr [eax]
    mov ebx, dword ptr [esp + 16]
    imul eax, ecx
    mov esi, dword ptr [esp + 56]
    mov esi, dword ptr [esi + ebx*4]
    mov edx, ecx
    imul edx, dword ptr [esp + 64]
    mov ecx, dword ptr [edi + 16]
    shl ecx, 3
    cmp eax, edx
    mov ebx, eax
    mov dword ptr [esp + 40], ecx
    mov dword ptr [esp + 32], esi
    mov dword ptr [esp + 48], ebx
    jge L13
    jmp L12
L11:
    mov ecx, dword ptr [esp + 40]
    mov esi, dword ptr [esp + 32]
L12:
    mov ebx, dword ptr [esi + ebx*4]
    mov edi, dword ptr [esi + eax*4 - 4]
    mov esi, edi
    mov edi, ebx
    mov ebx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    mov ebx, dword ptr [esp + 48]
    and ecx, 3
    inc ebx
    cmp ebx, edx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov dword ptr [esp + 48], ebx
    jl L11
    mov edi, dword ptr [esp + 52]
L13:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [ebp + 68]
    inc eax
    add edi, 84
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 52], edi
    jl L10
    mov ebx, dword ptr [esp + 60]
L14:
    mov ecx, dword ptr [esp + 64]
    mov dword ptr [ebx], ecx
L15:
    pop edi
    pop ebx
L16:
    pop esi
    pop ebp
    add esp, 20
    ret
FUN_10048630 ENDP
END
