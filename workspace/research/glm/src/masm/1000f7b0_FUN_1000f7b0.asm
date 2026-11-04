.686
.MODEL FLAT, C
EXTRN sub_1000EB34:PROC
EXTRN sub_1000ECEE:PROC
EXTRN sub_1000EE5D:PROC
EXTRN g_101D496B:DWORD
.CODE
FUN_1000f7b0 PROC
    sub esp, 8
    push ebp
    mov ebp, dword ptr [esp + 16]
    movsx ecx, word ptr [ebp + 10]
    movsx edx, word ptr [ebp + 8]
    push esi
    mov esi, eax
    movzx eax, byte ptr [ebp + 5]
    push edi
    push 0
    push eax
    movsx eax, word ptr [ebp + 6]
    push ecx
    push edx
    push eax
    mov eax, dword ptr [esp + 52]
    mov ecx, esi
    call sub_1000EE5D
    mov eax, dword ptr [esi]
    xor ecx, ecx
    add esp, 20
    cmp eax, 5
    mov al, byte ptr [ebp + 5]
    setne cl
    mov edi, 1
    dec ecx
    and ecx, 5
    inc ecx
    test al, 2
    mov dword ptr [esp + 16], ecx
    jne L2
    movsx ecx, word ptr [ebp + 6]
    mov eax, edi
L0:
    cmp eax, ecx
    jl L1
    movsx edx, word ptr [ebp + 8]
    cmp eax, edx
    jl L1
    movsx edx, word ptr [ebp + 10]
    cmp eax, edx
    jge L2
L1:
    shl eax, 1
    inc edi
    jmp L0
L2:
    movzx eax, byte ptr [esi + 8]
    dec edi
    cmp edi, eax
    mov dword ptr [esp + 12], edi
    jl L11
    push ebx
L3:
    movsx eax, word ptr [ebp + 6]
    movsx ebx, di
    mov cl, bl
    sar eax, cl
    mov ecx, 1
    sub ecx, eax
    js L4
    mov eax, 1
L4:
    movsx edx, word ptr [ebp + 8]
    mov cl, bl
    sar edx, cl
    mov ecx, 1
    sub ecx, edx
    js L5
    mov edx, 1
L5:
    mov ecx, dword ptr [esp + 20]
    xor ebx, ebx
    test ecx, ecx
    jle L10
    add eax, 3
    lea ebp, [edx + 3]
    sar ebp, 2
    sar eax, 2
    imul ebp, eax
    imul ebp, dword ptr [esp + 40]
    lea ecx, [ecx]
L6:
    movzx edx, byte ptr [esi + 8]
    mov eax, dword ptr [esi]
    sub edi, edx
    cmp eax, 4
    jne L7
    mov eax, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 36]
    push eax
    push edi
    push ecx
    push esi
    call sub_1000ECEE
    add esp, 16
    jmp L9
L7:
    cmp eax, 5
    jne L8
    test edi, edi
    je L8
    mov al, byte ptr [g_101D496B]
    test al, al
    je L9
L8:
    mov edx, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 36]
    push edx
    push eax
    call sub_1000EB34
    add esp, 8
L9:
    mov edx, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 20]
    mov edi, dword ptr [esp + 16]
    add edx, ebp
    inc ebx
    cmp ebx, eax
    mov dword ptr [esp + 32], edx
    jl L6
    mov ebp, dword ptr [esp + 28]
L10:
    movzx ecx, byte ptr [esi + 8]
    dec edi
    cmp edi, ecx
    mov dword ptr [esp + 16], edi
    jge L3
    pop ebx
L11:
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
FUN_1000f7b0 ENDP
END
