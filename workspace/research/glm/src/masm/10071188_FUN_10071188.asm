.686
.MODEL FLAT, C
EXTRN sub_1006E1BA:PROC
EXTRN sub_1006E1E9:PROC
EXTRN sub_1006E232:PROC
EXTRN sub_1006E47D:PROC
EXTRN sub_10071178:PROC
EXTRN sub_100713BD:PROC
EXTRN g_1010C728:DWORD
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_10071188 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    push ebx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [ebp + 8]
    push edi
    or ebx, 0FFFFFFFFh
    jmp L3
L0:
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 72]
    cmp ecx, ebx
    je L4
    mov eax, dword ptr [eax + 24]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi]
    cmp eax, 010000001h
    je L2
    cmp eax, 020500001h
    jne L6
    lea eax, [ebp - 28]
    push eax
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax]
    mov ecx, esi
    call sub_1006E1BA
    test eax, eax
    jl L1
    fld qword ptr [ebp - 28]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [eax + 4]
    jmp L3
L1:
    lea eax, [ebp - 28]
    push eax
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax + 4]
    mov ecx, esi
    call sub_1006E1E9
    test eax, eax
    jl L4
    fld qword ptr [ebp - 28]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L4
L2:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [eax]
L3:
    cmp ecx, ebx
    jne L0
L4:
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
L6:
    mov eax, dword ptr [edi]
    cmp eax, 020200001h
    jne L12
    lea eax, [ebp - 28]
    push eax
    mov eax, dword ptr [edi + 8]
    push dword ptr [eax]
    mov ecx, esi
    call sub_1006E232
    test eax, eax
    jl L4
    mov eax, dword ptr [ebp + 12]
    fild dword ptr [ebp + 12]
    test eax, eax
    jge L7
    fadd qword ptr [g_1010C728]
L7:
    fld qword ptr [ebp - 28]
    fucompp
    fnstsw ax
    test ah, 68
    jp L4
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 4]
    mov dword ptr [ebp + 8], eax
    push 1
    lea eax, [ebp + 8]
    push eax
    push 0
    mov ecx, esi
    call sub_10071178
    test eax, eax
    jl L4
    mov ebx, dword ptr [ebp + 20]
    mov eax, dword ptr [ebx]
    cmp eax, -1
    je L8
    xor ecx, ecx
    cmp dword ptr [ebp + 8], eax
    sete cl
    mov eax, ecx
    jmp L5
L8:
    mov esi, dword ptr [esi + 8]
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + edx*4]
    test byte ptr [eax], 2
    je L4
    mov eax, dword ptr [eax + 4]
    mov esi, dword ptr [esi + 16]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    jne L4
    test al, 16
    je L4
    test ah, 2
    je L4
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L10
    mov esi, dword ptr [edi + 8]
    mov esi, dword ptr [esi]
    mov ecx, dword ptr [ecx + esi*4]
L9:
    mov ecx, dword ptr [ecx + 48]
    mov dword ptr [eax], ecx
L10:
    mov dword ptr [ebx], edx
L11:
    xor eax, eax
    inc eax
    jmp L5
L12:
    cmp eax, 030000001h
    jne L4
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax + 20]
    mov edi, dword ptr [edi + 8]
    mov ecx, dword ptr [edi + 4]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + edx*4]
    mov edx, 000000100h
    test dword ptr [eax + 4], edx
    je L4
    cmp dword ptr [ecx + 8], ebx
    jne L4
    fld qword ptr [ecx + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L4
    mov eax, dword ptr [esi + 8]
    mov ebx, dword ptr [eax + 20]
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ebx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + ebx*4]
    test dword ptr [eax + 4], edx
    je L4
    cmp dword ptr [ecx + 8], -1
    jne L4
    fld qword ptr [ecx + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L4
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 20]
    mov edi, dword ptr [edi]
    mov ecx, dword ptr [ecx + edi*4]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + edx*4]
    test byte ptr [eax + 4], 2
    je L4
    cmp dword ptr [ecx + 8], -1
    jne L4
    mov eax, dword ptr [ecx + 72]
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    cmp eax, 020400000h
    mov dword ptr [ebp - 20], ecx
    jne L4
    mov eax, dword ptr [ecx + 12]
    and dword ptr [ebp + 8], 0
    test eax, eax
    jbe L14
    mov edx, dword ptr [ecx + 16]
L13:
    cmp dword ptr [edx], edi
    je L14
    inc dword ptr [ebp + 8]
    add edx, 4
    cmp dword ptr [ebp + 8], eax
    jb L13
L14:
    and dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 16], 1
    jmp L16
L15:
    mov ecx, dword ptr [ebp - 20]
L16:
    mov eax, dword ptr [ecx + 12]
    mov edi, dword ptr [ecx + 8]
    mov ecx, eax
    imul ecx, dword ptr [ebp - 8]
    add ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [esi + 8]
    mov ebx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [ebp - 24], edx
    mov edx, dword ptr [ebx + edx*4]
    mov ebx, dword ptr [edx + 4]
    mov ecx, dword ptr [ecx + ebx*4]
    test byte ptr [ecx + 4], 2
    je L21
    cmp dword ptr [edx + 8], -1
    jne L21
    mov ecx, dword ptr [edx + 72]
    mov edx, dword ptr [esi + 8]
    mov edx, dword ptr [edx + 24]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ecx]
    and edx, 0FFF00000h
    cmp edx, 010100000h
    jne L21
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ecx + 12], 0
    jbe L18
    mov edx, dword ptr [ecx + 16]
L17:
    mov ebx, dword ptr [edx]
    cmp ebx, dword ptr [ebp - 24]
    je L18
    inc dword ptr [ebp - 4]
    mov ebx, dword ptr [ecx + 12]
    add edx, 4
    cmp dword ptr [ebp - 4], ebx
    jb L17
L18:
    imul eax, dword ptr [ebp - 16]
    add eax, dword ptr [ebp + 8]
    mov edi, dword ptr [edi + eax*4]
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp - 4]
    mov ebx, dword ptr [eax + ecx*4]
    lea eax, [ebp - 36]
    push eax
    push edi
    mov ecx, esi
    call sub_1006E47D
    test eax, eax
    jl L21
    mov eax, dword ptr [ebp + 12]
    fild dword ptr [ebp + 12]
    test eax, eax
    jge L19
    fadd qword ptr [g_1010C728]
L19:
    fld qword ptr [ebp - 36]
    fucompp
    fnstsw ax
    test ah, 68
    jp L21
    push 1
    lea eax, [ebp - 12]
    push eax
    push 0
    mov ecx, esi
    mov dword ptr [ebp - 12], ebx
    call sub_100713BD
    test eax, eax
    jl L21
    mov ebx, dword ptr [ebp + 20]
    mov eax, dword ptr [ebx]
    cmp eax, -1
    je L20
    cmp dword ptr [ebp - 12], eax
    je L11
    jmp L21
L20:
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 20]
    mov edx, dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx + edx*4]
    test byte ptr [ecx], 2
    je L21
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    jne L21
    test al, 16
    je L21
    test ah, 2
    jne L22
L21:
    inc dword ptr [ebp - 8]
    dec dword ptr [ebp - 16]
    cmp dword ptr [ebp - 8], 2
    jb L15
    jmp L4
L22:
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L10
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + edi*4]
    jmp L9
FUN_10071188 ENDP
END
