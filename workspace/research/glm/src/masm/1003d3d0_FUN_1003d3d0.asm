.686
.MODEL FLAT, C
EXTRN sub_1003D263:PROC
.CODE
FUN_1003d3d0 PROC
    sub esp, 16
    push 0107666D4h
    push eax
    push ecx
    lea eax, [esp + 12]
    mov dword ptr [esp + 12], 1
    mov dword ptr [esp + 16], 2
    mov dword ptr [esp + 20], 3
    mov dword ptr [esp + 24], 26
    call sub_1003D263
    add esp, 28
    ret
FUN_1003d3d0 ENDP
END
