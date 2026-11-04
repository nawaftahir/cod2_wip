; FUN_10046c70 @ 0x10046c70 — auto-synthesized
    sub_10046a62 PROTO C
    sub_10046a73 PROTO C
.CODE
FUN_10046c70 PROC
    test eax, eax
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edi, ecx
    mov ecx, eax
    jg L0
    mov eax, 0x1388
    cdq
    mov ecx, 1
    idiv ecx
    mov esi, eax
    jmp L1
    cmp eax, 0x64
    jle L2
    mov ecx, 0x64
    mov esi, 0x64
    sub esi, ecx
    shl esi, 1
    push ebp
    push esi
    push 0x10190970
    xor ebx, ebx
    call sub_10046a62
    push ebp
    push esi
    push 0x10190a70
    mov ebx, 1
    call sub_10046a73
    add esp, 0x18
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    cmp eax, 0x32
    jge L3
    mov eax, 0x1388
    cdq
    idiv ecx
    mov esi, eax
    jmp L1
FUN_10046c70 ENDP
END