; FUN_1007d82f @ 0x1007d82f — auto-synthesized
.CODE
FUN_1007d82f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    push 4
    pop ecx
    xor eax, eax
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    pop edi
    sete al
    pop esi
    pop ebp
    ret 8
FUN_1007d82f ENDP
END