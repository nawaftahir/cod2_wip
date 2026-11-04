; FUN_100c2a58 @ 0x100c2a58 — auto-synthesized
.CODE
FUN_100c2a58 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 0x74700000
    je L0
    cmp eax, 0x74600000
    je L0
    cmp eax, 0x74400000
    je L0
    cmp eax, 0x74500000
    je L0
    cmp eax, 0x74300000
    je L0
    xor eax, eax
    jmp L1
    xor eax, eax
    inc eax
    pop ebp
    ret 4
FUN_100c2a58 ENDP
END