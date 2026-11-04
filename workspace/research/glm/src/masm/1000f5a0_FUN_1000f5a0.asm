.686
.MODEL FLAT, C
EXTRN sub_1000EBDE:PROC
EXTRN sub_1000ED58:PROC
EXTRN sub_1000ED96:PROC
EXTRN sub_1000EE5F:PROC
EXTRN fp_101D49D8:DWORD
EXTRN fp_101D49F8:DWORD
EXTRN g_101D496B:DWORD
.CODE
FUN_1000f5a0 PROC
    sub esp, 20
    push ebx
    mov ebx, dword ptr [esp + 36]
    push esi
    push edi
    mov edi, dword ptr [esp + 36]
    movsx ecx, word ptr [edi + 10]
    movsx edx, word ptr [edi + 8]
    mov esi, eax
    movzx eax, byte ptr [edi + 5]
    push 0
    push eax
    movsx eax, word ptr [edi + 6]
    push ecx
    push edx
    push eax
    mov eax, ebx
    mov ecx, esi
    call sub_1000EE5F
    mov edx, dword ptr [esi]
    xor ecx, ecx
    add esp, 20
    cmp edx, 5
    setne cl
    mov dword ptr [esp + 16], 0
    dec ecx
    and ecx, 5
    inc ecx
    cmp ebx, 22
    mov dword ptr [esp + 20], ecx
    jne L0
    movzx eax, word ptr [esi + 26]
    movzx edx, word ptr [esi + 24]
    imul eax, edx
    shl eax, 2
    push eax
    call dword ptr [fp_101D49D8]
    add esp, 4
    mov dword ptr [esp + 16], eax
L0:
    test byte ptr [edi + 5], 2
    mov eax, 1
    jne L4
    movsx edx, word ptr [edi + 6]
    mov ecx, eax
    nop
L1:
    cmp eax, edx
    jl L2
    movsx ebx, word ptr [edi + 8]
    cmp eax, ebx
    jl L2
    movsx ebx, word ptr [edi + 10]
    cmp eax, ebx
    jge L3
L2:
    shl eax, 1
    inc ecx
    jmp L1
L3:
    mov eax, ecx
L4:
    movzx ecx, byte ptr [esi + 8]
    dec eax
    cmp eax, ecx
    mov dword ptr [esp + 12], eax
    jl L20
    push ebp
    jmp L6
L5:
    mov eax, dword ptr [esp + 16]
L6:
    movsx ebx, ax
    movsx eax, word ptr [edi + 6]
    mov cl, bl
    sar eax, cl
    mov edx, 1
    sub edx, eax
    js L7
    mov eax, 1
L7:
    movsx edx, word ptr [edi + 8]
    mov cl, bl
    sar edx, cl
    mov ecx, 1
    sub ecx, edx
    js L8
    mov edx, 1
L8:
    mov ecx, dword ptr [esp + 24]
    xor ebp, ebp
    test ecx, ecx
    jle L19
    imul edx, eax
    mov eax, edx
    imul eax, dword ptr [esp + 52]
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 32], eax
    jmp L10
L9:
    mov edx, dword ptr [esp + 28]
L10:
    cmp dword ptr [esp + 48], 22
    jne L14
    mov ecx, dword ptr [esp + 44]
    mov edi, edx
    mov edx, dword ptr [esp + 20]
    lea eax, [edx + 2]
    add ecx, 2
    nop
L11:
    mov bl, byte ptr [ecx - 2]
    mov byte ptr [eax - 2], bl
    mov bl, byte ptr [ecx - 1]
    mov byte ptr [eax - 1], bl
    mov bl, byte ptr [ecx]
    mov byte ptr [eax], bl
    mov byte ptr [eax + 1], 0000000FFh
    add eax, 4
    add ecx, 3
    dec edi
    jne L11
    movzx eax, byte ptr [esi + 8]
    mov edi, dword ptr [esp + 16]
    sub edi, eax
    mov eax, dword ptr [esi]
    cmp eax, 4
    jne L12
    push edx
    push edi
    push 22
    push esi
    call sub_1000ED58
    add esp, 16
    jmp L18
L12:
    cmp eax, 5
    jne L13
    test edi, edi
    je L13
    mov al, byte ptr [g_101D496B]
    test al, al
    je L18
L13:
    push edx
    push 22
    jmp L17
L14:
    movzx ecx, byte ptr [esi + 8]
    mov edi, dword ptr [esp + 16]
    mov eax, dword ptr [esi]
    sub edi, ecx
    cmp eax, 4
    jne L15
    mov edx, dword ptr [esp + 44]
    mov eax, dword ptr [esp + 48]
    push edx
    push edi
    push eax
    push esi
    call sub_1000ED96
    add esp, 16
    jmp L18
L15:
    cmp eax, 5
    jne L16
    test edi, edi
    je L16
    mov al, byte ptr [g_101D496B]
    test al, al
    je L18
L16:
    mov ecx, dword ptr [esp + 44]
    mov edx, dword ptr [esp + 48]
    push ecx
    push edx
L17:
    mov ebx, ebp
    call sub_1000EBDE
    add esp, 8
L18:
    mov eax, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 44]
    add edx, eax
    mov eax, dword ptr [esp + 24]
    inc ebp
    cmp ebp, eax
    mov dword ptr [esp + 44], edx
    jl L9
    mov edi, dword ptr [esp + 40]
L19:
    mov eax, dword ptr [esp + 16]
    movzx ecx, byte ptr [esi + 8]
    dec eax
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jge L5
    pop ebp
L20:
    mov eax, dword ptr [esp + 16]
    test eax, eax
    pop edi
    pop esi
    pop ebx
    je L21
    push eax
    call dword ptr [fp_101D49F8]
    add esp, 4
L21:
    add esp, 20
    ret
FUN_1000f5a0 ENDP
END
