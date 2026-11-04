; FUN_100f936c @ 0x100f936c — auto-synthesized
    EXTRN g_1076adb0:DWORD
    sub_100f93ba PROTO C
    sub_100f93e7 PROTO C
    sub_10104416 PROTO C
    sub_1010520b PROTO C
.CODE
FUN_100f936c PROC
    cmp dword ptr [g_1076adb0], 0
    je sub_100f93ba
    sub esp, 8
    stmxcsr dword ptr [esp + 4]
    mov eax, dword ptr [esp + 4]
    and eax, 0x1f80
    cmp eax, 0x1f80
    jne L0
    fnstcw word ptr [esp]
    mov ax, word ptr [esp]
    and ax, 0x7f
    cmp ax, 0x7f
    lea esp, [esp + 8]
    jne sub_100f93e7
    jmp sub_1010520b
    mov edx, 0x101a529a
    jmp sub_10104416
FUN_100f936c ENDP
END