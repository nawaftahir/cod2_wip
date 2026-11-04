; FUN_10099846 @ 0x10099846 — auto-synthesized
.CODE
FUN_10099846 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0xc]
    cmp ecx, eax
    je L0
    dec ecx
    cmp ecx, 0xb
    ja L1
    jmp dword ptr [ecx*4 + 0x100998cf]
    test eax, eax
    jle L1
    cmp eax, 8
    jle L0
    xor eax, eax
    inc eax
    pop ebp
    ret 8
    test eax, eax
    jle L1
    cmp eax, 2
    jle L0
    cmp eax, 4
    jle L1
    cmp eax, 6
    jmp L2
    dec eax
    je L0
    dec eax
    dec eax
    je L0
    dec eax
    dec eax
    je L0
    dec eax
    dec eax
    jmp L3
    cmp eax, 1
    je L0
    cmp eax, 3
    jle L1
    cmp eax, 5
    jle L0
    cmp eax, 8
    jmp L3
    cmp eax, 9
    jl L1
    cmp eax, 0xc
    jmp L2
    cmp eax, 9
    jl L1
    cmp eax, 0xa
    jmp L2
    sub eax, 9
    jmp L4
    cmp eax, 9
    je L0
    cmp eax, 0xc
    jne L1
    xor eax, eax
    jmp L5
FUN_10099846 ENDP
END