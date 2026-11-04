; FUN_1008af0b @ 0x1008af0b — auto-synthesized
.CODE
FUN_1008af0b PROC
    xor eax, eax
    cmp dword ptr [ecx + 8], eax
    jbe L0
    mov edx, dword ptr [ecx + 0x14]
    mov edx, dword ptr [edx + eax*4]
    mov dword ptr [edx + 0x30], eax
    inc eax
    cmp eax, dword ptr [ecx + 8]
    jb L1
    xor eax, eax
    ret
FUN_1008af0b ENDP
END