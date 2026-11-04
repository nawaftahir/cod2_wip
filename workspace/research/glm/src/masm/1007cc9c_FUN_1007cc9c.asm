.686
.MODEL FLAT, C
EXTRN sub_1006DE23:PROC
EXTRN sub_1007B759:PROC
EXTRN sub_1007B7CE:PROC
EXTRN sub_1008617D:PROC
EXTRN sub_1008626C:PROC
EXTRN g_1010C728:DWORD
.CODE
FUN_1007cc9c PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    xor edx, edx
    cmp ebx, edx
    push edi
    mov edi, ecx
    jne L6
    mov ebx, dword ptr [ebp + 12]
    cmp ebx, edx
    je L30
    xor esi, esi
    cmp dword ptr [ebp + 16], edx
    jbe L30
    jmp L2
L1:
    xor edx, edx
L2:
    mov ecx, dword ptr [edi + 8]
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edx
    push edx
    push dword ptr [ecx + 000000088h]
    call sub_1008617D
    mov dword ptr [ebx + esi*4], eax
    mov ecx, dword ptr [edi + 8]
    cmp eax, dword ptr [ecx + 8]
    jae L3
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax*4]
    jmp L4
L3:
    xor eax, eax
L4:
    test eax, eax
    je L5
    or dword ptr [eax + 48], 0FFFFFFFFh
L5:
    inc esi
    cmp esi, dword ptr [ebp + 16]
    jb L1
    jmp L30
L6:
    mov eax, dword ptr [ebx + 4]
    cmp eax, 14
    jne L20
    mov esi, dword ptr [ebp + 12]
    cmp esi, edx
    je L30
    mov eax, dword ptr [ebx + 16]
    cmp eax, 6
    jne L10
    xor eax, eax
    cmp dword ptr [ebx + 24], -1
    jne L8
    cmp dword ptr [ebp + 16], edx
    jbe L30
L7:
    mov ecx, dword ptr [edi + 28]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [esi + eax*4], ecx
    inc eax
    cmp eax, dword ptr [ebp + 16]
    jb L7
    jmp L30
L8:
    cmp dword ptr [ebp + 16], edx
    jbe L30
L9:
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [edi + 24]
    add ecx, eax
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [esi + eax*4], ecx
    inc eax
    cmp eax, dword ptr [ebp + 16]
    jb L9
    jmp L30
L10:
    sub eax, edx
    fldz
    mov dword ptr [ebp + 12], edx
    je L14
    dec eax
    je L13
    dec eax
    je L11
    dec eax
    jne L17
    fstp st(0)
    fld qword ptr [ebx + 24]
    jmp L17
L11:
    mov eax, dword ptr [ebx + 24]
    fstp st(0)
    test eax, eax
    fild dword ptr [ebx + 24]
    jge L12
    fadd qword ptr [g_1010C728]
L12:
    mov dword ptr [ebp + 12], 2
    jmp L17
L13:
    fstp st(0)
    fild dword ptr [ebx + 24]
    jmp L12
L14:
    cmp dword ptr [ebx + 24], edx
    fstp st(0)
    je L15
    fld1
    jmp L16
L15:
    fldz
L16:
    mov dword ptr [ebp + 12], 23
L17:
    mov ecx, dword ptr [edi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edx
    push edx
    push dword ptr [ecx + 120]
    call sub_1008626C
    mov dword ptr [esi], eax
    mov edi, dword ptr [edi + 8]
    cmp eax, dword ptr [edi + 8]
    jae L18
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + eax*4]
    jmp L19
L18:
    xor eax, eax
L19:
    test eax, eax
    je L30
    mov ecx, dword ptr [ebp + 12]
    or dword ptr [eax], ecx
    or dword ptr [eax + 48], 0FFFFFFFFh
    jmp L30
L20:
    cmp eax, 13
    jne L21
    push edx
    push dword ptr [ebp + 12]
    mov ecx, edi
    push ebx
    call sub_1007B759
    jmp L23
L21:
    cmp eax, 1
    je L25
L22:
    push 01010FC44h
    push edx
    push edx
    push edi
    call sub_1006DE23
    add esp, 16
    mov eax, 080004005h
L23:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
L24:
    xor edx, edx
L25:
    mov eax, dword ptr [ebx + 8]
    cmp eax, edx
    je L22
    cmp dword ptr [eax + 4], 14
    jne L27
    xor esi, esi
    inc esi
    cmp dword ptr [eax + 16], 6
    jne L26
    mov esi, dword ptr [eax + 28]
L26:
    push esi
    push dword ptr [ebp + 12]
    mov ecx, edi
    push eax
    call L0
    test eax, eax
    jl L23
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L29
    jmp L28
L27:
    cmp eax, edx
    je L22
    cmp dword ptr [eax + 4], 13
    jne L22
    mov esi, dword ptr [eax + 24]
    imul esi, dword ptr [eax + 20]
    push 0
    push dword ptr [ebp + 12]
    mov ecx, edi
    push eax
    call sub_1007B7CE
    test eax, eax
    jl L23
    cmp dword ptr [ebp + 12], 0
    je L29
    mov eax, dword ptr [ebp + 12]
L28:
    lea eax, [eax + esi*4]
    mov dword ptr [ebp + 12], eax
L29:
    mov ebx, dword ptr [ebx + 12]
    test ebx, ebx
    jne L24
L30:
    xor eax, eax
    jmp L23
FUN_1007cc9c ENDP
END
