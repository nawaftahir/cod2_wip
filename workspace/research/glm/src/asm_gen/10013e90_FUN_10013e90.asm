; FUN_10013e90 @ 0x10013e90 — auto-synthesized
    sub_100144c0 PROTO C
    sub_100144f6 PROTO C
.CODE
FUN_10013e90 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L0
    push esi
    lea esi, [edi + 0x10]
    cmp esi, eax
    je L1
    push ebx
    push ebp
    lea ebp, [esi + 0x10]
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
    call sub_100144c0
    add esp, 8
    jmp L3
    lea edi, [ebp - 0x20]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L4
    mov ebx, edi
    sub edi, 0x10
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
    call sub_100144f6
    add esp, 8
    mov edi, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x18]
    add esi, 0x10
    add ebp, 0x10
    cmp esi, eax
    jne L6
    pop ebp
    pop ebx
    pop esi
    pop edi
    ret
FUN_10013e90 ENDP
END