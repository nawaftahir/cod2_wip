.686
.MODEL FLAT, C
EXTRN sub_1003D263:PROC
.CODE
FUN_1003d3d0 PROC
    sub sub esp, 16
    push push 0107666D4h
    push push eax
    push push ecx
    lea lea eax, [esp + 12]
    mov mov dword ptr [esp + 12], 1
    mov mov dword ptr [esp + 16], 2
    mov mov dword ptr [esp + 20], 3
    mov mov dword ptr [esp + 24], 26
    call sub_1003D263
    add add esp, 28
    ret ret
FUN_1003d3d0 ENDP
END
