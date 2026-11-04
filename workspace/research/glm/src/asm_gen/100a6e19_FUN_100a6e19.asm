; FUN_100a6e19 @ 0x100a6e19 — auto-synthesized
.CODE
FUN_100a6e19 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 0x60500000
    je L0
    cmp eax, 0x60a00000
    je L0
    cmp eax, 0x60000000
    je L0
    cmp eax, 0x72e00000
    je L0
    cmp eax, 0x60700000
    je L0
    cmp eax, 0x60f00000
    je L0
    xor eax, eax
    jmp L1
    xor eax, eax
    inc eax
    pop ebp
    ret 4
FUN_100a6e19 ENDP
END