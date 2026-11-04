.686
.MODEL FLAT, C
EXTRN sub_100F93BA:PROC
EXTRN sub_100F93BD:PROC
EXTRN sub_100F93E7:PROC
EXTRN sub_10104416:PROC
EXTRN sub_1010520B:PROC
EXTRN EXTRN g_1076ADB0:DWORD:DWORD
.CODE
FUN_100f936c PROC
    cmp cmp dword ptr [g_1076ADB0], 0
    je sub_100F93BA
    sub sub esp, 8
    stmxcsr stmxcsr dword ptr [esp + 4]
    mov mov eax, dword ptr [esp + 4]
    and and eax, 01F80h
    cmp cmp eax, 01F80h
    jne sub_100F93BD
    fnstcw fnstcw word ptr [esp]
    mov mov ax, word ptr [esp]
    and and ax, 127
    cmp cmp ax, 127
    lea lea esp, [esp + 8]
    jne sub_100F93E7
    jmp sub_1010520B
    mov mov edx, 0101A529Ah
    jmp sub_10104416
FUN_100f936c ENDP
END
