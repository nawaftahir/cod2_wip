.686
.MODEL FLAT, C
EXTRN sub_1003D263:PROC
.CODE
FUN_1003d410 PROC
    sub esp, 16
    push 0107666F4h
    push eax
    push ecx
    lea eax, [esp + 12]
    mov dword ptr [esp + 12], 4
    mov dword ptr [esp + 16], 5
    mov dword ptr [esp + 20], 6
    mov dword ptr [esp + 24], 27
    call sub_1003D263
    add esp, 28
    ret
FUN_1003d410 ENDP
END
