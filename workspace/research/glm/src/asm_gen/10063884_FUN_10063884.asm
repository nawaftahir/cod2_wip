; FUN_10063884 @ 0x10063884 — auto-synthesized
    sub_1006372e PROTO C
    sub_10080e62 PROTO C
    sub_10080e9a PROTO C
    sub_100f78aa PROTO C
.CODE
FUN_10063884 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    xor esi, esi
    cmp ebx, esi
    push edi
    je L0
    mov dword ptr [ebx], esi
    mov edi, dword ptr [ebp + 8]
    cmp edi, esi
    je L1
    cmp ebx, esi
    jne L2
    mov eax, 0x8876086c
    jmp L3
    mov eax, dword ptr [edi]
    mov ecx, 0xffff0000
    and eax, ecx
    cmp eax, 0xfffe0000
    je L4
    cmp eax, ecx
    jne L5
    push 0x20
    call sub_100f78aa
    cmp eax, esi
    pop ecx
    je L6
    mov ecx, eax
    call sub_10080e62
    mov esi, eax
    test esi, esi
    jne L7
    mov eax, 0x8007000e
    jmp L3
    push 0
    push edi
    mov ecx, esi
    call sub_10080e9a
    mov edi, eax
    test edi, edi
    jge L5
    push 1
    mov ecx, esi
    call sub_1006372e
    mov eax, edi
    jmp L3
    mov dword ptr [ebx], esi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_10063884 ENDP
END