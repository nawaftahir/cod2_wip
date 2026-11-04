; FUN_1007e10e @ 0x1007e10e — auto-synthesized
.CODE
FUN_1007e10e PROC
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
    and eax, 3
    lea eax, [eax + edx*4]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 0xc
FUN_1007e10e ENDP
END