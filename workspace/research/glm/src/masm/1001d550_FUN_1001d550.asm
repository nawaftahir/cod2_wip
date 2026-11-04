.686
.MODEL FLAT, C
.CODE
FUN_1001d550 PROC
    sub esp, 16
    push ebx
    mov ebx, dword ptr [esp + 24]
    sub eax, ebx
    mov ecx, eax
    mov eax, 02AAAAAABh
    imul ecx
    sar edx, 1
    push ebp
    mov ebp, dword ptr [esp + 32]
    push esi
    mov esi, edx
    shr esi, 31
    add esi, edx
    mov ecx, ebp
    sub ecx, ebx
    mov eax, 02AAAAAABh
    imul ecx
    sar edx, 1
    mov ecx, edx
    shr ecx, 31
    add ecx, edx
    test esi, esi
    push edi
    mov eax, ecx
    mov edi, esi
    je L1
    nop
L0:
    cdq
    idiv edi
    mov eax, edi
    test edx, edx
    mov edi, edx
    jne L0
L1:
    cmp eax, ecx
    jge L8
    test eax, eax
    jle L8
    lea edx, [esi + esi*2]
    shl edx, 2
    lea ecx, [eax + eax*2]
    mov dword ptr [esp + 40], edx
    lea ebx, [ebx + ecx*4]
    mov dword ptr [esp + 16], eax
    nop
L2:
    mov eax, ebx
    mov ecx, dword ptr [eax]
    mov dword ptr [esp + 20], ecx
    mov ecx, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 24], ecx
    lea ecx, [ebx + edx]
    cmp ecx, ebp
    mov edi, ebx
    mov dword ptr [esp + 28], eax
    jne L3
    mov ecx, dword ptr [esp + 36]
L3:
    cmp ecx, ebx
    je L7
L4:
    mov edx, ecx
    mov eax, dword ptr [edx]
    mov dword ptr [edi], eax
    mov eax, dword ptr [edx + 4]
    mov dword ptr [edi + 4], eax
    mov edx, dword ptr [edx + 8]
    mov dword ptr [edi + 8], edx
    mov edx, ebp
    sub edx, ecx
    mov eax, 02AAAAAABh
    imul edx
    sar edx, 1
    mov eax, edx
    shr eax, 31
    add eax, edx
    cmp esi, eax
    mov edi, ecx
    jge L5
    add ecx, dword ptr [esp + 40]
    jmp L6
L5:
    mov ecx, esi
    sub ecx, eax
    lea eax, [ecx + ecx*2]
    mov ecx, dword ptr [esp + 36]
    lea ecx, [ecx + eax*4]
L6:
    cmp ecx, ebx
    jne L4
    mov edx, dword ptr [esp + 40]
L7:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [edi], eax
    mov eax, dword ptr [esp + 28]
    mov dword ptr [edi + 4], ecx
    mov dword ptr [edi + 8], eax
    mov eax, dword ptr [esp + 16]
    sub ebx, 12
    dec eax
    mov dword ptr [esp + 16], eax
    jne L2
L8:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 16
    ret
FUN_1001d550 ENDP
END
