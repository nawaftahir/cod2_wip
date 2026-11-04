; FUN_10019480 @ 0x10019480 — auto-synthesized
    sub_1005f3bf PROTO C
    sub_1005fb01 PROTO C
    sub_1005fb2c PROTO C
    sub_1005ff54 PROTO C
.CODE
FUN_10019480 PROC
    push ebx
    push 1
    push 0x101958cc
    mov ecx, edi
    mov ebx, eax
    call sub_1005fb01
    add esp, 8
    test eax, eax
    jne L0
    xor al, al
    pop ebx
    ret
    push esi
    mov ecx, edi
    call sub_1005ff54
    mov esi, eax
    test esi, esi
    jl L1
    cmp esi, ebx
    jge L1
    push 1
    push 0x101958a8
    mov ecx, edi
    call sub_1005fb2c
    add esp, 8
    test eax, eax
    je L2
    imul esi, dword ptr [esp + 0xc]
    mov eax, dword ptr [esp + 0x10]
    mov dword ptr [eax], esi
    pop esi
    mov al, 1
    pop ebx
    ret
    dec ebx
    push ebx
    push 0x101955b4
    call sub_1005f3bf
    add esp, 8
    pop esi
    xor al, al
    pop ebx
    ret
FUN_10019480 ENDP
END