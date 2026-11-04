; FUN_10081eec @ 0x10081eec — auto-synthesized
.CODE
FUN_10081eec PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    test ecx, ecx
    jne L0
    mov eax, 0x8876086c
    jmp L1
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx], edx
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 4]
    xor eax, eax
    pop ebp
    ret 8
FUN_10081eec ENDP
END