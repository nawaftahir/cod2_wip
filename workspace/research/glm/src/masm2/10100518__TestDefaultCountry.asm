.686
.MODEL FLAT, C
EXTRN sub_10100543:PROC
.CODE
_TestDefaultCountry PROC
    xor xor eax, eax
    mov mov cx, word ptr [esp + 4]
    cmp cmp cx, word ptr [eax + 01017DAA4h]
    je sub_10100543
    inc inc eax
    inc inc eax
    cmp cmp eax, 20
    jb L0
    xor xor eax, eax
L0:
    inc inc eax
    ret ret
    xor xor eax, eax
    ret ret
_TestDefaultCountry ENDP
END
