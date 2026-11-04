.686
.MODEL FLAT, C
.CODE
FUN_10056e10 PROC
    sub esp, 000000428h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 000000438h]
    push esi
    mov esi, dword ptr [eax + 120]
    push edi
    mov edi, ecx
    mov ecx, dword ptr [esp + 00000043Ch]
    lea edx, [ecx + ecx + 24]
    sar edx, 1
    mov dword ptr [esp + 44], edx
    lea ebx, [edi + 28]
    lea edx, [ebx + edi]
    sar edx, 1
    mov dword ptr [esp + 24], edx
    lea edx, [ebp + ebp + 24]
    sar edx, 1
    test esi, esi
    mov dword ptr [esp + 48], esi
    mov dword ptr [esp + 40], edx
    mov dword ptr [esp + 20], 07FFFFFFFh
    mov dword ptr [esp + 16], 0
    jle L14
    mov eax, dword ptr [eax + 124]
    mov edx, dword ptr [eax]
    mov dword ptr [esp + 52], edx
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 36], edx
    mov dword ptr [esp + 28], eax
L0:
    mov edx, dword ptr [esp + 52]
    mov eax, dword ptr [esp + 16]
    movzx eax, byte ptr [edx + eax]
    cmp eax, ecx
    jge L3
    mov edx, eax
    sub edx, ecx
    imul edx, edx
    add ecx, 24
L1:
    sub eax, ecx
L2:
    mov ecx, dword ptr [esp + 16]
    imul eax, eax
    mov esi, dword ptr [esp + 36]
    movzx ecx, byte ptr [esi + ecx]
    cmp ecx, edi
    jge L5
    mov esi, ecx
    sub esi, edi
    lea esi, [esi + esi*2]
    mov ebp, esi
    imul ebp, esi
    add edx, ebp
    mov ebp, dword ptr [esp + 000000440h]
    sub ecx, ebx
    jmp L7
L3:
    lea esi, [ecx + 24]
    cmp eax, esi
    jle L4
    mov edx, eax
    sub edx, esi
    imul edx, edx
    jmp L1
L4:
    xor edx, edx
    cmp eax, dword ptr [esp + 44]
    jg L1
    sub eax, esi
    jmp L2
L5:
    cmp ecx, ebx
    jle L8
    mov esi, ecx
    sub esi, ebx
    lea esi, [esi + esi*2]
    mov ebp, esi
    imul ebp, esi
    add edx, ebp
    mov ebp, dword ptr [esp + 000000440h]
L6:
    sub ecx, edi
L7:
    lea ecx, [ecx + ecx*2]
    mov esi, ecx
    imul esi, ecx
    mov ecx, dword ptr [esp + 28]
    add eax, esi
    mov esi, dword ptr [esp + 16]
    movzx ecx, byte ptr [ecx + esi]
    cmp ecx, ebp
    jge L9
    mov esi, ecx
    sub esi, ebp
    shl esi, 1
    mov ebp, esi
    imul ebp, esi
    add edx, ebp
    mov ebp, dword ptr [esp + 000000440h]
    lea esi, [ebp + 24]
    sub ecx, esi
    jmp L11
L8:
    cmp ecx, dword ptr [esp + 24]
    jg L6
    sub ecx, ebx
    jmp L7
L9:
    lea esi, [ebp + 24]
    cmp ecx, esi
    mov dword ptr [esp + 32], esi
    jle L13
    mov ebp, dword ptr [esp + 32]
    mov esi, ecx
    sub esi, ebp
    shl esi, 1
    mov ebp, esi
    imul ebp, esi
    add edx, ebp
    mov ebp, dword ptr [esp + 000000440h]
L10:
    sub ecx, ebp
L11:
    shl ecx, 1
    mov esi, ecx
    imul esi, ecx
    mov ecx, dword ptr [esp + 00000043Ch]
    add eax, esi
    mov esi, dword ptr [esp + 16]
    mov dword ptr [esp + esi*4 + 56], edx
    mov edx, dword ptr [esp + 20]
    cmp eax, edx
    jge L12
    mov edx, eax
    mov dword ptr [esp + 20], edx
L12:
    inc dword ptr [esp + 16]
    mov esi, dword ptr [esp + 48]
    cmp dword ptr [esp + 16], esi
    jl L0
    jmp L15
L13:
    cmp ecx, dword ptr [esp + 40]
    jg L10
    sub ecx, esi
    jmp L11
L14:
    mov edx, dword ptr [esp + 20]
L15:
    xor eax, eax
    xor ecx, ecx
    test esi, esi
    jle L18
L16:
    cmp dword ptr [esp + ecx*4 + 56], edx
    jg L17
    mov edi, dword ptr [esp + 000000444h]
    mov byte ptr [eax + edi], cl
    inc eax
L17:
    inc ecx
    cmp ecx, esi
    jl L16
L18:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000428h
    ret
FUN_10056e10 ENDP
END
