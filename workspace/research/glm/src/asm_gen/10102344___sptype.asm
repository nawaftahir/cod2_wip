; __sptype @ 0x10102344 — auto-synthesized
.CODE
__sptype PROC
    push ebp
    mov ebp, esp
    xor edx, edx
    cmp dword ptr [ebp + 0xc], 0x7ff00000
    jne L0
    cmp dword ptr [ebp + 8], edx
    jne L1
    xor eax, eax
    inc eax
    pop ebp
    ret
    cmp dword ptr [ebp + 0xc], 0xfff00000
    jne L1
    cmp dword ptr [ebp + 8], edx
    jne L1
    push 2
    jmp L2
    mov ecx, dword ptr [ebp + 0xe]
    mov eax, 0x7ff8
    and ecx, eax
    cmp cx, ax
    jne L3
    push 3
    jmp L2
    cmp cx, 0x7ff0
    jne L4
    test dword ptr [ebp + 0xc], 0x7ffff
    jne L5
    cmp dword ptr [ebp + 8], edx
    je L4
    push 4
    pop eax
    pop ebp
    ret
    xor eax, eax
    pop ebp
    ret
__sptype ENDP
END