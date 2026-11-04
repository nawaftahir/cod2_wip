.686
.MODEL FLAT, C
EXTRN sub_10038D98:PROC
EXTRN sub_100391FA:PROC
EXTRN sub_1003949E:PROC
EXTRN g_1072D9BC:DWORD
.CODE
FUN_100393b0 PROC
    push ecx
    test eax, eax
    push esi
    mov esi, ecx
    jle sub_1003949E
    push ebx
    push ebp
    mov dword ptr [esp + 12], eax
    mov ebx, dword ptr [esp + 12]
    push edi
    mov edi, dword ptr [esp + 16]
    jmp L0
    lea ecx, [ecx]
L0:
    movzx eax, word ptr [esi]
    sub eax, 0
    je L6
    dec eax
    je L4
    dec eax
    jne L9
    mov ecx, dword ptr [g_1072D9BC]
    movzx edx, word ptr [ecx + 54]
    mov ebp, dword ptr [esi + 4]
    xor eax, eax
    test edx, edx
    jle L3
    mov ecx, dword ptr [ecx + 64]
    lea esp, [esp]
L1:
    cmp ebp, dword ptr [ecx]
    je L2
    inc eax
    add ecx, 20
    cmp eax, edx
    jl L1
    push ebx
    push edi
    jmp L7
L2:
    lea edi, [ecx + 4]
    mov ebx, 1
L3:
    push ebx
    push edi
    jmp L7
L4:
    mov ax, word ptr [esi + 4]
    cmp ax, 0000000BBh
    jae L5
    movzx ebx, byte ptr [esi + 7]
    movzx ecx, word ptr [esi + 2]
    movzx edi, ax
    sub edi, 000000080h
    shl edi, 4
    push ebx
    add edi, 01072DA00h
    push edi
    push ecx
    jmp L8
L5:
    movzx ecx, byte ptr [esi + 7]
    movzx edx, byte ptr [esi + 6]
    push ecx
    movzx eax, ax
    push edx
    push eax
    call sub_10038D98
    movzx ebx, byte ptr [esi + 7]
    movzx ecx, word ptr [esi + 2]
    add esp, 12
    push ebx
    mov edi, eax
    push edi
    push ecx
    jmp L8
L6:
    mov edx, dword ptr [esi + 4]
    push 1
    push edx
L7:
    movzx eax, word ptr [esi + 2]
    push eax
L8:
    call sub_100391FA
    add esp, 12
L9:
    mov eax, dword ptr [esp + 16]
    add esi, 8
    dec eax
    mov dword ptr [esp + 16], eax
    jne L0
    pop edi
    pop ebp
    pop ebx
FUN_100393b0 ENDP
END
