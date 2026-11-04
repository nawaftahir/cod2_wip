.686
.MODEL FLAT, C
.CODE
FUN_10087b3a PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ebx*4]
    mov eax, dword ptr [ebp + 12]
    cmp ebx, dword ptr [eax]
    mov dword ptr [ebp - 24], ecx
    jne L3
L1:
    mov dword ptr [ebp - 4], ebx
    fld1
L2:
    fstp qword ptr [ebp - 32]
    jmp L20
L3:
    mov eax, dword ptr [ecx + 64]
    cmp eax, -1
    je L4
    mov dword ptr [ebp - 4], eax
    fld qword ptr [ecx + 40]
    jmp L2
L4:
    cmp dword ptr [ecx + 8], -1
    jne L1
    mov eax, dword ptr [esi + 16]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 4], 2
    je L1
    mov eax, dword ptr [ecx + 72]
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ecx + 12]
    xor eax, eax
    test edx, edx
    push edi
    jbe L6
    mov edi, dword ptr [ecx + 16]
L5:
    cmp dword ptr [edi], ebx
    je L6
    inc eax
    add edi, 4
    cmp eax, edx
    jb L5
L6:
    cmp eax, edx
    je L17
    mov edi, dword ptr [ecx]
    and edi, 0FFF00000h
    cmp edi, 010000000h
    jne L7
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov ecx, dword ptr [ecx + 8]
    lea edx, [ebp - 32]
    push edx
    lea edx, [ebp - 4]
    push edx
    push dword ptr [ecx + eax*4]
    mov ecx, esi
    call L0
    test eax, eax
    jge L19
    jmp L17
L7:
    cmp edi, 010100000h
    jne L8
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov ecx, dword ptr [ecx + 8]
    lea edx, [ebp - 32]
    push edx
    lea edx, [ebp - 4]
    push edx
    push dword ptr [ecx + eax*4]
    mov ecx, esi
    call L0
    test eax, eax
    jl L17
    fld qword ptr [ebp - 32]
    fchs
    jmp L18
L8:
    cmp edi, 020400000h
    jne L12
    mov ecx, dword ptr [ecx + 8]
    mov edi, dword ptr [ecx + eax*4]
    add edx, eax
    mov ebx, dword ptr [ecx + edx*4]
    or dword ptr [ebp - 4], 0FFFFFFFFh
    cmp edi, ebx
    mov ecx, esi
    jne L9
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 4]
    push eax
    push edi
    call L0
    test eax, eax
    jl L16
    fld qword ptr [ebp - 32]
    fadd st(0), st(0)
    jmp L18
L9:
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 4]
    push eax
    push edi
    call L0
    test eax, eax
    jl L10
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 4]
    push eax
    push ebx
    mov ecx, esi
    call L0
    test eax, eax
    jge L11
L10:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 4]
    push eax
    push ebx
    mov ecx, esi
    call L0
    test eax, eax
    jl L16
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 4]
    push eax
    push edi
    mov ecx, esi
    call L0
    test eax, eax
    jl L16
L11:
    fld qword ptr [ebp - 20]
    fadd qword ptr [ebp - 12]
    jmp L18
L12:
    cmp edi, 020500000h
    jne L17
    mov ecx, dword ptr [ecx + 8]
    mov edi, dword ptr [ecx + eax*4]
    add edx, eax
    mov edx, dword ptr [ecx + edx*4]
    cmp edi, edx
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 16], edx
    je L17
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [esi + 16]
    mov edi, edx
    shl edi, 2
    mov eax, dword ptr [edi + eax]
    mov ebx, dword ptr [eax + 4]
    mov ecx, dword ptr [ecx + ebx*4]
    mov ebx, 000000100h
    test dword ptr [ecx + 4], ebx
    je L14
    cmp dword ptr [eax + 8], -1
    jne L14
    or dword ptr [ebp - 4], 0FFFFFFFFh
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 4]
    push eax
    push dword ptr [ebp - 8]
    mov ecx, esi
    call L0
    test eax, eax
    jl L13
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [edi + eax]
    jmp L15
L13:
    mov edx, dword ptr [ebp - 16]
L14:
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [esi + 16]
    shl eax, 2
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edi + ecx*4]
    test dword ptr [ecx + 4], ebx
    je L16
    cmp dword ptr [eax + 8], -1
    jne L16
    or dword ptr [ebp - 4], 0FFFFFFFFh
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 4]
    push eax
    push edx
    mov ecx, esi
    call L0
    test eax, eax
    jl L16
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ecx + eax]
L15:
    fld qword ptr [ebp - 32]
    fmul qword ptr [eax + 32]
    jmp L18
L16:
    mov ebx, dword ptr [ebp + 8]
L17:
    fld1
    mov dword ptr [ebp - 4], ebx
L18:
    fstp qword ptr [ebp - 32]
L19:
    pop edi
L20:
    mov ecx, dword ptr [ebp + 12]
    mov eax, dword ptr [ecx]
    cmp eax, -1
    pop esi
    pop ebx
    je L21
    cmp dword ptr [ebp - 4], eax
    je L21
    mov eax, 080004005h
    jmp L22
L21:
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [eax + 64], edx
    fld qword ptr [ebp - 32]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx], edx
    fstp qword ptr [eax + 40]
    mov eax, dword ptr [ebp + 16]
    fld qword ptr [ebp - 32]
    fstp qword ptr [eax]
    xor eax, eax
L22:
    leave
    ret 12
FUN_10087b3a ENDP
END
