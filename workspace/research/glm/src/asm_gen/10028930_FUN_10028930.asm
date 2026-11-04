; FUN_10028930 @ 0x10028930 — auto-synthesized
.CODE
FUN_10028930 PROC
    sub esp, 8
    push ebp
    mov ebp, dword ptr [esp + 0x10]
    push esi
    push edi
    mov edi, eax
    sub edi, ebp
    mov ecx, ebx
    sub ecx, ebp
    sar edi, 3
    sar ecx, 3
    test edi, edi
    mov eax, ecx
    mov esi, edi
    je L0
    cdq
    idiv esi
    mov eax, esi
    test edx, edx
    mov esi, edx
    jne L1
    cmp eax, ecx
    jge L2
    test eax, eax
    jle L2
    lea esi, [ebp + eax*8]
    mov dword ptr [esp + 0x18], eax
    jmp L3
    lea ecx, [ecx]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esp + 0xc], eax
    lea eax, [esi + edi*8]
    cmp eax, ebx
    mov edx, esi
    mov dword ptr [esp + 0x10], ecx
    jne L4
    mov eax, ebp
    cmp eax, esi
    je L5
    lea esp, [esp]
    mov ecx, dword ptr [eax]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [edx + 4], ecx
    mov ecx, ebx
    sub ecx, eax
    sar ecx, 3
    cmp edi, ecx
    mov edx, eax
    jge L6
    lea ecx, [edi*8]
    add eax, ecx
    jmp L7
    mov eax, edi
    sub eax, ecx
    lea eax, [ebp + eax*8]
    cmp eax, esi
    jne L8
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0xc]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [esp + 0x18]
    sub esi, 8
    dec eax
    mov dword ptr [edx], ecx
    mov dword ptr [esp + 0x18], eax
    jne L3
    pop edi
    pop esi
    pop ebp
FUN_10028930 ENDP
END