; FUN_10063e76 @ 0x10063e76 — auto-synthesized
.CODE
FUN_10063e76 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov edx, dword ptr [ecx + 0x26c]
    mov edx, dword ptr [edx + 0x18]
    mov dword ptr [eax], edx
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L1
    mov ecx, dword ptr [ecx + 0x26c]
    mov ecx, dword ptr [ecx + 0x1c]
    mov dword ptr [eax], ecx
    xor eax, eax
    pop ebp
    ret 8
FUN_10063e76 ENDP
END