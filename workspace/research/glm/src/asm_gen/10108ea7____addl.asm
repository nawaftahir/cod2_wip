; ___addl @ 0x10108ea7 — auto-synthesized
.CODE
___addl PROC
    mov edx, dword ptr [esp + 4]
    push esi
    mov esi, dword ptr [esp + 0xc]
    lea ecx, [edx + esi]
    xor eax, eax
    cmp ecx, edx
    jb L0
    cmp ecx, esi
    jae L1
    xor eax, eax
    inc eax
    mov edx, dword ptr [esp + 0x10]
    mov dword ptr [edx], ecx
    pop esi
    ret
___addl ENDP
END