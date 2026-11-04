.686
.MODEL FLAT, C
EXTRN sub_10102FFE:PROC
EXTRN sub_1010AC53:PROC
EXTRN sub_1010AE5B:PROC
EXTRN g_1076ADB0:DWORD
.CODE
FUN_1010abb0 PROC
    cmp dword ptr [g_1076ADB0], 0
    je L1
    sub esp, 8
    stmxcsr dword ptr [esp + 4]
    mov eax, dword ptr [esp + 4]
    and eax, 000001F80h
    cmp eax, 000001F80h
    jne L0
    fnstcw word ptr [esp]
    mov ax, word ptr [esp]
    and ax, 127
    cmp ax, 127
L0:
    lea esp, [esp + 8]
    jne L1
    jmp sub_1010AE5B
L1:
    sub esp, 12
    fst qword ptr [esp]
    call sub_10102FFE
    call sub_1010AC53
    add esp, 12
    ret
FUN_1010abb0 ENDP
END
