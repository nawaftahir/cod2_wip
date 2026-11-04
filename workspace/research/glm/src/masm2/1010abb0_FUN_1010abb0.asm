.686
.MODEL FLAT, C
EXTRN sub_10102FFE:PROC
EXTRN sub_1010AC01:PROC
EXTRN sub_1010AC21:PROC
EXTRN sub_1010AC53:PROC
EXTRN sub_1010AE5B:PROC
EXTRN EXTRN g_1076ADB0:DWORD:DWORD
.CODE
FUN_1010abb0 PROC
    cmp cmp dword ptr [g_1076ADB0], 0
    je L0
    sub sub esp, 8
    stmxcsr stmxcsr dword ptr [esp + 4]
    mov mov eax, dword ptr [esp + 4]
    and and eax, 01F80h
    cmp cmp eax, 01F80h
    jne sub_1010AC01
    fnstcw fnstcw word ptr [esp]
    mov mov ax, word ptr [esp]
    and and ax, 127
    cmp cmp ax, 127
    lea lea esp, [esp + 8]
    jne sub_1010AC21
    jmp sub_1010AE5B
    sub sub esp, 12
    fst fst qword ptr [esp]
    call sub_10102FFE
    call sub_1010AC53
    add add esp, 12
    ret ret
FUN_1010abb0 ENDP
END
