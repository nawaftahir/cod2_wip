; FUN_1007e20e @ 0x1007e20e — auto-synthesized
.CODE
FUN_1007e20e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 4
    jbe L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [ebp + 0xc]
    mov edx, eax
    shr edx, 2
    lea ecx, [ecx + edx*4]
    and eax, 3
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 0xc
FUN_1007e20e ENDP
END