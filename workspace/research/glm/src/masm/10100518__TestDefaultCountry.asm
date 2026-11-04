.686
.MODEL FLAT, C
.CODE
_TestDefaultCountry PROC
    xor eax, eax
L0:
    mov cx, word ptr [esp + 4]
    cmp cx, word ptr [eax + 01017DAA4h]
    je L1
    inc eax
    inc eax
    cmp eax, 20
    jb L0
    xor eax, eax
    inc eax
    ret
L1:
    xor eax, eax
    ret
_TestDefaultCountry ENDP
END
