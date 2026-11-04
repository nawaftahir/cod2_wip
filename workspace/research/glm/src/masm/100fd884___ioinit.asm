.686
.MODEL FLAT, C
EXTRN sub_100FC473:PROC
EXTRN sub_100FC509:PROC
EXTRN sub_10107BAA:PROC
EXTRN sub_10107C2F:PROC
EXTRN fp_1010C150:DWORD
EXTRN fp_1010C154:DWORD
EXTRN fp_1010C158:DWORD
EXTRN fp_1010C15C:DWORD
EXTRN g_1076AC9C:DWORD
EXTRN g_1076ACA0:DWORD
.CODE
__ioinit PROC
    sub esp, 72
    push ebx
    mov ebx, 000000480h
    push ebx
    call sub_100FC473
    test eax, eax
    pop ecx
    jne L0
    or eax, 0FFFFFFFFh
    jmp L23
L0:
    mov dword ptr [g_1076ACA0], eax
    mov dword ptr [g_1076AC9C], 32
    lea ecx, [eax + 000000480h]
    jmp L2
L1:
    or dword ptr [eax], 0FFFFFFFFh
    and dword ptr [eax + 8], 0
    mov byte ptr [eax + 4], 0
    mov byte ptr [eax + 5], 10
    mov ecx, dword ptr [g_1076ACA0]
    add eax, 36
    add ecx, 000000480h
L2:
    cmp eax, ecx
    jb L1
    push ebp
    push esi
    push edi
    lea eax, [esp + 20]
    push eax
    call dword ptr [fp_1010C15C]
    cmp word ptr [esp + 70], 0
    je L12
    mov eax, dword ptr [esp + 72]
    test eax, eax
    je L12
    mov edi, dword ptr [eax]
    lea ebp, [eax + 4]
    lea eax, [edi + ebp]
    mov dword ptr [esp + 16], eax
    mov eax, 000000800h
    cmp edi, eax
    jl L3
    mov edi, eax
L3:
    cmp dword ptr [g_1076AC9C], edi
    jge L8
    mov esi, 01076ACA4h
L4:
    push ebx
    call sub_100FC509
    test eax, eax
    pop ecx
    je L7
    add dword ptr [g_1076AC9C], 32
    mov dword ptr [esi], eax
    lea ecx, [eax + 000000480h]
    jmp L6
L5:
    or dword ptr [eax], 0FFFFFFFFh
    and dword ptr [eax + 8], 0
    mov byte ptr [eax + 4], 0
    mov byte ptr [eax + 5], 10
    mov ecx, dword ptr [esi]
    add eax, 36
    add ecx, ebx
L6:
    cmp eax, ecx
    jb L5
    add esi, 4
    cmp dword ptr [g_1076AC9C], edi
    jl L4
    jmp L8
L7:
    mov edi, dword ptr [g_1076AC9C]
L8:
    xor ebx, ebx
    test edi, edi
    jle L12
L9:
    mov eax, dword ptr [esp + 16]
    mov eax, dword ptr [eax]
    cmp eax, -1
    je L11
    mov cl, byte ptr [ebp]
    test cl, 1
    je L11
    test cl, 8
    jne L10
    push eax
    call dword ptr [fp_1010C158]
    test eax, eax
    je L11
L10:
    mov ecx, ebx
    mov eax, ebx
    and eax, 31
    lea eax, [eax + eax*8]
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea esi, [ecx + eax*4]
    mov eax, dword ptr [esp + 16]
    mov eax, dword ptr [eax]
    mov dword ptr [esi], eax
    mov al, byte ptr [ebp]
    mov byte ptr [esi + 4], al
    lea eax, [esi + 12]
    push 000000FA0h
    push eax
    call sub_10107BAA
    test eax, eax
    pop ecx
    pop ecx
    je L14
    inc dword ptr [esi + 8]
L11:
    add dword ptr [esp + 16], 4
    inc ebx
    inc ebp
    cmp ebx, edi
    jl L9
L12:
    xor ebx, ebx
L13:
    mov ecx, dword ptr [g_1076ACA0]
    lea eax, [ebx + ebx*8]
    lea esi, [ecx + eax*4]
    cmp dword ptr [esi], -1
    jne L20
    test ebx, ebx
    mov byte ptr [esi + 4], 000000081h
    jne L15
    push -10
    pop eax
    jmp L16
L14:
    or eax, 0FFFFFFFFh
    jmp L22
L15:
    mov eax, ebx
    dec eax
    neg eax
    sbb eax, eax
    add eax, -11
L16:
    push eax
    call dword ptr [fp_1010C154]
    mov edi, eax
    cmp edi, -1
    je L19
    push edi
    call dword ptr [fp_1010C158]
    test eax, eax
    je L19
    and eax, 0000000FFh
    cmp eax, 2
    mov dword ptr [esi], edi
    jne L17
    or byte ptr [esi + 4], 64
    jmp L18
L17:
    cmp eax, 3
    jne L18
    or byte ptr [esi + 4], 8
L18:
    lea eax, [esi + 12]
    push 000000FA0h
    push eax
    call sub_10107C2F
    test eax, eax
    pop ecx
    pop ecx
    je L14
    inc dword ptr [esi + 8]
    jmp L21
L19:
    or byte ptr [esi + 4], 64
    jmp L21
L20:
    or byte ptr [esi + 4], 000000080h
L21:
    inc ebx
    cmp ebx, 3
    jl L13
    push dword ptr [g_1076AC9C]
    call dword ptr [fp_1010C150]
    xor eax, eax
L22:
    pop edi
    pop esi
    pop ebp
L23:
    pop ebx
    add esp, 72
    ret
__ioinit ENDP
END
