; FUN_1001aa00 @ 0x1001aa00 — auto-synthesized
    sub_1001a832 PROTO C
    sub_1001a965 PROTO C
    sub_1005fb02 PROTO C
.CODE
FUN_1001aa00 PROC
    push esi
    push edi
    push 1
    push 0x101950b4
    mov esi, eax
    mov edi, ecx
    call sub_1005fb02
    add esp, 8
    test eax, eax
    je L0
    push 0
    mov eax, edi
    call sub_1001a832
    add esp, 4
    test eax, eax
    jne L1
    pop edi
    xor al, al
    pop esi
    ret
    mov edx, dword ptr [esp + 0xc]
    lea ecx, [esi + 0x14]
    mov dword ptr [esi + 8], eax
    push ecx
    add esi, 0x10
    push esi
    push edx
    mov esi, eax
    call sub_1001a965
    add esp, 0xc
    pop edi
    pop esi
    ret
FUN_1001aa00 ENDP
END