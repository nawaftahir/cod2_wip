; FUN_1001cfd0 @ 0x1001cfd0 — auto-synthesized
    sub_1001d590 PROTO C
    sub_1001d5c6 PROTO C
.CODE
FUN_1001cfd0 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L0
    push esi
    lea esi, [edi + 0xc]
    cmp esi, eax
    je L1
    push ebx
    push ebp
    lea ebp, [esi + 0xc]
    mov edi, edi
    mov ebx, dword ptr [esp + 0x1c]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L2
    cmp edi, esi
    je L3
    cmp esi, ebp
    je L3
    push ebp
    push edi
    mov eax, esi
    call sub_1001d590
    add esp, 8
    jmp L3
    lea edi, [ebp - 0x18]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L4
    mov ebx, edi
    sub edi, 0xc
    push edi
    push esi
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    jne L5
    cmp ebx, esi
    je L4
    cmp esi, ebp
    je L4
    push ebp
    push ebx
    mov eax, esi
    call sub_1001d5c6
    add esp, 8
    mov edi, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x18]
    add esi, 0xc
    add ebp, 0xc
    cmp esi, eax
    jne L6
    pop ebp
    pop ebx
    pop esi
    pop edi
    ret
FUN_1001cfd0 ENDP
END