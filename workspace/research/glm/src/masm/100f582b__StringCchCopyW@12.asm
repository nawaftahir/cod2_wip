.686
.MODEL FLAT, C
EXTRN sub_100CC6EB:PROC
.CODE
_StringCchCopyW@12 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 12], 07FFFFFFFh
    jbe L0
    mov eax, 080070057h
    pop ebp
    ret 12
L0:
    pop ebp
    jmp sub_100CC6EB
_StringCchCopyW@12 ENDP
END
