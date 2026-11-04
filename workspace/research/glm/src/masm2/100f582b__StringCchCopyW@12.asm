.686
.MODEL FLAT, C
EXTRN sub_100CC6EB:PROC
EXTRN sub_100F5850:PROC
.CODE
_StringCchCopyW@12 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    cmp cmp dword ptr [ebp + 12], 07FFFFFFFh
    jbe sub_100F5850
    mov mov eax, 080070057h
    pop pop ebp
    ret ret 12
    pop pop ebp
    jmp sub_100CC6EB
_StringCchCopyW@12 ENDP
END
