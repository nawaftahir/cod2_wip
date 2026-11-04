.686
.MODEL FLAT, C
EXTRN sub_1003D263:PROC
.CODE
FUN_1003d410 PROC
    sub sub esp, 16
    push push 0107666F4h
    push push eax
    push push ecx
    lea lea eax, [esp + 12]
    mov mov dword ptr [esp + 12], 4
    mov mov dword ptr [esp + 16], 5
    mov mov dword ptr [esp + 20], 6
    mov mov dword ptr [esp + 24], 27
    call sub_1003D263
    add add esp, 28
    ret ret
FUN_1003d410 ENDP
END
