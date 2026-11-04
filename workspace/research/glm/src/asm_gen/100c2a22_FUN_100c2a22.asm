; FUN_100c2a22 @ 0x100c2a22 — auto-synthesized
.CODE
FUN_100c2a22 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 0x73500000
    je L0
    cmp eax, 0x73600000
    je L0
    cmp eax, 0x73700000
    je L0
    cmp eax, 0x73800000
    je L0
    cmp eax, 0x10f00000
    je L0
    xor eax, eax
    jmp L1
    xor eax, eax
    inc eax
    pop ebp
    ret 4
FUN_100c2a22 ENDP
END