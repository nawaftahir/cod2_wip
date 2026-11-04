; FUN_10088445 @ 0x10088445 — auto-synthesized
.CODE
FUN_10088445 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    cmp edx, esi
    je L0
    mov eax, dword ptr [ecx + 0x14]
    mov ecx, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [ecx + 0x40]
    test dword ptr [eax + 0x40], ecx
    jne L0
    xor eax, eax
    jmp L1
    xor eax, eax
    inc eax
    pop esi
    pop ebp
    ret 8
FUN_10088445 ENDP
END