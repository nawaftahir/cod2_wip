; FUN_1003fb50 @ 0x1003fb50 — auto-synthesized
    sub_1003f6f9 PROTO C
    sub_1003f94f PROTO C
    sub_1003fb23 PROTO C
.CODE
FUN_1003fb50 PROC
    sub esp, 0x10
    push edi
    mov edi, eax
    mov eax, dword ptr [edi + 4]
    test ah, 0x20
    je L0
    mov ecx, dword ptr [edi + 0x68]
    lea eax, [esp + 0xc]
    push eax
    push ecx
    lea eax, [edi + 0x3c]
    call sub_1003f94f
    add esp, 8
    test al, al
    je L1
    mov edx, dword ptr [esp + 0xc]
    mov dword ptr [esp + 8], edx
    lea edx, [esp + 8]
    mov eax, edi
    call sub_1003f6f9
    pop edi
    add esp, 0x10
    ret
    call sub_1003fb23
    pop edi
    add esp, 0x10
    ret
FUN_1003fb50 ENDP
END