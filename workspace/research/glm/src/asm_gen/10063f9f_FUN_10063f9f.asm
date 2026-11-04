; FUN_10063f9f @ 0x10063f9f — auto-synthesized
.CODE
FUN_10063f9f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x26c]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [eax + 0x1c], edx
    cmp dword ptr [ecx + 0x278], 0xc
    je L0
    mov eax, dword ptr [ecx + 0x26c]
    dec dword ptr [eax + 0x1c]
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L1
    mov ecx, dword ptr [ecx + 0x26c]
    mov dword ptr [ecx + 0x18], eax
    xor eax, eax
    pop ebp
    ret 8
FUN_10063f9f ENDP
END