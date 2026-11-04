.686
.MODEL FLAT, C
.CODE
FUN_10014480 PROC
    mov edx, dword ptr [esp + 4]
    sub esp, 20
    push ebp
    mov ebp, dword ptr [esp + 32]
    sub eax, edx
    push esi
    sar eax, 4
    mov ecx, ebp
    sub ecx, edx
    push edi
    mov edi, eax
    sar ecx, 4
    test edi, edi
    mov eax, ecx
    mov esi, edi
    je L1
L0:
    cdq
    idiv esi
    mov eax, esi
    test edx, edx
    mov esi, edx
    jne L0
L1:
    cmp eax, ecx
    jge L8
    test eax, eax
    jle L8
    mov ecx, dword ptr [esp + 36]
    push ebx
    mov esi, eax
    mov ebx, edi
    shl esi, 4
    shl ebx, 4
    add esi, ecx
    mov dword ptr [esp + 16], eax
L2:
    mov eax, esi
    mov ecx, dword ptr [eax]
    mov dword ptr [esp + 20], ecx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [esp + 24], ecx
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 12]
    mov dword ptr [esp + 32], eax
    lea eax, [esi + ebx]
    cmp eax, ebp
    mov edx, esi
    mov dword ptr [esp + 28], ecx
    jne L3
    mov eax, dword ptr [esp + 40]
L3:
    cmp eax, esi
    je L7
L4:
    mov ecx, eax
    mov ebp, dword ptr [ecx]
    mov dword ptr [edx], ebp
    mov ebp, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], ebp
    mov ebp, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], ebp
    mov ecx, dword ptr [ecx + 12]
    mov ebp, dword ptr [esp + 44]
    mov dword ptr [edx + 12], ecx
    mov ecx, ebp
    sub ecx, eax
    sar ecx, 4
    cmp edi, ecx
    mov edx, eax
    jge L5
    add eax, ebx
    jmp L6
L5:
    mov eax, edi
    sub eax, ecx
    mov ecx, dword ptr [esp + 40]
    shl eax, 4
    add eax, ecx
L6:
    cmp eax, esi
    jne L4
L7:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 28]
    mov dword ptr [edx + 4], ecx
    mov ecx, dword ptr [esp + 32]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [esp + 16]
    sub esi, 16
    dec eax
    mov dword ptr [edx + 12], ecx
    mov dword ptr [esp + 16], eax
    jne L2
    pop ebx
L8:
    pop edi
    pop esi
    pop ebp
    add esp, 20
    ret
FUN_10014480 ENDP
END
