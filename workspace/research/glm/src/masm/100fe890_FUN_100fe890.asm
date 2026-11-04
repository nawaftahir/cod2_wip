.686
.MODEL FLAT, C
EXTRN sub_100FE90C:PROC
.CODE
FUN_100fe890 PROC
    push edi
    mov edi, dword ptr [esp + 8]
    jmp sub_100FE90C
FUN_100fe890 ENDP
END
