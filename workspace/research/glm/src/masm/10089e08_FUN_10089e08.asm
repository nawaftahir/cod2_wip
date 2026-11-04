.686
.MODEL FLAT, C
.CODE
FUN_10089e08 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [ecx + 20]
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + edi*4]
    mov esi, dword ptr [edx + 72]
    mov dword ptr [ebp - 12], eax
    or eax, 0FFFFFFFFh
    cmp esi, eax
    je L14
    cmp dword ptr [edx + 8], eax
    jne L14
    mov edx, dword ptr [ecx + 24]
    mov esi, dword ptr [edx + esi*4]
    mov edx, dword ptr [esi]
    and edx, 0FFF00000h
    cmp edx, 010100000h
    mov dword ptr [ebp - 8], edx
    jne L3
    mov ecx, dword ptr [esi + 12]
    xor edx, edx
    test ecx, ecx
    jbe L1
    mov eax, dword ptr [esi + 16]
L0:
    cmp dword ptr [eax], edi
    je L1
    inc edx
    add eax, 4
    cmp edx, ecx
    jb L0
L1:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L2
    fld qword ptr [eax]
    fchs
    fstp qword ptr [eax]
L2:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + edx*4]
    jmp L14
L3:
    cmp edx, 020500000h
    je L4
    cmp edx, 020400000h
    jne L14
L4:
    mov edx, dword ptr [esi + 12]
    xor ebx, ebx
    test edx, edx
    jbe L6
    mov eax, dword ptr [esi + 16]
L5:
    cmp dword ptr [eax], edi
    je L6
    inc ebx
    add eax, 4
    cmp ebx, edx
    jb L5
L6:
    mov eax, dword ptr [ecx + 16]
    mov edx, dword ptr [esi + 12]
    mov edi, dword ptr [esi + 8]
    and dword ptr [ebp + 8], 0
    mov dword ptr [ebp - 16], eax
    mov eax, edx
    shl eax, 2
    mov dword ptr [ebp - 24], eax
    mov ecx, edx
    mov eax, ebx
    shl eax, 2
    neg ecx
    mov dword ptr [ebp - 32], eax
    add eax, edi
    shl ecx, 2
    add edx, ebx
    lea edi, [edi + edx*4]
    mov dword ptr [ebp - 4], edi
L7:
    mov edx, dword ptr [eax]
    mov dword ptr [ebp - 28], edx
    mov edx, dword ptr [edi]
    mov edi, dword ptr [ebp - 12]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [ebp - 16]
    mov dword ptr [ebp - 20], edx
    mov edx, dword ptr [edx + 4]
    mov edx, dword ptr [edi + edx*4]
    test byte ptr [edx + 5], 1
    je L8
    mov edx, dword ptr [ebp - 20]
    cmp dword ptr [edx + 8], -1
    je L10
L8:
    mov edi, dword ptr [ebp - 4]
    inc dword ptr [ebp + 8]
    add eax, dword ptr [ebp - 24]
    add edi, ecx
    cmp dword ptr [ebp + 8], 2
    mov dword ptr [ebp - 4], edi
    jb L7
    cmp dword ptr [ebp - 8], 020400000h
    jne L13
    mov ecx, dword ptr [esi + 12]
    mov eax, dword ptr [esi + 8]
    lea edx, [ecx + ebx]
    mov ecx, dword ptr [ebp - 32]
    mov edi, dword ptr [eax + ecx]
    cmp edi, dword ptr [eax + edx*4]
    jne L13
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L9
    fld qword ptr [eax]
    fadd st(0), st(0)
    fstp qword ptr [eax]
L9:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [ecx + eax]
    jmp L14
L10:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L12
    cmp dword ptr [ebp - 8], 020500000h
    fld qword ptr [edx + 32]
    fmul qword ptr [eax]
    je L11
    mov eax, dword ptr [ebp + 16]
    fadd qword ptr [eax]
L11:
    fstp qword ptr [eax]
L12:
    mov eax, dword ptr [ebp - 28]
    jmp L14
L13:
    or eax, 0FFFFFFFFh
L14:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_10089e08 ENDP
END
