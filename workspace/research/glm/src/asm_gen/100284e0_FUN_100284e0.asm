; FUN_100284e0 @ 0x100284e0 — auto-synthesized
    sub_1002899c PROTO C
.CODE
FUN_100284e0 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L0
    push esi
    lea esi, [edi + 8]
    cmp esi, eax
    je L1
    push ebx
    push ebp
    lea ebp, [esi + 8]
    jmp L2
    mov edi, dword ptr [esp + 0x14]
    mov ebx, dword ptr [esp + 0x1c]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L3
    cmp edi, esi
    je L4
    cmp esi, ebp
    je L4
    push edi
    jmp L5
    lea edi, [ebp - 0x10]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L4
    mov ebx, edi
    sub edi, 8
    push edi
    push esi
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    jne L6
    cmp ebx, esi
    je L4
    cmp esi, ebp
    je L4
    push ebx
    mov eax, esi
    mov ebx, ebp
    call sub_1002899c
    add esp, 4
    mov eax, dword ptr [esp + 0x18]
    add esi, 8
    add ebp, 8
    cmp esi, eax
    jne L7
    pop ebp
    pop ebx
    pop esi
    pop edi
    ret
FUN_100284e0 ENDP
END