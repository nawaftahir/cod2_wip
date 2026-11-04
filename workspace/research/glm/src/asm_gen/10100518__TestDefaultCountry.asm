; _TestDefaultCountry @ 0x10100518 — auto-synthesized
.CODE
_TestDefaultCountry PROC
    xor eax, eax
    mov cx, word ptr [esp + 4]
    cmp cx, word ptr [eax + 0x1017daa4]
    je L0
    inc eax
    inc eax
    cmp eax, 0x14
    jb L1
    xor eax, eax
    inc eax
    ret
    xor eax, eax
    ret
_TestDefaultCountry ENDP
END