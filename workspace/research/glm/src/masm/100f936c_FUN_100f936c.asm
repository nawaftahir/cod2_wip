.686
.MODEL FLAT, C
EXTRN sub_100F93BA:PROC
EXTRN sub_100F93E7:PROC
EXTRN sub_10104416:PROC
EXTRN sub_1010520B:PROC
EXTRN g_1076ADB0:DWORD
.CODE
FUN_100f936c PROC
    cmp dword ptr [g_1076ADB0], 0
    je sub_100F93BA
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
    jne sub_100F93E7
    jmp sub_1010520B
    mov edx, 0101A529Ah
    jmp sub_10104416
FUN_100f936c ENDP
END
