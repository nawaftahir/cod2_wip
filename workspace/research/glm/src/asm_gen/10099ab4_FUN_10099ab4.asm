; FUN_10099ab4 @ 0x10099ab4 — auto-synthesized
.CODE
FUN_10099ab4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jne L0
    xor eax, eax
    jmp L1
    cmp dword ptr [eax + 4], 9
    jne L2
    xor ecx, ecx
    cmp dword ptr [eax + 0x10], ecx
    sete cl
    mov eax, ecx
    pop ebp
    ret 4
FUN_10099ab4 ENDP
END